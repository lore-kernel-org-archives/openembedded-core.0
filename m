Return-Path: <net147@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id C84206103C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 05:49:57 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc8so6969645pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 22:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=otQrePevFJ/R6oNacuiJLlj9XE1JiX1Yhe8V6KAePDc=;
	b=aPnkFhCnJ8D2ZwL95auajiHmGBXnzsF4nov+G0g2YiIhzCUILJ/2Ijsmo/gFQ/cM5l
	G3RGiiBNM4Ts5sGf31+Cw6u/vwSxnIpYM1BzRs2lQiJCrSXvGQ16Jgsyc9lQQKACG3zh
	vRVbb9Fw4cU4gpQFB5GVf1t9juAGZEfqY5Tl0vOjcO2XIvlzjP8OcQOox/nfMHK5LCOI
	LZb3UhcqXrotxqxoBoU7J9VoKEea9kftWLjo6raSzwa53BocAg2/9w6uM3vIhZo/hbFS
	WC0gcffA3f0KZ/BAl5m/QhAtPko8bncqJMouLaZyk5u9ZCRIoA0XSi5hNN9OCJS/4Xma
	hM/Q==
X-Received: by 10.68.233.98 with SMTP id tv2mr32430940pbc.146.1372830598899;
	Tue, 02 Jul 2013 22:49:58 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	fp2sm30264026pbb.36.2013.07.02.22.49.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 22:49:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 16:04:19 +1000
Message-Id: <1372831460-6435-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH 0/1] xf86-video-modesetting: upgrade to 0.8.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2013 05:49:58 -0000

Tested on Intel Atom Desktop Board D2500HN with gma500 kernel module.

Jonathan Liu (1):
  xf86-video-modesetting: upgrade to 0.8.0

 ...ort-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch | 31 ----------------------
 .../xorg-driver/xf86-video-modesetting_0.7.0.bb    |  9 -------
 .../xorg-driver/xf86-video-modesetting_0.8.0.bb    |  7 +++++
 3 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb

-- 
1.8.3


