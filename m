Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0F472DC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 17:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A7CB118134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BCmkqPvfucn1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id E6F2B1812B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C6F1F1401
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id BBEF8B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id BA4351091
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2FHhDLU014438
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2FHhDCi014434
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2016 18:43:13 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 18:43:05 +0100
Message-Id: <cover.1458063686.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/6] Improve oe-init-build-env/-memres
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
X-List-Received-Date: Tue, 15 Mar 2016 17:43:18 -0000

I started looking at the oe-init-build-env (and
oe-init-build-env-memres) scripts since I wanted to add support for
specifying $OEROOT from the outside. This is because we want to wrap
those scripts with our own while keeping the official names (so anyone
reading the official Poky documentation will not be too confused).

While fixing the above, I had noticed a number of inconsistencies in
the scripts, so I continued to fix those. I also improved the code
that adds paths to $PATH, and the code that adds variable names to
$BB_ENV_EXTRAWHITE.

//Peter

The following changes since commit 8debfea81e69d038bd2d56314b272cb74f5582ed:

  local.conf.sample: Disable prelink by default (2016-03-13 22:09:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-init-build-env
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-init-build-env

Peter Kjellerstedt (6):
  oe-init-build-env*: Allow $OEROOT to be predefined
  oe-init-build-env*: Update/correct comment about specifying arguments
  oe-init-build-env*: Remove unnecessary differences between the scripts
  oe-buildenv-internal: Add paths to $PATH individually
  oe-buildenv-internal: Add variables individually to BB_ENV_EXTRAWHITE
  oe-buildenv-internal: Some clean up

 oe-init-build-env            | 45 ++++++++++++------------
 oe-init-build-env-memres     | 54 ++++++++++++++--------------
 scripts/oe-buildenv-internal | 83 ++++++++++++++++++++++++++++----------------
 3 files changed, 102 insertions(+), 80 deletions(-)

-- 
2.1.0


