Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKxNo-0005R5-63
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 20:46:40 +0200
Received: by pwj9 with SMTP id 9so1351649pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=0RNqxpkJmo3O43WYc1jbeJZLLyXNC2eBYFzsxiVk7xM=;
	b=Bka5JSGe3pRsYQwTYbdvRR50fZGwT5PlEv/goNCd6dvSIwPZQCw+WLzZCNuXUrZlMc
	i45uMyMSmX93FBa3x8W7j9sG3ayJOqD6Yu+horvqN71GplQu7NzexHeURTot7bnVEFtR
	lrDsSpXdXHVkw8WN/p5GsQO1BAo5OUPt/j304=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=lGKtnOEjcZ8FmHiNYYZC1xYIHs4DaDF5l4ohEwKOfpB4Gkpt3QBMxDLy9+DnpGebnC
	uAhUkMHWXpuZw4xyV7QwB/wZRcNKAmBpM1a39A0TmtbJMP9cFMzznJutdN5Q6R+V64g5
	Oy4iCVt5xZlu2fsFrHA6yd9FsFMmOp9kHTkAA=
Received: by 10.142.216.11 with SMTP id o11mr983848wfg.199.1305311908689;
	Fri, 13 May 2011 11:38:28 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm2298838wfh.20.2011.05.13.11.38.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:38:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 11:38:22 -0700
Message-Id: <cover.1305311636.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Toolchain configuations for enabling ARM hardfp ABI
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
X-List-Received-Date: Fri, 13 May 2011 18:46:40 -0000

On armv7 machines with neon or vfp, gcc can support hardfp calling convention
These changes introduce a new variable to control the FP abi for ARM. This
variable can be set in machine.conf files or in local.conf to chose the 
desired ABI, The defaults remain same i.e. softfp calling conventions for
passing floating point arguments.

I have bootied the generated root file system on beagleboard

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/arm-hardfp
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/arm-hardfp

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  tune-cortexa8.inc: Define variable for controlling FP ABI
  gcc-common.inc: Consider hardfp knob for configuring toolchain

 meta/conf/machine/include/tune-cortexa8.inc |   14 ++++++++++----
 meta/recipes-devtools/gcc/gcc-common.inc    |   13 ++++++++++---
 2 files changed, 20 insertions(+), 7 deletions(-)

-- 
1.7.4.1



