Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 42D3873193
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CAD602E169;
	Mon,  7 Mar 2016 15:34:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iaKuaeJfSiOa; Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id CEFBE2E104;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B6980959;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id A96C3122;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A7383A0C;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u27EYiXE006355;
	Mon, 7 Mar 2016 15:34:44 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u27EYiGZ006351;
	Mon, 7 Mar 2016 15:34:44 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Andre McCurdy <armccurdy@gmail.com>
Date: Mon,  7 Mar 2016 15:34:30 +0100
Message-Id: <cover.1457361163.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Revert recent change to streamer1.0-plugins.inc
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
X-List-Received-Date: Mon, 07 Mar 2016 14:34:48 -0000

This reverts a recent change to streamer1.0-plugins.inc where it was
made to inherit gettext. This caused all out GStreamer plugins to
start generating warnings since they lack localization support.

//Peter

The following changes since commit d2c96caa40d6979792b7b73f37e81e2bc67f6735:

  mtools: Drop GCONV_PATH manipulation (2016-03-07 12:41:38 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/gstreamer-plugins
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/gstreamer-plugins

Peter Kjellerstedt (1):
  Revert "gstreamer1.0-plugins-XXX: move inherit gettext into common
    .inc file"

 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 2 +-
 5 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.1.0


