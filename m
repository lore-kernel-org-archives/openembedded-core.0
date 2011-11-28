Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUqOj-0003Q3-C0
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 02:52:45 +0100
Received: by ghy10 with SMTP id 10so4783572ghy.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2011 17:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WOb+0m425S5gT93XKq84aMBL8TgUqgqAPNde8W7TQhY=;
	b=gtcc6A3IIiLy9H6oOJATyRTaNz1tcN/IAiWh45K/g4ab+UeVzV9bVhVYoCMJBT9oZs
	Mq1TmJ+4Ur7WrhzoNbC2rGnAe+qqrb9bnj8PB6Z1JRbYK7XctL0xhTB/ef3cYlcx1bku
	XpdqGMTsWEwXl148YxIFhwglDha0TGx9ts0hA=
Received: by 10.50.17.197 with SMTP id q5mr47704278igd.2.1322444767216;
	Sun, 27 Nov 2011 17:46:07 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a2sm79124512igj.7.2011.11.27.17.46.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Nov 2011 17:46:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Nov 2011 17:45:58 -0800
Message-Id: <cover.1322444142.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Fixes for python-native and runqemu with uclibc
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
X-List-Received-Date: Mon, 28 Nov 2011 01:52:45 -0000

These patches fix a problem with python-native
and other patches to get runqemu working with uclibc

The following changes since commit a14b41f4de3ea6c3f00ff7a1d0441483e40b28de:

  default-distrovars: Define SDK_VERSION and DISTRO_VERSION (2011-11-27 17:32:00 -0800)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (3):
  default-distrovars: Define SDK_VERSION and DISTRO_VERSION
  toolchain-scripts.bbclass: Make it work when TCLIBC=uclibc
  python-native: Fix gcc compiler detecting logic

 meta/classes/toolchain-scripts.bbclass             |    8 +++++-
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 .../python/python-native/unixccompiler.patch       |   22 ++++++++++----------
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
 4 files changed, 20 insertions(+), 15 deletions(-)

-- 
1.7.5.4



