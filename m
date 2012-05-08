Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRtRa-0005lx-Ol
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 01:03:46 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so8527529dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 15:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0xu77grCBejxpRnp4lSwIJyS+QtlhZpwd+PyA7rKBME=;
	b=B6A7Kre76bgpCUHBDQOmM2WCqiB5RzEaBPUSWYl3c1ZSnB+Cn+yascltf/8Hoqw4e2
	+uB1ZJ0gDniCNoN93IzlD0vWpZnI7ApSAKcH/pzmuMkV+rRrvjkuJRj9pXQaaIU2GONB
	ly3SrVoQme1aa08PO2Zo9KX37d4ycvWu/lPNXzcS4LetkbSu083/diHcCxKDD+Hd5eGd
	QAMbJkXfLqb1Nf7OyZKB83nn0Hs0AOXqTnY/XTOU3KwvWrKmSTgmDuB7Zr78n+2UQnJ6
	fJFF466qUiLzqDAR/RrM+6Vcu1lNcEvrcLnYeSLS4HdfrvN/fh8rWC2Ocao4x7Rm3bgx
	DSEQ==
Received: by 10.68.132.201 with SMTP id ow9mr2050849pbb.160.1336517636596;
	Tue, 08 May 2012 15:53:56 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ka5sm3770829pbb.37.2012.05.08.15.53.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 15:53:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 15:53:39 -0700
Message-Id: <339076a9cf1ef906416bd850e5825c3bb8521983.1336517492.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336517492.git.raj.khem@gmail.com>
References: <cover.1336517492.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] kmod: Update to .8 release
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
X-List-Received-Date: Tue, 08 May 2012 23:03:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kmod/kmod.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 681e52b..70d376e 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -7,7 +7,7 @@ HOMEPAGE = "http://packages.profusion.mobi/kmod/"
 LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
-PV = "7+git${SRCREV}"
+PV = "8+git${SRCREV}"
 INC_PR = "r0"
 DEPENDS += "gnome-doc-utils-native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
@@ -20,7 +20,7 @@ SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
            file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
           "
 
-SRCREV = "02629fa02e96763db7460a930239cc93649a52f8"
+SRCREV = "819f79a24d58e3c8429f1631df2f8f85a2f95d4a"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.5.4



