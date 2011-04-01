Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0B-0004q3-QF
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:28 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so571564pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=OMhltZi+1Ko3JwuKERbTVF6buFdaWED5CNmX5fwkM4c=;
	b=AOpbI1AmuuMJzy7hGRLB5fnOMr0Wg4iVkALyngO43SoG/c9vwmVP8O/sgHmsuS/9Cg
	W1yFjjDdyBi1mEYN//yVCVfwG5p0zjoAA3iTzfLg38yhSxN47ho1FMITTxlez4/cnCoz
	dfmV3vN/r2Rn1fCZx1txU+ZWqZfj/7Pephh4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nuINvuJW9e2Q9AHFWmsw01G/qLcA3bR7KCr4XYLzIn8O1Rp0t0F0rqdY+j6utAbykd
	2ipmRUMw2cBIdOk3gcTP5/0OBfGV2wf9bC2wK9yrQkfRuixgqXu7gB0u2kGh0KF2kqPq
	t82g4qW1zdQXuLqoPK8k9ajfxhOzyInSA2x8k=
Received: by 10.142.107.12 with SMTP id f12mr2567741wfc.226.1301632108971;
	Thu, 31 Mar 2011 21:28:28 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm2378668wfb.22.2011.03.31.21.28.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:20 -0700
Message-Id: <e86b14a1b5781214e62c943c5f185a592c845738.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 05/46] conf/distro/poky.conf: Use -uclibceabi instead of -uclibgnuceabi
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/poky.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index 76620f9..748e0ab 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -54,7 +54,7 @@ KERNEL_CONSOLE = "ttyS0"
 
 # Default to TARGETOS values for EABI on arm
 GLIBCTARGETOS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
-UCLIBCTARGETOS = "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
+UCLIBCTARGETOS = "linux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
 
 POKYMODE ?= "default"
 require conf/distro/include/poky-${POKYMODE}.inc
-- 
1.7.4.1



