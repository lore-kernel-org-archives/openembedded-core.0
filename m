Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2tsj-0004Um-8M
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 03:00:47 +0200
Received: by pbcwy7 with SMTP id wy7so6094833pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 17:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1nRXwjHM3FLcE5ahgqMRyd30Gp1WQahTcEiMtoJU1g4=;
	b=Ql3glTPz9lZssXagyy9F1UIQ9jo/z8Pe+hVaZIvcT3W5Fowob56o5wbZe/+7NbBiEm
	iocuE42ApvIAyZ1odpoPD3Bpf0XTm9Vdw905pz6vtGlqT31LM9n4zeuqbMnfdKW6aT9b
	GKrGEVh/cv/nlRMyOrGDsUt21VJg/yR5HPm1Vf6WxRLKuvbYFUfa3VWwOiw554QVtsY+
	zMDD9abe8ux+8V1Sf1xduY+z3Cde0InbbgyczaWVBEhvmrh29zZDGGWqEL40oRn2EFAC
	KVj0Pu77IB8sMYyKPyGKPtAUhnCVrKFGEMRb3vZEArUvTnKLWnc1gd0eALxAU1oc8nU4
	lO/g==
Received: by 10.68.196.193 with SMTP id io1mr23454177pbc.17.1345337322645;
	Sat, 18 Aug 2012 17:48:42 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sz3sm7964618pbc.21.2012.08.18.17.48.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 18 Aug 2012 17:48:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2012 17:48:15 -0700
Message-Id: <1345337295-11206-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V3] unifdef-native: Correct LICENSE
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
X-List-Received-Date: Sun, 19 Aug 2012 01:00:48 -0000

The header in sourcefile says its BSD licensed
not GPL therefore make the correction

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unifdef/unifdef-native_2.6.18+git.bb           |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
index 1b93816..b1869fd 100644
--- a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
+++ b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "Kernel header preprocessor"
 SECTION = "devel"
-LICENSE = "GPL"
+LICENSE = "BSD-2-Clause"
+
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/unifdef.c;endline=32;md5=1a33f5c39aa718a89058721df61979bd"
 
-- 
1.7.9.5



