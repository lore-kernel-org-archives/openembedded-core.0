Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08993C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:13 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.7901.1646406312389493673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EpiPlwnO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 132so7744293pga.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E6ql8Whrdk7tSC0j1258ySUOMt+aBDGEBVOc/xaOxN4=;
        b=EpiPlwnOI+hLH0uydDU2dgKe3g5hWXwQqNflNcABiMeXRvZ5OKzYFCjHuzK1TEckOI
         3v2+pjmaYh0j36mVSFWcnEV4s1zyb1mpxK0CwWWLL5e+/PgjSvj9VlQMyOU7f9lM8Mz/
         xUVWuFmrfpuYJ/ddgRCRWbGVFb3bidLIMrPUrGvsyd3kynAPcNmqUjieOeU+D/ZjguT9
         kmnYvvXLxL4dB2oVIbNfzLRYXMNAKho8dJ48bxyQ0/+QmsCXyUBrEYEC/r4MfFJbYvNr
         gsWd/XePPrkdmw9ci2de1f8108h/Y0X1+6oQ7Eq1g8UswAdCg0DAAvq5a0PL2cdPpDRT
         lR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E6ql8Whrdk7tSC0j1258ySUOMt+aBDGEBVOc/xaOxN4=;
        b=3AFqMgEvbK9VL1Dw8796vW2zklzu33GWfLhMH92j6VlEUiTEwMU4kQf9J+PQacyQkh
         89NbLcFyh24krmGgfVmLroatOYaq8UyPIGJjsU1dmnDwKGBskwPaXLhH+GbMxuz+NtJW
         5kZ8b+cDAxnVfAS1IZ6wmtSL7kD8gOoYEpiwzylsdqB2y2289NjZ++ta6MBeXRrPE9jO
         QRJdfON6Sb3f09AQhfnk3tObZXsU1KS0eloAeiBbICfj0XRtzrURXCmEEIH+BTUovBoo
         Kp8VNG1Mdf2f/5Jq1ZoNCu9obUx/27dDSmqPCmhPF9UlfKbNBuPQCj/foT4kmlPEX7Q+
         FpKg==
X-Gm-Message-State: AOAM531kmPRDbrcJWIiLHTRrhKdEgbgqw4IvWXy0P7PcgHMDQWGHRoue
	F51Zlbds5lxgr7DFT6zzVQ3Wa0SPG/b7kjp6oLE=
X-Google-Smtp-Source: 
 ABdhPJzzQAJ3+FBjx40bErQ0HYFJ+O1/F6JhXFLJtQVq5l0xcXS+c7MIqIK3bGU+zc7xvo/fZrhaOg==
X-Received: by 2002:a63:c56:0:b0:378:7ad0:c01c with SMTP id
 22-20020a630c56000000b003787ad0c01cmr25170455pgm.510.1646406311379;
        Fri, 04 Mar 2022 07:05:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/18] wireless-regdb: upgrade 2021.08.28 ->
 2022.02.18
Date: Fri,  4 Mar 2022 05:04:20 -1000
Message-Id: 
 <fd64364f16c822960a00e8a28b87b0ec590eed74.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162731

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5c06ddfd3c0db0d0762c0241c019f59ad310e53)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
index 376311804e..4e6da4cbe1 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446"
+SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
 
 inherit bin_package allarch
 
-- 
2.25.1


