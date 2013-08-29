Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id BC9436BDF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:23:26 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so551883eek.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=f3J09PXM/gGGxFi8EYWibj0Lpm+V6zCviIJKl9bR/5g=;
	b=OVwE+oRog5d1czn2j8PngtswH6yOYqAwaXYkqF+xkaFf5gigE/IK54/l2e+4iTauHX
	kYOZkC4/Lp2qY++7ARCd8gW7SJti6LJ9xMWMy0u5vVDf65itLbNaMdHZofUIjSkUmO7C
	/ksJ/HiK7YJrpRAYoQzrYBliPice2+5U8+5mwqXHZ+U2kEZAyE2qhTJlAq5A6T7qZiQB
	yb0FENlerjKEqKTdo7CauQef9YZ3DdmDPQXjf/vKfKQ+HaF+y+5Gy0hyl/OmHcHEe2zQ
	51DLRCB+i9QaAz+AjZUe5O2KoDWoL/H6IPEBBl+OCwFaMiNa9DFaGVZWxnHPnZscQFxm
	LGUw==
X-Received: by 10.15.54.72 with SMTP id s48mr7548010eew.58.1377818607239;
	Thu, 29 Aug 2013 16:23:27 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id d8sm50007881eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:23:26 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:23:19 +0200
Message-Id: <0dc752916503bab276d3bd5fe90235571715bb4d.1377818011.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1377818011.git.andrea.adami@gmail.com>
References: <cover.1377818011.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1377818011.git.andrea.adami@gmail.com>
References: <cover.1377818011.git.andrea.adami@gmail.com>
Subject: [PATCH 1/2] util-linux: package mkfs.cramfs and fsck.cramfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 23:23:27 -0000

The recipe builds the two utils which are unpackaged.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 961bcc5..8a14d16 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,6 +36,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-uuidd \
+             util-linux-mkfs.cramfs util-linux-fsck.cramfs \
              util-linux-partx ${PN}-bash-completion"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
@@ -83,6 +84,10 @@ FILES_util-linux-lscpu = "${bindir}/lscpu"
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
 FILES_util-linux-mkfs = "${sbindir}/mkfs"
 
+FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
+FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
+
+
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
-- 
1.8.1.5


