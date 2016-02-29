Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A025477154
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 6CAD12E154
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id e6LmjAhfaB-L
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 7E15E2E15A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5DB6D13AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 528BBA52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 509E034277
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u1TGSwU4006822
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:28:58 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u1TGSwWX006821
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Feb 2016 17:28:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 17:28:55 +0100
Message-Id: <cover.1456763255.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for sanity handling of meta-yocto -> meta-poky
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
X-List-Received-Date: Mon, 29 Feb 2016 16:28:59 -0000

The code in sanity.bbclass to handle the transition from meta-yocto to
meta-poky needs to be more resilient and not mistake meta-yocto-bsp
for meta-yocto. It also needs to handle all occurrences of meta-yocto.

Even with the suggested change here the code still relies on that all
layers in bblayers.conf are specified on separate lines...

//Peter

The following changes since commit 4006a7f2762ccd5dcbc6cdff49482d4387a73261:

  sanity: Fix int verses string reference (2016-02-28 22:54:09 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/sanity-meta-poky
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/sanity-meta-poky

Peter Kjellerstedt (1):
  sanity: Do not mistake meta-yocto-bsp for meta-yocto

 meta/classes/sanity.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.1.0


