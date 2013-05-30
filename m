Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECE6D61AD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id B5205349647
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:21:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mj1Osvnt+TMG
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:21:10 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 8CFE834964D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:21:00 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 90313A73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:20:03 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 855CBA6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:20:03 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 83C0E3405E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:20:03 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4U7K3hb014276
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:20:03 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4U7K3hk014275
	for openembedded-core@lists.openembedded.org;
	Thu, 30 May 2013 09:20:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 09:19:54 +0200
Message-Id: <cover.1369898198.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH v2 0/4] Fixes for makedevs
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
X-List-Received-Date: Thu, 30 May 2013 07:21:11 -0000

When I wanted to create devices from a package I stumbled upon a couple
of problems with the makedevs program. Most notable was that it failed
to set the correct uid/gid for devices created as part of a block (i.e.,
with a count > 0).

And now with Signed-off-by lines, as requested.

The following changes since commit efb8a460d2a977dbd481a0650fba8eb637c65bec:

  package.bbclass: Fix sources contents (2013-05-14 08:52:47 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/makedevs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/makedevs

Peter Kjellerstedt (4):
  makedevs: Create blocks of devices with the correct uid/gid
  makedevs: Correct the device number calculation for blocks of devices
  makedevs: Make the mode number readable in debug messages
  makedevs: Avoid unnecessary timestamp calculation

 .../recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
1.8.2.1


