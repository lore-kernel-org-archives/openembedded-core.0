Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRtRc-0005lx-5H
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 01:03:48 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so8527529dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 15:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3sSrxAFKW/Ivan65nnEDgQCQeK1vlkH2kkrcKa2KiEI=;
	b=BHe7cXcp/YdCnSpadqMWGIenLnYvko3uYoAMEmfmq+yy4x0No+LMwgdI/2uPaYe0yI
	EiH4iZw+aBIQCAr7NQAV4bDR711BLnIeol4/eYsiVb41umb73ODPgRE5vlmB+4FQiQ7p
	uYjzZtgbe86dye1DkDwu5U+I7DxivoU+iT6tVhCK8/quTwPL0Rs1YriFFKahOBSBBKe9
	rkA4jGHKi8rrBFN5YHL1OwHo5fAo7mnsJbD+TUxW80AzSWasw2cr/msXz0gh3vPqkuBT
	UGTIuKmOyTOsbne7LWKBow2KvyZABk8nHMxkLpN5n08im6e8It2/oPg0eIdaZ6VorcBj
	D1vA==
Received: by 10.68.193.167 with SMTP id hp7mr2408939pbc.38.1336517638021;
	Tue, 08 May 2012 15:53:58 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ka5sm3770829pbb.37.2012.05.08.15.53.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 15:53:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 15:53:40 -0700
Message-Id: <9f0168b7a33fbfe7920ee449f4cc34d4ba09ea17.1336517492.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336517492.git.raj.khem@gmail.com>
References: <cover.1336517492.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] kmod: Use base_libdir for installing libkmod
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
X-List-Received-Date: Tue, 08 May 2012 23:03:48 -0000

This also helps avoid QA errors about binaries
accessing contents from /usr/lib

Also fixes emptry libkmod problem since now
the files are installed in expected place

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index 4c860f0..fed068f 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -16,7 +16,7 @@ RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod
 # autotools set prefix to /usr, however we want them in /bin and /sbin
 bindir = "${base_bindir}"
 sbindir = "${base_sbindir}"
-# libdir = "${base_libdir}"
+libdir = "${base_libdir}"
 
 do_install_append () {
         install -dm755 ${D}${base_bindir}
-- 
1.7.5.4



