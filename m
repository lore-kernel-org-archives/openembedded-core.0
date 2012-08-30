Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T78Pt-0004g4-U1
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:20:30 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 10:08:12 -0700
Received: by mail-wi0-f171.google.com with SMTP id hq4so516908wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=dB+HWtuOKBe82kUzMMuhAWljK5br/UmWLBQ+ZWaruLg=;
	b=dWQOqTFFlOKn2unHITtcuXmuh0DTRfSo/EtQEN4td07JLxsCCtsLqUG8A/lploAZL3
	Qed+GuR6wDE+QmYjBQglgBzirgb+g1OhbajsicBQLKzSxprlX97hGBos83FQIPCS/EAL
	5fQzxWWxsYymCHPN3JGOEsquYVRPUIyEER8eXAbrtJnYFmyPm0Ti03MmtaBAN27Qg5ES
	rqWCydHKzdVoanCGr5Og9seYdrj7UPK4dyVwBjBNqBA5CM0jqml1GFKLQ07a3atJadN/
	0kQDUlu7Hw3WTIYOgAs2suJi9dDBMrEY3czmjYUdjw6+TWpTR05CstMcUAdlAU/oux9L
	w/DA==
Received: by 10.216.132.76 with SMTP id n54mr3205831wei.135.1346346492445;
	Thu, 30 Aug 2012 10:08:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm1707554wib.0.2012.08.30.10.08.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:08:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 18:07:22 +0100
Message-Id: <a3fa31a7da2ffae65f8e022323cea9ca67e7c3fb.1346346320.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmBayOUwgyiPgD/08TfXOCVARv8nn9TFdoCFe+i1mfP5KZW5menF/zDYvygTMELK0/KSFFU
Subject: [PATCH 3/6] task-core-x11: default to xserver-xorg instead of kdrive
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
X-List-Received-Date: Thu, 30 Aug 2012 17:20:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/tasks/task-core-x11-mini.bb |    4 ++--
 meta/recipes-sato/tasks/task-core-x11.bb      |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/tasks/task-core-x11-mini.bb b/meta/recipes-sato/tasks/task-core-x11-mini.bb
index 98189fe..0aed286 100644
--- a/meta/recipes-sato/tasks/task-core-x11-mini.bb
+++ b/meta/recipes-sato/tasks/task-core-x11-mini.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tasks for core X11 applications"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 PACKAGES = "\
     task-core-x11-mini \
@@ -16,7 +16,7 @@ PACKAGES = "\
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-XSERVER ?= "xserver-kdrive-fbdev"
+XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
 ALLOW_EMPTY = "1"
 
diff --git a/meta/recipes-sato/tasks/task-core-x11.bb b/meta/recipes-sato/tasks/task-core-x11.bb
index f1b06f9..764ea02 100644
--- a/meta/recipes-sato/tasks/task-core-x11.bb
+++ b/meta/recipes-sato/tasks/task-core-x11.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tasks for core X11 applications"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r35"
+PR = "r36"
 
 PACKAGES = "\
     task-core-apps-x11-core \
@@ -22,7 +22,7 @@ PACKAGES = "\
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-XSERVER ?= "xserver-kdrive-fbdev"
+XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
 ALLOW_EMPTY = "1"
 
-- 
1.7.10



