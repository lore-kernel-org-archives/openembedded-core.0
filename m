Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id C64397653B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 01:48:38 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ho8so2959948pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 17:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=AAuZ7Qgaer70ILcwZf6NUxlnyJYsA/8Q8x37hrdrwts=;
	b=uN5zbqL/+lOENf993XJBTD46InxLgH6cw2HvefcGFYW1iKfPNDtFEIlKWeU7hYFTED
	LakNm0KFocK6PufuNbBkUGxJay3uC2RraM7PjN3BJ9cTs/Q/uG0pzssjqPiNgOIjXWm6
	ulk2vmztOMTo1XepXcHhYrO2OihoH40H7ns422Bax2JFnmEguva/9wFbl2J/E96WUmjX
	pUGKmsEr8COrMEPmUtzkZD36KPEKhhugaxl8F62mu+kj/f6uo/sZEOESn9aSkFY8JBz5
	I3dAFcSDb3CYNvZFo50lek/KFAGD4RbTkzwZSbWijdZ4GfwflRy5UR6NufyKoBjBw0x1
	ix1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AAuZ7Qgaer70ILcwZf6NUxlnyJYsA/8Q8x37hrdrwts=;
	b=k6OZi5fxLsENChtVPovgjqOz81LL9W+HPNsunWLxeXBQlpjm23kUHq55DlCS/s1WhM
	DLXFii96rsoOJa8I886lvalhOVlWmlrYGVJqKa+4LGzI2ut9eGjIbMmCz+jNdD0zDC6E
	8ClMo4S/k1XAS7Cf+hNQskd8SUrWEXckWMYpqu/UsURX1LCFryqSqRaNFb0V6G0e00K+
	08egmyOAkdiXAtF1ekpcJjHoZZdiIGtpLazVQv4vW30qg+qBUc8ka2E8jSpFuj52kIYM
	YypLhMCC4VTXVAnDsKPAsKCI1abddSgMJrDBTR716ljnZraqLN4A59Lx+TS+ehBJHWK4
	y6vQ==
X-Gm-Message-State: AG10YOQmlWvf5spvGxZeL9twpw4yMBQ05h8HIvGccRknEIdViVmgXbWj5aKd9AL1ZMDVUg==
X-Received: by 10.66.141.71 with SMTP id rm7mr50921774pab.106.1456278519022;
	Tue, 23 Feb 2016 17:48:39 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	s197sm443852pfs.62.2016.02.23.17.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Feb 2016 17:48:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster@mvista.com
Date: Tue, 23 Feb 2016 17:48:23 -0800
Message-Id: <cover.1456278327.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [fido][PATCH 00/11] Fido Security fixes #2
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
X-List-Received-Date: Wed, 24 Feb 2016 01:48:39 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these changes for the next fido update.

This is to meet our obligation for Yocto compatibility

The following changes since commit 9037f2c7c797367c2d09b87f344ecf749d28cb41:

  gdk-pixbuf: Security fix CVE-2015-7674 (2016-02-22 19:08:53 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/fido_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fido_cve_fixes

Armin Kuster (10):
  busybox: Security fix CVE-2011-5325
  libpng: Security fix CVE-2015-8126
  libpng: Security fix CVE-2015-8472
  libgcrypt: Security fix CVE-2015-7511
  curl: Security fix CVE-2016-0754
  curl: Secuirty fix CVE-2016-0755
  bind: Security fix CVE-2015-8461
  nettle: Security fix CVE-2015-8803 and CVE-2015-8805
  nettle: Security fix CVE-2015-8804
  git: Security fixes CVE-2015-7545

Li Zhou (1):
  rpcbind: Security Advisory - rpcbind - CVE-2015-7236

 .../bind/bind/CVE-2015-8461.patch                  |  45 +++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   3 +-
 .../busybox/busybox/CVE-2011-5325.patch            |  48 +++
 meta/recipes-core/busybox/busybox_1.23.1.bb        |   1 +
 .../git/git-2.3.0/CVE-2015-7545_1.patch            | 445 +++++++++++++++++++++
 .../git/git-2.3.0/CVE-2015-7545_2.patch            | 113 ++++++
 .../git/git-2.3.0/CVE-2015-7545_3.patch            | 110 +++++
 .../git/git-2.3.0/CVE-2015-7545_4.patch            | 146 +++++++
 .../git/git-2.3.0/CVE-2015-7545_5.patch            |  67 ++++
 meta/recipes-devtools/git/git_2.3.0.bb             |   7 +
 .../rpcbind/rpcbind/cve-2015-7236.patch            |  83 ++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb     |   1 +
 .../libpng/libpng-1.6.16/CVE-2015-8126_1.patch     |  91 +++++
 .../libpng/libpng-1.6.16/CVE-2015-8126_2.patch     | 134 +++++++
 .../libpng/libpng-1.6.16/CVE-2015-8126_3.patch     |  79 ++++
 .../libpng/libpng-1.6.16/CVE-2015-8126_4.patch     |  48 +++
 .../libpng/libpng-1.6.16/CVE-2015-8472.patch       |  29 ++
 meta/recipes-multimedia/libpng/libpng_1.6.16.bb    |   7 +
 meta/recipes-support/curl/curl/CVE-2016-0754.patch | 384 ++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2016-0755.patch | 133 ++++++
 meta/recipes-support/curl/curl_7.40.0.bb           |   4 +-
 .../libgcrypt/files/CVE-2015-7511_1.patch          | 245 ++++++++++++
 .../libgcrypt/files/CVE-2015-7511_2.patch          |  55 +++
 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb  |   5 +
 .../nettle/nettle-2.7.1/CVE-2015-8803_8805.patch   |  71 ++++
 .../nettle/nettle-2.7.1/CVE-2015-8804.patch        | 272 +++++++++++++
 meta/recipes-support/nettle/nettle_2.7.1.bb        |   5 +
 27 files changed, 2629 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_1.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_2.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_3.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_4.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_5.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_1.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_2.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_3.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_4.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8472.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0754.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0755.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_1.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_2.patch
 create mode 100644 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
 create mode 100644 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8804.patch

-- 
2.3.5


