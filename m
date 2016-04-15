Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD3E370034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 39B0A180D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rl2va8zH0ta4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 22A38180C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 0459F163F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id EDCD214D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:07 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id EC3C01039
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:07 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3FHU7Nh014278
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:07 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3FHU7Um014242
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2016 19:30:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 19:30:05 +0200
Message-Id: <cover.1460741369.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] Correct oe-selftest usage information
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
X-List-Received-Date: Fri, 15 Apr 2016 17:30:10 -0000

This corrects the usage information in the oe-selftest script, and
corrects references to meta/lib/oeqa/selftest in some comments.

//Peter

The following changes since commit 20a0121b558b32179220e394a66cb90dc6ff3879:

  bitbake: bitbake-user-manual: Updated discussion about using "inherit" (2016-04-15 06:59:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-selftest_usage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-selftest_usage

Peter Kjellerstedt (2):
  oe-selftest: Correct the usage examples
  lib/oeqa/selftest/base.py: Correct a reference to
    meta/lib/oeqa/selftest

 meta/lib/oeqa/selftest/base.py | 2 +-
 scripts/oe-selftest            | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.1.0


