Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2S-0005Id-91
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:48 +0200
Received: by mail-pz0-f47.google.com with SMTP id 35so573808pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=e60rYMVpGYCY2sQhOjWCUT7c3kMbkmTWAgcBQO2Bf6U=;
	b=LJ66EU0w9ZBWNy0T7yxYTqjy3WOl66hv+z0cIbCIjaSn0DPMkg/bm/MEvpcdI4n3f0
	HFElruCpvMlgmHlqYuuT1jYZGmeQWADoUPYzSAUn+EjRTgdhpoRlHaQ9L3y73eA+yL5e
	xFT18DXZckyX49DWXpqK8dxcA1SOON3TGQu1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Pv0rGicw9tZ503Z3YdoUKB/Cl57k3UFqnfcMkXYR8ejOXRRRsMw2bZ7DITVhTTVwfZ
	sSD9yBI1GVGU14d7AZGy+dxG+hn97yyqDUikyjkp2ZFlFqyylBWqxncXTllqMRXITHoo
	LMsGLFOqpoD16qzetQ8nxGy/bGvp1sG0iDuZM=
Received: by 10.142.253.20 with SMTP id a20mr2788619wfi.190.1301632248977;
	Thu, 31 Mar 2011 21:30:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm2388965wfl.11.2011.03.31.21.30.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:40 -0700
Message-Id: <d7dccee03bbc7f01922e09e0dddf23d11f8623bb.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 45/46] libexif_0.6.16.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libexif/libexif_0.6.16.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libexif/libexif_0.6.16.bb b/meta/recipes-support/libexif/libexif_0.6.16.bb
index 8fb15d9..d9d1c5e 100644
--- a/meta/recipes-support/libexif/libexif_0.6.16.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.16.bb
@@ -3,14 +3,13 @@ HOMEPAGE = "http://sourceforge.net/projects/libexif"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
-DEPENDS = "gettext"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "deee153b1ded5a944ea05d041d959eca"
 SRC_URI[sha256sum] = "db6885d5e40e3a273ff8bb9708ab739c8ace3c5abdd75509eec8ea31a31aac43"
 
-inherit autotools
+inherit autotools gettext
 
 do_configure_append() {
 	sed -i s:doc\ binary:binary:g Makefile
-- 
1.7.4.1



