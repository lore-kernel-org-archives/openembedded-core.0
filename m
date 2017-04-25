Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 14B1B72F9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:48:54 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id u75so49298647qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7DdFla5c/LfxNzTgKPrB929p7NAxmnlY7/p4EUPJmnk=;
	b=SJ/+QalhcERr2ln1/Q0xxkFCrGOcdkssxO++IWZgkr4V/DPLdhFh/1VxIQylJxzoI9
	KkL0ED0SnP9WIDc0lS7e7rKWoAJIQzbxPoBsU2Ra31FltkTeaOjeAweWLbv9Q2bmYKir
	6mjR75nV/yXpMtvvftYZRBhPuRDwkahsZaGJRV7yv+GvbArro3eo5Ls+DlNUuT6jEqPf
	Z5TbiK/uwW4xwh14r8Zpho+r6j66YLr5EXyhQQzEkZdsz09s9RqigJgn5N46obYXDi5Q
	fbxsnVA9IOI1SRsmhxkepAc2kNUejtxO3igO336IDQepGaAGbcQ75QwYPHms3KsyQOX3
	wAiA==
X-Gm-Message-State: AN3rC/7mO0lJikye4McUjO+zELtbfwyHOCQjABd57KoG/lrpD5c5NgzT
	o5N9givBryYJAS3Y
X-Received: by 10.55.176.135 with SMTP id z129mr29833074qke.308.1493131735906; 
	Tue, 25 Apr 2017 07:48:55 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:48:55 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:33 -0400
Message-Id: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv4 0/7] bluez: upgrade and refactoring
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
X-List-Received-Date: Tue, 25 Apr 2017 14:48:55 -0000

V4:
* dropped the "rename readline 'config' option to 'client'" changes (reported by Ross Burton)
* make references to libasound-module-bluez depend on bluez4 only (reported by Ross burton)

V3:
* shell functions use tabs not spaces (reported by Khem Raj)

V2:
* upgrades to version 5.44
* renames variables and configure options to better reflect bluez options
* adds midi, cups and systemd as PACKAGECONFIG options
* removes references from files that are no longer part of bluez
* cleanups tabs/spaces usage

V1:
* https://patchwork.openembedded.org/patch/138995/

Regards,

Marc Ferland (7):
  bluez5: Upgrade 5.43 -> 5.44
  bluez5: remove libasound-module references
  bluez5: add PACKAGECONFIG option for midi
  bluez5: add PACKAGECONFIG option for systemd
  bluez5: add PACKAGECONFIG option for cups
  bluez5: do not install audio.conf
  bluez5: cleanup tabs and spaces

 meta/conf/distro/include/default-providers.inc     |  1 -
 meta/recipes-connectivity/bluez5/bluez5.inc        | 60 ++++++++++---------
 meta/recipes-connectivity/bluez5/bluez5_5.43.bb    | 55 -----------------
 meta/recipes-connectivity/bluez5/bluez5_5.44.bb    | 68 ++++++++++++++++++++++
 .../packagegroups/packagegroup-base.bb             |  2 +-
 5 files changed, 100 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.43.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.44.bb

-- 
2.7.4


