Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qh4Kz-0005QT-8g
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 20:39:09 +0200
Received: by gxk3 with SMTP id 3so2668689gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 11:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=tE+xuq3u61fm4+CDX2hMXMZoYS4IW9IF0oYcvVkdJ8U=;
	b=L8oYl2j22hAwrF17SEUtmGr8cWIh4fQ7iHJD+N+RVOm7i6edxCixILai8zH52ujKOz
	Uf1Z65mRwH/0lF0UFAQ1CWg65Qu6xTn88umJozwn1tX//mJnt2xBavU63ieD+4x0y0+y
	zTbzwt4LmwWP4d+22c6UQbvSJgTO49RkHpYMI=
Received: by 10.236.5.140 with SMTP id 12mr1945342yhl.433.1310582110131;
	Wed, 13 Jul 2011 11:35:10 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id v25sm7845069yhk.8.2011.07.13.11.35.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 11:35:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 11:35:02 -0700
Message-Id: <cover.1310581914.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] [PULL REQUEST,v2] Rework the devshell
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
X-List-Received-Date: Wed, 13 Jul 2011 18:39:09 -0000

Changes since the previous sends: resurrects the export of some variables that
were inadvertently removed.

The following changes since commit de4dc5f0741533529789a6094721f708728af386:

  eglibc: fix runtime assertion failure (2011-07-13 12:34:23 +0100)

are available in the git repository at:
  http://github.com/kergoth/oe-core devshell

Chris Larson (2):
  Rework how the devshell functions
  oe.terminal: improve how we spawn screen

 meta/classes/devshell.bbclass |   29 +++++-------
 meta/classes/terminal.bbclass |   30 +++++++++++
 meta/lib/oe/terminal.py       |  107 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/terminal.py

-- 
1.7.5.4



