Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5C0797B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:04:08 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id t19-v6so2876998ply.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RSxHgEqV972HulIudFcSGXoGE2ykGqZ6vHTfLvCR/00=;
	b=OjJkie7L8rLfqyvg/B70tDuu1qiohAwcmu+5ckbMbfW+jg3ZlP9Cum1vkK2H74/DGV
	73WKAmXk43C8VP64VuiV8F+4fTPSCQYm+PBFPKB/auwhHE7a912K1HiyHfdCm0bfUEOO
	t69YoQD2d62VuZL/STCuCkP1I5y6+ccJKsAs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RSxHgEqV972HulIudFcSGXoGE2ykGqZ6vHTfLvCR/00=;
	b=s/vzpg+OkiHhMnrcds9d5SPoEcH/8P83MVOKIW9cLQQZ1ugm+/O6PXH/iLvCzlMih4
	uwTTILIAz8xwnBnPBHATs5Uy8AYHCiQyR4m6gi72K8BEf4V2WSxyb4Hym/7fUtAPvKWv
	8DyoUOz3gIUmKRIXIR5Bc5lqkJswkasmdvdRN7UC3fodVAVawiEXvG50wGh2fuu95aka
	GvgKpV2LlsCuV9uwHEcQ1G8BtvMGrtgexpdQBcqgk6+/IIsa8r7cuvRd7JEk37Clw9k3
	6S74G7bDczyLXWkWTnOIzjGsgFn9/KH5QfYS35l2lr7oMJXNdcouNaCgXLzEtzEk4R5v
	4iGw==
X-Gm-Message-State: APzg51DCpFBdDw9wMdvlrwO61dSNxKfjMUS+7KITDG4l6kEoYYNotUmw
	JqwhZ04NZm6Wf2+k7AvTCXNizVf21mXLIQ==
X-Google-Smtp-Source: ANB0VdZiBcvrkn5nlA0kx3/sPxC9K4D/W1TjNUrdWnl10IoU93nkpm7L0rTe3RBNFbDzdjQS+jotJQ==
X-Received: by 2002:a17:902:b81:: with SMTP id
	1-v6mr35503038plr.319.1537373049252; 
	Wed, 19 Sep 2018 09:04:09 -0700 (PDT)
Received: from hex.int.rpsys.net ([209.121.128.187])
	by smtp.gmail.com with ESMTPSA id
	h20-v6sm24370600pgg.3.2018.09.19.09.04.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 09:04:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 09:04:05 -0700
Message-Id: <20180919160405.7291-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180919160405.7291-1-richard.purdie@linuxfoundation.org>
References: <20180919160405.7291-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] yocto-uninative: Add aarch64 uninative tarball checksum
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 16:04:08 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 38080c63b58..180d4e54baa 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -9,6 +9,7 @@
 UNINATIVE_MAXGLIBCVERSION = "2.27"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.2/"
+UNINATIVE_CHECKSUM[aarch64] ?= "5c9636d2683dca8b783763b5e52f80f12ac857c0f445cdaa58a8c2370583da77"
 UNINATIVE_CHECKSUM[i686] ?= "036b60092fe4acfa1a321d110673030db20344a2d56f33a4d047f0279498bdad"
 UNINATIVE_CHECKSUM[x86_64] ?= "e3b77208169bf1ac4e89496f3cdbf27695f5b18a2694a908a793390f28b67f83"
 
-- 
2.17.1


