Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 794B560191
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:26 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id a103so191100894ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CWnVyB4vl2Zzwlwae7vOzNRswO37qP+n9XJ96KheTNs=;
	b=Dc5P3Z17n1KKTaV/OvCXLQZWifgtzMIsQVp6uwFoIflzMmrg5oI5oVU+Sld3IO4VcW
	qFPZ9ACLqwxS89I+wCFgzeVf0taILqnzn08sO+co+rueXfti6jarokqKKrkyZStUfyMJ
	BUUvk5agFY/Lr1AYQRxaiV3WbGrj9yFtOD6f9lyH8q7sDj17PFidpnbAgQXbL5wDCUqW
	TKJENBSy3ugIfXrH6bdkzmkt1nipWaLeivoulg8KO/DwMxGYmhGb3unCY7vlVkRu+NHm
	IC5mUBp+Bl1y1tYQq03KGVYK8osCRhoal0k/9/p+NVKYhCTUD9UYp8Hu8davvDQpiqo8
	Vckw==
X-Gm-Message-State: AN3rC/74HfIuJRjK6GAVAo/qz3leoD8Gkf3dDTuDBVEQj8vGB37S9ldL
	FqY3FUI1gTzzZmh6
X-Received: by 10.36.138.65 with SMTP id v62mr14605751itd.108.1492521626672;
	Tue, 18 Apr 2017 06:20:26 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:25 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:01 -0400
Message-Id: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv3 0/8] bluez: upgrade and refactoring
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:27 -0000

V3:
* shell functions use tabs not spaces (as pointed by Khem Raj)

V2:
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

 meta/recipes-connectivity/bluez5/bluez5.inc     | 66 ++++++++++++------------
 meta/recipes-connectivity/bluez5/bluez5_5.43.bb | 55 --------------------
 meta/recipes-connectivity/bluez5/bluez5_5.44.bb | 68 +++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.43.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.44.bb

-- 
2.7.4


