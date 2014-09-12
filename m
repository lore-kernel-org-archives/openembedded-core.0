Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCABF6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 15:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C42FE18071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id U2R0Xd92HdBt
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:14 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 93EA4180AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:14 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 7313FA67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:14 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 67FF09B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:14 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 660523E048
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:14 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s8CF5ED6020885
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:14 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s8CF5EHx020884
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Sep 2014 17:05:14 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Sep 2014 17:04:59 +0200
Message-Id: <cover.1410534231.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Fix for "useradd --root"
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
X-List-Received-Date: Fri, 12 Sep 2014 15:05:29 -0000

This fixes a problem with useradd where it used the /etc/login.defs
file from my host system rather than the one provided by Poky. The
patch has been reported to the pkg-shadow-devel mailing list as well.

//Peter

The following changes since commit 429802fe6691c8a70ec9735c0db4c6a4e1e1b038:

  classes/populate_sdk_base: enable adding custom commands to SDK install script (2014-09-11 18:02:55 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/shadow
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/shadow

Peter Kjellerstedt (1):
  shadow: Make useradd work correctly with --root again

 ...o-not-read-login.defs-before-doing-chroot.patch | 46 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch

-- 
1.9.0


