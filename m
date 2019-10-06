Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 89CFA605BE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 15:24:11 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w8so5616481plq.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AlVANYp6wvOZBR83NpBo1zZfCW2inmpaGvvrSExd6+8=;
	b=aTdNO8E1IN1e+bbXgKsA+N/IY/p+048KcbUEl+vl90YNU3FFnAYwNFNwNMnzTvO+dd
	7yntUGLEBcGBxdi3mpysGIKCXAkwYkqEgRoOUUwsHdx2vzS1qsxkU7bU1edni0gQZBAm
	fvUU7L7DQuzYTnfXRup3r7sKc6aJZ4UalVP0SGYJ6NX6wxl6XDGwSNUQCuBqZ7LLoGFN
	jiO6S/+asYjw27lnouymNlCttDfY2CwqanUkJc2WqZkwMijF4eo0TOc0xyom7j2ZuS4H
	EWkTI1Kc3gcfn0io6c81k4HeU0Iwc9uxIqeAx9gxzXWZ/gmCD8SKEIUUt32Qv9LW3Mn2
	ZKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AlVANYp6wvOZBR83NpBo1zZfCW2inmpaGvvrSExd6+8=;
	b=GM9vbWOSlJzSz7uXig1k3Egsr+p34Ey4GvSw9tU9tZC+I3zxJU7oR+SFQ/i5BC5ls5
	M5enLS3A4KUHO7ijMHRHGa6TB34LCqIU5IsvH0VUD08SuEWWH0TEm1mZxhcKSc1DkBi6
	0t9OwxzEljF4E6ZO6wcb+aelVNLeFCn0DZJkFxn/d5B7sb2cSQ3p78YCqdT5moxcfk7c
	1wU24kRQO1DZZRC4Zyt6hUoXksuo/G49aJV+x0KpsnAcVlUl27FX5B5+z7p+l10rr75v
	YWCMEU3wQauRGB9dnKglrFIicgSp8iDBpPdHrGarFcDULjmulVVGdk0j7mAmkcO/7Y6F
	n8Gw==
X-Gm-Message-State: APjAAAX0eZmjbBr8sjwQ131twtWDINKkbPr/ozbm/ehxqQ9QRPf0zzMb
	4xItUAlkX9FfoDCArgjyHKVWJXtpVIM=
X-Google-Smtp-Source: APXvYqwO40536IPVHInkYHLQHUictX3PUwRP3z5RQ5K/DICAHBShtJyb4mRhska2smEX2RoRfH09zg==
X-Received: by 2002:a17:902:848c:: with SMTP id
	c12mr23448202plo.120.1570375452388; 
	Sun, 06 Oct 2019 08:24:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	v1sm10586425pjd.22.2019.10.06.08.24.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Oct 2019 08:24:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 08:24:00 -0700
Message-Id: <cover.1570375187.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior] 0/8] Patch review
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
X-List-Received-Date: Sun, 06 Oct 2019 15:24:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Next series to review.

Please comment by Monday.
All these have already been sent to the list so short review period.


The following changes since commit acc0f4a6a99fe9367e57a5c2a4f995b6f4db4a9f:

  runqemu: Add support for kvm on aarch64 (2019-10-01 10:48:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Adrian Bunk (1):
  json-c: Don't --enable-rdrand

Alexander Kanavin (1):
  python: update to 3.7.3

Andrii Bordunov via Openembedded-core (1):
  classes/image-live.bbclass: Don't hardcode cpio.gz

Anuj Mittal (1):
  python3: upgrade 3.7.3 -> 3.7.4

Armin Kuster (2):
  qemu: Fix CVE-2019-8934
  qemu: fix build issue on new hosts with glibc 2.30

Dan Tran (1):
  unzip: Fix CVE-2019-13232

Jan Klare (1):
  systemd: update SRCREV for systemd v241-stable

 meta/classes/image-live.bbclass                    |   2 +-
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 meta/recipes-devtools/json-c/json-c_0.13.1.bb      |   2 -
 ...ysconfig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
 ...2-distutils-prefix-is-inside-staging-area.patch |   2 +-
 .../python/python3/CVE-2018-20852.patch            | 124 -------
 .../python/python3/CVE-2019-9636.patch             | 154 ---------
 .../python/python3/CVE-2019-9740.patch             | 151 ---------
 .../python/{python3_3.7.2.bb => python3_3.7.4.bb}  |   9 +-
 meta/recipes-devtools/qemu/qemu.inc                |   3 +
 ...nux-user-assume-__NR_gettid-always-exists.patch |  49 +++
 ...rename-gettid-to-sys_gettid-to-avoid-clas.patch |  95 ++++++
 .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 +++++++++++++
 .../unzip/unzip/CVE-2019-13232_p1.patch            |  33 ++
 .../unzip/unzip/CVE-2019-13232_p2.patch            | 356 +++++++++++++++++++++
 .../unzip/unzip/CVE-2019-13232_p3.patch            | 121 +++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   3 +
 17 files changed, 882 insertions(+), 441 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch
 rename meta/recipes-devtools/python/{python3_3.7.2.bb => python3_3.7.4.bb} (97%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch

-- 
2.7.4


