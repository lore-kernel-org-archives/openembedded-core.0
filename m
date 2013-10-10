Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96D156CF91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 08:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 374CA365286
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AhWJF+u1wumD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:12 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 8812311E33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 67CBB9FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5CE8054D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 520393404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r9A8qBUD027882
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:52:11 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r9A8qBYf027881
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Oct 2013 10:52:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 10:52:05 +0200
Message-Id: <cover.1381395083.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH 0/1] Add a missing '[' to kernel-yocto.bbclass
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
X-List-Received-Date: Thu, 10 Oct 2013 08:52:15 -0000

This adds a missing '[' which caused the test for
${SRCREV_machine} == "INVALID" to not work as expected.

//Peter

The following changes since commit 102bf5e0f640fe85068452a42b85077f1c81e0c9:

  build-appliance: Update SRCREV for release (2013-10-08 16:33:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/kernel-yocto_typo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/kernel-yocto_typo

Peter Kjellerstedt (1):
  kernel-yocto: Add a missing '['

 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.4


