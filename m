Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB0B60EE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:25:27 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 6CEB6A02EBF; Wed, 20 Nov 2013 17:26:51 -0600 (CST)
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2013 17:26:50 -0600
Message-Id: <cover.1384989468.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] v2: make sanity check failure perhaps-surviveable
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
X-List-Received-Date: Wed, 20 Nov 2013 23:25:27 -0000

Sanity checks are changed to happen when a SanityCheck event shows up,
rather than sometimes but not always on a ConfigParsed; there is a
corresponding bitbake patch to actually send the event.

SanityCheck events do not strictly imply that the response should be
handled through the event system; that's now an optional setting in the
SanityCheck event.

So is whether a failure should be a fatal error.

The following changes since commit ee3e2e5ce15a3bf78c7e9d76d7bf68131f2d3ef7:

  librsvg: upgrade to 2.40.0 (2013-11-20 14:03:06 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/insanity_revisited
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/insanity_revisited

Peter Seebach (1):
  sanity.bbclass: Failure might be an option.

 meta/classes/sanity.bbclass |   38 +++++++++++++++++++++++++-------------
 1 files changed, 25 insertions(+), 13 deletions(-)


