Received: from mail-ia0-f177.google.com ([209.85.210.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5qH2-00030B-0Y
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 05:18:20 +0100
Received: by mail-ia0-f177.google.com with SMTP id k38so1939295iah.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 20:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=q+7yw1QNUPjvfFcEfanS+1briCqajSvhr4rlHPyRcqg=;
	b=j2Kh7scPaLIIPmftFu1N8tdS5INkYy78ykgs3+s2gTOUCqfnpHPamz0CV2NK4IH6fq
	b2h8Oa6ZJlRKiWpj3M/nyOyxJtVQT4IHU6TnP9kIhiyBUBxRVUoNviny97FKONrJgN7h
	NOWFPcCFx8qCOY5JiGvzYDE3MTlXJb0z8nXm5IoTZ1ih1wYAf4TzPlNPGL3sDlW30q4F
	HLhmR3/f1F208T7zwtkmCbQ7E/3R3R02pXGdAfUaEtzAEKSPhWpsLwdzWQ3S1LS+xStD
	eGch3n15G9XBE3kPSBmdX9dJ9kqW7VF73ymlO3ChliapUkbcumr408kyhtYxD/8xlUOB
	q/sA==
X-Received: by 10.50.108.161 with SMTP id hl1mr16071553igb.101.1360814533926; 
	Wed, 13 Feb 2013 20:02:13 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id wo8sm742841igb.6.2013.02.13.20.02.12
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 20:02:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 20:02:01 -0800
Message-Id: <1360814521-24221-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360814521-24221-1-git-send-email-raj.khem@gmail.com>
References: <1360814521-24221-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH] util-linux: Remove -systemd package
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
X-List-Received-Date: Thu, 14 Feb 2013 04:18:22 -0000

unit files are added to util-linux itself when selected

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 667232c..10439c0 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -33,7 +33,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie util-linux-systemd util-linux-reset"
+             util-linux-mkfs util-linux-mcookie util-linux-reset"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
@@ -79,8 +79,6 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 # reset calls 'tput'
 RDEPENDS_util-linux-reset += "ncurses"
 
-FILES_${PN}-systemd = "${systemd_unitdir}/system/"
-
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 
-- 
1.7.9.5



