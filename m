Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ubpwy-0005vV-JL
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 12:26:11 +0200
Received: by mail-ea0-f176.google.com with SMTP id h14so3600768eak.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=YVAFh4K19s00L5B09bDT1TY6IzKWfPkpKIRlZZ4Y8t8=;
	b=sSjG55AHgIbhhexcCJy0SlnAqDoRdHpct88U0k/OwpW8A96LW98phYj/+gM/n9/X7a
	MkbRuRbmws+2D3jeopW9YVprf5+JaqBS+S+o4QYjr/FvxdHcCCECdKG+6F/57n6riWiw
	Ulh4oi/LOnNziNeO/XxQjQ58ZIzK53PWCCczJdSllFQ439Fz0VF9zB3dBFYG0k5iZiMY
	/Sng9EHAV+t0taJin04s93pqS6qll6AWqZUpB4UmoLsWtq7Rx6TN8Ol6n5fESUDjGUS6
	nwqBC15JWSapJak6XD/izbVMo0EMn3TQr4wbsLatscVY8C/dAOTwn27iDbPlQdt2jlcK
	DTUQ==
X-Received: by 10.15.73.197 with SMTP id h45mr36396737eey.46.1368439659315;
	Mon, 13 May 2013 03:07:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm10824218eeg.2.2013.05.13.03.07.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 03:07:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 12:07:43 +0200
Message-Id: <1368439663-26865-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] bitbake.conf: define empty EXTRA_IMAGE_FEATURES before using them
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
X-List-Received-Date: Mon, 13 May 2013 10:26:21 -0000

* fixes build without EXTRA_IMAGE_FEATURES defined:
  ERROR: '${EXTRA_IMAGE_FEATURES}' in IMAGE_FEATURES is not a valid
  image feature. Valid features: dbg-pkgs ....

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index caf7d04..b7260d1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -729,6 +729,8 @@ MACHINE_EXTRA_RDEPENDS ?= ""
 MACHINE_EXTRA_RRECOMMENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
+
+EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit"
-- 
1.8.2.1



