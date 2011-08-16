Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSJU-0005W2-8x
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:40:50 +0200
Received: by yia28 with SMTP id 28so333909yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 15:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fZ/nG/dTetu8DPxJ9CZzbhiLnoM6cyKl8461zZ6gkRk=;
	b=PEEGfEP7Q2uOqCGk3B88Lg898mm+mW2w3rxSSod3nCfI5Fnl1xmIbX0hmSvXsq6574
	gKbnI1ZsGe9W3MPRAjxEHT8pC0MuYSpVKPKrLyzyvqLDOfyN2eCzsSltuf/Nr3Pa6Ysr
	NqLbRF/bmYE6Mp/FLD5s+r3Mebh0+3CBXHRCs=
Received: by 10.236.157.102 with SMTP id n66mr1075208yhk.46.1313534170209;
	Tue, 16 Aug 2011 15:36:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c63sm581513yhe.18.2011.08.16.15.36.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 15:36:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:35:50 -0700
Message-Id: <0b15f070c107e2d42c52290d15769b786b41ac39.1313533911.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
References: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
In-Reply-To: <cover.1313533911.git.raj.khem@gmail.com>
References: <cover.1313533911.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] task-core-tools: Use LTTNGUST variable instead of hardcoding lttng-ust
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
X-List-Received-Date: Tue, 16 Aug 2011 22:40:50 -0000

This helps build on uclibc where lttng-ust is not included

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index b0eb7d4..11ea723 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r10"
+PR = "r11"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -76,8 +76,8 @@ LTTNGUST_libc-uclibc = ""
 # MIPS.
 RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemux86-64 = " ${LTTNGUST} ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemuarm = " lttng-ust"
+RDEPENDS_task-core-tools-profile_append_qemuppc = " ${LTTNGUST} ${SYSTEMTAP}"
+RDEPENDS_task-core-tools-profile_append_qemuarm = " ${LTTNGUST}"
 
 RDEPENDS_task-core-tools-testapps = "\
     blktool \
-- 
1.7.5.4



