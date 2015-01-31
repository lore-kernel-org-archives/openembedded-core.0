Return-Path: <mike.looijmans@topic.nl>
Received: from smtp03.online.nl (smtp03.online.nl [194.134.41.33])
	by mail.openembedded.org (Postfix) with ESMTP id 09D7760183
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 14:06:17 +0000 (UTC)
Received: from smtp03.online.nl (localhost [127.0.0.1])
	by smtp03.online.nl (Postfix) with ESMTP id F084B6850C;
	Sat, 31 Jan 2015 15:06:16 +0100 (CET)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp03.online.nl (Postfix) with ESMTP;
	Sat, 31 Jan 2015 15:06:16 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Jan 2015 15:06:11 +0100
Message-Id: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp03.online.nl)
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 0/2] RFC: Integrating gitpkgv functionality
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
X-List-Received-Date: Sat, 31 Jan 2015 14:06:21 -0000

Follow-up on the discussion here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100345.html

This is a preliminary implementation of gitpkgv in OE-core. It modifies the
fetcher to optionally provide an incremental numbering scheme for GIT
repositories.

These two patches implement this. The change in __init__ is basically ready for
public consumption. The modification to git.py is a prototype that I've used to
test feasibility. It imitates gitpkgv perfectly for the recipes I tried.

To make this ready for production, we should provide better names and likely
a GITPKGV or similarly named variable that can be used in recipes instead of
"${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}".

Mike Looijmans (2):
  fetch2/__init__.py: Make get_srcrev output configurable
  fetch2/git.py: Add gitpkgv_revision alternative version information

 lib/bb/fetch2/__init__.py |    9 ++++++---
 lib/bb/fetch2/git.py      |   25 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

-- 
1.7.9.5


