Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7723F70BE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6A4031805A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MYcvHbBlXmuI
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 49C06180A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 32D1C1465
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 27B1B340
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 25DED3E049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHlsRJ004775
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHls8b004772
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:47:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:47:51 +0200
Message-Id: <cover.1407952036.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Update gstreamer1.0-rtsp-server to 1.4.0
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:57 -0000

This updates gstreamer1.0-rtsp-server to 1.4.0. I have no idea why
this was not done when all the other GStreamer recipes were updated.

//Peter

The following changes since commit 6882d2d9993c8655a292c93e84ea01b4738a700d:

  yocto-project-qs, ref-manual: Added 'socat' package to essentials. (2014-08-12 13:50:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/gstreamer1.0-rtsp-server
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/gstreamer1.0-rtsp-server

Peter Kjellerstedt (1):
  gstreamer1.0-rtsp-server: Upgrade to 1.4.0

 ...r1.0-rtsp-server_1.2.3.bb => gstreamer1.0-rtsp-server_1.4.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.2.3.bb => gstreamer1.0-rtsp-server_1.4.0.bb} (43%)

-- 
1.9.0


