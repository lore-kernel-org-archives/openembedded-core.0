Received: from e06smtp17.uk.ibm.com ([195.75.94.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1SKomf-0003zl-A3
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 12:40:17 +0200
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Thu, 19 Apr 2012 11:20:48 +0100
Received: from d06nrmr1806.portsmouth.uk.ibm.com (9.149.39.193)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 19 Apr 2012 11:20:46 +0100
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1806.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q3JAKjb92695192
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 11:20:46 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q3JAKjXa028646
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 04:20:45 -0600
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-213-71.boeblingen.de.ibm.com [9.152.213.71])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q3JAKjU9028617; Thu, 19 Apr 2012 04:20:45 -0600
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2012 12:20:39 +0200
Message-Id: <1334830839-25853-1-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 12041910-0542-0000-0000-0000019665CA
Subject: [PATCH] bdwgc: Set ARM_INSTRUCTION_SET to "arm"
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
X-List-Received-Date: Thu, 19 Apr 2012 10:40:17 -0000

The bdwgc recipe uses a version of libatomic that fails when building in Thumb
mode. This has been fixed upstream already. The
pulseaudio/libatomics-ops_1.2.bb has the same issue and sets the
ARM_INSTRUCTION_SET to "arm" (probably until a new version gets pulled in).
This patch applies the same workaround to the bdwgc/bdwgc_20110107.bb recipe.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 meta/recipes-support/bdwgc/bdwgc_20110107.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
index 327e59b..bc7b613 100644
--- a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
@@ -33,5 +33,7 @@ PR = "r1"
 
 S = "${WORKDIR}/bdwgc"
 
+ARM_INSTRUCTION_SET = "arm"
+
 inherit autotools
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.4



