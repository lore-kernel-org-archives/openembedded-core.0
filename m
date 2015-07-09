Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 44BDE6E648
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 17:52:12 +0000 (UTC)
Received: by iggp10 with SMTP id p10so19287291igg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C0T/YjUkfQddsXrfEA/WXEP3cLUC6os54tmesvuHRik=;
	b=UzVoIntlvFlFR+GYvnOPAQagZflSBuVhe2DMojaoHvuoHwgvFjBexzdFMXggLgi2fO
	OL9U3kTjc+6jfo8FGPKNitTSU9yo69ujlLOvwaJJ0hD2JAYJUpz2YKp4yNUDjYRO3AHx
	IqClmn9x5N5bEt+GxP6SXvFMgmWVAm9DPhI1W1xQpyYbfwaudWZMbFTtZD9glcuI8JaL
	8SsRFpYcN6FfsmfSZ+nbc+jUZL+tXwqYSU3PtIDZN1wvOs3+kmWNFpe8mPDfmUwlCkMF
	l1P8xkLw1N9QzB8WfncIpSIS7LRrEo0DEyokw3Hj+1D9UWFwcBUqJTMib/RkAbJWeujQ
	3r2w==
X-Received: by 10.50.138.73 with SMTP id qo9mr1518223igb.64.1436464332345;
	Thu, 09 Jul 2015 10:52:12 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id d3sm4739295igx.5.2015.07.09.10.52.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jul 2015 10:52:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:51:59 -0700
Message-Id: <cover.1436464186.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] GCC 4.9 upgrade
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
X-List-Received-Date: Thu, 09 Jul 2015 17:52:14 -0000

Upgrade gcc4 to 4.9.3
Backport patches to gcc5 to fix warning related diagnostics bugs
runqemu patch required to run weston images otherwise mouse does
not work

Khem Raj (3):
  gcc-4.9: Upgrade to 4.9.3
  gcc-5: Backport patches for -Wno-narrowing behaviour fixes
  runqemu-internal: Replace wacom-tablet with tablet for usbdevice

 meta/recipes-devtools/gcc/gcc-4.9.inc              | 11 ++-
 ...BS_DIR-replacement-instead-of-hardcoding.patch} |  0
 ...racking.c-backport-from-gcc-trunk-r212178.patch | 39 ----------
 meta/recipes-devtools/gcc/gcc-5.1.inc              |  8 +-
 .../gcc/gcc-5.1/backport/0001-PR65801.patch        | 89 ++++++++++++++++++++++
 .../gcc/gcc-5.1/backport/0002-PR65858.patch        | 63 +++++++++++++++
 .../gcc/gcc-5.1/backport/0003-PR66007.patch        | 73 ++++++++++++++++++
 scripts/runqemu-internal                           |  4 +-
 8 files changed, 239 insertions(+), 48 deletions(-)
 rename meta/recipes-devtools/gcc/gcc-4.9/{0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch => 0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch

-- 
2.1.4


