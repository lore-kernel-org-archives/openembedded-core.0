Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FDFC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 03:55:39 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.24381.1643255737958811147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Okq4O7RB;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id b22so1505564qkk.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2yHUJ9nADtnYAOu8QGkp5BXouqQ7nI/0Ei/EoVHq+u8=;
        b=Okq4O7RBpOz93UimdEtPkUGFfFhUcWUGMWXLzC4N6+9/R2PHMKnZN21GWVldJlcvJM
         VwwL+ttaMKxpfHReRWWOskyHjScmD012mGgHYZgPXXw2cLEGq1Iup9ytGnpITkQ0Z/Mx
         0jWodB8TksX/sSQpO5K5MgPOzUosu2QDUK7fy3dQPNhy4jkcuIZWpGoZO1MjU3UuwPSY
         YpbfiuSAMKS98/gP2eVVx489m5/f0f7o7kh6cEmkI04xCtdHVi/FGp3+WLfzZ69Hq2CX
         H+jgQ6QWtvaN1i06cGFzBABkg/OvAnjw04iRXOVvgnUCf4sP9wyp3ve/tT4hsAn6M0oL
         caYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2yHUJ9nADtnYAOu8QGkp5BXouqQ7nI/0Ei/EoVHq+u8=;
        b=4DkjwuZt+8fxapuHk5fWq977bZWSVntMLvN5E+nQOTYb6ekZg3jAUMf/JQ7qCT6RdD
         McTXA1RqclCJW5CjCIvnDqLmiykDZ7tJW6dXMEhu7ZRpArAHA0OufNC70g4iuGLGLMhY
         28ANFH3xDye8coMw10XWwbpFmln9Vw2zVHPBC4Ml2IC+pdMNmwkY/E7TP8oKyr2gdFbL
         OJGqmROpT67+ZG0Up0HKKlBsEBQ9HMg+1HypqO3+QtDuzR+Hrf/iZ4iSVDj1dGO0STTe
         /ZtigEyLYVmX6Dw98vpAISzU8arR0xFicYxReqLbXBVQ2uV7H/SjqGxaqa7Yo0v6FHQ7
         YkAQ==
X-Gm-Message-State: AOAM5337/EdoAinkoaJZUROqE+JR5/HZgLet7RP5fz62hddzQSEYEfXf
	xhjC5buGOVC3BHVJ+s1/7oo=
X-Google-Smtp-Source: 
 ABdhPJznsgwmN2QJKsYExgBKRcrGVjyowNuBoPpQAtYLJLKpWieFdMZoezCieI24msFEucNme9Q6Lg==
X-Received: by 2002:a05:620a:1706:: with SMTP id
 az6mr1313989qkb.271.1643255736935;
        Wed, 26 Jan 2022 19:55:36 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id m6sm639405qti.85.2022.01.26.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 19:55:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel: consolidated pull request
Date: Wed, 26 Jan 2022 22:55:28 -0500
Message-Id: <cover.1643255467.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 03:55:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160996

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable updates.

As was previously discussed, we'll go with 5.10/5.15 and -dev at 5.16/17
for the upcoming LTS release (I can do a 5.16 versioned recipe if there's
interest, but since it won't be a LTS kernel, it will go EOL early in the
lifetime of the LTS).

Although the default kernel will be 5.15 for the reference, to make sure
that newer kernel interfaces are fully tested, there's a commit in this
series to bump the libc-headers to 5.16.

I built musl/glibc locally and didn't find any issues, and my AB run
shows green. I've also tested some of the meta-oe packages that have
broken with libc-headers updates in the past, and they also built fine.
So hopefully there's not much fixing to do with the libc-headers bump!

Cheers,

Bruce

The following changes since commit 92bb6f72ceb39c99e5c93c0a99b70fb210233acb:

  libical: build gobject and vala introspection (2022-01-26 06:27:00 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/5.15: update to v5.15.15
  linux-yocto/5.10: update to v5.10.92
  linux-libc-headers: update to v5.16
  x86: fix defconfig configuration warnings
  linux-yocto/5.15: update to v5.15.16
  linux-yocto/5.10: update to v5.10.93

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...ers_5.15.bb => linux-libc-headers_5.16.bb} |  4 +--
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 8 files changed, 42 insertions(+), 42 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.15.bb => linux-libc-headers_5.16.bb} (81%)

-- 
2.19.1


