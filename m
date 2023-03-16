Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6D9C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.5143.1679003140263320550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mw2UL8lR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id h8so3238926plf.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+8Pxdf9CnwGOxycVdbc98ZghM7KC6uU4KWiDMVJ64U=;
        b=mw2UL8lRmZL6HBz2SmrdHSLziEw7IxnIW6P+xzpnhzHF++8KHBjTr8ck1rgt/T2wWh
         c5HFjNs7pyt6BAvRPdvVERk5Gd0crg1Mvg1Zxzin2bT8b5B3IG0fEUcRZEICEFYfPN3X
         btXJloqMPaqqJh2quZxmegVUyEIceInj2M+lxWHuox7iV9i3Zkc0iFyFar6NcPmpJP1G
         hG4EwbxLalH5cl7tT+xt3p/625Yp0E54UICQbZ5hEY+ipx5zeqSArNCvcnbdto1a+nXH
         NPaIaV9ICI7BFsrdRW9x1X8g8W8wbOvniwJ3rG64GPqNzBj+YRSWcZ2ORhkPbgOmZgJe
         oW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+8Pxdf9CnwGOxycVdbc98ZghM7KC6uU4KWiDMVJ64U=;
        b=F5ikZ02NCxt6t6gK1vhtSaFjJtY2FFT63HIIDcBWN79oUiTfc36eTMylA9bjf5whY3
         /QgTxo8e2WOkvxbqYv9+27nAVp50C0MtT2SLxL1B1zj+PMGD0vqays7IMkItXreJGC4B
         o18z2Ca6ijMYaUUJ+PDiOpgB3FjcHgrkuhQ/Oqj6OSFBVxCtJlwlYBQioZHPuLUwAeqv
         gWB7TUi76b0oPl62NW+WfKxBnHQps7Qf9dnL7bBCWkiftd0YtkH/Kmc0AV8T2zoPGVcn
         OsDxXrbo/E7Uow14LjNNI5ClTIFe9jfewem3iUfrb1wRm4rsWB0/keKfBRZqbiHKxFi5
         1HYw==
X-Gm-Message-State: AO0yUKWVMFQeulCAQWokVEiyTDBv07RIZS53O4rg3cAZfUrVSKQP2FGM
	nQBtODoY8M416E9ThW4B5LqxxHaqsqZaAHmcO1c=
X-Google-Smtp-Source: AK7set9UHP+3iMrmKqdREvRt86YAtZ4FFUmBg7tsBA1gj9Wj1qAfqg3QLK32+8QIuiS1NuoIP7B2+w==
X-Received: by 2002:a05:6a20:baa7:b0:c7:4bf5:fa0a with SMTP id fb39-20020a056a20baa700b000c74bf5fa0amr5167487pzb.48.1679003139237;
        Thu, 16 Mar 2023 14:45:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/23] vim: upgrade to 9.0.1403
Date: Thu, 16 Mar 2023 11:45:03 -1000
Message-Id: <6752b83f62129b3d60d5189cb6e67a0865d876d9.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178717

From: Ross Burton <ross.burton@arm.com>

This incorporates fixes for CVE-2023-1127, CVE-2023-1170, CVE-2023-1175.

Also remove runtime/doc/uganda.txt from the license checksum: the Vim
license is also in the top-level LICENSE file so this is redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71111e6b62d37c5e6853d7940dec2993df127a35)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index da586a5699..40ad44486d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,8 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -20,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1293"
-SRCREV = "0caaf1e46511f7a92e036f05e6aa9d5992540117"
+PV .= ".1403"
+SRCREV = "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


