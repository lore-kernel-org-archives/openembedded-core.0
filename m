Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pya3j-0004Ym-88
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Mar 2011 02:25:28 +0100
Received: by yxn22 with SMTP id 22so1672898yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2011 17:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=l+KYM2ahZIuk6LVbYgVMK3uTRX7m5k6R5L/DP6Jl3Xo=;
	b=rjfwLmAKGbwLYM002rr4/m36J2OKO7/2+F5RAmFQKBl4Zzqi1sgtEl/dkLivp17jkv
	7YiciRw3dc87pPKDC/MigtPuSx8oE6x16QK/JevMgIsgurlUnuAVAwzB1MRs1z2YoEh3
	/O3cULe5uwi6j6o6w3gWTFTbKRIkLVxLVp2hg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=wr/CBBnKsJ6WElDbtfTTeScxjiSqpgtv9ege4+CS4bqJdTmnk96kr20II0VgfdFVHM
	54fSDL8fYlBo/MlbIOLf3AC3ybrSnfcbJbsHQEtME/D2qxSfOM0Wj8Pwwh7/h9uvy53G
	Q0e7ZmUysGFKE+CtpfUlWlSQvRC+hH6iGCBeA=
Received: by 10.151.134.17 with SMTP id l17mr4364895ybn.376.1299979427004;
	Sat, 12 Mar 2011 17:23:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l2sm4248906ybn.15.2011.03.12.17.23.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 17:23:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Mar 2011 17:23:41 -0800
Message-Id: <cover.1299978990.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Upgrade netbase recipe
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
X-List-Received-Date: Sun, 13 Mar 2011 01:25:28 -0000

netbase 4.45 is available. This patch upgrades the existing 4.44 recipes
to 4.45

Pull URL: git://git.openembedded.org/openembedded-core-contrib.git
  Branch: kraj/netbase-update
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/netbase-update

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  netbase: Upgrade version 4.44 to 4.45

 .../colinux/interfaces                             |    0
 .../{netbase-4.44 => netbase-4.45}/epia/interfaces |    0
 .../netbase/{netbase-4.44 => netbase-4.45}/hosts   |    0
 .../netbase/{netbase-4.44 => netbase-4.45}/init    |    0
 .../{netbase-4.44 => netbase-4.45}/interfaces      |    0
 .../mtx-1/interfaces                               |    0
 .../netbase/{netbase-4.44 => netbase-4.45}/nfsroot |    0
 .../nokia800/interfaces                            |    0
 .../{netbase-4.44 => netbase-4.45}/openmn/hosts    |    0
 .../openmn/interfaces                              |    0
 .../qemuarm/interfaces                             |    0
 .../qemuarmv6/interfaces                           |    0
 .../qemuarmv7/interfaces                           |    0
 .../qemux86-64/interfaces                          |    0
 .../qemux86/interfaces                             |    0
 .../{netbase-4.44 => netbase-4.45}/tosa/interfaces |    0
 .../wrt54/interfaces                               |    0
 .../xxs1500/interfaces                             |    0
 .../netbase/{netbase_4.44.bb => netbase_4.45.bb}   |    4 ++--
 19 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/colinux/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/epia/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/init (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/mtx-1/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/nfsroot (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/nokia800/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/openmn/hosts (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/openmn/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/qemuarm/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/qemuarmv6/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/qemuarmv7/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/qemux86-64/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/qemux86/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/tosa/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/wrt54/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.44 => netbase-4.45}/xxs1500/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase_4.44.bb => netbase_4.45.bb} (94%)

-- 
1.7.4.1



