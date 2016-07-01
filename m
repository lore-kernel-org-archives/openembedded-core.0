Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id B098F60111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 13:53:51 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id g127so18301037ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=p1RwNI0VoR3n0yrSbk4T5+xzS4RQ3jalI2mSGUj9W4E=;
	b=PlhyQSRfjdMTn5ioiNZ8ES94l8940faTwdpxz+jr1cpsfb9fZP0MaScsTBa6jVwA5X
	gzZa8mR/w84n9yWv4ETjY6zSyrwaU1dt7uM2tKiAWtpBzFY3rGcDLmIJwf6hzzD0cqs5
	I5+yRPHJSyogLiRsBJoAagnG3+Xf7x1HFsAc3cPbg7RhKy4pfSdtTFPzevBGiW3jaU+o
	g5ZLUpqtzevMkCQZ66I8KdUhM7e8d6EFRx9q9BLfu7ECGNt2xQUUgy6IcS7CLsZbjzsv
	Es1P9hejh9yigDTNPfhtFy4zWC6aCB1VLyvtoV2WkOjdX9dFnfJxT+l+9tlByNpU7MLh
	Lwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p1RwNI0VoR3n0yrSbk4T5+xzS4RQ3jalI2mSGUj9W4E=;
	b=NVmKlIsH5LKqqkvPsvOnyRyZK9AhPJljQbDdZuSF30+hie5n9fWVzWdMjsy11APD/X
	KfC/+Ztx6Bsi1Z9nNA+ii1tcNKXNWT46G3ObrJUBfYs4mNr3suwuzOuX07ROPLjPdW/3
	KLPJS35nNC0HbFM1vJut038wZxyvWM+g6e+bbMUW6kiCcQA4dkOC3Xdycdd1skibGsOQ
	9WJngGxaSUTayzxHpcJ97i1nA2ErKhKll9/7YGykg/nH6VyfFshRRiR2A91SRZZk7wjc
	QOnf6cyApFyLW2d/rQME6KAceWh5eZLSWOWbdcq3wVEBaWCp8a6RuWZKcOSmt24N5plE
	zV4A==
X-Gm-Message-State: ALyK8tLahOT0eAiDNezZleBR4uYL/aPcULVLA2y58zuwkJ0ONUnSJCEr5YmINadnTD6M1qhv
X-Received: by 10.36.135.134 with SMTP id f128mr20385693ite.23.1467381231861; 
	Fri, 01 Jul 2016 06:53:51 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56DC4.dip0.t-ipconnect.de.
	[87.165.109.196]) by smtp.gmail.com with ESMTPSA id
	v138sm10294130ita.13.2016.07.01.06.53.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 06:53:51 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 15:53:45 +0200
Message-Id: <cover.1467378176.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Igor Stoppa <igor.stoppa@intel.com>
Subject: [PATCH 0/2] initramfs-framework enhancements
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
X-List-Received-Date: Fri, 01 Jul 2016 13:53:51 -0000

These are two enhancements that we've used for a while now in Ostro OS:
- a retry loop that we found necessary for some slow USB hardware
- finding the root partition by partition UUID (only filesystem UUID
  supported before)

The following changes since commit 646c366c2566bd8dd6f73681cea9f5b021589a56:

  gst-player: upgrade to latest HEAD (2016-06-27 14:08:37 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core initramfs-framework
  https://github.com/pohly/openembedded-core/tree/initramfs-framework

Igor Stoppa (1):
  meta-ostro-fixes: initramfs-framework: Add support for PartUUIDs

Patrick Ohly (1):
  meta-ostro-fixes: initramfs-framework: add retry loop for slow boot
    devices (like USB)

 .../initrdscripts/initramfs-framework/finish       | 33 ------------
 .../initrdscripts/initramfs-framework/rootfs       | 62 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  4 +-
 3 files changed, 65 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/rootfs

-- 
2.1.4


