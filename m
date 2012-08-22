Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4FPv-0004wj-CQ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 20:12:35 +0200
Received: by pbcwy7 with SMTP id wy7so1742413pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8GlhCubWOez1DzsGEiG2fkK2hZySLWsAjxYT9ZqLbtg=;
	b=MBgcFu8cyWuwtgFGYXPwFdQu5Eyeowm9Tc8Hvh5USPQUBH2lia2/PbIdr70wvUyng5
	yA3A60Zh+CEJLiDlqySj2zlXASuiFO+MIuiAidok6YA5fdyqLkdBzpd7ZDe1OOABBeVh
	+phOuZFdREZt6tzq89oyBt1OF13uwHSFvVRRJ/3G8Tl33XAJkc4igMfFtqbDxim6zsGQ
	xqmINtOQf5WOpqM1ieg2EZYV0hpjg+k42rWz523LGx7C0ZT4q5qbuc32oEWxDrCx/Svl
	JFD8u8XBhaoq0PbOgTXM9S7dvxt11J4AiGszOfU49N69TvP56GTlyGbwciEt4LSBQB48
	CP0g==
Received: by 10.68.221.70 with SMTP id qc6mr55512013pbc.92.1345658425655;
	Wed, 22 Aug 2012 11:00:25 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pn4sm4142276pbb.50.2012.08.22.11.00.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 11:00:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 10:59:48 -0700
Message-Id: <1345658390-19692-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
References: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/4] linux-yocto: Remove parens from COMPATIBLE_MACHINE regexp
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
X-List-Received-Date: Wed, 22 Aug 2012 18:12:35 -0000

This helps in appending to this regexp from bbappends
coming from other layers who want to leverage linux-yocto
with minimum tweaks by using a standard prefefined machine
from linux-yocto

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index f5e812e..4d19664 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;b
 
 SRC_URI += "file://noslang.patch"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
 KERNEL_FEATURES = "features/netfilter"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index b254251..c3fb252 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;b
 
 SRC_URI += "file://noslang.patch"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
 KERNEL_FEATURES="features/netfilter"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 8ac2402..691d789 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -22,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
 KERNEL_REVISION_CHECKING=""
-- 
1.7.9.5



