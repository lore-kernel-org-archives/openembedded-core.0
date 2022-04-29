Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08A3C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:49 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.12080.1651248159699365647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WtJ7ro/I;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id r83so6869574pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CVrk+jLKpKJ9Oxhr2NV4yNUX/PbUdlMyasiWthiDTdU=;
        b=WtJ7ro/IC8neZwAbvwwq4Qs3PlNxcGFr61nbllr+vA/SXMFUf7TNY3WysYns+RvGOT
         z24JQ79jrRZ43afYCzjnVjeXh/vzBqn2Zx475Cq2nWU82jxsHCgu8e/rEqgOK1p9K6OD
         Yknuc8PoovNFHAkeHTPAcJNZc2DFAvd0QDkJiiGkJYRXOvAhCcz04Xb5dbki3Q4IwQIp
         Z6tZ//IdWK+8g97H97GotZzXBV6TcpT16YBM/I2+O+bsN2ffmnviZjB9TXOjt32ekOxU
         W6uqjWIIGt3PLymieQdNgse2i5jxnGHuDU1uJOPzwvjsbPqm9Ui09l1Lhv1/yOTRgRYo
         T75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CVrk+jLKpKJ9Oxhr2NV4yNUX/PbUdlMyasiWthiDTdU=;
        b=dhkea6VEGO0wI+o9rg2w06wfdyA2j6Jsv32mDGv6WOBcYC2Ojdgf7Xb1u0IX4s+fIn
         lkZIdLTllgJfE1fpkoHwdOA8Tsmr2ejzxvIWiqjSZsPzg0lmpxIG3HBaOi8+xiesoM3J
         qxxFrzqmKscWPvAUR1GbhacCVPo7FmdZ3fTIrRxrsNKq124+PEkTJ/sey7f6DAhufb3x
         98K3YjDYZnhXHGCKQSpYA8yE12uQOrVO3p4UFESYNSGT3CCNqS00x2pVAsNgO+LCDVzh
         JSrj+CmA/Z7S3xwCv7EoAV3cHlqtdCntE/JYTS9ZdcH8Nj4L8Z2EwVzw+H0qN/6ue9ca
         4PRA==
X-Gm-Message-State: AOAM530l1OVYGceHT8YsMu1XyoF8v/1Di8DzFA7/D6bRkO0ea9zrAqJa
	74ZdO1s4AdAOCnk/UKRqMkXVPv/TZfbmg/08yPo=
X-Google-Smtp-Source: 
 ABdhPJwcHLUVp8weqEc8tvxEdssVDXdCTSatIUpERC+O+84XRj/gSqNkLoYNgCOdn0nYWV1cJsqlYQ==
X-Received: by 2002:a63:c23:0:b0:3aa:3f26:b2eb with SMTP id
 b35-20020a630c23000000b003aa3f26b2ebmr96501pgl.196.1651248158123;
        Fri, 29 Apr 2022 09:02:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/34] sanity: skip make 4.2.1 warning for debian
Date: Fri, 29 Apr 2022 06:00:50 -1000
Message-Id: 
 <3744d06135a76d0170141dc02ead3704a089a427.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165050

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

This is a follow up patch of:
ad5829aa1f8a (sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu systems)

Debian10 has the exact same version/sources for make as Ubuntu
(focal), e.g. https://packages.debian.org/source/buster/make-dfsg and
https://packages.ubuntu.com/source/focal/make-dfsg.

As per the corresponding changelog, the patch mentioned in
ad5829aa1f8a, is included in both Debian and Ubuntu in make
4.2.1-1.1. So it's safe to use make 4.2.1 in Debian10.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d5d5278ff4f620cd786b85e880e8429a04a1548)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c385d92e8b..c72a7b3ed3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -470,7 +470,7 @@ def check_make_version(sanity_data):
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
         distro = oe.lsb.distro_identifier()
-        if "ubuntu" in distro:
+        if "ubuntu" in distro or "debian" in distro:
             return None
         return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
     return None
-- 
2.25.1


