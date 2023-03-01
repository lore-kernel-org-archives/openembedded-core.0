Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00B5C6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:14:09 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.24969.1677683640113549528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nREc9YIS;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id r5so14563052qtp.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UtJFzg76hm3APuenoQtF1mAJKx6aGTjNHYGJ+ic4oE=;
        b=nREc9YIS5Ei448RbxTbqrIgy2X5X32wRjCOsKh3NPzN9WzIuYhdaXaUHsW0T9sixh6
         2bJEYR0bxeDE60GUE33kzWiKvxK2K3pdJ6WqDvP7+F5/dEf54mpeMes0h92EXdK1c5Ub
         1w5+GG+kvlRNUqc9v/8HKA1ttmIDvCmbyMVgAkEsswfctNwen5WQyuyF5nhlzCDLpk9d
         uTiytKY4gU3LUcYD2cYpPcP5904ThmOGMbU4qWod95DjmomFeR5qXeeP+rPxPjifsRL5
         NTQZF5PXM23gfLdRlDENQuuLCk9JN8GWt21fRReYyKhVCKtH/K6ykiQwzseAVrAZ19+e
         7ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UtJFzg76hm3APuenoQtF1mAJKx6aGTjNHYGJ+ic4oE=;
        b=voFq9am/h0QY4mk/luIUMRBJPt21mALk1vPWg6xrsO5QV6NSfpUU0RpbvsKWwOUBPv
         zmQOxEAZVQ7z0kE4FbE2GdM1Mu7pSknRyM7/8w43CvKWKGsVLkTbfA0KTyjn/BMOrbb6
         WJhScoak6ONm3L5QdALu7GhBkryQcEIXFZauRUo8jdHyR1jVCh6VR6hfmIF54hpoNBSx
         5xSe/Y5sFh0IIDFyjIUoOgvKWclwkjoBaXHkqfRgPrABOV+pPNx2R3XhfZTcJbZWr5/f
         zleY0Zr5GtyUj2zQqy+EzRDs4CvgyrG1qQml+yJ3UQXqjlHOVDQMaDWLmMjEZm9/lxR3
         VAxg==
X-Gm-Message-State: AO0yUKVnqrqHTIOvlJcaBTpIerx6PErcCIwEoRlr8gQnzejrDgbGEQYj
	p+rzZ4fqNfSI/KChzf1XGLjJWGjdHsk7Vw==
X-Google-Smtp-Source: AK7set9+e7NuGxvIVRao/nj63UX5MdlQIyTVQcbyEL8jfhgnvvr/apOY0ytPR6k4YI3mhNqCZxVf5g==
X-Received: by 2002:ac8:5bd3:0:b0:3bd:85c:cb3 with SMTP id b19-20020ac85bd3000000b003bd085c0cb3mr11037967qtb.63.1677683639146;
        Wed, 01 Mar 2023 07:13:59 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm8472323qts.30.2023.03.01.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:13:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto-rt/6.1: update to -rt7
Date: Wed,  1 Mar 2023 10:13:45 -0500
Message-Id: <1e853e0c977288498c7e34d832aa2d53ff29da78.1677683523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677683523.git.bruce.ashfield@gmail.com>
References: <cover.1677683523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177942

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.1:

    fb6c0ef43abf v6.1.12-rt7
    18b89fa1b1fa softirq: Wake ktimers thread also in softirq.
    d096b2295771 v6.1.12-rt6

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 2b3cfdeacc..f0e3614c8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eb88226488a4e1ecee5653a0c060e9f6172ec72b"
+SRCREV_machine ?= "fb6c0ef43abf097dcb4c5c94f0609c2f3e3f339b"
 SRCREV_meta ?= "e8d08fc4c02c80ef13d4e540f70364c27f8a310c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.34.1


