Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 9221E724FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 13:37:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id E4E41600496
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 14:37:11 +0100
Message-Id: <cover.1431696945.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/1] Fix implicit dependencies in cairo
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
X-List-Received-Date: Fri, 15 May 2015 13:37:19 -0000

The following changes since commit 90861b8908d254154f4d1d613471070df8013da8:

  base: Avoid find race (2015-05-14 15:22:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/cairo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/cairo

Joshua Lock (1):
  cairo: make xlib and libxcb dependencies explicit

 meta/recipes-graphics/cairo/cairo.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.4.0


