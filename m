Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAA5C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:49 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.30658.1668892548244689391
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VG25WwLP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id n17so7909296pgh.9
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usmz31EYYSSj+4S+zS4b0ioDmww0yMXv8w+GYm6oIn8=;
        b=VG25WwLP7J3Ts0rZ8eWyFYX26i0bk+dfCJdkTt0uXKZf11pTQbTcyun8TjmfIdowto
         8RC5/+Y/GEaP8yZeyBO1tRefXMWdbSG8m9vhNkxEVO9q91VCMVhgvPkNhgRpNqgxedyx
         o6EHVWZdmK1XvF3bAVwGF6Cb5VuSTbge7/U/dQ8ELOzUJ4Ge4GD4cyK4XUJnW0fK3+8M
         8KBK28SFLJ0zZO6VOKq2ovWYCFhgHiiMJYcMgsj/Hhr4ywiaNrNQ+59Q+Nghty0fav2h
         t320y5DfCVWwNpcv/VVElZ5wotakOfWmtUyg1UJoaFZQ0f8p1eRrq72dxqnrKT2q4F6j
         n/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usmz31EYYSSj+4S+zS4b0ioDmww0yMXv8w+GYm6oIn8=;
        b=dcFYklXeJz91FiiqfBxKzevsm+gBTCbf8fItLzlPN6kS9sh6hMlKL/f3alkgf+7nsb
         v5aGip8RA+CJIphno871Ym/ORaPMl8Yo9AN6Qw7TL6z+86igJG0NY3fBpkvagzDRVcRW
         CMZIoGMxYClGOoBX0kyvfKS5p6B+mL5AgJqR34cUNQbCD+pwlQ2pq/VyYe9Y0G6I9WWU
         PFb4d4XCzTDfJ/XqTdF0ipoddRXpUzfzLHPLRdzK3C+9OCalynxwX+auqGjf/vClS4+v
         C1eheGSnhllIFeJ4+P+FZkxeEzwuxTB+thG10HZQwQJ8CNnCBpQ4vQMiqGLfGXk66SI0
         HnZQ==
X-Gm-Message-State: ANoB5pmsfA3bz00Rh4ByZP7hvvRBJjzuD3iPdq9HZ3tNRZd5/dR8j+qV
	1CMrXbKc4tqxWPyBp26mf4hc3Am2Jtlz8TT/TYw=
X-Google-Smtp-Source: AA0mqf68sMLvaAeOC8aJjJW9PzzYUQPs3ZrTNwaTeKFdiGNYER99xR3Y9kbZJoBWKSzUzunMp0XmmA==
X-Received: by 2002:a05:6a00:2a8:b0:56c:db44:7b1f with SMTP id q8-20020a056a0002a800b0056cdb447b1fmr13945201pfs.54.1668892547289;
        Sat, 19 Nov 2022 13:15:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/35] cargo_common.bbclass: Fix typos
Date: Sat, 19 Nov 2022 11:14:52 -1000
Message-Id: <48e7851721735f31be5ed5a69b516c2b18c4c2ab.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173553

From: Alex Kiernan <alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7a92180b21e75a84f632e4c16e63dc1f4861a00)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cargo_common.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index dea0fbe2f6..f503a001dd 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -56,7 +56,7 @@ cargo_common_do_configure () {
 
 		[source.crates-io]
 		replace-with = "bitbake"
-		local-registry = "/nonexistant"
+		local-registry = "/nonexistent"
 		EOF
 	fi
 
@@ -103,7 +103,7 @@ cargo_common_do_configure () {
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		[build]
-		# Use out of tree build destination to avoid poluting the source tree
+		# Use out of tree build destination to avoid polluting the source tree
 		target-dir = "${B}/target"
 		EOF
 	fi
-- 
2.25.1


