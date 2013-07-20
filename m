Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 13F5461663
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:04 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so2961155eaj.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fJLns2wK9nQgxle+F/CSh+fLLF8/Uq4TVhbcHIf1uXA=;
	b=xb+te7kTd/eYdB6jMSLkeTkgpRyPfqVjWdkMyIgGb1O+9vB1ugKOOZtcmDoQroPPZ3
	amYmOR+c1HlRY7RCyOrMsXVkUcvzDdVmAwvgNkWbDpuaOrndES68VlWTEDiUYf8q/1jM
	Rp4lFeYiwVxxAwYTjcjdiorB9KACdg8uoXWOzyY4lNnRIRxhwAC7DKPJaRp6aUDp7VCW
	hheOVkqfPSAvbWn6mXbL21KJjY9o9CUyjHz4hJk4zURczBZeRrS3jqN95n7S0wlBqTgI
	95RkPHNaQbyUS/tnXs0hV3k61C2GLjhAKnEc24PE8/4G4vPhvdOj0U89itZ6YvhFOrqg
	Pu7A==
X-Received: by 10.15.31.9 with SMTP id x9mr20426953eeu.103.1374332224806;
	Sat, 20 Jul 2013 07:57:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm35847645eed.9.2013.07.20.07.57.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:21 +0200
Message-Id: <cover.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/8] autodetected dependencies
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:05 -0000

The following changes since commit 8fc6904fe97438478119db6cd23b7b4eb33b50aa:

  curl: add upstream status to patch (2013-07-18 12:21:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/deps

Martin Jansa (8):
  test-dependencies: add simple script to detect missing or autoenabled
    dependencies
  gst-plugins-good: add PACKAGECONFIG for jack
  gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
  pulseaudio: add PACKAGECONFIG for jack
  subversion: add PACKAGECONFIG for sasl
  gst-plugins-bad: add few more PACKAGECONFIGs
  cups: add PACKAGECONFIG for avahi
  mesa: add Upstream-Status

 .../subversion/subversion_1.6.15.bb                |   2 +
 .../subversion/subversion_1.7.10.bb                |   2 +
 meta/recipes-extended/cups/cups16.inc              |   3 +
 ...ate-NativeDisplayType-depending-on-config.patch |   3 +
 ...ate-NativeDisplayType-depending-on-config.patch |   3 +
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   8 +
 .../gstreamer/gst-plugins-good_0.10.31.bb          |   1 +
 .../gstreamer/gst-plugins-ugly_0.10.19.bb          |   5 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   1 +
 scripts/test-dependencies.sh                       | 256 +++++++++++++++++++++
 10 files changed, 284 insertions(+)
 create mode 100755 scripts/test-dependencies.sh

-- 
1.8.3.2


