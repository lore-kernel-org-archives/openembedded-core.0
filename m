Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id CB13971B86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:26 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id p68so104578359qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6L7eDjuXBMfyjdWDWy7Nb9yUfKNhXM+mDX/DXT9lwWY=;
	b=l14sClXBFblFuMPVZ081jPLigiMHERRJ5ltpT/H+359hadvVoh5OSX+R338bk3lXZZ
	+lpGe0APhiOla7AvRhA1X38Eg3LFPhzjWv0dZqi+8z3ovSQqCSWyOS4AtoZ3IKmIGZOv
	5bDfZbPCeBYyF9LZo5CCxLSjS2pHfWqIP6Zr9DQ77OdF67aeJ4qVjS1h/87GIVVtdNOg
	wQ4l0cUb7uA6MM7xb0IAPv5ssUMoAb/W1k+AADI6V7xWpa+GucFyoVEy42QObaGs2RXq
	FteyT5i1XKU+Nm4fymkgXIHNA2vVP0fEaEh0p0hYQ4iU7G1EB6F4dXFDHtuEN3OxwGQt
	wLdQ==
X-Gm-Message-State: AN3rC/4LPu5TUQDifUIxdj74J0ERAOVzPoQH1eEdwiC46E19T2IhkqQ9
	phL2saZdzybY4U+d
X-Received: by 10.55.103.199 with SMTP id b190mr8366210qkc.90.1492436367637;
	Mon, 17 Apr 2017 06:39:27 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:27 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:50 -0400
Message-Id: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2 0/8] bluez: upgrade and refactoring
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
X-List-Received-Date: Mon, 17 Apr 2017 13:39:27 -0000

This patch series:

* upgrades to version 5.44
* renames variables and configure options to better reflect bluez options
* adds midi, cups and systemd as PACKAGECONFIG options
* removes references from files that are no longer part of bluez
* cleanups tabs/spaces usage

Please drop the changes from my previous patch:
https://patchwork.openembedded.org/patch/138995/

Regards,

Marc Ferland (8):
  bluez5: Upgrade 5.43 -> 5.44
  bluez5: remove libasound-module references
  bluez5: add PACKAGECONFIG option for midi
  bluez5: add PACKAGECONFIG option for systemd
  bluez5: add PACKAGECONFIG option for cups
  bluez5: do not install audio.conf
  bluez5: cleanup tabs and spaces
  bluez5: rename "readline" config option to "client"

 meta/recipes-connectivity/bluez5/bluez5.inc     | 92 +++++++++++++------------
 meta/recipes-connectivity/bluez5/bluez5_5.43.bb | 55 ---------------
 meta/recipes-connectivity/bluez5/bluez5_5.44.bb | 68 ++++++++++++++++++
 3 files changed, 115 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.43.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.44.bb

-- 
2.7.4


