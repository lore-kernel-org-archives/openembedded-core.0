Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DCDAF65EB1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:18:26 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so2019892wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 07:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8aDOa2KwpYEdQRPn1jepf3uQPwdEbXEszZ4N7g6sfeA=;
	b=ZPayl31QxgKrg5TWCuX1tv2YA4Dgo2YS69EfsfNuRMBNSPskFRB6NC7pSPnPufpzaP
	0l8gDiDWVWncklJv73kjNdYG2UKY5ZI+UgdbPjerSoQaLvmkS+C9pJ05r6wAgqV38zqw
	RYRSmmzB4scSRrdX2V0VUwfQxiv89lQwlas9oh6WcSghr0t0GDMPEpdwbg6rNqi5HH1C
	i3KRf80immvaCevqpNWsZdXCTjb+w9Wt92SzFEACcRPFTUJta2/MFrL+5YS9Je6vskK+
	HEsk6ohKNpltC1OCc+tw2wPL9muzxRzpLgvsFQX44NUbuow4ivEdndq17nHpGpI1QRes
	zNwQ==
X-Gm-Message-State: ALoCoQluofGLGWqOBHAjgjH4CGxdeZGJTzZR9S3Ryg2wLWAL0j1Pbs7kZ6JZEdo/xAYXSLhFdJb3
X-Received: by 10.180.126.8 with SMTP id mu8mr29636337wib.10.1402323506817;
	Mon, 09 Jun 2014 07:18:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id g9sm25200969wja.39.2014.06.09.07.18.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 07:18:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 15:18:16 +0100
Message-Id: <cover.1402323355.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] Mesa and DRI fixes
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
X-List-Received-Date: Mon, 09 Jun 2014 14:18:34 -0000

Hi,

This series is mostly based on Valentin's Mesa upgrade with some tweaks to the
Python, a build fix, and changing DRI3 to be disabled rather than enabled.  I
spoke to a few colleagues who work on the graphics system and the conclusion was
that DRI3 isn't ready to replace DRI2 just yet.

Ross

The following changes since commit 66d5be204fd339cc84a0ae92d3923a8c1e6f1389:

  bitbake: bitbake: show wildcard appends for bitbake-layers (2014-06-06 10:33:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to 521c60cab274b7833562f18907efe4bf51bd5d42:

  xorg-xserver: disable DRI3 by default (2014-06-09 13:49:38 +0100)

----------------------------------------------------------------
Ross Burton (2):
      mesa: add build-dependency on libxml2-native
      xorg-xserver: disable DRI3 by default

Valentin Popa (1):
      mesa: upgrade to 10.1.3

 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |    0
 meta/recipes-graphics/mesa/mesa.inc                |   30 +++++++++++++-------
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |    4 +--
 meta/recipes-graphics/mesa/mesa_git.bb             |    4 +--
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 5 files changed, 24 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)

Ross Burton (2):
  mesa: add build-dependency on libxml2-native
  xorg-xserver: disable DRI3 by default

Valentin Popa (1):
  mesa: upgrade to 10.1.3

 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |    0
 meta/recipes-graphics/mesa/mesa.inc                |   30 +++++++++++++-------
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |    4 +--
 meta/recipes-graphics/mesa/mesa_git.bb             |    4 +--
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 5 files changed, 24 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)

-- 
1.7.10.4


