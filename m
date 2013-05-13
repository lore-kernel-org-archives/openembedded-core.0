Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ublo5-0001ft-7z
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 08:00:43 +0200
Received: by mail-pd0-f181.google.com with SMTP id p11so4107383pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 22:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=yzOdP8a9k+t6nKkfO7DsbTM4GAgR8TqA4iR0xiUCTlU=;
	b=dmnjocOuO5l78B6N/R4VoAg6k/gXs5XQvNuiehtNGjJHY4nT+v45msa58njmSUtEAV
	/eosCCDzyM2lwMq6rtXGIbcyYHBFNngS1ZAfBo4uHEKnpRh2kThubpaDoBe1QOrLQYo+
	WIOcWuxdwb7DJoaZ1MQE/V8ra9626NjLle6suh0rWur2UgGUw+nUt9rkdl+e8Xug7rk8
	KtzYy66QOghVLauZz/Sm88LBRzcn9TZ0z04+iJ7Xvay0Jc9EzDTcdKnLRNhoqw/EhX0p
	bY1/mTEgln/fQa1tYxR83Da5/nzHOzNjF511aa/xg+e5iXhxGtwkrXyBBpB020HkF/LE
	kXlg==
X-Received: by 10.68.1.6 with SMTP id 6mr5585566pbi.146.1368423731074;
	Sun, 12 May 2013 22:42:11 -0700 (PDT)
Received: from norse.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id q18sm5854555pao.4.2013.05.12.22.42.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 22:42:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 May 2013 22:41:44 -0700
Message-Id: <cover.1368423406.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 06:00:56 -0000

This patchset adds a new qemu based machine target for mips64 Big-endian
linux-yocto recipe is modified to have it in tree to support qemumips64
machine

  image-vmdk.bbclass: disable the NOISO = "1" (2013-05-12 09:37:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/qemumips64
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemumips64

Bruce Ashfield (1):
  linux-yocto: add qemumips64 compatibility

Khem Raj (3):
  runqemu: Replace use of ifconfig with ip
  binutils: Add broadcom XLP support
  machine/qemumips64: Add machine definition

 meta/conf/machine/qemumips64.conf                  |  13 +
 meta/recipes-devtools/binutils/binutils-2.23.2.inc |   1 +
 .../binutils-2.23.2/binutils-xlp-support.patch     | 398 +++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   2 +-
 scripts/runqemu-gen-tapdevs                        |   6 +-
 scripts/runqemu-ifup                               |   6 +-
 scripts/runqemu-internal                           |   6 +-
 8 files changed, 423 insertions(+), 11 deletions(-)
 create mode 100644 meta/conf/machine/qemumips64.conf
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/binutils-xlp-support.patch

-- 
1.8.2.1



