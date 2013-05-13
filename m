Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UbieT-00048w-3B
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 04:38:18 +0200
Received: by mail-pb0-f50.google.com with SMTP id um15so4009191pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=/JQtY33jTzDD3sNtonE3Fsl+gSiqjod5ZAZOPfUbg9w=;
	b=dYVXFJocvZPQ8vKEtMnlvk1tPgk1ntk+RGqNxJ5NM5VtPl5Z+ENYIB4/tQWi6PCSct
	kQBrwQeUm07dpc6gCA/8sCEiDLWiEyaUVsVL5azS27lZkzI7YH/elVmCmXek3B9V7hmw
	Gnc3Ej3kUsUnB1GomzdNvgLRpkUAMEri1s5UgYSy6/qFwM7P+yeY2or5FZYoyxatCrbb
	kxGkbq809993S+uJCq0SFb6rQbqDeg3CRWDZ6mtNhyvZi2MIcXFe6Z9Q2JK0l1y95Dvt
	RDEpHhjUvjMY4aDQjIWysUl0g+OzQ8F1l+kuZuNnoWZrXXTCGkSaHws+JQeHBlxTPunq
	V3jA==
X-Received: by 10.66.166.107 with SMTP id zf11mr27931119pab.166.1368411603382; 
	Sun, 12 May 2013 19:20:03 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	az5sm11958966pbc.18.2013.05.12.19.20.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 19:20:02 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 12:32:48 +1000
Message-Id: <1368412369-6445-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH 0/1] xf86-video-modesetting: upgrade to 0.7.0
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
X-List-Received-Date: Mon, 13 May 2013 02:38:32 -0000
X-List-Received-Date: Mon, 13 May 2013 02:38:32 -0000

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



