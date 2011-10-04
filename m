Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=VA3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBDP2-00082u-4a
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:23:56 +0200
Received: from mail188-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.22; Tue, 4 Oct 2011 22:03:15 +0000
Received: from mail188-va3 (localhost.localdomain [127.0.0.1])	by
	mail188-va3-R.bigfish.com (Postfix) with ESMTP id 1596F1C601F7	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:15 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail188-va3 (localhost.localdomain [127.0.0.1]) by mail188-va3
	(MessageSwitch) id 1317765794999157_16536;
	Tue,  4 Oct 2011 22:03:14 +0000 (UTC)
Received: from VA3EHSMHS028.bigfish.com (unknown [10.7.14.252])	by
	mail188-va3.bigfish.com (Postfix) with ESMTP id E5471D88050	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS028.bigfish.com
	(10.7.99.38) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 4 Oct 2011 22:03:11 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.323.7; Tue, 4 Oct 2011 17:03:10 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p94M38JJ010861	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 17:03:09 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2011 17:03:06 -0500
Message-ID: <1317765787-19127-5-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317765787-19127-1-git-send-email-msm@freescale.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Tue, 04 Oct 2011 22:23:56 -0000
Content-Type: text/plain

sysprof will not build properly without this defined

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
No comments on original patch sent

 meta/recipes-kernel/sysprof/sysprof_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 10bde04..271b5d8 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -16,6 +16,8 @@ SRC_URI_append_arm  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
 SRC_URI_append_powerpc = " file://ppc-macro-fix.patch"
 
+export CFLAGS_append_powerpc64 = " -D__ppc64__"
+
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
1.7.6.1




