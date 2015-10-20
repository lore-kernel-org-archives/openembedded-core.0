Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA8076FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 04:06:50 +0000 (UTC)
Received: by iofz202 with SMTP id z202so9066642iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 21:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0K9XJXDnPWQcqwerLydwcOObRNSsqXCSTSk/u4rkR3o=;
	b=jyENymlwMmD1qMToW71bYRWNu4gpXua+TlITHlEMp+8SoPgclyOBMbGYStiKDcl27b
	mgLwUCz4QKzYvL4qk772pxrFI34SzzQ7aYwd3lzl8O3SyZdt8yvogrFjbcbLkg06nBLN
	sNogYTNiijD8OS/ihPP1zTOQXWh4Gx3I+ivvLeGhg3EmEr4bJtmU0DPau1cqqL2CQCop
	XjbxNHbarUZ6A6bcCAbKwo1PnV2TYu7KKFY+7qJyHcsPXa4VtGMYHOcVeNauxlg53K6a
	qLc7Q55GTTwMZcp8RgJYKgbyUcKE0AYH6X+szCNWohrfb3o36mlCKCqFhVMhK8Bd0Yvk
	jIbw==
X-Received: by 10.107.163.131 with SMTP id m125mr1408415ioe.111.1445314010492; 
	Mon, 19 Oct 2015 21:06:50 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id g12sm9050157igh.2.2015.10.19.21.06.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 21:06:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 21:06:43 -0700
Message-Id: <1445314003-16327-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] scons.bbclass: SCons packages don't require do_configure
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
X-List-Received-Date: Tue, 20 Oct 2015 04:06:51 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/scons.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index b8de822..1579b05 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -2,6 +2,8 @@ DEPENDS += "python-scons-native"
 
 EXTRA_OESCONS ?= ""
 
+do_configure[noexec] = "1"
+
 scons_do_compile() {
         ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
         die "scons build execution failed."
-- 
1.9.1


