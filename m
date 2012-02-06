Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RuMUW-000692-Fz
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 12:12:12 +0100
Received: by yhfq46 with SMTP id q46so2263709yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=4PG3Puo9EUKXUqOJ82y96TaqvXR2WtzEm6f6BTHEIfA=;
	b=G26EJHFKMaO/GRcSh/c1cSpXJHqkJ5031ljaIwziTV9zkz+sadEIFZWDN7CEW409uS
	HdGz+baISWPuyyAyV1BOwwVOgZTx1FyM6XgUe0PsX84jUwXGVsVkHln/8JbqoohyaFS2
	ULTekn3A9KaRZmRN3qs5sUWT9esdR0w8hmIlA=
Received: by 10.236.118.195 with SMTP id l43mr22041817yhh.97.1328526251142;
	Mon, 06 Feb 2012 03:04:11 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id a39sm22309816yhk.15.2012.02.06.03.04.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 03:04:09 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 11:03:57 +0000
Message-Id: <cover.1328526202.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/2] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Mon, 06 Feb 2012 11:12:12 -0000

The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:

  libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (2):
  dhcp: move dhcp leases files handling to postinst/postrm
  udev: stop providing cache support by default

 meta/recipes-connectivity/dhcp/dhcp.inc      |   19 ++++++++++++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 meta/recipes-core/udev/udev.inc              |    2 +-
 meta/recipes-core/udev/udev_164.bb           |    2 +-
 4 files changed, 21 insertions(+), 4 deletions(-)

-- 
1.7.2.5



