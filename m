Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pya3q-0004Yt-Ox
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Mar 2011 02:25:35 +0100
Received: by pzk35 with SMTP id 35so427794pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2011 17:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=lMPE0T+FzmKQ6ndh6bNcJaXwQs2NWBR0nLYS1RizOIw=;
	b=jePJHGYszdl6Ppn37dkBvjXtBoXKhuVtWYUkI2dtGJNgAC+4EGbtVwHP3sFzYyqN99
	mBkIE3BF/8KyoF7adXH+8Sy7tvx8jMpJ/qApzY6Uie1ciZiSuJ31ysBDep9HFzVwRwpp
	MBgsu+3uNLp3CgkKNV0kEhQfCFJul9inVVnCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cpDZSuAAkcoL+ePTbMwmvnk/NmXJdHzsY47xAUpSg6mnAvaxHzAOTkzueF9xZH9//y
	gEZHF0m8ibMJ759Ol5MpAI4IUfi34fLWSe9qnQUgvJKfCW7kb0PEz/9bH7q/suqhkbRe
	ZKswYZrko44ctoAz0Lo5VrjObSbmAWR+5KyOY=
Received: by 10.142.9.36 with SMTP id 36mr145895wfi.125.1299979430469;
	Sat, 12 Mar 2011 17:23:50 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w32sm7805592wfh.19.2011.03.12.17.23.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 17:23:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Mar 2011 17:23:46 -0800
Message-Id: <30b1ab34f7ac33e27809c7f73c24ac1b15447e18.1299978990.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1299978990.git.raj.khem@gmail.com>
References: <cover.1299978990.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] netbase: Upgrade version 4.44 to 4.45
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
X-List-Received-Date: Sun, 13 Mar 2011 01:25:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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

diff --git a/meta/recipes-core/netbase/netbase-4.44/colinux/interfaces b/meta/recipes-core/netbase/netbase-4.45/colinux/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/colinux/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/colinux/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/epia/interfaces b/meta/recipes-core/netbase/netbase-4.45/epia/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/epia/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/epia/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/hosts b/meta/recipes-core/netbase/netbase-4.45/hosts
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/hosts
rename to meta/recipes-core/netbase/netbase-4.45/hosts
diff --git a/meta/recipes-core/netbase/netbase-4.44/init b/meta/recipes-core/netbase/netbase-4.45/init
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/init
rename to meta/recipes-core/netbase/netbase-4.45/init
diff --git a/meta/recipes-core/netbase/netbase-4.44/interfaces b/meta/recipes-core/netbase/netbase-4.45/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/mtx-1/interfaces b/meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/mtx-1/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/nfsroot b/meta/recipes-core/netbase/netbase-4.45/nfsroot
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/nfsroot
rename to meta/recipes-core/netbase/netbase-4.45/nfsroot
diff --git a/meta/recipes-core/netbase/netbase-4.44/nokia800/interfaces b/meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/nokia800/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/openmn/hosts b/meta/recipes-core/netbase/netbase-4.45/openmn/hosts
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/openmn/hosts
rename to meta/recipes-core/netbase/netbase-4.45/openmn/hosts
diff --git a/meta/recipes-core/netbase/netbase-4.44/openmn/interfaces b/meta/recipes-core/netbase/netbase-4.45/openmn/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/openmn/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/openmn/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/qemuarm/interfaces b/meta/recipes-core/netbase/netbase-4.45/qemuarm/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/qemuarm/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/qemuarm/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/qemuarmv6/interfaces b/meta/recipes-core/netbase/netbase-4.45/qemuarmv6/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/qemuarmv6/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/qemuarmv6/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/qemuarmv7/interfaces b/meta/recipes-core/netbase/netbase-4.45/qemuarmv7/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/qemuarmv7/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/qemuarmv7/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/qemux86-64/interfaces b/meta/recipes-core/netbase/netbase-4.45/qemux86-64/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/qemux86-64/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/qemux86-64/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/qemux86/interfaces b/meta/recipes-core/netbase/netbase-4.45/qemux86/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/qemux86/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/qemux86/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/tosa/interfaces b/meta/recipes-core/netbase/netbase-4.45/tosa/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/tosa/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/tosa/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/wrt54/interfaces b/meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/wrt54/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.44/xxs1500/interfaces b/meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.44/xxs1500/interfaces
rename to meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces
diff --git a/meta/recipes-core/netbase/netbase_4.44.bb b/meta/recipes-core/netbase/netbase_4.45.bb
similarity index 94%
rename from meta/recipes-core/netbase/netbase_4.44.bb
rename to meta/recipes-core/netbase/netbase_4.45.bb
index dbb7e83..68cde85 100644
--- a/meta/recipes-core/netbase/netbase_4.44.bb
+++ b/meta/recipes-core/netbase/netbase_4.45.bb
@@ -57,5 +57,5 @@ PACKAGE_ARCH_qemuarm = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86 = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86-64 = "${MACHINE_ARCH}"
 
-SRC_URI[md5sum] = "a8d0bfed8a67273a276fc792524bc103"
-SRC_URI[sha256sum] = "eb2d4db2e3ec20eeea1e22962bce46f9651bf63e8add2ba6d4e996f0befb2823"
+SRC_URI[md5sum] = "a56cb362ece358a5b3b8972e5c7be534"
+SRC_URI[sha256sum] = "dea29d60b3d751f0c5669b5299af312ad269c48e6440e0072d0d68d9544ebad3"
-- 
1.7.4.1



