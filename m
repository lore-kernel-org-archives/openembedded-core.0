Return-Path: <vz@mleia.com>
X-Greylist: delayed 541 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 06 Aug 2016 01:52:31 UTC
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	by mail.openembedded.org (Postfix) with ESMTP id E788277157
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Aug 2016 01:52:31 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 102D3433E79;
	Sat,  6 Aug 2016 02:43:31 +0100 (BST)
From: Vladimir Zapolskiy <vz@mleia.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2016 04:43:27 +0300
Message-Id: <1470447809-12186-1-git-send-email-vz@mleia.com>
X-Mailer: git-send-email 2.8.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20160806_024331_087823_E82A8069 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message. 
Subject: [PATCH 0/2] meta/classes: correct subprocess.Popen.communicate() return values
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
X-List-Received-Date: Sat, 06 Aug 2016 01:52:33 -0000

This is a non-functional change, which intends to correct element
names of a tuple returned by Popen.communicate() in oe-core classes
chrpath and package.

Both in python2 and python3 subprocess.Popen.communicate() method
returns a tuple (stdoutdata, stderrdata), thus some old assignments
and collateral comments are incorrect from human's point of view,
however formally there is no error in the code.

The issue was occasionally found by code inspection while investigating
early build errors due to not installed chrpath utility on a host.

The change is desired to have to avoid excessive astonishment while
reading code and of course copy-paste errors in future.

Vladimir Zapolskiy (2):
  chrpath: correct subprocess.Popen.communicate() return values
  package: correct subprocess.Popen.communicate() return values

 meta/classes/chrpath.bbclass | 18 +++++++++---------
 meta/classes/package.bbclass | 12 ++++++------
 2 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.8.1


