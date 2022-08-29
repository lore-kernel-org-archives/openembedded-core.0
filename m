Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B83C0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:03:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.3645.1661806983630080711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vHuBOMzQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id x19so7525222pfr.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=0TChK/ltfd6clCuYA1NWdePZ8dAtx8ahgkoinbG75nE=;
        b=vHuBOMzQ/IP9DFdmjoOoNiIkFYz9N4Pzdw1ENsiBDctW9Gc7vc7eNIChJ8a3qfCJQl
         QEwKBFyFYublGgf13PIiMgWkZMCeaLrgR3gQIgmO9fBd0x60+zwvrvJBJ1f2hUKYDgWL
         X8mMm+Q+BtT1dtdjWocqCb66VKLLg/rqBKpAnZmWNv9pD3ZjD93N6C+03vFlnkE2kFVq
         qBX7QOGL8xKc4kf4efnsdBlyV7hsx98P0RjJprLi1ORAyZnv8G4TZrEK452zIVGj2tLi
         hsk/C0vgv1fUSVgPvB6y781Qj2iqkrXck757VDcnQ9s2cvACbtUWVGJ+1yaVl6MzJt8P
         OLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=0TChK/ltfd6clCuYA1NWdePZ8dAtx8ahgkoinbG75nE=;
        b=lYPh82rBc2YWh4Mb7TJC+lOGIpirFJEB4bGXLnSHhpTK2kmGgopQcbSbKXi/5MvPV8
         bLI8j4MdAZOfDcR2UjP0Gp/CE5EOcBqJnGiSXaWfwuftM7/Stc8mUa7yW0v8lwPnuMCV
         +Eh1EAxI2KcR8WckRyVymF9OErPuDnzR1Iik0uOtBlcdeqoXQZfmEw8b9CAgpIPOAIfV
         91qlOrPOaXCC4ZyVVDfVuJ4JPnzUT6Vo/0unIkANNCDZDtVNIpZro5EiVLQcIwPs3OVR
         928uGMmKJ4w0T2G4yKxsLhAcRHtX4DnP9EUi9MeNR3moPOWISwm6ZXV+jC+a3Yr8+7la
         skww==
X-Gm-Message-State: ACgBeo0w3pp3EysRvv6RpRz2GQM/ygl2P8azzmOGWNLTJnX9tOMRXBsi
	nXz759pe0RZhoUOmJq4RPJfAN15EAuDKUM3g
X-Google-Smtp-Source: 
 AA6agR7U7rp43bD5lYYt3UppY6u2rs99m0guGrX96UZ+ro9lXwNbSSi2LpUtDRkLjMOXPuuFMrYk0A==
X-Received: by 2002:a05:6a00:180b:b0:536:816b:f770 with SMTP id
 y11-20020a056a00180b00b00536816bf770mr18543569pfa.3.1661806982665;
        Mon, 29 Aug 2022 14:03:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.03.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:03:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] vim: Upgrade 9.0.0115 -> 9.0.0242
Date: Mon, 29 Aug 2022 11:02:27 -1000
Message-Id: 
 <169537045e614aa08052fd0130ea3199523bc8f3.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170033

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for:

CVE-2022-2816
CVE-2022-2817
CVE-2022-2819
CVE-2022-2845
CVE-2022-2849
CVE-2022-2862
CVE-2022-2874
CVE-2022-2889

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ec2d27d09444213ec1c9b91c6f8c4363f297294)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 30883384f6..8f89699560 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0115"
-SRCREV = "6747cf1671bd41cddee77c65b3f9a70509f968db"
+PV .= ".0242"
+SRCREV = "171c683237149262665135c7d5841a89bb156f53"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


