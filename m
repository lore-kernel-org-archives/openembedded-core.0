Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB492C636F8
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.8123.1650463784565751599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nSESclBR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 ga4-20020a17090b038400b001d4b33c74ccso1178830pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=W2RFX6/DnSjDDedG6Q1DmOnxh29eKfYCH4gV4nzTuxU=;
        b=nSESclBRBCqQr4qxjmW825E8vx10Tu3NHogc5Lnx79OxZMh2Mqsj0MZh1vQLPnuWn+
         yyT4oOuoh+JEE78MGvxsfru8H6Ta59RlayTdGs6DYASIuQiSzyupxSxghEHF9WFTVKAM
         1TXmJ5CcehLF2+Emy1v7Liueko3Lf8Akb4YxTe6lapIRZbQXbEIBs+DagKf/Z5FjYKO2
         8TDpuojgu3Ss8RW1bk70yzTlK6kWzxFXBA0WRlw2N4VlSaxcWu/IJgafdt1xa22i8Bcq
         Me/NfaXNwpFEhsQKNKKJok4fM34oIfqBGa8T58Nu3JLOWJF6kgY5vZYPDNfnkaDxTXZS
         AL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W2RFX6/DnSjDDedG6Q1DmOnxh29eKfYCH4gV4nzTuxU=;
        b=2rBLbsZkchGt8aTv4Y14OLGc/EVqGyuibx9xapR7S4M3f1nlpnb5W8nJYB0Uf06VBa
         C1J3KQTXSAdn5E9jyq/rifC9htMCBTpn+hs5x5gYnyypH1nzqSYrZizyBpIGZ3vAOwdg
         VBPwkMcQrshQJ5D6NeUY3Akwv5TxgC4XCt8Xd6/RxPdgYqBPhIj34M7/q27uUldeXlWi
         +s66HfhUfU0SVnqDv7n0UcA1j/nXGuaN2CGl0efNAft04CBan3ge2nxrZzIxerVrio/s
         LDY13IHJMakn36toNHxmPxPtn80oloTnZ1OZ1M8DzNulsHCXIjRNw6wqvoE8JiOxK/ei
         yqGQ==
X-Gm-Message-State: AOAM530YgWyndvBkwM3vzXE0cFTlJVcjNiKCEEkehj/nQ2OevlxtpxHl
	TNb1Zhv5/eH881kEBwa9/8OeW8naSS3Ws2zM6zA=
X-Google-Smtp-Source: 
 ABdhPJz4VQcyxvPD22hUVR2kLET5zLgijBhACBBHDQGkxdURdZjW5Zl+EMX+0xZjgrlzs74eSrrAtw==
X-Received: by 2002:a17:902:ed83:b0:158:c459:ab59 with SMTP id
 e3-20020a170902ed8300b00158c459ab59mr20999685plj.161.1650463783633;
        Wed, 20 Apr 2022 07:09:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/27] libgit2: upgrade 1.4.2 -> 1.4.3
Date: Wed, 20 Apr 2022 04:08:13 -1000
Message-Id: 
 <5469986c79c95279715559acf33e921f2baa791e.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164693

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
Validate repository directory ownership (v1.4)
midx: Fix an undefined behavior (left-shift signed overflow)
fetch: support OID refspec without dst
Fix crash when regenerating a patch with unquoted spaces in filename

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bef09c61ee32df214fb8cf6000e0314ff3a38156)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.2.bb b/meta/recipes-support/libgit2/libgit2_1.4.3.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.4.2.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.3.bb
index 88bf5a8520..7e27b5b018 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
-SRCREV = "182d0d1ee933de46bf0b5a6ec269bafa77aba9a2"
+SRCREV = "465bbf88ea939a965fbcbade72870c61f815e457"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


