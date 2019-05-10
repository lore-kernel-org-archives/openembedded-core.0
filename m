Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 379627E047
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 10:59:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c5so7305464wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7PLLkepuKC1MGOkIEYwHupm/AOVjVql69BSWzQ9r4i0=;
	b=FHKdKjKRMdpa3r2d3+pnz1edlcoBthTr7L7k1W6szWjGzMC4fxvm7wVJQEb14JDKcn
	Lo84TKA84aJMJZPiV2UvuULkxq2Ncc9aoq5F+KqN/qNWPtlYg475fNtgVJrX732aUWty
	THSVk6dr8roZTqy56FWacKHaRhIiNns9puKrmqlGFiFEoRWSpbZm4P5scfimjj7HRApR
	xuJdmyv9+ny0vy55FcID5hvJ0JftYED/Nyh/zbNbFSIxupr+3jKLtQKoam4QRcZXCvlS
	1UpM6raesgchHoryVcAa5Pic3R0cGEdeovUssiFRKfYFEKw0SEoUcLr+MQY+wJ+oGiX9
	8plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7PLLkepuKC1MGOkIEYwHupm/AOVjVql69BSWzQ9r4i0=;
	b=tXwkvXiZcdgCdM8vWAS0ftyObzzlWCm4AloM7VBK3VhgpsFN+R4IKyiZNrt55AgBz9
	9Qsr5BtggmaJ10fGPX6ZsOvf5x4MJox8iRjKRp2Y/pDp0EKMLdUMe1VoBh1PPMcBP3dW
	RgUV0bbYdrB/UsWSBNIR6GXHPlxKlwzVM3qPqnyTwvig5ygKGE3cTZDhKWiRcDyDTrU/
	ueyW/FZPExjAKPMawKeh7y35xV+f9inTVmOErmsZhEsaek/EQUL9tm1hbB2VFruOOuTS
	0zJLq1R7ehPRa8wzqDT3Eb3VcBfsw8BQBaqK+TiWU2bXmg/8rNwGb2BVaitwwsavSEMB
	k3Bg==
X-Gm-Message-State: APjAAAWkSuy61Tbhd6zhHRrP4WyaDDddF2Pua8S5kLj9mEmYXwINXyL2
	H66W66WlIHBm/VA6A0gban6kSRLCrOg=
X-Google-Smtp-Source: APXvYqxy3988YpuPE2+DVDXFsZ2oDRNAxdzsxlgaw4T+bSaOz0KFLa87wo5YUqG/AOoozOUbM5T2nw==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr6924396wrv.295.1557485982587; 
	Fri, 10 May 2019 03:59:42 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y6sm5035497wrw.60.2019.05.10.03.59.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 03:59:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 11:59:39 +0100
Message-Id: <20190510105939.25524-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib-2.0: add missing locales for the tests
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
X-List-Received-Date: Fri, 10 May 2019 10:59:42 -0000

Some tests are either failing or skipping due to missing locales.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 69bcd0dd1d0..9ffc4560a9e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -148,6 +148,14 @@ RDEPENDS_${PN}-ptest += "\
             tzdata-europe \
             tzdata-posix \
             shared-mime-info \
+            ${PN}-locale-ja \
+            ${PN}-locale-fr \
+            ${PN}-locale-el \
+            ${PN}-locale-hr \
+            ${PN}-locale-lt \
+            ${PN}-locale-pl \
+            ${PN}-locale-ru \
+            ${PN}-locale-th \
            "
 
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
@@ -173,5 +181,7 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             locale-base-fr-fr \
             locale-base-es-es \
             locale-base-en-gb \
+            locale-base-en-us \
             locale-base-pl-pl \
+            locale-base-pl-pl.iso-8859-2 \
            "
-- 
2.11.0


