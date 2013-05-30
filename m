Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 1683B6A4AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id D447519D94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0MQGFLLjya1x
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:43 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 6E79F19D92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5068CA05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 457C03B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 43BAA3405E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4UCIg1B017025
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4UCIgoQ017024
	for openembedded-core@lists.openembedded.org;
	Thu, 30 May 2013 14:18:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:18:28 +0200
Message-Id: <cover.1369916015.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH v3 0/5] Fixes for makedevs
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
X-List-Received-Date: Thu, 30 May 2013 12:18:46 -0000

When I wanted to create devices from a package I stumbled upon a couple
of problems with the makedevs program. Most notable was that it failed
to set the correct uid/gid for devices created as part of a block (i.e.,
with a count > 0).

PATCH v2: And now with Signed-off-by lines, as requested.

PATCH v3: Also made count for blocks of devices behave as a count rather
than the end (noticed after looking a makedevs.c from BusyBox).

The following changes since commit efb8a460d2a977dbd481a0650fba8eb637c65bec:

  package.bbclass: Fix sources contents (2013-05-14 08:52:47 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/makedevs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/makedevs

Peter Kjellerstedt (5):
  makedevs: Create blocks of devices with the correct uid/gid
  makedevs: Correct the device number calculation for blocks of devices
  makedevs: Make the mode number readable in debug messages
  makedevs: Avoid unnecessary timestamp calculation
  makedevs: Make count actually behave as a count for device blocks

 meta/files/device_table-minimal.txt                   |  2 +-
 .../makedevs/makedevs-1.0.0/makedevs.c                | 19 +++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

-- 
1.8.2.1


