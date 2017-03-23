Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 318BC72F71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:11:44 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y90so7108560wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lcinvM8z+YUlOm3uUEYSeYgpf2miGIvKFm+Y11UH1Nw=;
	b=XVhh+qYbbUWuaiplJOOL3Av1Te04C8NqkiY6bzEpDrtSgL4XumDAs58uy3rDM+WSwt
	7Y81y/XXhOXnpWHpICB+8mnd/APh28T628KClYPEv0s8sXtkfveWAY4JvWoDyEjXMlpM
	wN8qbIBKPAO2azho4ho1qbRTlWEvlWEuNepC8QLou9KRbB0iOj3UKna5+bY2aGigl0Dm
	UKyMgl6PtPtV1bxzyPQ+ba4eUOLSbX6lEn4CcDx9Hj/hV1ik48xmL+XipFHxxGBIuMM3
	iKwXPpXDjQH71VsJwAop1RXH12uIM7yv5ZlHd+a+wjV6avM8UAiXxwEb7iYktqBX/Elv
	S/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lcinvM8z+YUlOm3uUEYSeYgpf2miGIvKFm+Y11UH1Nw=;
	b=MCa3I2dC8jc72BViHSOLYITzwrUM/TfDOShYuqW/gLqB1ak13m6kfyzJrRooKNxU68
	5Z+Alxug8RouoiH4/X3azjGCrHFWS+1p2iN5NaFaiuygMpLfZlNMhdlt3DqtKjkoHoJ8
	HcDeyXJEOG6EuVDOp2GrgP1K+Ic4XZqR59IAdofadO8453ze/xkLtfaD5LoysMYGCI88
	sF4Ar2zh7C2ehYdyRiLLWIMl6CDQGtOdBu44qxmQJQ9ROiVB+OifBZ1d5ofP3cejzUzt
	Pk8J4b7Vv16l4CwUfaJTt25e39p3W+GJZEWwYbbGH0v/t7QFvHrecXWdvWN2NFtsicVC
	CUKQ==
X-Gm-Message-State: AFeK/H3wc7y3mkqnaz8137rH4jLD9qWbVfZa683NyegAGNbKts38TXTfh5vyoHaYIS05tw==
X-Received: by 10.223.165.17 with SMTP id i17mr2467275wrb.70.1490271105844;
	Thu, 23 Mar 2017 05:11:45 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	k190sm4093773wmg.10.2017.03.23.05.11.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 05:11:45 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:11:11 +0100
Message-Id: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V4 0/4] Fix some issues of kernel/image recipes
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
X-List-Received-Date: Thu, 23 Mar 2017 12:11:45 -0000

From: Ming Liu <liu.ming50@gmail.com>

Changes in V4:
1 Do not append 'vmlinux' to KERNEL_IMAGETYPES.

Ming Liu (4):
  kernel.bbclass: fix some incorrect inter-task dependencies
  kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
  image.bbclass: remove initramfs bundle related code
  kernel-initramfs: add recipe

 meta/classes/image.bbclass                    |  13 ----
 meta/classes/kernel-fitimage.bbclass          |  10 +--
 meta/classes/kernel.bbclass                   |  26 +++----
 meta/recipes-kernel/linux/kernel-initramfs.bb | 100 ++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
 5 files changed, 119 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
2.7.4


