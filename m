Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id AB0707FBD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:00:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c14so2193498wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8zKfG5ZXpM+6pE/aTfcBNnKvKdhltC6rkm+C0JyEkb8=;
	b=Ta02t7pnl5Ze0/+dXNmutFuhknGUl++KdAji5DaAbG2dVvzNcV0kt1t4KvZIMG8jmq
	ev8Zo4+KfVK23bk0hiq00mSoGHDoef7MpNvDO5x1eDHe54/AB0zA0cSAosGDm4tEuoh8
	HNoc88ea2WYBeA+aMVBGVgxDPdqSIORavEeH+6W/UIppuG9cHwa2nslOj7YkGggU6uN1
	QGQKlV7dDUYrgkYP+CUMRkI2D+spR7kNl1KZyTiDyA7h2wn7ZxnI8jeVS5tdZ3/0QOX/
	5Vt/oOQ6KUXitTPR0aVB6SCKUiJvQh1VXCFfEtnlM/fKLChMsXK8OgdI9IcmwTp4MyuU
	Xrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8zKfG5ZXpM+6pE/aTfcBNnKvKdhltC6rkm+C0JyEkb8=;
	b=d9jrcBWId3lu2J+qFnEzJwj7PAW0bR5FQJW/+inyy49kJXa8VNZU7+N4t01mA4nppQ
	fwQyL+zw/0MNyMGflj3B+H0KbFJSFcfKFFsuuERfhSDLZhGnIAzq/AkmO0QR9/pNp8C1
	9C1BrLdsApMBq/C7KhFJxWq0ppjW7JbCGJHYk01O0/H0P4tF5iMLopmkwg60dFRprPeO
	6QBCHdXtAH+3fTHsH7LuJhkrc6xiLSfWy0YvHJ3HJSSUwVbTgX9MsuZp7eFTklgYzMUO
	5kvgzCRPi1QvbTIH0dUt9GhkaGig+qrfMK1+AyOOMofFdr8P3q+7aoYVFeCO8IyRK8Zg
	0tww==
X-Gm-Message-State: APjAAAV5VNBqO50+zYf6hUC9SOwvxob34Qj3UM4I08F5rxeRPnV4m1pf
	kVw0qVI3PYRF/A4hHyDa/f6ElLwPTsQ=
X-Google-Smtp-Source: APXvYqybZRKMY0PL7QMolWlPhrRSnREFlOUOhb9fzL1c/XcKZhWrf+bgY6NjK8bp4sYeB58gpgFddA==
X-Received: by 2002:adf:da52:: with SMTP id r18mr42812199wrl.167.1574863239892;
	Wed, 27 Nov 2019 06:00:39 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o1sm19372284wrs.50.2019.11.27.06.00.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:00:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 14:00:29 +0000
Message-Id: <20191127140030.7838-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127140030.7838-1-ross.burton@intel.com>
References: <20191127140030.7838-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] python: use correct autotools variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Nov 2019 14:00:41 -0000
Content-Transfer-Encoding: 8bit

Use EXTRA_OECONF and CACHED_CONFIGUREVARS as nature intended.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python_2.7.17.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.17.bb
index 5807f63db44..b3bdcba1a89 100644
--- a/meta/recipes-devtools/python/python_2.7.17.bb
+++ b/meta/recipes-devtools/python/python_2.7.17.bb
@@ -36,9 +36,11 @@ S = "${WORKDIR}/Python-${PV}"
 
 inherit autotools multilib_header python-dir pythonnative ptest
 
-CONFIGUREOPTS += " --with-system-ffi "
+EXTRA_OECONF += "--with-system-ffi"
 
-EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no ac_cv_working_tzset=yes"
+CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes \
+                        ac_cv_file__dev_ptc=no \
+                        ac_cv_working_tzset=yes"
 
 PACKAGECONFIG ??= "bdb"
 PACKAGECONFIG[bdb] = ",,db"
-- 
2.20.1


