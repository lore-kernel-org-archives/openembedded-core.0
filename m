Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315C8C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2582.1639608055642274905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LAcTTTtI;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id a18so40756286wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tOXqzz4tVpfwfun9kp/02gIOJXw4ew/SeTWdL8DXtgQ=;
        b=LAcTTTtI/Rgz4L/PgPigGB49HqBfwdVRhrIWUij2gkujSQMy3FHlYbbdyC+GYn4QxC
         lbRb1tgFj5xEQq3/Aj0rInr4tlU8How+WESKFvgaC013FnMuoxmND5JjwSl5UP8BUu2u
         yWcmersoSibewIeGWDGyhmSBrsWoI24iBAdDHoEaurEGTDRfeL17gGN9suPZkkYbf6/F
         mDsYK++xCOdKcc7Lz+7aAd8Z63fIL8N2ci7eDcemo0c9ioE2iL7WkSEUa9bSKVNwupHi
         nR/YG0/hXkbeLr0tcGsQQk7G6OG6+rGSHdhwvIrGiJ2/JuThSq3NOMJ39PkBTcAlpCMc
         qcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tOXqzz4tVpfwfun9kp/02gIOJXw4ew/SeTWdL8DXtgQ=;
        b=bMjYIcD5pSlPVW8RGf8Gxv1EtexR0Sf9yLhLSKE43X6Jzp5tgyyToLqswEE/WCOJIg
         1O1pFhkE1s1+4LEBw4HJuphjEeORZtlcaVphfiT/9AjXan/jMtrhocubOcdW/5Qphy5T
         KuLqvXCOKJjObjVEzRSeIZmwMcBeo8kH9hP+QfmdDO+MbZ4HXWWwhRmAI5Ct0Jz40BZL
         CfWH6UN+EV+bJ/YW7mH2qzt6ooj+Jobbeh7JSrHAhKVS8wzBx8SnB9uC4RSNxDZRdfQo
         4VtrS/yoZurrzX9Ma2+LTtB2nQ/SKkIdLiQJp34OAiLwh2K/C5lNVtIjoJbGeZZrKMQ2
         7nZg==
X-Gm-Message-State: AOAM531ZjJEj2u6fwZAH3F8XG0w2sD1d6IBvjf4xmXGFJktRRfkIqkEk
	kv0olFNO+7TKVQPfU8di5izByYePznvIrA==
X-Google-Smtp-Source: 
 ABdhPJwGcx0y9tDAnjLSFDp9hSqqm+qvg1P32Ou5IAZWvGyqu/c7NY21LcAMD95qBF71YT95V7RnGg==
X-Received: by 2002:adf:f08c:: with SMTP id n12mr136967wro.598.1639608054243;
        Wed, 15 Dec 2021 14:40:54 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/26] debianutils: update 4.11.2 -> 5.5
Date: Wed, 15 Dec 2021 23:40:32 +0100
Message-Id: <20211215224034.1814148-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159766

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...bianutils_4.11.2.bb => debianutils_5.5.bb} | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.11.2.bb => debianutils_5.5.bb} (73%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.11.2.bb b/meta/recipes-support/debianutils/debianutils_5.5.bb
similarity index 73%
rename from meta/recipes-support/debianutils/debianutils_4.11.2.bb
rename to meta/recipes-support/debianutils/debianutils_5.5.bb
index 231666c4dc..6eea86f6d3 100644
--- a/meta/recipes-support/debianutils/debianutils_4.11.2.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.5.bb
@@ -8,25 +8,26 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20200929T025235Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
-# the package is taken from snapshots.debian.org; that source is static and goes stale
-# so we check the latest upstream from a directory that does get updated
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
+SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
+           "
 
-SRC_URI[sha256sum] = "3b680e81709b740387335fac8f8806d71611dcf60874e1a792e862e48a1650de"
+SRCREV = "4c420893485ad07d771c327ef899819d4846408f"
 
 inherit autotools update-alternatives
 
-S = "${WORKDIR}/debianutils"
+S = "${WORKDIR}/git"
+
+# Disable po4a (translated manpages) sub-directory, as that requires po4a to build
 do_configure:prepend() {
-    sed -i -e 's:tempfile.1 which.1:which.1:g' ${S}/Makefile.am
+    sed -i -e 's:po4a::g' ${S}/Makefile.am
 }
 
+
 do_install:append() {
     if [ "${base_bindir}" != "${bindir}" ]; then
         # Debian places some utils into ${base_bindir} as does busybox
         install -d ${D}${base_bindir}
-        for app in run-parts tempfile; do
+        for app in run-parts; do
             mv ${D}${bindir}/$app ${D}${base_bindir}/$app
         done
     fi
@@ -41,7 +42,7 @@ RDEPENDS:${PN} += "${PN}-run-parts"
 RDEPENDS:${PN}:class-native = ""
 
 ALTERNATIVE_PRIORITY = "30"
-ALTERNATIVE:${PN} = "add-shell installkernel remove-shell savelog tempfile which"
+ALTERNATIVE:${PN} = "add-shell installkernel remove-shell savelog which"
 
 ALTERNATIVE_PRIORITY_${PN}-run-parts = "60"
 ALTERNATIVE:${PN}-run-parts = "run-parts"
@@ -54,7 +55,6 @@ ALTERNATIVE_LINK_NAME[installkernel] = "${sbindir}/installkernel"
 ALTERNATIVE_LINK_NAME[remove-shell] = "${sbindir}/remove-shell"
 ALTERNATIVE_LINK_NAME[run-parts] = "${base_bindir}/run-parts"
 ALTERNATIVE_LINK_NAME[savelog] = "${bindir}/savelog"
-ALTERNATIVE_LINK_NAME[tempfile] = "${base_bindir}/tempfile"
 ALTERNATIVE_LINK_NAME[which] = "${bindir}/which"
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


