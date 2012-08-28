Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6Fh0-0006Kp-93
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:30 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1156736eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1urg+yFspWW88qVrgNK25fitujRuOFO0xUTu4I4ONd4=;
	b=LSyL4ke6YMnUiHo0h97e77sKnpNBWFgfOkPPCYFwEI3TyoBku5M2AMHQ4f+QqIO7GF
	16iNiqUJnGCwmNQ4kE6EFM4k25cMP9v5pA4XGsQj2D+WBYMiacPJabu1RBT0jsrK4IZh
	A10Ot9AGQxVxiLGD5KsVquxKo4Xz4CZ9jNKVpZAqC1jwXPUqzvSwCaHMtFimwi08f6CN
	gka0UGNuB/LT/BNxvNIwg0ThJq3ZTs1yM33MsQtC78aYJVTGh/31TkFTQiqUseENnu9I
	8m4siJYHaMyI4wGTUYrA5ey5ZlueVnbV26f/4kt/RsI8mtHGAGL5uQ1Myqm7SardFpHs
	P73w==
Received: by 10.14.5.67 with SMTP id 43mr20579364eek.15.1346136140167;
	Mon, 27 Aug 2012 23:42:20 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id i8sm2348034eeo.16.2012.08.27.23.42.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:18 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:42 +0200
Message-Id: <1346136108-13062-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlZ6BwWo3vpaeznUQBm9MJijFDUABeTYE+jm0znv8I0HxZrmJ4vWKAoUG1/Ee7nEsuNfA+l
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 05/11] man: fix RDEPENDS and reformat recipe
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
X-List-Received-Date: Tue, 28 Aug 2012 06:54:30 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/man/man_1.6f.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
index ee3d648..b35621a 100644
--- a/meta/recipes-extended/man/man_1.6f.bb
+++ b/meta/recipes-extended/man/man_1.6f.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "A set of documentation tools: man, apropos and whatis"
 SECTION = "console/utils"
 HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
 LICENSE = "GPLv2"
-PR = "r2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-DEPENDS = "groff less"
+PR = "r3"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "groff less"
 
 SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
            file://man-1.5k-confpath.patch;striplevel=0 \
@@ -61,4 +61,5 @@ do_install_append(){
 }
 
 
+RDEPENDS_${PN} = "less groff"
 FILES_${PN} += "${datadir}/locale ${sysconfdir}/man.conf"
-- 
1.7.7.6



