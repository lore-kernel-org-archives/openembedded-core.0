Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4E96A7F380
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 19:45:43 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id c81so3601003pfc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 12:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p08H7tHL8lrR3ko3h9brvgcG/XDtjM+vDB0xKVQ10rw=;
	b=f4kuaDtJdoxfI7ZaACWU73O4D6P88IC2R0TmuKBS5ddYabT7Yxn38oULfd8htK1lOV
	9fSfbtmVwAz6OEXSBgA88hP6clOlD0aMRWOVbGzSIhCRUM9chsReL+fEC9ABF+noMAkz
	kzceCGD6wE8aH0SjwJA42U3R6kBCR6BM5awznwLLpKSpso9tNxWJIJAA0gKA1uHvJVCS
	pl6kCEduO7FYdxtrlO3aefrBu+LeCsAxom+6oYbrernuMeyEYkUy3+imWV5TxVS1DcxH
	h7iwvbPkGzlys+xlPEZjKrRISrAsaWCdY/cqAF6QB/ehft4HxFd+b01sL8MKCN/L0C7C
	wgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p08H7tHL8lrR3ko3h9brvgcG/XDtjM+vDB0xKVQ10rw=;
	b=q7rCQTaBCsRmrsm4uSCzYaYKCt8poeeFVKlPIFBLI3jHeULnONNyXMfb9yyW3/5Q/R
	JeAho+P9O/3rr/7cb3UUvMz0TZeM4RE12ZHyv11qPNBdtLxgxcaiZtKHr3094CgrVTtb
	I0LXCjcgl1u34boEGtOEQb6yZ5h48COuRIpDtKxMZ43KrTwKyGmIS0c6YnFfiY0W7dOe
	SU5UHhcZ1H0HitKnKB9Njzthol18lv+RJkRotmpIxxzgiW/ZMjhPKsMcY3/NltPZLFq1
	jz6EDci949Mzhc1XhPMcqKloq+P9Ko779ZAxyKl53nWKYz5RdCneTCrEnUppv+ZSFr+1
	EOyA==
X-Gm-Message-State: APjAAAXB0ghsKRrNgLo3FN2xvHZKNUT8xV8BGr/GR8lSfwi4ydefl9aW
	loOpVs69goIarCWVUgF9lUtIrNgY
X-Google-Smtp-Source: APXvYqwRzY2Zew8UyZK7Hi51/Gmkp1hvSDsb0YaeDNJkQnSA/AcX5PfL1D91qYtRp9OQIcS8DHuHpQ==
X-Received: by 2002:a63:b919:: with SMTP id z25mr9030763pge.201.1565984744095; 
	Fri, 16 Aug 2019 12:45:44 -0700 (PDT)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	o35sm5537333pgm.29.2019.08.16.12.45.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 12:45:43 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:44:05 -0400
Message-Id: <20190816194405.12751-6-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190816194405.12751-1-wesley.lindauer@gmail.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
Subject: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Fri, 16 Aug 2019 19:45:43 -0000

Although xz has some files that are GPLv3 licensed, none of them get
packaged up, and therefore none of it ends up in the final rootfs. Since
there is no GPLv3 code in the final image, we don't want to include it
when we collect licenses, as that would give the incorrect impression
that the image contains GPLv3 code.

Also fixes the endline for getopt.c which had a couple of non-license
text lines at the bottom.
---
 meta/recipes-extended/xz/xz_5.2.4.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.4.bb b/meta/recipes-extended/xz/xz_5.2.4.bb
index 791746e1cf..e6725e5f12 100644
--- a/meta/recipes-extended/xz/xz_5.2.4.bb
+++ b/meta/recipes-extended/xz/xz_5.2.4.bb
@@ -17,9 +17,8 @@ LICENSE_liblzma = "PD"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
+                    file://lib/getopt.c;endline=21;md5=32575ca1a42c5fa04aac6f08566ddf48 \
                     "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-- 
2.14.5


