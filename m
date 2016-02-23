Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id BFB1D77369
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 15:59:21 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id c10so118158613pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=01xlCg0pe1rbkcM1+VVeCop76Fg9n6zEu42QFtt+H0w=;
	b=Hv1b70iBfTVpGFFGwx0+P5JM2d4sY9cBCy9CaNhd6VB7mCsAz9G7qQh8I8TUbRrkRM
	xUZ44Pl66+W09PsWWiv//+Ma0MQNp7Ah5DH/9qJR+Ar1pIAJzXgMJsqwT+bQuBEV8J6Q
	8M6S5Xc+hLadShzLX1y24zNmSwX1wdd3ZFl4XgQ83dMVUn9xAAh+TYmT9G89BZcXEYwJ
	XhREOCmrkWnOMd7o0zan+6E3F/fCRLiEFcZGmAo/TDfQEwX8ul7PVZCjoruDJ8MzZe9k
	jFRWEVRPrr7lEQTXspH4Zy7qJvHfnO2yHrTHhOqUxN4tepNZIEISaO7Fwe68cBgdE2Bv
	IHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=01xlCg0pe1rbkcM1+VVeCop76Fg9n6zEu42QFtt+H0w=;
	b=bK34IVRQ1YPBgUhgIi6jQwFHvG94cE72/AXJ0AAsYemWUf1k+KeJ60C9dmAabygj/T
	b48vd6HWH2TmgvWnDmmEP65rFKdmyRsV6QImHJ/I5wX5UVHPzDNl/ZOOUQW7m4J7JILR
	FPhd7HTRgGqo8DLvRK4JrK5L04eWGPRomQ/jfzDKbS/ElpNDdL/1pSSIaL4npVpF5f6j
	pFUaGLH8vKNxeOlkbT3FU0FaSucqBanvp5icE836f2ilUWj/nOo0Aktj2Z/HpD6iRytQ
	AreeXr3syoKZ20MrM8DCXzgI+mgNhYlB1RIV2f5P+G7vtoGZ1rOfpEsEJEJvxKt411EZ
	6TSw==
X-Gm-Message-State: AG10YOR1yCZJnf6upPHsZAFBVYoYmlk3I5+lEnGQGUxPrsOAIAUiKARrhUVcMejbycVuKg==
X-Received: by 10.98.0.194 with SMTP id 185mr47070979pfa.139.1456243162814;
	Tue, 23 Feb 2016 07:59:22 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q85sm45108605pfq.81.2016.02.23.07.59.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Feb 2016 07:59:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster@mvista.com
Date: Tue, 23 Feb 2016 07:58:58 -0800
Message-Id: <cover.1456242658.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [fido][PATCH 0/7] fido Security fixes pull request
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
X-List-Received-Date: Tue, 23 Feb 2016 15:59:25 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider these for the next fido 

This is to meet our obligation for Yocto compatibility

The following changes since commit 06d9c894636352a6c93711c7284d02b0c794a527:

  libbsd: Security fix CVE-2016-2090 (2016-02-18 11:03:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/fido_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fido_cve_fixes

Armin Kuster (7):
  qemu: Security fix CVE-2016-2198
  foomatic-filters: Security fix CVE-2015-8560
  foomatic-filters: Security fixes CVE-2015-8327
  tiff: Security fix CVE-2015-8781
  tiff: Security fix CVE-2015-8784
  librsvg: Security fix CVE-2015-7558
  gdk-pixbuf: Security fix CVE-2015-7674

 .../recipes-devtools/qemu/qemu/CVE-2016-2198.patch |  45 ++++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |   1 +
 .../foomatic-filters-4.0.17/CVE-2015-8327.patch    |  23 +++
 .../foomatic-filters-4.0.17/CVE-2015-8560.patch    |  23 +++
 .../foomatic/foomatic-filters_4.0.17.bb            |   4 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      |  39 ++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   1 +
 .../librsvg/librsvg/CVE-2015-7558_1.patch          | 139 +++++++++++++
 .../librsvg/librsvg/CVE-2015-7558_2.patch          | 230 +++++++++++++++++++++
 .../librsvg/librsvg/CVE-2015-7558_3.patch          | 223 ++++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.6.bb       |   6 +-
 .../libtiff/files/CVE-2015-8781.patch              | 196 ++++++++++++++++++
 .../libtiff/files/CVE-2015-8784.patch              |  73 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   5 +-
 14 files changed, 1006 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch

-- 
2.3.5


