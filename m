Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFuP-0007au-DB
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 10:09:49 +0100
Received: by eaal12 with SMTP id l12so268074eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=U+jfGFbTnlcYbtaO+peyJVVaJgnNPvC51FTJX1GAjPc=;
	b=UBl3izMvKNBakUUwdJVQBhSh27nkzm7m/3pxofcOZX7ekgIqgElI7QLNKTSs6vdtc9
	KVJ/rmUDbaLMA29sh/WMx2fZIoA1lQulszYQz2UTq45IKTJda1j/JrqaJ6tbZiIQa8EF
	Ij2QmKaIVXp7aJfnWsRkYSNyXcKZv/brvh3oM=
Received: by 10.213.20.73 with SMTP id e9mr1431536ebb.113.1327309325620;
	Mon, 23 Jan 2012 01:02:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x43sm51317556eef.8.2012.01.23.01.02.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 01:02:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:01:57 +0100
Message-Id: <cover.1327309289.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH 0/2] Initscripts cosmetics
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
X-List-Received-Date: Mon, 23 Jan 2012 09:09:49 -0000

The following changes since commit ac162df288f6d8f68c1764fad0ab2d33b9cee281:

  distro_tracking: update libpng, libgdbus, opensp, nfs-utils manual check dates (2012-01-20 16:35:08 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (2):
  initscripts: add shebang where it was missing completely
  initscripts: remove space from shebang, just cosmetics

 .../initscripts/initscripts-1.0/bootmisc.sh        |    1 +
 .../initscripts/initscripts-1.0/checkfs.sh         |    1 +
 .../initscripts/initscripts-1.0/checkroot.sh       |    1 +
 .../initscripts/initscripts-1.0/devpts.sh          |    2 +-
 meta/recipes-core/initscripts/initscripts-1.0/halt |    2 +-
 .../initscripts/initscripts-1.0/hostname.sh        |    1 +
 .../initscripts/initscripts-1.0/mountall.sh        |    1 +
 .../initscripts/initscripts-1.0/mountnfs.sh        |    1 +
 .../initscripts/initscripts-1.0/reboot             |    2 +-
 .../initscripts/initscripts-1.0/rmnologin.sh       |    2 +-
 .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
 .../initscripts/initscripts-1.0/sendsigs           |    2 +-
 .../initscripts/initscripts-1.0/single             |    2 +-
 .../initscripts/initscripts-1.0/umountfs           |    2 +-
 .../initscripts/initscripts-1.0/umountnfs.sh       |    1 +
 .../initscripts/initscripts-1.0/urandom            |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 17 files changed, 17 insertions(+), 10 deletions(-)

-- 
1.7.8.4



