Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id EEFF8607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:03:32 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so1981160pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=XbfCE+ZlFjYdFiJH/zKYmPJBCMR46Ji5FGmlXnnk0AA=;
	b=e3c24C30UJ6MeV7XzzW8tqigCQqan5sT5EfGHWMebNEbzZZy7zMBLv3ngTKhMx8s5H
	65BF5E3W0t4mDgc8x61HJ3KObSfdUFaCG/mnC1GfPjCB/ygSmnAmX1B0LThlqL1jVJSa
	xtIbJWYc9FkN3EyI1dY+CIMWm/7IUvUdEyEiGys4CfBpnP0lS4T/Z9NcCvECoahjbgXf
	tnEnlelxVopSoVnq9QpTBjug8SB92kcZ4h1sfNyH2KRBoZ1H4J1F4sdNjPcBRt+3LU+c
	+saPcp60kzw4rMM3ntg5X0mmKoME0i9VnwMJz9n9SqmUpoCtYR1ae50zgt3cU7SeayHK
	immg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XbfCE+ZlFjYdFiJH/zKYmPJBCMR46Ji5FGmlXnnk0AA=;
	b=LtyE8t1Wg/6dNAyuyhKj945oXu+aVitGYLjkn4xPxXPhN8VS/PBQ/tpvgncgz5jObQ
	dTl97oRREWY9GzorogmG9rNn9OACd2GpKh+tQTE5Qpy9FFKgezJp2ufu1SkBpt481Xuj
	KgoaajjLRo/4eua/8km49IFQqblhnsTQIJ7SLlv0ZISclu6ipNWjaxkFUfahbRS4mJaD
	Xj3rLh1CmfPImmxadJ1H+olRVMfokanZWsbaQYynsfz0k0BnOSDb4smXF2HgbG+vQJZy
	CkIMNpyMOjhK80b153B0UBWdMbVal0qmlfZzk8T8dB7ieaGSHC0M4vDJcgwgeY+6A1R5
	757Q==
X-Gm-Message-State: AEkoouua1AQUQL8slCUxklrLgj9DoZCrHs7cOchT4JWxBRcbK6MsgAfRIKcX17K750DnYw==
X-Received: by 10.66.175.45 with SMTP id bx13mr50347601pac.23.1469635413305;
	Wed, 27 Jul 2016 09:03:33 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	c82sm10275116pfb.72.2016.07.27.09.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 09:03:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, liezhi.yang@windriver.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 09:03:13 -0700
Message-Id: <cover.1469634894.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/4] Jethro-next: QEMU security fixes
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
X-List-Received-Date: Wed, 27 Jul 2016 16:03:33 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider these patches for Jethro-next

The following changes since commit 7ed60009e2bcdd2380265ca95eb5de2328825eb5:

  libxml2: Security fix for CVE-2016-4448 (2016-07-09 15:47:51 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro-next

Armin Kuster (4):
  qemu: Security fix for CVE-2016-2858
  qemu: Security fix for CVE-2016-4001
  qemu: Security fix for CVE-2016-4020
  qemu: Security fix for CVE-2016-4037

 .../recipes-devtools/qemu/qemu/CVE-2016-2858.patch | 182 +++++++++++++++++++++
 .../qemu/qemu/CVE-2016-2858_pre_1.patch            |  99 +++++++++++
 .../qemu/qemu/CVE-2016-2858_pre_2.patch            | 137 ++++++++++++++++
 .../qemu/qemu/CVE-2016-2858_pre_3.patch            | 165 +++++++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4001.patch |  50 ++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4020.patch |  38 +++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4037.patch |  66 ++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   7 +
 8 files changed, 744 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4020.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4037.patch

-- 
2.3.5


