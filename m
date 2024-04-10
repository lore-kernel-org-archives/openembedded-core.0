Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE467CD129A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:29:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.162655.1712741391653746125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 02:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FozpkQuE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-416a208d496so12020035e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712741390; x=1713346190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLqh6+yinidPsXKL0OcYIWo7fnhcpEWrfUTNvkxflU8=;
        b=FozpkQuEW1RYnk4sCSL9X6vBZfDQ+HAGYJZ6W91XhfBMC7bv4U6CTN6Jo15KdDm6Hm
         EViOqPlOEqrZIiua7Ki3Yeudpt5pSxKYgNO//Fc8a1Rl/bOhtmGUYkTUvMXsoSzNIhq8
         sQJHaPwZal/aBPkwPKd4LhYWkzxZXKRUVzDqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741390; x=1713346190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLqh6+yinidPsXKL0OcYIWo7fnhcpEWrfUTNvkxflU8=;
        b=AEKTngWAVfvSRAsOjwx08nEHcjXG7T+yeeR8hhmQ1f9YGBLMgqQMfad8uBubckPJTp
         X7pBqpfq9UFw388FdY4+G0SslVR2Pte92npxgcJG3K6ajZYBtZF5Cc7rupPs8cLi+QIk
         2ANCqmwS1YlLR/3aNTTb79b1p4Ada8mXb4Ca1ihehyGwGHGNIbl/dFqJW967L2Gt7Pps
         cAKUPKjXBpt2u7lJIz2huI2YUDIVg+i46vF/Ox1JYmtBw17UrShpcPUUt0oeB26vdWAe
         CEyrtXnkJWBqMvULwrB+GesjSpsccBlBobgdtJhlWghM8HywG+by28QGPFpEi72QDZ2z
         mmtQ==
X-Gm-Message-State: AOJu0Yy5xdxlsQoqa9UM8jkBkQlc3BZJr0DBkCKE6xEiteihnDFpHLGn
	VhglXeS+3XhTp0hM/dpei7cThHUYTdHzjD6UMRpZl6alo9R8BY/MZopnClyhsVo=
X-Google-Smtp-Source: AGHT+IGtgVuV2oPwJiQyzwVqW3Jx73Qw6f67FVf/jIfpfzC2Dz9kdu0V5lHmZvxjnD7kqAp3OSymAg==
X-Received: by 2002:a05:600c:138e:b0:416:8091:a39e with SMTP id u14-20020a05600c138e00b004168091a39emr1594159wmf.10.1712741389953;
        Wed, 10 Apr 2024 02:29:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:502:f603:97df:1110])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c3b8c00b004165315d885sm1703165wms.11.2024.04.10.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:29:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto-patches@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
	seebs@seebs.net,
	mark.hatle@kernel.crashing.org
Subject: [PATCH 1/2] README: Switch to yocto-patches mailing list
Date: Wed, 10 Apr 2024 10:29:47 +0100
Message-Id: <20240410092948.1989389-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 09:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198087

We're trying to align the various components so tweak pseudo to match our
other projects a little more and use the yocto-patches mailing list for
submissions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/README b/README
index 468cf66..425ee6e 100644
--- a/README
+++ b/README
@@ -1,17 +1,9 @@
 pseudo -- an analogue to sudo
 
-IMPORTANT NOTE:
+The official home for pseudo's git repository is:
 
-As of this writing, the official home for pseudo's git repository has
-changed to:
 	git://git.yoctoproject.org/pseudo
 
-The old site at:
-	https://github.com/wrpseudo/pseudo
-
-is no longer the "real" master, although I'll probably try to keep it in
-sync.
-
 OVERVIEW:
 
 The pseudo utility offers a way to run commands in a virtualized "root"
@@ -88,7 +80,6 @@ available for other people to look at.
 
 CONTACT:
 
-Discussions and patches should be directed at the openembedded-core mailing
-list at openembedded-core at lists.openembedded.org. More information at
-https://www.openembedded.org/wiki/Mailing_lists. Bugs should be filed with
-the Yocto project at https://bugzilla.yoctoproject.org/.
+Patches should be directed at the yocto-patches mailing list at yocto-patches
+at lists.yoctoproject.org.  Bugs should be filed with the Yocto project
+at https://bugzilla.yoctoproject.org/.
-- 
2.40.1


