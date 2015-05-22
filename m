Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob10.myregisteredsite.com
	(atl4mhob10.myregisteredsite.com [209.17.115.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF0273231
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 06:29:10 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t4M6TA0K029177 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 02:29:10 -0400
Received: (qmail 725 invoked by uid 0); 22 May 2015 06:29:10 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 22 May 2015 06:29:09 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:29:02 +0200
Message-Id: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2 0/3] RFC: Integrating gitpkgv functionality
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
X-List-Received-Date: Fri, 22 May 2015 06:29:13 -0000

Follow-up on the discussion here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100345.html

This is an implementation of gitpkgv in OE-core. It modifies the fetcher
to optionally provide an incremental numbering scheme for GIT repositories.

These three patches implement this, and provide the functionality in three stages.
1 __init__.py: Allows fetchers to provide alternatives to formatting a version string.
2 git.py: Implements such alternative formatting in gitpkgv style.
3 bitbake.conf: Sets GITPKGV so that it becomes backwards compatible with gitpkgv.

v2: Rebased and added bitbake.conf patch to set GITPKGV

Mike Looijmans (3):
  fetch2/__init__.py: Make get_srcrev output configurable
  fetch2/git.py: Add gitpkgv_revision alternative version information
  bitbake.conf: Set GITPKGV variable

 conf/bitbake.conf         |  1 +
 lib/bb/fetch2/__init__.py |  9 ++++++---
 lib/bb/fetch2/git.py      | 25 +++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 3 deletions(-)

-- 
1.9.1


