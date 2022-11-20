Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F981C4167B
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13208.1668953750517925500
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5bdDu7pT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id y10so7238498plp.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gAZkl1p8ERZ5cXIpFu9nQcWwbsJfjAwo23Qi4jzLrk=;
        b=5bdDu7pTas0P5GHFL8SmmTbcwwHKMVReqFqhqBC04ByJdS8ec/hUolRk11bCpv8dfG
         39zV/YeCfdJciP2VGOr8SjGwcNN4oyu+hrzCDS2+8GQkKbMhfL13rWTR4KJhZiBepZmT
         iQxGrOQTXoaFH8zDMoUtTPql+ToUYqlHXcmU2OLHt7OzNNt1JooCzyjvrf6UALxrfpS5
         VU++sRCVRuG/g9djYE3ltAVIYiqTtOLufCmTBCknaRw2eYUBu0c32izw8qZKAt3su1tR
         JlfGf2o7YlXqYDXTIM/RlaJcbg86zinluSjYjl3woSzMGFYVOJ+/ZVEisolqsqYbA9xQ
         vLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gAZkl1p8ERZ5cXIpFu9nQcWwbsJfjAwo23Qi4jzLrk=;
        b=WdtR6TEhwvPr1WXmjzc8wRs/Wt6YJlNPFjpq1uW6RyyYptR35XIZUzmswgs1P97VjF
         ib3DUqVLz6Y3HVAn08+FjFozqMkA58gXnyygW946nfckO1/UhppbQAmSZq0xdCvlPGYY
         tpm3z+Zj7Q7l+9HWGwCxGrVt+J4osYN+79bSnxtbjrcMHMWENUfmxSAG1F0SLHrYOu4B
         sdpHUBmQXU4/9SnNvmimHPjHKvytcuCgZGFGr/xyMAu1U9csyQz6zslCsaswZpyXS6lT
         WjMQ3wNyg6P2pNzDjM318GQjxzEKj56KG+Sl0T6x+R/DResM33rRujocVvK++tRNtJ9u
         utPA==
X-Gm-Message-State: ANoB5pnbCJxenkA82TxtC/L2I5F13ExfTIr11bpN2X/cp4bB/Mwt4bX1
	npagSFcftJpa11kEYQBUElru7PbfqumYiYEeXgY=
X-Google-Smtp-Source: AA0mqf7BPqor6zhKppGvcEZ/7ibvJxyQ0vILuO/bgmQXDV1EVOv/+Y6ZcZ7tT3Je1xr4IEpPeg5DKA==
X-Received: by 2002:a17:903:26ce:b0:186:8a1e:5055 with SMTP id jg14-20020a17090326ce00b001868a1e5055mr376179plb.116.1668953772028;
        Sun, 20 Nov 2022 06:16:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/35] cargo_common.bbclass: Fix typos
Date: Sun, 20 Nov 2022 04:15:08 -1000
Message-Id: <8c58aacba69f815261b3e4aa32ba7eebeb3f62ae.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173619

From: Alex Kiernan <alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7a92180b21e75a84f632e4c16e63dc1f4861a00)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cargo_common.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 39f32829fd..1e9d284b5d 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -50,7 +50,7 @@ cargo_common_do_configure () {
 
 		[source.crates-io]
 		replace-with = "bitbake"
-		local-registry = "/nonexistant"
+		local-registry = "/nonexistent"
 		EOF
 	fi
 
@@ -88,7 +88,7 @@ cargo_common_do_configure () {
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		[build]
-		# Use out of tree build destination to avoid poluting the source tree
+		# Use out of tree build destination to avoid polluting the source tree
 		target-dir = "${B}/target"
 		EOF
 	fi
-- 
2.25.1


