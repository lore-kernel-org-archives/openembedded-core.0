Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6423B755F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 17:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id E6E3A2E71F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ZqYaH8y-EfyI
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 7025D2E4B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 52CB313CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 47CDF13C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 45F9B34009
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t9KHEG1A008672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t9KHEGRH008671
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Oct 2015 19:14:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 19:14:13 +0200
Message-Id: <cover.1445361177.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Avoid unnecessary useradd warnings
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
X-List-Received-Date: Tue, 20 Oct 2015 17:14:21 -0000

This avoids unnecessary warnings when using GROUPMEMS_PARAM, or when
using userdel or groupdel in EXTRA_USERS_PARAMS. A similar change was
introduced for GROUPADD_PARAM and USERADD_PARAM in
c0da4270c76375a7a8cbcc09319fe4570ebbc5bd.

//Peter

The following changes since commit 8578bc17b54da97d42b257b3c8f398ac52b91a9f:

  libc-package: Fix localedef multilib dependency issues (2015-10-20 10:12:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/avoid_useradd_warnings
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/avoid_useradd_warnings

Peter Kjellerstedt (1):
  useradd_base.bbclass: Do not warn without a reason

 meta/classes/useradd_base.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.1.0


