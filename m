Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7B82D70BA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 148B72E462
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8lw0bRODoZLT
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 83E422E434
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6B2FD1464
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 5FE53D16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 5491E3E048
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHf6jj031906
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHf6rX031905
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:41:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:41:03 +0200
Message-Id: <cover.1407951634.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Fix for running scons with old host installation present
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:13 -0000

This makes scons useable if there is an older version than 2.3.0
installed on the host.

//Peter

The following changes since commit 6882d2d9993c8655a292c93e84ea01b4738a700d:

  yocto-project-qs, ref-manual: Added 'socat' package to essentials. (2014-08-12 13:50:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/scons
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/scons

Peter Kjellerstedt (1):
  python-scons-native: Make it useable if old host install exists

 meta/recipes-devtools/python/python-scons-native_2.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.0


