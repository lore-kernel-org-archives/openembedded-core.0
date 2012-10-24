Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQwBu-0001af-Op
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 10:19:54 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so181457wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 01:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=tqVr0p3G6CkraAz2XPvGt6vcl/aLn8Yj1NLL8f4kswk=;
	b=p7lLUnr5/EZwLe6xgOjwqeNkQv4Jqruj7jL9dlsNO54IDFkTywrqFclHHkpuc4OvoT
	+iqXJF65Tq43+45AgTXjPjrW0UxCcC5WHw4mccAN/lDRcshuXZ4Rpcqf9OPYFwCw2ZNe
	8vW+hj/Yr12UWd+Lilv/1IACANWH+QAPo1sEaG4P6J9nzsriLoGBQX4eE0XGqj6eDjfg
	Byxz+tI8im0uc+4mVsXusOlOgkm+pe49qWyZkeaKZwug+/kQZRErXJ363RV0XmCMHGTq
	El9YdchRUJTZBqR43isPn8eh3clTxhFFwLEpBI3Gn9b4IjlasbP/L2lOxbjYrm6sQu9K
	IRZA==
Received: by 10.180.99.194 with SMTP id es2mr3888922wib.15.1351065987453;
	Wed, 24 Oct 2012 01:06:27 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id ei1sm3534677wid.7.2012.10.24.01.06.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 01:06:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 10:05:13 +0200
Message-Id: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [V3 0/4] icon-themes fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2012 08:19:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1->v2:
  * fix sato-icon-theme
v2->v3:
  * add libxml-simple-perl-native to DEPENDS
  * merge sato-icon-theme.inc into recipe

The following changes since commit 06d27cf0fbcc4004e6f456880eca49893c9290bf:

  xorg: remove XF86 BigFont extension (2012-10-22 14:57:26 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/oe-core.git icon-themes

Andreas Müller (4):
      gnome-icon-theme: fix icon mapping
      gnome-icon-theme: remove unused configure variable
      sato-icon-theme: fix build
      sato-icon-theme: merge sato-icon-theme.inc into recipe

 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |   10 +++----
 .../sato-icon-theme/sato-icon-theme.inc            |   24 -----------------
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |   27 +++++++++++++++++--
 3 files changed, 28 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc

-- 
1.7.6.5



