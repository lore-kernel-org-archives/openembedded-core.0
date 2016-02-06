Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 82E206FF3D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 15:54:50 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yy13so3767007pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 07:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=93VLYY08x7XNqZqRxsZGUBOIhf73DRyliDT6o10Om1g=;
	b=ipeRF+Bz8zirNraW6stPwQs/wlIVpINq1Jf/OmvzTnNFxSdEbU5RAYHuvFpGk6O1u3
	0O/pSgOpZgt5aRJx+58ytabggby4LgoYnZ4pHT5qUmUuIE0XFeB9o0SvVS2xhgL11kAq
	5AKMU4WJAXBobpI3IcWpsaIaOxrpiJTjfRw/KHP4LE1qTzP4Z+7r07/U4aA9HBR61gwm
	Ik22ayaRnGElm4ah8sej3fAP1c1UBMgBEVM18NIgULOWY0HjpkNqusebKET22l+KSumh
	zGxP9PNI7P6O83nQAyOht/DH7wISytBRKexBFt/BBeAQja9DdBgWnvjeGTaQJZgWcc7H
	Oc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=93VLYY08x7XNqZqRxsZGUBOIhf73DRyliDT6o10Om1g=;
	b=MsTcpE7uQRhKjHMPY17xmewCDx8SNG2rRy5ouERQ3VHSHjglGzPWX6n5GICRLyqZm5
	cUWv4zbY5ySJEoNbEzH08u6XXkdtGurjF5E7lp1cgMEaaep+IVChgfdeS9ZKG5Rikqqa
	hHD6kq4yKYWKKoTZx7XArqd+EolKcMCJeItSjedCnHBAyjyy2/dQECy3ciS5sxXaqCsn
	eeAAP5jct3PM662nTjxHap5T6kYfEYAjnzAnUnfFbhs5uM6631DJqRWRixF1/tnNnZrF
	3sORRT1TU87OCjblPLu09ctCc7Tof7smlnUMcD7Dl/pSHb2LMAqXbbWPsxz/bspNpJ4C
	fkuw==
X-Gm-Message-State: AG10YOSUa/bJZD+f5cp6bg7F9bHwqjXdSnplMZSyR/lRNHTfz+Ihzbj/2snntqTZvg/zbA==
X-Received: by 10.66.142.168 with SMTP id rx8mr28453449pab.16.1454774091015;
	Sat, 06 Feb 2016 07:54:51 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ey2sm32233096pab.2.2016.02.06.07.54.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 07:54:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	joshua.g.lock@intel.com
Date: Sat,  6 Feb 2016 07:54:32 -0800
Message-Id: <cover.1454773801.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/4][fido] Fido security pull request
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
X-List-Received-Date: Sat, 06 Feb 2016 15:54:50 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these changes for the next fido update
The following changes since commit 9845a542a76156adb5aef6fd33ad5bc5777acf64:

  openssh: CVE-2016-077x (2016-01-20 17:08:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/fido_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fido_cve_fixes

Armin Kuster (4):
  glibc: CVE-2015-8777
  glibc: CVE-2015-8779
  glibc: CVE-2015-9761
  glibc: CVE-2015-8776

 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch  |  155 +++
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch  |  122 +++
 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch  |  262 +++++
 .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039 ++++++++++++++++++++
 .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  388 ++++++++
 meta/recipes-core/glibc/glibc_2.21.bb              |    5 +
 6 files changed, 1971 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch

-- 
2.3.5


