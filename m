Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8417D6FF91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 14:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 033E62E0C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:52:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8eIFNO+oDi09
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:52:03 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 84EFD2E0DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:52:02 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 673D11418
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:52:02 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5C40D833
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:52:02 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 515C1FEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:52:02 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2AEq2EY016564
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:52:02 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2AEq2Qe016563
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2016 15:52:02 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 15:51:58 +0100
Message-Id: <cover.1457621343.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [jethro][PATCH 0/1] Backport fix to devtool for readonly Git hooks
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
X-List-Received-Date: Thu, 10 Mar 2016 14:52:06 -0000

This backports a change to devtool from master so that devtool can
handle Git hooks that are readonly.

//Peter

The following changes since commit 1a52eceaa5df89914b6a711defdcf0046e74c7f6:

  ref-manual: Corrected Note for CentOS package requirements (2016-03-03 17:40:20 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/jethro-devtool-hooks
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/jethro-devtool-hooks

Peter Kjellerstedt (1):
  lib/oe/patch: Make GitApplyTree._applypatch() support read-only
    .git/hooks

 meta/lib/oe/patch.py | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

-- 
2.1.0


