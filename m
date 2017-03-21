Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id C6F4F6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 00:55:15 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id g10so102809113wrg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 17:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tKMZ2Gh8hyouk527nTDQWip1BOCCyPEoTuz6fxj+5KQ=;
	b=k6awrhCET6Lwn5oSkmP9H1GDPDHQsJ2pWSP1x/5r2gnXgiAN1uV2U/1AsQ8Sit1/eM
	dz5HPGsZnyBVm//12tu+stZ+Y0fSyOjowoyGrl8A3LwLNfTGVDi8egqYU97vL+pnmASy
	UiIW01bKla8kGwazKH4k4Nn4LnISdVuj0mmtKMlaiipQ1yEiO0qiQNXCVsw7KpQj3z1y
	gslecdY+GQsMKeAvbGIf5BUTZoN5vdGNjP1dCRm9KPuPDPeH/8OMe10PKQUOfyNUekCG
	8KVSf/WQ3PnUsY3yY4VHBgEeC2Gf5+PtJCuHNVCAwbf5vx8QucM3ZVp4ifpwKkZuTgDN
	cIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tKMZ2Gh8hyouk527nTDQWip1BOCCyPEoTuz6fxj+5KQ=;
	b=q8mxECGo9P0Y4i1VXU+d7WZvYHsfZY+rYu3Zi7fWwygEI4Rr8ygo8izCdGck8waLuv
	J9pufY4Zd1i47Z0BJQ3n83yZ9SwupJeu4xd/wRLCN7J/Ei8jEAuqzGAP7/pFV5pEvP44
	aX5gjbUv1VHnRfXxbEauzCdzxChupyXuqdXy8YVHDOq3KJaeIzqfB4v/p0PspbTcGLQl
	zdoCC9x2yq2ye7BhjDtSpDPxh7pfxaPfts06qBYRDPMbfW5I7zvnN+kiMxP16g7p/69+
	ti7oQm8yPnzL9DdPlLeqEh2QOhKqauqyzF2q/gFKWjJA+AoSqdK4HGOCemhACV3zNSb6
	Frlw==
X-Gm-Message-State: AFeK/H0dXHFdbVlJIUPgfr4NV5o06gOQQpSdvd2aN9KC6wdVvrcQNutmWNOlRAVzEONs6w==
X-Received: by 10.223.179.90 with SMTP id k26mr5776526wrd.139.1490057716305;
	Mon, 20 Mar 2017 17:55:16 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([223.104.101.84])
	by smtp.gmail.com with ESMTPSA id 10sm8882258wrz.44.2017.03.20.17.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 17:55:15 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 01:54:58 +0100
Message-Id: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Peter Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 0/5] Fix some issues of kernel/image recipes
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
X-List-Received-Date: Tue, 21 Mar 2017 00:55:16 -0000

From: Peter Liu <peter.x.liu@external.atlascopco.com>

The changes include:
kernel.bbclass: fix some incorrect inter-task dependencies
kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
image.bbclass: remove initramfs bundle related code
kernel-initramfs: add recipe

Ming Liu (5):
  kernel.bbclass: fix some incorrect inter-task dependencies
  kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
  kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
  image.bbclass: remove initramfs bundle related code
  kernel-initramfs: add recipe

 meta/classes/image.bbclass                    |  13 ----
 meta/classes/kernel-fitimage.bbclass          |  10 +--
 meta/classes/kernel.bbclass                   |  73 +++++++++----------
 meta/recipes-kernel/linux/kernel-initramfs.bb | 100 ++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
 5 files changed, 139 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
2.7.4


