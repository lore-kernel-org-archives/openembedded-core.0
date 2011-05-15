Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLVJE-0000Bf-Sk
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 09:00:13 +0200
Received: by pzk36 with SMTP id 36so1764808pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2011 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=r5YXYEHM2m2FSWSELcWi9wP4t0U8IcqBrwKSS6Z8Wfs=;
	b=Tm02CbQ3CqZAB7AxBzl/btLTPRknHkE0ztt1zA94OX08HX4SRP5dPtN2bM7W7xOsXZ
	8kEOHN7hzyehkN112kXs9ay809aaA2Y4nQZU5IjDa0ozKhnCKJ8xc6zpm4uHlzYWoY1f
	u6WaH0T8ZXkdlEu5lWy/0tz5y0VsfyW7GVBV8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qi4WmavzJbLkKfrS0Sx6Ab8/FijrERRx6ueJLGhZQaIpviI2N/KRs8j+0JwhFhLZnc
	hYMbCpdl9mkTJbd5PLZkBIqhgx7ck0VMUfkjkjHLrTLabCnn6bVV/kqpJ2WUp9njsOpD
	OPYNs8u2+/KRdO9JNUeSUE5rovOJERtcCUrsA=
Received: by 10.68.63.69 with SMTP id e5mr4865074pbs.307.1305442641352;
	Sat, 14 May 2011 23:57:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm2482672pbt.46.2011.05.14.23.57.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 May 2011 23:57:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 14 May 2011 23:57:14 -0700
Message-Id: <184aa7f54d9b91f55f40fd273e639a3a9b7a2be9.1305442428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305442428.git.raj.khem@gmail.com>
References: <cover.1305442428.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] e2fsprogs_1.41.14.bb: Package libraries into separate packages
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
X-List-Received-Date: Sun, 15 May 2011 07:00:13 -0000

add libcomerr libss libe2p libext2fs packages
helps in reducing the root file system size

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
index d493f6f..91a783d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
@@ -39,11 +39,17 @@ do_install () {
 RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-badblocks"
 
 PACKAGES =+ "e2fsprogs-blkid e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
+PACKAGES =+ "libcomerr libss libe2p libext2fs"
+
 FILES_e2fsprogs-blkid = "${base_sbindir}/blkid"
 FILES_e2fsprogs-fsck = "${base_sbindir}/fsck"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext*"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
+FILES_libcomerr = "${libdir}/libcom_err.so.*"
+FILES_libss = "${libdir}/libss.so.*"
+FILES_libe2p = "${libdir}/libe2p.so.*"
+FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



