Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 63D9060557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 07:52:18 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id bs8so3675120wib.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 23:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=4OIzHU7jNFiaqTbbZ7vheYYC6DfuBb/JUNCxhGfyKdA=;
	b=YQwEXoJyuLARYc4MJseiSHBOTTAW3weigA5DZwX5CO3RQCDrZpy5bUEl82b3jXe/6u
	g09OF928ScsTcAY/HI6NZE+4zR9K9erNxBaA74UDX7sMVHUnGwq5pV7AQf7P+5E4Bi+Z
	dJEJUoJKHMX2Aa+E4zLgU3jWuvg3nKcNepuq23txYrjA4sAt+b0Ix3zoI/snwoteEGL2
	33fS+apwLB4taoAqYSPYKW1CXqRWK/3Kvk3BLaVu+VFHd8SuenV9U3r8Wp9y51TjtbXW
	d3wrTEIgN5ewpy3c6vSwlCY6MLZyuyiWnBZb57DZymHDzLdahekytYfV0hNlbjSvr+k0
	SgkA==
X-Received: by 10.194.76.202 with SMTP id m10mr13671794wjw.42.1415346738515;
	Thu, 06 Nov 2014 23:52:18 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id md11sm982653wic.15.2014.11.06.23.52.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Nov 2014 23:52:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 08:52:07 +0100
Message-Id: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] update xserver-xorg & midori
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
X-List-Received-Date: Fri, 07 Nov 2014 07:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I have these in my repos & running for a while.

Andreas Müller (2):
  midori: update to 0.5.8
  xserver-xorg: update to 1.16.1

 .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
 .../xserver-xorg/mips64-compiler.patch             | 29 ----------
 .../xorg-xserver/xserver-xorg/present-module.patch | 66 ----------------------
 ...erver-xorg_1.15.1.bb => xserver-xorg_1.16.1.bb} |  9 +--
 meta/recipes-sato/midori/midori_0.5.5.bb           | 47 ---------------
 meta/recipes-sato/midori/midori_0.5.8.bb           | 31 ++++++++++
 6 files changed, 34 insertions(+), 170 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb => xserver-xorg_1.16.1.bb} (75%)
 delete mode 100644 meta/recipes-sato/midori/midori_0.5.5.bb
 create mode 100644 meta/recipes-sato/midori/midori_0.5.8.bb

-- 
1.8.3.1


