Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BB5F57717A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 3744A2E1F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UkUTfo0XWsAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id A588F2E136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 89A8914AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 7ED58834
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 7C006102B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSLZ6026696
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLQU026695
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:11 +0200
Message-Id: <cover.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/7] Improvements for the rootfs log check
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
X-List-Received-Date: Wed, 18 May 2016 22:28:27 -0000

This is a set of improvements to the log check code in
meta/lib/oe/rootfs.py. It started out with me wanting to reduce the
spam I got when there were many warnings in the log, and ended up with
quite a lot of refactoring. I also activated the fix to bug 7789 along
the way...

I have only tested this with rpm builds, but I expect it to work for
deb and ipk builds as well...

//Peter

The following changes since commit 7707cf6562e6a477ea953743a2d9aba682d90949:

  sdk-manual: Fixed three broken links to sections within manual. (2016-05-17 21:35:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/improve_rootfs_log_check
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/improve_rootfs_log_check

Peter Kjellerstedt (7):
  Revert "rootfs.py: add more info to the warning message"
  rootfs.py: Remove _log_check_error() from the RpmRootfs class
  rootfs.py: Simplify the regular expression used in _log_check_warn()
  rootfs.py: Use one way to exclude lines in _log_check_error()
  rootfs.py: Exclude lines in _log_check_warn() as well
  rootfs.py: Reduce spam from _log_check_warn()
  rootfs.py: Unify _log_check_warn() and _log_check_error()

 meta/lib/oe/rootfs.py | 93 +++++++++++++++++----------------------------------
 1 file changed, 31 insertions(+), 62 deletions(-)

-- 
2.1.0


