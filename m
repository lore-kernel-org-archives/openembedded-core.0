Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLqxa-0004zt-HZ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 08:07:18 +0200
Received: by pvc30 with SMTP id 30so2018655pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 23:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=z0QXHIOhTPCk0pG6WlNWIqOSm68W9mtBrOYQM/de2wo=;
	b=JTO2muwDKVwg7l9kLBS9rNxoP/eshOiRqnZAY/QdbHB0r0yTvbSjWDm3hjTkRvEk1I
	C4yhF6EI49peBSqd/xfMFax0diYvy8FEA+g9CHEJznxVMM06Ehhc5QNl/IggkF/86rL/
	E00KiGIRRi2LeBa6EI3EhupFF5trIGi94lrcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nw045Q3XvskhD+mSifFceXgd7uFtxDQbwvr3ewwJt3Vp3AxWb7AHQUGMGl0UEcEGCz
	Bzw7HfaiaDMKS40nExyLp4H6d0Pk6881sqD8yQLh0ogtKXlYMQWTELGtswlYjifA9rIn
	rwpBnvLLkEvJIAeDcbR/DvaD6ao65P5MOWL/w=
Received: by 10.142.240.14 with SMTP id n14mr2502145wfh.360.1305525865639;
	Sun, 15 May 2011 23:04:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p40sm4409497wfc.7.2011.05.15.23.04.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 23:04:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 May 2011 23:04:17 -0700
Message-Id: <eca19ce0a0acc36dfc8d9d788f3ac1b1c59430f4.1305525725.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305525725.git.raj.khem@gmail.com>
References: <cover.1305525725.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] default-distrovars.inc: Do not add DISTRO_EXTRA_RDEPENDS and DISTRO_EXTRA_RRECOMMENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 06:07:18 -0000

We otherwise get these added to image dependencies in distributions
and they may not want it but would like to use those variables

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9b1d0ee..1aa45c8 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -14,9 +14,6 @@ LOCALE_UTF8_ONLY ?= "0"
 
 DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
-DISTRO_EXTRA_RDEPENDS += "task-core-boot"
-DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
-
 IMAGE_FEATURES ?= ""
 
 # This is a list of packages that are used by the build system to build the distribution, they are not
-- 
1.7.4.1



