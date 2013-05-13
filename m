Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ubj2x-00089J-9B
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 05:03:36 +0200
Received: by mail-pb0-f42.google.com with SMTP id up7so4081767pbc.15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 19:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=/JQtY33jTzDD3sNtonE3Fsl+gSiqjod5ZAZOPfUbg9w=;
	b=HuJpx+HA2UAUgEplAjdqkJTQ56To4fyzjD4Mfe5/aCKWYLuXWcmK0H78HqhoFPFZzF
	hfmDI1YfsCClFFMe5bncJScDG/nzSJbux2oPYVRdvWRsNuutWY06ypYcueBL6Ne5iU13
	37WgRpoy6GxozGUIdI6k7xZ5Ob/TBPk6DsYqiuZZsIhq18Vgex8pP7kgxFaBtglr+OSz
	8LPuqVWzU807iYoF42/Emxzo2cHnaKZ/qcZYCPg01fO6ioxqnlML7HgbO8jPtg+v0T5K
	R1LkzAcyjWqpupszsLUolQ+e/WgubGg91BgnlDo4Cc77n7yMAfDsA6B8CYQe28qRDMln
	czyQ==
X-Received: by 10.67.14.70 with SMTP id fe6mr27226175pad.195.1368413117865;
	Sun, 12 May 2013 19:45:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kr7sm12827487pab.23.2013.05.12.19.45.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 19:45:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 12:58:03 +1000
Message-Id: <1368413884-7667-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v2 0/1] xf86-video-modesetting: upgrade to 0.7.0
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
X-List-Received-Date: Mon, 13 May 2013 03:03:41 -0000

Tested on Intel Atom Desktop Board D2500HN with gma500 kernel module.

Jonathan Liu (1):
  xf86-video-modesetting: upgrade to 0.7.0

 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb | 8 --------
 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb

-- 
1.8.2.3



