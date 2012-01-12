Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHAr-00079y-2k
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 10:42:21 +0100
Received: by eekd17 with SMTP id d17so493358eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=J9nrEFmnSPbn2KIMskz4XeD/i4Ex518R8Yt6YUKLwNg=;
	b=gWWr2X5jCwG+KJUqd+oYGbYHfW9fMW4SzhlPPmWRbW0EgIt+AziAv5yD46oH3oz76y
	iOAPFDPqcNj8mvRtplzKRiiCRa/iSpE0UF1E5rY22uv54JafFdBTMCy0oVOFH8kH27gN
	S5SAk1qTr4yXM4fQorS1ErEXrfG4QUMLmVsLs=
Received: by 10.14.39.196 with SMTP id d44mr1033253eeb.108.1326360889109;
	Thu, 12 Jan 2012 01:34:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x43sm17291873eef.8.2012.01.12.01.34.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:34:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:34:38 +0100
Message-Id: <cover.1326360842.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH 0/2] Small fixes
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
X-List-Received-Date: Thu, 12 Jan 2012 09:42:22 -0000

The following changes since commit 1d2697e6f00cc3771f39f5a7d4384a22d9696b16:

  multilib.conf: Clean up file and add missing entries for various dependencies (2012-01-11 23:53:21 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (1):
  alsa-utils: depend on libsamplerate0

Martin Jansa (1):
  xorg-*: disable xmlto where it was failing

 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../xorg-proto/xorg-proto-common.inc               |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 ++--
 4 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.7.8.3



