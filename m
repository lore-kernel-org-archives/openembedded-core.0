Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RbBAB-00025K-IJ
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 14:15:55 +0100
Received: by ghrr15 with SMTP id r15so1481955ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 05:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=inbxLjpfshij9U44681AHySzsObU9T3T2RfqqJGFEEQ=;
	b=Zup4zolQ/iK9cH/sMqWGLtSly52PCOMJ+AhrLidcKtZ5uw1Tkjrnph7XrdtCpunq70
	xQvhsZJioQ28P+kKVrpJxTiM5g/bVOn9mV/imxlF54yMTl5QYmXdZkBdkHqry7oPetHe
	clhpU4rlE8aIhS8OxszzoL1yVDuITjZ+YaYCE=
Received: by 10.236.123.108 with SMTP id u72mr4940109yhh.45.1323954537311;
	Thu, 15 Dec 2011 05:08:57 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id a11sm10142868anc.11.2011.12.15.05.08.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 05:08:56 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:08:35 +0000
Message-Id: <1323954515-15604-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] dropbear: bump epoch to fix upgrade path in meta-oe
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
X-List-Received-Date: Thu, 15 Dec 2011 13:15:55 -0000

There was a 'dropbear-systemd' binary package on meta-oe versioned as
'v1' and it has been merged on dropbear's bbappend; to fix the upgrade
path for the dropbear-systemd package on meta-oe we need to bump epoch
and to avoid messing it up this needs to go into OE-Core.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/dropbear/dropbear.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1894715..073ac13 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -11,6 +11,8 @@ DEPENDS = "zlib"
 RPROVIDES = "ssh sshd"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
+PE = "1"
+
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 	         file://urandom-xauth-changes-to-options.h.patch \
 		 file://dropbear-0.53.1-static_build_fix.patch \
-- 
1.7.2.5



