Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA8DC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.28090.1653314429378976634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=l4lSbOUL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id z25so1083965pfr.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NTUknsKScsUUsML4ZJ/g5VdSrE16JIaxLKsuecDNLsc=;
        b=l4lSbOULnTKZP6a84wVpiY2JSJRgMNTqDUWfixVK8Mundi1acb85UP4mN4lxvnsjsg
         TrkPAnTZPD2FWw4JBH8PWAiMhtS0vQGEVgJJGWjYifT8vp9yVDSfLeruB4Hq7rUsysew
         NBlbH6IFHz8696XmnbRZTNWAkwXD4ioWHIap8XauCf1OBFEbzix73ALnCbxlF+qAmAXU
         qxP5URhEln1jQw299x4z0sDyIOD5iTHxn6bwKngOWywkzHLQucQ58f3RNiL89457n6ap
         BK88ipdoU4SpFTYehr9/ASiTDqGy1lRhEdNxwPnnLRfnXYczEtcBxUEg8f/C1D0dOnp0
         o0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTUknsKScsUUsML4ZJ/g5VdSrE16JIaxLKsuecDNLsc=;
        b=f4cpdV+joglhAW6lOyMYJAP/tVAPSlo/Ol/Qu22heVCZxv/HXY9V49YvOLmagr8K9V
         6PxUjWo7ED3/+MPA9Tm7jQ/81dn9Tal0TNffq+StHqrxiGwcghKStQPq+CKs1BidJS/i
         TQ1yry69FR3FHmxGoh1NyvWe31W9GOZjt8ygLcVI2ultymB6oZF68XESTr7oRC/Xx+F9
         q4gDVy5dcD21+XwsIjfO7YHH0UE1+lNyk14Uqdqi6VmcumotgU3IghgX3MOQpp9zSYHJ
         836/3e8wsrUBM0kEGp6qkzJdbJlboTFeve33uY1rLqu/vkfaKv2wl8s3c2Y/Yvce9WFA
         X5KQ==
X-Gm-Message-State: AOAM533mztdqIPN9KHnmjcnI34jRHGq7obDu6tmYDPaMVG5sHRFQSRLt
	s7GQWk95dFz85fuBZBlk5GwQkEP08mQKbhWf
X-Google-Smtp-Source: 
 ABdhPJysq/5oU7OZy9goUhHoZo9B22zivzD23bRf14fkaU1hOpTpTS+R6y9DvJdJhCUDSjbTT7WsJg==
X-Received: by 2002:a63:f653:0:b0:3fa:ac4:d910 with SMTP id
 u19-20020a63f653000000b003fa0ac4d910mr8643923pgj.407.1653314428105;
        Mon, 23 May 2022 07:00:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] librepo: upgrade 1.14.2 -> 1.14.3
Date: Mon, 23 May 2022 03:59:44 -1000
Message-Id: 
 <cd16ecd4412708731968b25585d85217fa83858b.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653313955.git.steve@sakoman.com>
References: <cover.1653313955.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166028

From: wangmy <wangmy@fujitsu.com>

Minor bug fix release with a single commit:

Make error messages about repodata and rpm mismatch more user friendly

This should help users to recognize the error is not on dnf side but
instead on the server (in the repository).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b41ae2900dc308e005d3f0e8a4d3912be35bc01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.3.bb
index 8dece946b4..2c8e592251 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "3b9a8d17188ba602d139f79b6e61305030f21109"
+SRCREV = "8fc7950795282d9c7c50071f45973006de5594ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


