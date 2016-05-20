Return-Path: <andrew@bradfordembedded.com>
X-Greylist: delayed 471 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 May 2016 19:12:57 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 4123C65CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 19:12:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 672FB20836;
	Fri, 20 May 2016 15:05:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 20 May 2016 15:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=2gLa5lGfhZ4gtImFVzZbwOQ2Qi4
	=; b=AyCYBmVqrDGKE6I66fxHoCYf6Sp9RLrXAnUDviPcXujMCCqFBKyaagybJ4J
	33Z13l+SxAcL7l/8L2EVttTjiGtefslDZ9UR8rQiT+MMLnp0Ur7816/3NaCZlmSR
	CCelLAsO++HeyV9Bkd0ZAb3103fq3Kxq/KJv5l3h18rXdZJs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=2gLa5lGfhZ4gtImFVzZbwOQ2Qi
	4=; b=An4DUXYLL5SlLHrlSCCt9AvzSOVIVxmxY6RfzwErDcPbOV6gJ7lgqH/+A/
	dUOSQmxSJKLoay4nYZJQkLXy/rOPl70EKd8oPAeEAbjtqCsPG5xXYpJBpBsSm2rC
	hGarrKKltXu8BaKAgYGcc/sGBSzGT3Y9Gax/c9n4KElngAvdY=
X-Sasl-enc: CiB0gZkYsf9uWkopIvHuBG3BbYgQl+rtazyaKwnQ5CD9 1463771106
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id B80EFF29F7;
	Fri, 20 May 2016 15:05:05 -0400 (EDT)
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 15:04:05 -0400
Message-Id: <1463771045-28749-1-git-send-email-andrew@bradfordembedded.com>
X-Mailer: git-send-email 2.8.1
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: [PATCH] lttng-modules: Upgrade to 2.7.3 release
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
X-List-Received-Date: Fri, 20 May 2016 19:12:57 -0000

From: Andrew Bradford <andrew.bradford@kodakalaris.com>

Linux 4.5 and later cause lttng-modules versions prior to 2.7.2 to fail
to compile due to Linux vmscan changes.  See lttng-modules git commit
d0d2908478bdc8c36faaeae6fcb687052cb5f93b on lttng-modules branch
stable-2.7: "Fix: update vmscan instrumentation for kernel 4.5".

Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 2eb1a51..d8a7d36 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=362844633a08753bd96ab322a6c7f9f6 \
 
 inherit module
 
-SRCREV = "45e0ebd91f995cc73c2b0d5c60cf9d12e8c838bf"
-PV = "2.7.1+git${SRCPV}"
+SRCREV = "5362a1f26060e0d64464bb35cdd285c914ae6171"
+PV = "2.7.3+git${SRCPV}"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 
-- 
2.8.1


