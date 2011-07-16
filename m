Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhuDs-0002B4-3v
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 04:03:16 +0200
Received: by iyj12 with SMTP id 12so272213iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 18:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=noXh+c/n6vgH2UafHE4AKE8eJpmRwbFUoAKGRZeUpsg=;
	b=nMcZwTqGjseLV8vsOpcTPJGjy/KYWQC6QpO5RQlj16C2eX+Fei1dF3dKMQ9vCy1Ho0
	7vKJZaXufcm4ohVxFLHGozDlY+pA/g7pHN+07YzuqFWdFRVDrgjK8WtXRAq7Gdr9Y5E9
	tYXnfqYvjkZscA/NYaFb/MJRrdLFpZnV6K0W0=
Received: by 10.42.150.134 with SMTP id a6mr56182icw.370.1310781554612;
	Fri, 15 Jul 2011 18:59:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id hq1sm2001828icc.14.2011.07.15.18.59.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 18:59:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 18:59:04 -0700
Message-Id: <e7d67976cf57057481b91a95a7fa2c06cdb8f3ca.1310781382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e286a25378756398463d3bf34174005a8cef8841.1310781382.git.raj.khem@gmail.com>
References: <e286a25378756398463d3bf34174005a8cef8841.1310781382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1310781382.git.raj.khem@gmail.com>
References: <cover.1310781382.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] default-distrovars: Add largefile to DISTRO_FEATURES
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
X-List-Received-Date: Sat, 16 Jul 2011 02:03:16 -0000

This is needed for packages that go into core-image-minimal
highlighted by uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index fe8ed22..f9d44a6 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -16,8 +16,7 @@ DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-
 					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
 					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
 					libc-posix-wchar-io"
-
-DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci 3g ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES ?= "alsa bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi nfs zeroconf pci 3g ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
-- 
1.7.4.1



