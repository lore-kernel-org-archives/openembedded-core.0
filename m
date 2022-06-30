Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E6ACCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:52 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.27533.1656606222984103892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=l5+mOJSP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so3381531pjj.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o/48H3F8g79evQ4Ap+HldaqCtNbKARuuw7cZtb71BoE=;
        b=l5+mOJSPBRB4Fg7b/TE3zIlwfjoRK4WwW8GGphQvaIATSR/vAlFcqH5YfPF0fqdMKi
         G9l5eJeCJbmfRFin7TVrTLfMWp0kFA3xFsVB05vV4YCPmYlTDaGG7qavicl1m21JASP7
         rjKg9mQVLpvh8ZHTpNQ0JfuP5M81zf+aSF9N+G3GOVxvE8UwLhrqhPZL9p/A2miCdJpf
         SN5SdE1ALoW1L0cY/kR8/Djyg43U5QrLsSjpqs7nds0u2+jTS8btrUR3tx7o7Jrp5b3s
         ExFvsGdJC9GtLF46KVddW57rvbNOlC9rLu+NNlHccCgKYkw335eTpXAm91TmZOyf1zPs
         aWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/48H3F8g79evQ4Ap+HldaqCtNbKARuuw7cZtb71BoE=;
        b=cHb5OHlZHLpWZdP+24qWL92WioaeY/QD4XI0iyKhawEh8ncuFrM0eT1GJUwtvk5Hny
         LS+4KAFS21Gi8cCJX0kussb2i1yWB6neMB6R9tj8wEqP8KwNJXjUen7HHM9/KUAQyr/S
         wyUlNtu+JGBOHCyLMa4xgbqyDz6JwfvjA0+r/SXArI9hmT6viY2AOXpoORm+Th+b2Qxu
         ZjbcbF1HSK0lBUKXSSkLXWeCm3x7yq4a6V+dmcTedRqZ/EmNwbd8pJ7Jdhvp0KkkBfOf
         6asZLrcKKPOPBK8l4rmVtswqV+Shg32PuFuTBKi7fBq/iI76uvkn5OpN1eGb5YY8qKI7
         xB/g==
X-Gm-Message-State: AJIora8PyHYvlhscJyUKStGBvTT/fAhzEaNeACGGQ+oys7Ct1AhyPSWS
	lXkTLwknVTp/1XUs7xtyEDxV1slQgPCh2zsZ
X-Google-Smtp-Source: 
 AGRyM1ubrDEDkOOKZ7hPncGiUVFdPs/eRRV0K50s2PZSonJQPNrKKZpx/EVRja4YrQF3ZZ2j6XYqSQ==
X-Received: by 2002:a17:90b:3a8d:b0:1ef:7d4:6a5f with SMTP id
 om13-20020a17090b3a8d00b001ef07d46a5fmr11028117pjb.139.1656606221867;
        Thu, 30 Jun 2022 09:23:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] wireless-regdb: upgrade 2022.04.08 ->
 2022.06.06
Date: Thu, 30 Jun 2022 06:23:08 -1000
Message-Id: 
 <a0415549af8d10f4915c519433b49ce812bd2324.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167424

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c27711292f93dfad1ffdeab6d715becad32a4ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
index ad6ba8dc8b..91775bce5c 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
+SRC_URI[sha256sum] = "ac00f97efecce5046ed069d1d93f3365fdf994c7c7854a8fc50831e959537230"
 
 inherit bin_package allarch
 
-- 
2.25.1


