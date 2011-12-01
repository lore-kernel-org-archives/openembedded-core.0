Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW5RT-0003pp-AD
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:08:43 +0100
Received: by eaad13 with SMTP id d13so2082708eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4tuEIhUg2lDTNfmqk8LpgF+V61MSFJrgPXnm6sgbB7I=;
	b=cDfLilfVi3/yqxAE3BLG7MOPi3EiPgWDEPxxZ9QF6qHPmHH5k9Q0f6EENW46bnHlYb
	pRXDMf0xjAZMSiHFquB0wCbJQpJKN28tLmGnzhM5VQ64Iofyl/7+UWYBPfB0J2vdkbJ9
	TGtNuFiHXFjGqe9c3FKz9h317CLkEpK+ssdzk=
Received: by 10.213.17.145 with SMTP id s17mr1021391eba.14.1322740920990;
	Thu, 01 Dec 2011 04:02:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm16867563eeh.5.2011.12.01.04.01.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 04:01:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 13:01:49 +0100
Message-Id: <cover.1322740824.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Subject: [PATCH][oe-core 0/4] Small fixes for sysstat, shadow, coreutils, gconf
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
X-List-Received-Date: Thu, 01 Dec 2011 12:08:43 -0000

sysstat and gconf are fixed version of previous patches (which were also sent
to ML, resending now just to be clear that they are also in branch and pull-request).

The following changes since commit 6ef79ede361c42e11e78d4afcff11295a3144055:

  pulseaudio 1.1: add filter-apply and filter-heuristics to pulseaudio-server RDEPENDS, it won't start without (2011-12-01 10:53:27 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (4):
  sysstat: don't run populate-volatile.sh update in do_rootfs or
    without populate-volatile.sh
  gconf: add polkit to DEPENDS only for target recipe and disable
    default-service for native
  shadow: use u-a for /usr/bin/groups
  coreutils: fix u-a for base64, mktemp and df

 meta/recipes-core/coreutils/coreutils_8.14.bb   |   20 ++++++++++++++------
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb  |    5 +++--
 meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
 meta/recipes-extended/sysstat/sysstat_10.0.2.bb |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb         |   10 +++++++---
 5 files changed, 31 insertions(+), 13 deletions(-)

-- 
1.7.8.rc4



