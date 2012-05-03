Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPmze-0000nq-T5
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 05:46:15 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so1652799pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9tTbO0UQrk6yHe9/M4iKmRucRjTZ674VZpK5xMXONRs=;
	b=KMpGB3tDMIqsN/L9oFidUqNEggwABgw/2V7ZX2FFAf/Dh7v0SwZ4cfSw3hKaMlnNi4
	cVSqFU3hFYcK/mQmnct9bS0yIvyRetxTz2oZ+EAAXs0ijjsaDCzVFSDZ8+gSZ8OKlMqr
	oMRbv4vXV6Z7xAMzBj84VPe52XZ1gXf/hhdgN5KeCDSqrK8yI3dlI/MMCfs2akK4Tmyp
	nje3jy9M5LT1Gwqy1AIpolBDXCK/RcfCQg4T5fhIPkYv05G90RfKoI17I397hGWzLm9i
	Qq54IusELuupJa+DzeNfc8ewjf0jLkmxUMdSZltobsXTJ/yPKX1NM/i5/GSxtJu0aTdr
	sLlQ==
Received: by 10.68.221.136 with SMTP id qe8mr3175345pbc.108.1336016191791;
	Wed, 02 May 2012 20:36:31 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nt8sm3883458pbb.12.2012.05.02.20.36.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 20:36:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 20:35:32 -0700
Message-Id: <fb85f4acd897466f053198dd9606143b90c14c66.1336015963.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
References: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336015963.git.raj.khem@gmail.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] qemux86-64, qemux86: Override XSERVER variable
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
X-List-Received-Date: Thu, 03 May 2012 03:46:15 -0000

Now qemu.inc sets a weak definition which is
not what we want for x86_64 and x86

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemux86-64.conf |    2 +-
 meta/conf/machine/qemux86.conf    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 129fe9f..b381627 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 # We bypass swrast but we need it to be present for X to load correctly
-XSERVER ?= "xserver-xorg \
+XSERVER = "xserver-xorg \
            mesa-dri-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 246d5a0..5b25b2f 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 # We bypass swrast but we need it to be present for X to load correctly
-XSERVER ?= "xserver-xorg \
+XSERVER = "xserver-xorg \
            mesa-dri-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
-- 
1.7.5.4



