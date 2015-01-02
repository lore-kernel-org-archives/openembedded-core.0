Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECBE7277A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jan 2015 21:25:15 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so24618259wgg.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jan 2015 13:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3zuxiO6ojocHhCunb4/tojez0RzWBLisaXP+QUXqp8Y=;
	b=gHr5gfoTZIWn6HZaZRyZ94X76e9s6EYuTzZ0d9J0JG7hHf2CEFmJLerWJufHq6TzRN
	wmicdkqi5Va9vd1BHeH9Vd+1n6hIGqNjvq59YYxpWYxPywWa3KpS4bqAc12LQHKo04FI
	cB4HGEeBOJ4/NYgGQDsK1D3C4wLSYxsYv73iwlQt6PV+wS16kQwJ4GSiN83j3GBQtcMz
	1riUf8wjIg1Js0H/Ez/2pZrtbk2F2vjlsofew+7dbNomTpx9FA4aTdtHlAKH/bnqTNAq
	yFzz3xA93Ze+jO4iQuV5wB3G+/83QpCZQRDGClafviOWT/GBKIeubgdrMvzcqmniXAe/
	QO8w==
X-Received: by 10.180.228.37 with SMTP id sf5mr1227239wic.35.1420233915646;
	Fri, 02 Jan 2015 13:25:15 -0800 (PST)
Received: from Saturn.local.all (212-41-114-243.adsl.solnet.ch.
	[212.41.114.243]) by mx.google.com with ESMTPSA id
	u18sm65897114wjq.42.2015.01.02.13.25.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jan 2015 13:25:15 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jan 2015 22:25:01 +0100
Message-Id: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [oe][PATCH 0/3] pcmanfm: update to 1.2.3
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
X-List-Received-Date: Fri, 02 Jan 2015 21:25:17 -0000

This updates pcmanfm and its supporting libraries libfm and menu-cache to
the latest version.

Tested with core-image-sato on a qemux86-64 machine and a custom image on
armv7 hardware.

Due to a circular dependency between menu-cache and libfm the menu-cache patch
requires the libfm patch.

This obsoletes the following two patches which have not (yet) been applied:
http://patchwork.openembedded.org/patch/79087/
http://patchwork.openembedded.org/patch/79089/


Max Krummenacher (3):
  libfm: update to 1.2.3
  menu-cache: update to 1.0.0
  pcmanfm: update to 1.2.3

 .../menu-cache/files/Fix-segfault.patch            | 31 -------------------
 .../menu-cache/menu-cache_0.4.1.bb                 | 21 -------------
 .../menu-cache/menu-cache_1.0.0.bb                 | 16 ++++++++++
 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb         | 33 --------------------
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         | 35 +++++++++++++++++++++
 .../libfm-1.1.2.2/fix-make-parallelism-issue.patch | 31 -------------------
 .../libfm-1.1.2.2/ignore_automake_warnings.patch   | 14 ---------
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    | 21 +++++++++++++
 meta/recipes-support/libfm/libfm_1.1.2.2.bb        | 25 ---------------
 meta/recipes-support/libfm/libfm_1.2.3.bb          | 36 ++++++++++++++++++++++
 10 files changed, 108 insertions(+), 155 deletions(-)
 delete mode 100644 meta/recipes-graphics/menu-cache/files/Fix-segfault.patch
 delete mode 100644 meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
 create mode 100644 meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
 delete mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
 create mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
 delete mode 100644 meta/recipes-support/libfm/libfm-1.1.2.2/fix-make-parallelism-issue.patch
 delete mode 100644 meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
 create mode 100644 meta/recipes-support/libfm/libfm-extra_1.2.3.bb
 delete mode 100644 meta/recipes-support/libfm/libfm_1.1.2.2.bb
 create mode 100644 meta/recipes-support/libfm/libfm_1.2.3.bb

-- 
1.8.4.5


