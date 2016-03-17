Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1EF6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 11:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B4DBB180B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 51yav6RR9gzk
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id CED7818134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B0B961401
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id A5E5A108C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id A448C10D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2HBEGPJ026153
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2HBEG9r026152
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2016 12:14:16 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:14:07 +0100
Message-Id: <cover.1458213205.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv2 0/7] Improve oe-init-build-env/-memres
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
X-List-Received-Date: Thu, 17 Mar 2016 11:14:19 -0000

I started looking at the oe-init-build-env (and
oe-init-build-env-memres) scripts since I wanted to add support for
specifying $OEROOT from the outside. This is because we want to wrap
those scripts with our own while keeping the official names (so anyone
reading the official Poky documentation will not be too confused).

While fixing the above, I had noticed a number of inconsistencies in
the scripts, so I continued to fix those. I also improved the code
that adds paths to $PATH, and the code that adds variable names to
$BB_ENV_EXTRAWHITE.

New in version 2:

* Make sure oe-init-build-env and oe-init-build-env-memres actually
  return failures from other scripts they source and call.

//Peter

The following changes since commit 8debfea81e69d038bd2d56314b272cb74f5582ed:

  local.conf.sample: Disable prelink by default (2016-03-13 22:09:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-init-build-env
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-init-build-env

Peter Kjellerstedt (7):
  oe-init-build-env*: Allow $OEROOT to be predefined
  oe-init-build-env*: Update/correct comment about specifying arguments
  oe-init-build-env*: Remove unnecessary differences between the scripts
  oe-init-build-env*: Make them actually return failures
  oe-buildenv-internal: Add paths to $PATH individually
  oe-buildenv-internal: Add variables individually to BB_ENV_EXTRAWHITE
  oe-buildenv-internal: Some clean up

 oe-init-build-env            | 51 +++++++++++++++------------
 oe-init-build-env-memres     | 60 ++++++++++++++++++--------------
 scripts/oe-buildenv-internal | 83 ++++++++++++++++++++++++++++----------------
 3 files changed, 114 insertions(+), 80 deletions(-)

-- 
2.1.0


