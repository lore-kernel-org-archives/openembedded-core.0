Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jbV-0007kQ-OO
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:13:21 +0100
Received: by mail-iy0-f175.google.com with SMTP id 26so6818907iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=43o/mSA0VeQxhBLBwHVNUp7RuLzoBta1gHUDWOPx/+U=;
	b=nF5coCv3Mn8Hy8H8kXplGNmqSWsse0uqa/BoiAmepnQN655f3gaCzg9sHqTCQNoIpS
	/zmqHrZT6oCBMrt68hetlyKZJykeFTKLL4IWyRmPY4n+CxSSUAS94T8RN1RCTuvG2ggd
	nDsuE3wvEBnTIB68iIiHRyKNOXsGaMVq5zhlg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CkpRHvI/94pjwWS6x8LKjnhLOxUCP13qmYjRbSWbqCepDGFRVnMF966Qbkla7wo72l
	T5bjn9Q8uLTFc1JJH19C3rzTqDOCoH7Ky/Rb71huMK0QwiS5DfS3zQz+EYQQSNhGNAWG
	rqngvdGRLTScDPN+Pe3vhFUL7w3gk9bP8E3K8=
Received: by 10.231.26.87 with SMTP id d23mr4590970ibc.18.1300731094754;
	Mon, 21 Mar 2011 11:11:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm3841886iba.38.2011.03.21.11.11.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:11:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:11:29 -0700
Message-Id: <72afa727e7a7976856fd165a0cae34e49f347c8e.1300730825.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300730825.git.raj.khem@gmail.com>
References: <cover.1300730825.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] machine/include/tune-atom.inc: Remove FULL_OPTIMIZATION_pn-gtk+
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
X-List-Received-Date: Mon, 21 Mar 2011 18:13:22 -0000

* Since bitbake.conf has got rid of -fomit-frame-pointer this
  is no longer required

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-atom.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 668d028..399ea54 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -3,7 +3,3 @@ TARGET_CC_ARCH = "-m32 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
 #MOBLIN_CFLAGS = "-Os -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables"
 
 PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586 i686 core2"
-
-# Work around a gcc bug for core2 which caused matchbox-panel to segfault
-# and possibly others.
-FULL_OPTIMIZATION_pn-gtk+ = "-fexpensive-optimizations -frename-registers -O2 -ggdb -feliminate-unused-debug-types"
-- 
1.7.4.1



