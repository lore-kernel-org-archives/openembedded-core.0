Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3GZu-0007WT-Bl
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Mar 2011 00:38:02 +0100
Received: by iye7 with SMTP id 7so1114353iye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=AgOzMCV3Y+JvzGCUxp59kPprZeRjAxr9RNKdEuquQJw=;
	b=ZPPJw2CJCHH7t8hFD+MwUpkPahhobmA51ebcxR67+JlWgHWo9RUZqjDtG6kEQBj3Ks
	jSHAOpsHbTdjI/lGCQJN7R5qweNQpv6zqCTwybKExctrrLvTEIrMPi2jV6jD3sdvZe5s
	dQloexw+Eg+7M3WhtKUUSbJA8CUeHq36xxPqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=C7bWL9OUF8bXnJ9FVY4Zsl5sPKj6kUMO/OBO1eXx08nDU2oGxgSyZ6WS0plTUbuWsL
	/7iES97faHLpfTFBSaoy/zgeVkvQyb31uuYm9nTcAzyVUc+BQhCiCqjrJguOK4806Akq
	qwvHdGVh5Cgqunfs0yd8/VWzz6Ru3dkWA2Lkg=
Received: by 10.42.221.196 with SMTP id id4mr2038023icb.141.1301096163832;
	Fri, 25 Mar 2011 16:36:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 19sm952507ibx.52.2011.03.25.16.36.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2011 16:36:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Mar 2011 16:35:56 -0700
Message-Id: <cover.1301095943.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Call stty sane always and expand qemu target list
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
X-List-Received-Date: Fri, 25 Mar 2011 23:38:02 -0000

This patch series has two patches, one calls stty sane always before exit
previously it was only called if qemu crashed

Second patch introduces a new variable called QEMU_TARGET which
can be set by distributions or appended in layers to select
reduced set of targets to build in qemu-native
It weakly assigned and list is expanded to include SH and MIPS64
to help oe distros.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/qemu
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  scripts/poky-qemu-internal: call stty sane before exit
  qemu.inc: Add sh4,sh4eb,mips64,mips64el targets

 meta/recipes-devtools/qemu/qemu-targets.inc |   18 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc         |   12 +++++++++---
 scripts/poky-qemu-internal                  |    6 ++++--
 3 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-targets.inc

-- 
1.7.4.1



