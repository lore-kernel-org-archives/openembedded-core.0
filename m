Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SzW1Y-0004Ri-Rb
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 18:55:52 +0200
Received: by eekb57 with SMTP id b57so178091eek.6
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 09 Aug 2012 09:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=T00/LB0CexTPhhMocEekh4Q4NyKOSi8UZyBhQMZbcZ8=;
	b=VVvi0GGNZn1kNTxMMdpCgaXI/Hv4QTDxx2o0pzFBEKo+5sh3Han+Z7ZOaCvSSDF8+A
	A2efU5X9zG4lvH7663U4llqSKv4guDbidwFt4kwxG/kg1YgD7boZq7/qjGhgQkV9oIF7
	1GFTRPn8kaVckSLtUGal77tETyBqLych9pARmjmsjGxvx8TPSgx0XlGi30qpxDJi1nDf
	9w1sKh28vmrUn96b1aboXnqCnQhFJzlkV1+AsZCTbVxCM6PsYXlIJhiFw7ufswUkanVi
	xIIrNKiBJWrXjOCLnNIn93OVM91bP2KSnc71UI0XnfhxnvEypLSoYqsqsJAuuIaKdB0W
	B/Xg==
Received: by 10.14.175.7 with SMTP id y7mr28316123eel.29.1344530644315;
	Thu, 09 Aug 2012 09:44:04 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id c6sm4838308eep.7.2012.08.09.09.44.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 09:44:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Thu,  9 Aug 2012 18:43:56 +0200
Message-Id: <1344530637-29330-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkGbKzD3O+qBPCLjQRgfzk8AsDxSkT6GFluj6VoVjJJt78LbcIy0EPyL/Jj/lqJEfE9MGhu
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] man: fix RDEPENDS and reformat recipe
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
X-List-Received-Date: Thu, 09 Aug 2012 16:55:52 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/man/man_1.6f.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
1.7.10



