Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DECC478A9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 18:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id BFAC5182CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IK68hZiBJdF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:03 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5423A1840C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:02 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD6C01E078
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A14091E076
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 93D2919EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w6JIJncP007502
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:19:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w6JIJnmi007501
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2018 20:19:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 20:19:37 +0200
Message-Id: <cover.1532024250.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/3] Three miscellaneous patches
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
X-List-Received-Date: Thu, 19 Jul 2018 18:20:09 -0000

These are three miscellaneous patches that I have sent earlier, 
but which somehow seems to have fallen between the cracks. The
original patches should still apply, but I thought it easier
to just resend them.

//Peter

The following changes since commit b0f2f690a3513e4c9fa30fee1b8d7ac2d7140657:

  systemd-boot: upgrade to 239 (2018-07-18 10:18:42 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/misc-patches

Peter Kjellerstedt (3):
  iptables: Split the iptables modules into separate packages
  logrotate: Improve configurability of the installed systemd service
    files
  base-files: profile: Avoid using "command" to determine if programs
    exist

 meta/recipes-core/base-files/base-files/profile    | 18 +++++----
 meta/recipes-extended/iptables/iptables_1.6.2.bb   | 43 +++++++++++++++-------
 .../recipes-extended/logrotate/logrotate_3.14.0.bb | 20 +++++++---
 3 files changed, 55 insertions(+), 26 deletions(-)

-- 
2.12.0


