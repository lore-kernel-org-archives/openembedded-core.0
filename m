Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RlTnZ-0007vv-JV
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:11:09 +0100
Received: from mail172-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jan 2012 23:03:34 +0000
Received: from mail172-va3 (localhost [127.0.0.1])	by
	mail172-va3-R.bigfish.com (Postfix) with ESMTP id 26B343403EC	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:03:34 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dhc1ahc1bh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail172-va3 (localhost.localdomain [127.0.0.1]) by mail172-va3
	(MessageSwitch) id 1326409413990487_22741;
	Thu, 12 Jan 2012 23:03:33 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.252])	by
	mail172-va3.bigfish.com (Postfix) with ESMTP id E1B2D600051	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:03:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jan 2012 23:03:33 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 12 Jan 2012 17:03:32 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	q0CN3WOI010820	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:03:32 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2012 17:03:31 -0600
Message-ID: <1326409412-15507-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] bitbake/fetch2: add support for wrapper command
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
X-List-Received-Date: Thu, 12 Jan 2012 23:11:10 -0000
Content-Type: text/plain

cc: bitbake-devel@lists.openembedded.org
Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 bitbake/lib/bb/fetch2/__init__.py |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 3af56e5..1d7d5c7 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -389,6 +389,8 @@ def runfetchcmd(cmd, d, quiet = False, cleanup = []):
     Optionally remove the files/directories listed in cleanup upon failure
     """
 
+    cmd = "%s %s" % (bb.data.getVar("BB_FETCH_WRAPPER", d, True), cmd)
+
     # Need to export PATH as binary could be in metadata paths
     # rather than host provided
     # Also include some other variables.
-- 
1.7.6.1




