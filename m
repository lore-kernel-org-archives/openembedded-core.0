Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0E5C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:22 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.15269.1634673261341546535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vBmX9J8B;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id i5so8225164pla.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DVTPC4iHXb1WdGk84uHf8rMxTtJ+1EAYkaCYzSUGBOg=;
        b=vBmX9J8Brcm/zrR2XW05bLfb6OqjYxH+546y0CU4ZRK6WSEG4UprZm6pD1bWKe1UJd
         K34vwtED6YkJ1SQoQxaexBGJE8537v+cTxkIuF2MTr5p6hRTv7ATT0/T/G455bpfGY8G
         RuMnhUm2/CDBgo+FEXHzrwkhDPN3Xs6a5WBnirulKLwxT/AKM9fG0Mz9cCr1M9BfgkGp
         UdNFQiBtoKR4MYrvTDrf5foLTEgBhypX8fnUrxWGKIS4KuI22lHtJmkn/a5eF8BgADUw
         zTxrlG1hl/RpSPwHFdYzpPqQaCTZdSxiu90+zjcXUM4qlp+pVRXu0RyVYaYkD7Jxv8vA
         6ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DVTPC4iHXb1WdGk84uHf8rMxTtJ+1EAYkaCYzSUGBOg=;
        b=WAV7LFpXEVORgWvMcDg/4ykTQoyT2XJRW09/UkqjQ0ip9jAGtKbm3Nwd6ZSWqsDyro
         RG9PQ0DCrMfwKpNGu8sIGH1wpEvdF81sw/x0XEUS2r0rccKivYMkWDN1uHOZMxtMLFMN
         /8LtmyRD3rLDUQx68dDnEU6D+A20p6OSBwGR0TL3U5BztKUSXRuo84iytBwuXn+ykbVn
         ci95VDaZW2B8W26YbXqCUk4grmsnK5ctXV/9r/+0fH0E/3RpuNkvDAOPhogvE4QG3wmu
         mOyhsxKAKwMia1mrSv/WlsQnWNyHzDU4gOvAfxvmLbfAiBDOZVhNKr/lWrtcfPaHiOQs
         GWfw==
X-Gm-Message-State: AOAM531taQilNM1WugOHg2XypFCdESNPJ2sQvcE0x8hfFC6USn6ccwbS
	odYo2DG7pTQatE2w9vu6JB23QDcTpumNK0sVNZA=
X-Google-Smtp-Source: 
 ABdhPJyCfXOEz65sljBYBHRH6IlBLJt97q+ExKnPG0lZZw0vRsrzTvykDNrZlakRMk4r8tpgIComsw==
X-Received: by 2002:a17:903:3092:b0:13f:663d:f008 with SMTP id
 u18-20020a170903309200b0013f663df008mr35065590plc.13.1634673260404;
        Tue, 19 Oct 2021 12:54:20 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/38] e2fsprogs: upgrade 1.45.6 -> 1.45.7
Date: Tue, 19 Oct 2021 09:53:17 -1000
Message-Id: 
 <d4ec2802306b901d00bc88ea1452c21c00d0914f.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157211

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch
removed since it is included in 1.45.7

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f51835e022731d1c0e8e18209e48f1a718048977)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../e2fsprogs/{e2fsprogs_1.45.6.bb => e2fsprogs_1.45.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.6.bb => e2fsprogs_1.45.7.bb} (99%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
index 4f5ad78154..3bc530e02b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
@@ -13,7 +13,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
                                 file://big-inodes-for-small-fs.patch \
 "
 
-SRCREV = "506d96fe640f76ab04276e0a7c578aa108ce19f8"
+SRCREV = "5403970e44241cec26f98aaa0124b9881b4bbf4f"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.25.1


