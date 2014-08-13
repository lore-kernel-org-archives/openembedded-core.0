Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB9270B94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 223012E45C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BCXNKJ0czTWo
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:38 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id E7B8A2E457
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D0C261465
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id C565A340
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id BA3EB34005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHkbJI003148
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHkb2c003147
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:46:37 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:46:34 +0200
Message-Id: <cover.1407951966.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/2] Avoid build-deps QA warnings
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
X-List-Received-Date: Wed, 13 Aug 2014 17:46:44 -0000

These changes avoids build-deps QA warnings for two recipes.

//Peter

The following changes since commit 6882d2d9993c8655a292c93e84ea01b4738a700d:

  yocto-project-qs, ref-manual: Added 'socat' package to essentials. (2014-08-12 13:50:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/build-deps
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/build-deps

Peter Kjellerstedt (2):
  gdb: Add a dependency on zlib
  gstreamer1.0-plugins-good: Add a PACKAGECONFIG for udev

 meta/recipes-devtools/gdb/gdb-common.inc                        | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.9.0


