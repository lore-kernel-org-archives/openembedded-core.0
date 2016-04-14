Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8472A602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 11:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 7C98D2E174
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XofZ7FmZ0J0t
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id B0BD42E08D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9233F14A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 876BD103B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 85D9C1128
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3EBaeIq019344
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3EBae0h019342
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2016 13:36:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 13:36:38 +0200
Message-Id: <cover.1460633745.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Disable syslog for all shadow commands supported by useradd_base.bbclass
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
X-List-Received-Date: Thu, 14 Apr 2016 11:36:42 -0000

With the introduction of using userdel and groupdel when cleaning up a
recipe, I started getting messages in my system logs about the removal
of users and groups I know only exist in my recipes. It turned out
that the use of syslog had been disabled for useradd and groupadd when
building shadow-native, but never for the other commands supported by
useradd_base.bbclass. This commit rectifies this.

//Peter

The following changes since commit aab3c8d56dd6344b1e6cf38e610970bc68b2f624:

  linux-yocto: make aufs4 optional (2016-04-14 10:58:34 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/shadow_disable_syslog
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/shadow_disable_syslog

Peter Kjellerstedt (1):
  shadow: Disable syslog for more commands

 .../0001-Disable-use-of-syslog-for-sysroot.patch   | 124 +++++++++++++++++++++
 .../shadow/files/disable-syslog.patch              |  34 ------
 meta/recipes-extended/shadow/shadow.inc            |   4 +-
 3 files changed, 126 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
 delete mode 100644 meta/recipes-extended/shadow/files/disable-syslog.patch

-- 
2.1.0


