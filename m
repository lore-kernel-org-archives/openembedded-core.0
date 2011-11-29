Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHhW-0002vN-IE
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:01:59 +0100
Received: by bkbzs2 with SMTP id zs2so8942107bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AL/1GWHsjOQ8y9OyLHl6YI91WHAX1cl93cPGaqwwauI=;
	b=OMV0tA73in3xrsvMNx0RRQeGw1ECXW/SBWKT3YvZBFds+7QeNqBSXOWG+cVKqA23Ft
	tmpAIy/YWMNzGl6CCbNPDh47dbnhKPjJdFDRwC3HiOazN7pIKfMze+emGfVX6HW9F7yG
	SiNZSfqYVDkdpyacJaD05YFj9W7flxfr/xk9I=
Received: by 10.205.112.6 with SMTP id eq6mr49522578bkc.16.1322549719340;
	Mon, 28 Nov 2011 22:55:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fa8sm26737462bkc.14.2011.11.28.22.55.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 22:55:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 07:55:09 +0100
Message-Id: <cover.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
Subject: [oe-core 00/10] Small fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 07:01:59 -0000

The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:

  getVar/setVar cleanups (2011-11-26 22:42:00 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2

Denis 'GNUtoo' Carikli (1):
  libical: add version 0.47

Martin Jansa (9):
  tinylogin: use u-a for getty so we can provide /sbin/getty from
    util-linux-agetty too
  util-linux: use u-a to provide /sbin/getty from util-linux-agetty
  mingetty: use u-a to provide /sbin/getty (also provided by
    util-linux-agetty and tinylogin)
  cronie: use useradd.bbclass instead of hardcoded groupadd calls
  ppp-dialin: use useradd.bbclass instead of hardcoded adduser/deluser
    calls
  libical: drop older version 0.46
  libid3tag: add gperf to DEPENDS
  gst-plugins-ugly: bump PR to rebuild after libid3tag fix
  gconf: add polkit to DEPENDS

 .../ppp-dialin/ppp-dialin_0.1.bb                   |   23 +++----------
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |   13 +++++++-
 meta/recipes-core/util-linux/util-linux.inc        |    8 +++++
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 meta/recipes-extended/cronie/cronie_1.4.8.bb       |   33 +++++++++-----------
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |    9 +++++-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    2 +-
 .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |    4 +-
 .../libical/{libical_0.46.bb => libical_0.47.bb}   |   11 +++---
 10 files changed, 59 insertions(+), 48 deletions(-)
 rename meta/recipes-sato/libical/{libical_0.46.bb => libical_0.47.bb} (41%)

-- 
1.7.8.rc3



