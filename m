Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB4F477029
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1E77D180D3;
	Fri, 18 Sep 2015 12:46:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Uq0LEbNh2Y61; Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 9A4C0180EA;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5536BFF3;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 49C1C13CB;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3D74034005;
	Fri, 18 Sep 2015 12:46:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t8IAkLw4028403;
	Fri, 18 Sep 2015 12:46:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t8IAkJDV028352;
	Fri, 18 Sep 2015 12:46:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 12:46:03 +0200
Message-Id: <cover.1442572927.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 0/3] Fixes for oe-git-proxy
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
X-List-Received-Date: Fri, 18 Sep 2015 10:56:14 -0000

This fixes a couple of problems with the oe-git-proxy script. See the
respective commits for more information.

//Peter

The following changes since commit 3a5e46b6ed483e43251da7e328b9299189997722:

  bitbake: bb.fetch2.{git, hg}: remove tarball if it needs updating (2015-09-18 09:05:36 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-git-proxy
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-git-proxy

Peter Kjellerstedt (3):
  oe-git-proxy: Allow explicit IP addresses in $NO_PROXY
  oe-git-proxy: Correct the parsing of a port in $ALL_PROXY
  oe-git-proxy: Allow socks4 as protocol in $ALL_PROXY

 scripts/oe-git-proxy | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.1.0


