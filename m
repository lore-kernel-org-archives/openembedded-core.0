Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9FF7017D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 11:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 7F4052E0ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OCQP+9BYbSOL
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 2B5D52E0DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 14F6B15DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 09AE6BB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id F0BCB1131
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:48 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2LBfmEo022141
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:48 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2LBfm4d022138
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2016 12:41:48 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 12:41:45 +0100
Message-Id: <cover.1458560461.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for oe-buildenv-internal
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
X-List-Received-Date: Mon, 21 Mar 2016 11:41:51 -0000

A late improvement to the oe-buildenv-internal patches i provided last
week introduced an error in the code that adds paths to $PATH. This
can cause $PATH to end up with a trailing : which will subsequently
cause the sannity checker to fail.

//Peter

The following changes since commit 068afc5d436c716591a54f7d6e1944d8b6f9a198:

  tzdata: update to 2016b (2016-03-20 23:12:32 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-init-build-env
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-init-build-env

Peter Kjellerstedt (1):
  oe-buildenv-internal: Correct the sed expression which updates $PATH

 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


