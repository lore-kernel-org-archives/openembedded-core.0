Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbHkW-0001mp-NE
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 21:45:36 +0200
Received: by pwi1 with SMTP id 1so3360123pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Q2ZFasy0ryJOH0WQsC7yYw59+ZJUUit+cEE45RLJx2M=;
	b=djeyT4KLWLQoeQWrj+JuDR+sVXn7sEEEBbrjuO/gUHE00pq5lxXZS2kSTBWE7CEBIL
	ye19Y9PI/s+GvopyQAYZ50DhW3Sq18ECy/kjFVKzqx4xG6UdMgpz7SNzXguE3ojc+Foi
	CCXP8wNmJTikDonYI2F1OQr7foV+MFUDH1Y9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UtUm1q1uWM3itVEW4JrNBiL1HGUCYtk5pvAsecChvjCbwZ7xAgg8r1fdhlOL7khzvn
	HWs77IGnam4fgB4z4drwiJuzV3voV8i7DSaWY0MZEcuspXRkUTUKMJaqhl8EwdbshDdo
	c0pO/1IRtGW+nnWq+c4B12zAHyFeje/3i2Z4k=
Received: by 10.143.33.2 with SMTP id l2mr1229295wfj.92.1309203714331;
	Mon, 27 Jun 2011 12:41:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z7sm4522317pbk.35.2011.06.27.12.41.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 12:41:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 12:41:49 -0700
Message-Id: <1309203709-25406-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] uclibc: Set ARCH_USE_MMU for armeb configs
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
X-List-Received-Date: Mon, 27 Jun 2011 19:45:36 -0000

After the last cleanup. armeb/uClibc.machine
gets picked up by default for ARM Big endian
so bring it uptodate.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/armeb/uClibc.machine         |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
index 7a6ad8b..b6932c6 100644
--- a/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
@@ -45,8 +45,10 @@ CONFIG_GENERIC_ARM=y
 ARCH_BIG_ENDIAN=y
 # ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
 DO_C99_MATH=y
 # UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="<path/to/kernel/headers>" 
-- 
1.7.4.1



