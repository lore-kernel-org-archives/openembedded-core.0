Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.1716.1594061274419963051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 11:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZaRSlW8/;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id v19so29784326qtq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 11:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSlWZnQD9pjmiFOel7iuFz+42ECTp0bYagO+exedVdM=;
        b=ZaRSlW8/jfNhaG6s3mJr5nHQ5v6ZLHVfD9FyFNNE/f5oJSYZOLvCzp/VtptFydOp3g
         dd1cdMRIiYLt4cbcv0Q74QRSWtmi0Iagp3DB/rPBKzbrzEeh/kOM5acbRpxd3pC14gv+
         gfcgq5ezc7RPPQf32nEbBSncy9bKtO8LiL1jwrGwgY2zrN2V1NlKRoiD+HO5uO+X6afC
         z92Y0xAdx+eym0rdW+66Tb22brB9BPkht+NnncPFaBFCEtYNHFERjG2d/uoW6jDPAKSe
         nWBDx/7B8gSPpCV2/l5A5k4v5fNX+ko2jdbG8SWhRf5oy319iSGKQ8Ar30tcd4Beez0w
         dzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSlWZnQD9pjmiFOel7iuFz+42ECTp0bYagO+exedVdM=;
        b=AgRNrv7eKyD48f2anKxnThXMeZrl33CjY6iY8Ngnk8cJu4yArni7Yb+vMsjyNfIk+P
         rLJxAN/98wL7M7VN9K+kExlaSSXHKCpoZpXjXc5WDK/bynUNFIoa5WBzwYFxxSPhxods
         D3zQ42M37eMueMF+RMlrTjBmZFpixZmlpYC36Ytit/gETNnCa5LBkvwnvNUqqWKz42zx
         XtOPNgzvv1bL+eaM7ctzvIscmDerN28HXGDbfjU7RDKF9qupMycsDZI/awdn95ZPlJ6K
         1KpuPdUCkVNKiS7c7crIXJBdp6jr76I51zvUfGJvYETUbZa9bIVP4S5KmQiI6CKtffw1
         zqig==
X-Gm-Message-State: AOAM533ysRNYbXXmO6usVYiIKE5rEep6OIAB1hSnTjjkC3eLfD1Chdny
	OJEJVgU66CRizWjhzDFau2E=
X-Google-Smtp-Source: ABdhPJwq4pbDI7nAkacqmszMbNrVuCCACbRoa+ysqfqFABlMEqeN/tp4Pm5jp4BJbCvNdLbdv1Bq0A==
X-Received: by 2002:ac8:3777:: with SMTP id p52mr49890654qtb.31.1594061273453;
        Mon, 06 Jul 2020 11:47:53 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id s24sm23144533qtb.63.2020.07.06.11.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 11:47:52 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: bump devupstream to v2.12.1+
Date: Mon,  6 Jul 2020 14:47:51 -0400
Message-Id: <20200706184751.39130-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To build against the v5.8-rc kernels, we need to pickup the latest
lttng-modules commits.

Bumping the devupstream version and SRCREV to do just that.  Validated
against v5.8-rc4.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

I'm continuing to work through 5.8 kernel-dev issues. lttng needs
commits to build against 5.8-rc. I'm bumping the devupstream variant
only right now, since that is expected when working against newer
kernels.

We can either add patches to the tgz variant, or wait for a new
lttng-modules release, but that is best done in a separate patch.

Bruce

 meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
index 8d3fb475c0..c0df0cab33 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
@@ -32,11 +32,11 @@ python do_package_prepend() {
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.12 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "17c413953603f063f2a9d6c3788bec914ce6f955"
-PV_class-devupstream = "2.11.2+git${SRCPV}"
+SRCREV_class-devupstream = "11441f8f17f7825f529e2f6c54d3605771709260"
+PV_class-devupstream = "2.12.1+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.19.1

