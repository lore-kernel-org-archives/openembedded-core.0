Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD6371A53
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 15:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id BF68F181CA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id nKuAXXxIX1XI
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2C1A2181C8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 184241A0B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D01A1A0B0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 01A66479
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u95FUoB5026015
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2016 17:30:50 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u95FUo9n026013
	for openembedded-core@lists.openembedded.org;
	Wed, 5 Oct 2016 17:30:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 17:30:44 +0200
Message-Id: <cover.1475681404.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 0/4] Fixes for PACKAGE_EXCLUDE_COMPLEMENTARY
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
X-List-Received-Date: Wed, 05 Oct 2016 15:30:54 -0000

The first patch fix a problem with PACKAGE_EXCLUDE_COMPLEMENTARY where
it could not contain a regular expression that began with a dash, and
the second makes it possible to specify multiple, whitespace separated
regular expressions in PACKAGE_EXCLUDE_COMPLEMENTARY.

PATCH v2: Added two more patches to make do_rootfs and do_populate_sdk
depend on PACKAGE_EXCLUDE_COMPLEMENTARY.

//Peter

The following changes since commit 4189a1977e65f71ddb8fc0498bcef91754c673d8:

  bitbake: toaster: add Font Awesome license (2016-10-05 10:28:53 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/complementary_packages
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/complementary_packages

Peter Kjellerstedt (4):
  package_manager.py: Allow a leading - in PACKAGE_EXCLUDE_COMPLEMENTARY
  package_manager.py: Allow multiple regexps in
    PACKAGE_EXCLUDE_COMPLEMENTARY
  image.bbclass: Make do_rootfs depend on PACKAGE_EXCLUDE_COMPLEMENTARY
  populate_sdk_base.bbclass: Make do_populate_sdk depend on
    PACKAGE_EXCLUDE_COMPLEMENTARY

 meta/classes/image.bbclass             | 2 +-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/lib/oe/package_manager.py         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.9.0


