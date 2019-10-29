Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 618347FAC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n15so12826310wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CYkx2+nOYsaYoNqjiSeadoQPjZmxhCDAWIp1Xv74EOc=;
	b=HwHOm/qWw5Mhl+5deZdV/6mP9rdkkuq/c1QFBcI5u8XvWXthWJzzyM7kJUuQfGy3hI
	syZpjIOFmlwF0LSEUsXAYBSgc2HsLzKbREnWdYSUssqbo2SgjgcdXBvZwfeAp9d+vq06
	RLR4+vo172xNcOj7Py2Khwd4NQRpdKOnEPGOZos+sM0Wh0x51vV1sRzZPZFLUWN36qlF
	d67yvwMOdJWMlVu/UAxPXv6Jo/J4yuHlgESXiIriWmNl3aeInJMoNL3cbAI4oESS6twN
	kb4NbZaB1JSjrzqip4gfsavku4MOn7bG6b98Vzxd3ZEXnDEdl8RvJecRoTvDGZuAAZ1X
	x/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CYkx2+nOYsaYoNqjiSeadoQPjZmxhCDAWIp1Xv74EOc=;
	b=dKdMbry50hJqA1ZLe0r5fFzsWcRRhod/lrf+qcdnTKwVk1qAFI8BdSvODb+/SvyQTR
	fNa6yfdtBJM1bCBxUrE1sPKrggc67y2jDwLxayU8FEDPr9LgE0pkyWbcnmDOT7RUpXu0
	nBZSDgOAlSMuCgKMN3/xXgflnk5RbnMrzjgPz4q9Wq8Wf5isnHH50Q4HlJFdftd6ZyV/
	7V0Qaup5QOgjMORixADe6yM0CjL6CRV/w39yUpfHueDTNOrXlez9yNXJPdnt45oCkO44
	Rhl9B5YPsHMMVqbtB4RFOY+P1l9CiJQmDasu2SHLtH813iQXETpAcBU+X0igebHSejHE
	LvCg==
X-Gm-Message-State: APjAAAXbCnRK/qbh6aQ3BeV4Hgn8Qg7VI76mA58zAR+Vvzj82HLUJQm7
	rDYcJnnOtn0d+x2WTWNoje4MmQnK3FY=
X-Google-Smtp-Source: APXvYqyflEDI8cZKhClZfWg2YKGPzXoqmEsuVMuhGGG51Qf+MuoQuChu38nwgONHTbcWnpcHreRmWw==
X-Received: by 2002:a5d:5101:: with SMTP id s1mr18209575wrt.339.1572342465995; 
	Tue, 29 Oct 2019 02:47:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:17 +0100
Message-Id: <967d5aad67f1074d0188000828a2e93906899ea6.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 04/19] linux-yocto/5.0: make scsi-debug include scsi core configs
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:46 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the scsi-debug fragment to include the core scsi config
options. This allows standalone use of the fragment, since all
supporting options will be enabled simply by including the top
level config in a BSP.

This also removes a configuration warning on qemuarm, since we
will no longer have missing / unavailable options during the
config audit.

(From OE-Core rev: c65826e96a77928938fef69fc0cbc65ec7431cb2)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index aa1609c..cc6ffd5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
+SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 603c0c5..a3a9315 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
+SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 88eacc2..b106a37 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
+SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


