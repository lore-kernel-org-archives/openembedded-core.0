Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC6171E68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 03:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 87C4C18172
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id coWj022nBmNi
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id C983E18154
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id AB24C1263
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 9DDFF103F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 99E613E229
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t1L31w4M014413
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t1L31wpn014412
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Feb 2015 04:01:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Feb 2015 04:01:53 +0100
Message-Id: <cover.1424487658.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for gst-plugins-package.inc
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
X-List-Received-Date: Sat, 21 Feb 2015 03:07:40 -0000

This fixes a problem that was introduced in Poky
34221ef141e9a8b4e9d3e0687563d691bcd9f225 whereby installing any
GStreamer plugin would install all plugins from the same recipe...

//Peter

The following changes since commit 5db6a27f4847e51c6434a968f81d3ceffcc54952:

  bitbake: toaster: importlayer Remove description input field (2015-02-20 12:58:20 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/gst-plugins-package
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/gst-plugins-package

Peter Kjellerstedt (1):
  gst-plugins-package.inc: Avoid dependency on ${PN} from ${PN}-<plugin>

 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.1.0


