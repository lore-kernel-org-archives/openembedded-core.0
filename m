Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jbQ-0007kQ-Jz
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:13:17 +0100
Received: by iyb26 with SMTP id 26so6818907iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=alCg9wgVuxDghqW+1Fc0hj/Dt5/ePr5kSX3YO4zh4x4=;
	b=SM/4HbwnGcHZc5bdwON62SQdnPvMSw5oG7FdmO/XVoZhn7g0HlTxVnZ1vpVnNhR+TU
	7cwKQ1WxaaZuyXZDcVdgqyBKuehxjZxYSfOOOvtl1r407ZGsFzDIactfCHSgm0qvgbQh
	SsjhQGgXUPFku9KCtxX/c4U46DemHPYwKeteY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GiUqstEX5aB1bull4rSMZM5BW59rX4qOP+giFW/Y+daVJWbk3CKaIpjtxBf880doz3
	pfXNUmywode521fZc+0yzp3cmsjqDTrZkqr52VfLuNOkbsrWWfHt6LHfR7tuSFS3V722
	ftuw5q0HGpzzarcdl2ygPcVjIwgPZPagFpeHE=
Received: by 10.43.56.197 with SMTP id wd5mr7210225icb.479.1300731086540;
	Mon, 21 Mar 2011 11:11:26 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 41sm3847955ibi.61.2011.03.21.11.10.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:11:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:10:52 -0700
Message-Id: <cover.1300730825.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] Prune global compilation flags
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
X-List-Received-Date: Mon, 21 Mar 2011 18:13:17 -0000

This patch series is for removing the unneeded flags in SELECTED_OPTIMIZATIONS
that gets passed to every recipe build by default. I have also introduced flags
to remove duplicate debug information which will reduce the debug info sections

Tested by building and booting console-image/angstrom on ppc,arm,mips,x86-64,x86
qemu machines.

Please apply

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/global-opts
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/global-opts

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (3):
  bitbake.conf: Prune global OPTIMIZATION flags
  machine/include/tune-atom.inc: Remove FULL_OPTIMIZATION_pn-gtk+
  gcc-runtime_4.5.1.bb: Fix ICE in gcc-runtime with
    -feliminate-dwarf2-dups

 meta/conf/bitbake.conf                         |    8 ++++----
 meta/conf/machine/include/tune-atom.inc        |    4 ----
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb |    7 ++++++-
 3 files changed, 10 insertions(+), 9 deletions(-)

-- 
1.7.4.1



