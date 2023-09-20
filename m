Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA696CD4925
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:33 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.3148.1695249085891152588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oCO0098h;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.53, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1d651ab1d77so209111fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249085; x=1695853885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VN0B+rdYNDi0ywUdnhNJcwtyhNyv4eHgN2BX1DvVRyc=;
        b=oCO0098hlikY+J0CfgkCSG3j4NBbthIy91bTHmNf9zdBn6R5dwAJmQmCsdqu9SfW5u
         ocGLDrmjzUDvEZX+Wm/NFghfQOGcowRkxR9ezljQhKb2t3PIB6ebAGds2dYvYTJ7lb2j
         TaAv2d3I1OsTSxLaTx95FvqCxZ3KW1+fVB6VAZijJqzsqe3zPQ3vvibFuUiPsE+ffRy7
         SuZyGYd/t+gOTbt7b+yUr2nx6FuINQeNgJgYHhD4va60onaqJdpsREKLJrSCWETU9E8e
         ekrK8rVU2l4g2u1IePTf+oC436RCGViojRdCyzO1+2dWKf5m9AnilyfNLGVKl5oSnPGD
         eE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249085; x=1695853885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN0B+rdYNDi0ywUdnhNJcwtyhNyv4eHgN2BX1DvVRyc=;
        b=Nvo3ftHS/r7JhmClco8LQZnzrFPHhafoonhBx3eJWBp7dXutfRutjZ8Bf9QMEbZIay
         Vefa7sQd9t5GchayksJPxIANh5h1G00uGBQSdIX6xYuD3Eu3kLtU/R1FIO9tJILK75hS
         Zh03O8GS9qB1Uku0XCZBSNlo+psJ7Bi3onYHuJxVF5S/aS/jItJGLioLrj9wts+62LIV
         ju86CN94+6X2iHOY32477CfJY6basvsFs+gCcHYVuIIlbaZCF2rvKIhxbWAgyGpZwhQm
         y/tuONa1Vbzgn1P2xNRQ4j0aRx5su5WuoZvJMYcfm37994Zd3wfJVBtaNHWjT5kp+1Sq
         UrzA==
X-Gm-Message-State: AOJu0Yz9hmOvdmW/npEw6siArCMcTP3oaU7Mkjin9S6CpR+MOyeILH3w
	Bkk3c7KC5aRoDjKRBDTpEQGLUs5+TgUpZ1XjbTU=
X-Google-Smtp-Source: AGHT+IHyjzoTXOZKJa4hwgbG4e8Yc9hexnCBE0atwGcjugfJcLLU4etR4XMVhjcRF94lkGhyMZg4Rw==
X-Received: by 2002:a05:6870:15ca:b0:1be:d3a1:fd9 with SMTP id k10-20020a05687015ca00b001bed3a10fd9mr4286255oad.9.1695249084869;
        Wed, 20 Sep 2023 15:31:24 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/20] scripts/create-pull-request: update URLs to git repositories
Date: Wed, 20 Sep 2023 12:30:50 -1000
Message-Id: <c88343380bd6a66f6e18637170c53b003594af7a.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187961

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also remove the git.pokylinux.org URL, no longer used.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47b88d143c2fc61ce0e03b7eb3a9dbcffadbf5b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/create-pull-request | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 2f91a355b0..885105fab3 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -149,13 +149,10 @@ fi
 WEB_URL=""
 case "$REMOTE_URL" in
 	*git.yoctoproject.org*)
-		WEB_URL="http://git.yoctoproject.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
-		;;
-	*git.pokylinux.org*)
-		WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
+		WEB_URL="https://git.yoctoproject.org/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*git.openembedded.org*)
-		WEB_URL="http://cgit.openembedded.org/$REMOTE_REPO/log/?h=$BRANCH"
+		WEB_URL="https://git.openembedded.org/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*github.com*)
 		WEB_URL="https://github.com/$REMOTE_REPO/tree/$BRANCH"
-- 
2.34.1


