Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2906677202
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:27:22 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p63so117833890wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 05:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=io+6Z7JynjcxYqsB5vknu9MMXmZ33khaNk6COai8t0g=;
	b=RFBvij7Zfvnp4vuWI1y0Eb0C/Syb2Qt+hJoQ7J/dZsdI+P5zk4JgEg/9Ro3l+ocYrZ
	vCi5xDrZo9VqqOYPouZ3i6K+dCWaa/0rJyKg0ic5Hh7FWlAxC8CpOY0veJz26ku3+ybE
	QTy3wEaK8Fh6qT1htZ1Tg8b/V4toY5BBWWUGZf388hXCvb7BLbokJ7Icj3UZ9abift/1
	tBHCMsjs0GT4oKAMvpj/ur4gkI3m0i31EDu6hxiMpwSOyhLlEwmSGffwjVrAR7Rh/Xaj
	/HUM+ytXlYR7M21Vp/QhOr9/I7lVnnfJCdbETNUDnwQbqbQyckfi3jhDOk8HCy6RQ/qZ
	2k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=io+6Z7JynjcxYqsB5vknu9MMXmZ33khaNk6COai8t0g=;
	b=l5EfnaKvIbWD6y3sVHsVJ+Mjfgmz4rxsTCiU3i3kXmvdzo4Z57sMD2Y2tTXjXJp8kT
	kZoudau2SjhkzWb/Dg5sujOx+MlOZF4EPUqiHoR9Eg4+YvS/VeDQQ7/o7nzE+yL9O36g
	fwGPiYo8NHz7jB1pa6hRFnMmG/2cRgcGngbsV2orPdrVIa4nkI0kjRiXYpDX9LEgpIO9
	Mh/JED0uGb10fSwiHvFEuhwg1kQsWEb2GCZRqRfF5zOasLLMu+wdIqKhzqNn1bOPWlAB
	M9yPoH7VtJ0paQ/fl0BDJGV5utoemerrO+baa1mzsME23mUjpSBDjieq/uFN9tpkjBJw
	fibw==
X-Gm-Message-State: AG10YORTt9raSXhLEzHadtq1SIwMkV/30iz//YnLfmcHWebcdfd4lc2n2QTR6YDdr8ZCH+s8
X-Received: by 10.194.142.135 with SMTP id rw7mr24322818wjb.42.1454419642876; 
	Tue, 02 Feb 2016 05:27:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l67sm16433764wmf.11.2016.02.02.05.27.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 05:27:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:27:14 +0000
Message-Id: <1454419635-10822-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
References: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] python3: set INSANE_SKIP as libpython3.so is a trampoline library
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
X-List-Received-Date: Tue, 02 Feb 2016 13:27:24 -0000

(From OE-Core rev: b7059f16fa4eb8795a4bec3f86d4ea309beaf485)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 0d9a4cc..54007d3 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -211,6 +211,7 @@ FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
 FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
+INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-- 
2.6.4


