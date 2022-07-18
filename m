Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C00C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:22 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.28041.1658155819324561993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JcPiegew;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id w185so10841622pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QkgZvQTFQGpFGgslZ9U3yWRFCco1Gr+jgJBGvRtAijA=;
        b=JcPiegewWVx5UN53USNurWRtRCyhAD+as4+7titbYiJSSrmq0Wz/vNj5mkh5PvXPMn
         TVTh/dfI975aXv4zXDqdta9rLNnomHgBhWY7DAvCQ/Qe5P7EMkdfJ5iLwrOSJZ8BBhxT
         5U6PLW30Uorn1tV/mOI7fCohkW2Eq59f5jLjkoMp4ZYoiCfij7bUYxDfUFOwofP92tRv
         nQ5CMkt+sQ5LUa/CLS5+7DXTMO9FVPJSxckR0H6Nib/EXIAw84zZ/RslM+/yYnBMMAJr
         bGisCHXQOtppaR+MJasu1oPNw6UO4gZ09uCyCxCJC/LyycGi22bD8j4lstM73BmK7bNJ
         DtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QkgZvQTFQGpFGgslZ9U3yWRFCco1Gr+jgJBGvRtAijA=;
        b=n130R5Ab1XE0n4ORQ/G1U7Q3W5URhBrDVnKH+iuPfA1+g+7056l138tcgwSly90elr
         N7GlLS9556LrOk4SzAmfyS5o8rkY9YQ8OZ9FhpDqOKQvMwn+l+fmOOxnB8miDuEcabCW
         4Ys1DlQR1dfJzmE4saYo2cTSre7dhchMvigvLsWp8ZP5L+0UxOZcfVVSfRzzqJpisiBP
         Nrm4WOQMx3ksIMB5+8xwVFJ6fZa1+08QYC5xfDxVp0xXwiFynkxm18e0RCVQhe/85v9O
         vkxTlEXTVxFbhTQmlv5ICCOr2HxjQsMBPUBdgDCsVy9CfLRXDiPxC5Q0NHBoZeP5Q6OF
         aCEQ==
X-Gm-Message-State: AJIora/V/wMAnhH3eG0DKqPAeh9Dbvj4Xgnxw2fQgcmUsNFxcMxxu8xO
	XmTAkqkMwVnjUZARZCcxZd3RV6VzmlvR9Yp+
X-Google-Smtp-Source: 
 AGRyM1uqqZ+CckwGhuFf4U/j2rImE6V2804/7OqtgD32f+Cevy8ZXzxeADlTZR46vyE6RHlZoIHsBw==
X-Received: by 2002:aa7:94b3:0:b0:52a:198a:e3cb with SMTP id
 a19-20020aa794b3000000b0052a198ae3cbmr28497208pfl.60.1658155818303;
        Mon, 18 Jul 2022 07:50:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/35] gtk-doc: Remove hardcoded buildpath
Date: Mon, 18 Jul 2022 04:48:46 -1000
Message-Id: 
 <d3149c9ea98f4d4252ff0822d062c32d94ca75c5.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168221

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When api-documentation is enabled, we see a hardcoded build path to xsltproc in
the target python configuration file. We curate PATH carefully so we don't
need the path there, tweak configure to remove it and solve the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f7924a85de548f9403d561b15c1f2c33d9912393)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 392913fcc6..150eca9274 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -18,6 +18,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
+
 SRC_URI[archive.sha256sum] = "cc1b709a20eb030a278a1f9842a362e00402b7f834ae1df4c1998a723152bf43"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
-- 
2.25.1


