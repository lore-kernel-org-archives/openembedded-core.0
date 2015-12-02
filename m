Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF3E60132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 16:55:14 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so223318861wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QqzLxStrXnCEWcaMRAKk0Z9OFb7V69G9Ln/buqZ08wE=;
	b=1rb7mxWocLN5FmmGQp+70TF3FG+ifUtkYFFTkoAOnPQArnDsO/4/Vtx0N/P5RMZlv9
	IPwiVr4YTQU4Uc8HESBsLACwJcYYAld+oVqAmq9hnKtiQ1IZDhNjTV6aVyz59upbhFrx
	pIqKIaDJq512QkC1ah1xefj6KK3AzZbVsplvKv62XvYzHNFa/0rCRn4PfUmND3dCtbc7
	X7x9Kjmou04CtHaRCb/ktIR5Uz3/cL3aBAak2iuQaS1Kt/5kBaD/MhfCMNCMfROnmeoW
	4Sn7gQWP5lx657nwZyYxXQB1mq8S+QcdoQrtFvRcwvxcOqy2VwJkxrzm0Ukmq1Lju1ny
	hToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QqzLxStrXnCEWcaMRAKk0Z9OFb7V69G9Ln/buqZ08wE=;
	b=NYzccFRQg1Uo9toiEkPXzTzN+HqIhJsWZ0FnS8k53WSuBVFsXZO71byUGkS/25vFpB
	gh2vLAfud7NjTMkp2yApKgY3OtlpoyexGWXwDirgiOZyt7DQrhQ+rGpVMY5qRe6me7h/
	rdx+KHv/eEEExgUSUgeJUxupMw/AszjxNjaY5MFnMY1gsE1JMFR00bRjSBqK3dtTIsNU
	gfRfnv8k4h+i+ZkStmLOJkSetwV0CscNBfWqdECSGIHO+GdGlv4NzSuieuVTWXQrnZ+x
	3edJRCfiNHm84070KcE+Puokdz8MqKEMzRI3e3cFkgJnJSI0CYM3K9iajq9Rx27CMwdl
	fASQ==
X-Gm-Message-State: ALoCoQkIz4Rp3rtT03vYzB5dWZi9g+R66vsDwPcBNxuOBdU6KWh8OlF61ESB3Y+drZBpVR4WmPDy
X-Received: by 10.28.171.134 with SMTP id u128mr47316441wme.22.1449075315174; 
	Wed, 02 Dec 2015 08:55:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n127sm31540389wmf.12.2015.12.02.08.55.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 08:55:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 16:55:08 +0000
Message-Id: <cover.1449075091.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Enable libsdl-native
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
X-List-Received-Date: Wed, 02 Dec 2015 16:55:17 -0000

Hi,

This is part 1 of the intrusive changes to master to change qemu-native from
linking to the host libsdl to build a libsdl-native.  This part isn't actually
intrusive and just enables libsdl-native, with a fix to the PACKAGECONFIG
handling to make it work.

Ross

The following changes since commit 698c74c373110ed081a7586e21d4a27b8b44c89b:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:32:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/sdl

for you to fetch changes up to 58ec5aaf4b7988eb0feda9961ab4b6f7bd8361c9:

  libsdl: expand PACKAGECONFIG and enable native builds (2015-12-02 14:58:59 +0000)

----------------------------------------------------------------
Ross Burton (2):
      base: check for existing prefix when expanding names in PACKAGECONFIG
      libsdl: expand PACKAGECONFIG and enable native builds

 meta/classes/base.bbclass                     |  5 +++-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 35 ++++++++++++++-------------
 2 files changed, 22 insertions(+), 18 deletions(-)

Ross Burton (2):
  base: check for existing prefix when expanding names in PACKAGECONFIG
  libsdl: expand PACKAGECONFIG and enable native builds

 meta/classes/base.bbclass                     |  5 +++-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 35 ++++++++++++++-------------
 2 files changed, 22 insertions(+), 18 deletions(-)

-- 
2.1.4


