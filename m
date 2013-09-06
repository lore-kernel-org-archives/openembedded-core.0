Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 350B56BEE1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 97FF234960F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZlV377MmjfgB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id EDE6834960C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:20 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id CE2355DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:20 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id C33F11C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:20 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id C20953404E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:20 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r86GCKhb012327
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2013 18:12:20 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r86GCKNR012326
	for openembedded-core@lists.openembedded.org;
	Fri, 6 Sep 2013 18:12:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 18:12:16 +0200
Message-Id: <cover.1378483732.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 0/2] Fixes for bb-matrix
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
X-List-Received-Date: Fri, 06 Sep 2013 16:12:23 -0000

This fixes a couple of problems with bb-matrix that I found the other
day when trying to use the script. They would have saved me a day or
two of test builds that were not building what I thought they were due
to incorrect configurations...

//Peter

The following changes since commit ed3ef0823fde89371a473d20c0127c0bd16d062b:

  qemumips: fix keyboard entry in graphical boots (2013-09-05 16:27:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/bb-matrix_improvements
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/bb-matrix_improvements

Peter Kjellerstedt (2):
  bb-matrix: Clean before, rather than after, building
  bb-matrix: Make sure local.conf does not interfere

 scripts/contrib/bb-perf/bb-matrix.sh | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
1.8.2.1


