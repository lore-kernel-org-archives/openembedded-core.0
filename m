Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QK6iw-0007YM-6T
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 12:32:58 +0200
Received: by mail-ey0-f175.google.com with SMTP id 27so101827eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 03:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=YejkrNR8+JRtW6/GF7RKkZJPfvg4kS/4g4HeCA6p9CQ=;
	b=Fhcwy7McME/8TelRsSKy2UNPmlix0CxGyn3QHCxN2/1TqQ8eenbnfpeGRY5fo+PCE3
	L1LcjL1Hs5c9yUcyRpgAZJKvS0t7/bROSldXk8E5VEOUpqrG+4SITZ/wLKtrbW6frc0v
	UrAg0U4v+V/zC2cGxp6iv4DLYlkh9YyNdVCRo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eV6xbKf3uruYRsEVY8dDc63ZdXKQzYVijhpGFQG4cVrwwpVAv/WE9hcvC57vxL6+Mo
	NICPfWSzlghmblCaW94SGowQ6pZbF4RC3sWmXcQ+OFv2NT7hhh5gO2quM+2iIE/zt8XC
	zRR2b3BGRTirRyDEbBIICLBpDVD9l5EaKcjmY=
Received: by 10.14.25.144 with SMTP id z16mr4439291eez.61.1305109813469;
	Wed, 11 May 2011 03:30:13 -0700 (PDT)
Received: from localhost.localdomain (095-097-098-131.static.chello.nl
	[95.97.98.131])
	by mx.google.com with ESMTPS id z1sm1450536eeb.21.2011.05.11.03.30.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 03:30:10 -0700 (PDT)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2011 12:29:55 +0200
Message-Id: <687fb20407ee32261a840c9e475b489319d8ee62.1305109178.git.leon@sidebranch.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1305109178.git.leon@sidebranch.com>
References: <cover.1305109178.git.leon@sidebranch.com>
Subject: [PATCH 1/1] siteinfo.bbclass: Add powerpc-linux-gnuspe.
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
X-List-Received-Date: Wed, 11 May 2011 10:32:58 -0000

From: Leon Woestenberg <leon@sidebranch.com>

Re-add powerpc-linux-gnuspe, from OpenEmbedded. Also adds support
to poky.conf so that minimal-core-image builds with DISTRO=poky,

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/siteinfo.bbclass |    1 +
 meta/conf/distro/poky.conf    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index df29097..731ccd1 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -47,6 +47,7 @@ def get_siteinfo_list(d):
                "powerpc-darwin":          "endian-big bit-32 common-darwin",\
                "ppc-linux":               "endian-big bit-32 common-glibc powerpc-common",\ 
 	       "powerpc-linux":           "endian-big bit-32 common-glibc powerpc-common",\
+               "powerpc-linux-gnuspe":    "endian-big bit-32 common-glibc powerpc-common",\
                "powerpc-linux-uclibc":    "endian-big bit-32 common-uclibc powerpc-common",\
                "sh3-linux":               "endian-little bit-32 common-glibc sh-common",\
                "sh4-linux":               "endian-little bit-32 common-glibc sh-common",\
diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index 71e40de..536fdc9 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -55,6 +55,7 @@ KERNEL_CONSOLE = "ttyS0"
 # Default to TARGETOS values for EABI on arm
 GLIBCTARGETOS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
 UCLIBCTARGETOS = "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
+GLIBCTARGETOS = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}" 
 
 POKYMODE ?= "default"
 require conf/distro/include/poky-${POKYMODE}.inc
-- 
1.7.0.4



