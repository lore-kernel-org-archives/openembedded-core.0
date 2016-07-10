Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7E347605B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 01:08:14 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id dx3so23379230pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=75H3K9m787XYRCc+hDV2TLbR5lvpCyipSmVAv0Xe9g0=;
	b=E0SZD+oirhx49N5hnFzYlo1tnRTsEidUqZxbnXbD9pyWX9ZyrUK+2Tu4CGP1J2W7Dl
	FZDObSg87xgSa0wmzA43a3KRxYeBkEbNn7DftQBYYLxJiTRjJXX9q59Hg8IgZkAh+f0o
	o8jBfhm1U/cKomLBsZ+WPtBNLjIMCRxhV7vB9mvqjTv1JdUvFG2/pUnaTEyeHbT/DRje
	FTaAT0va2xDP7tP5i0tWlykn8kH77FnGNJsXRbOP7oNwhuejY10YWvD4LwDv+IP5LejC
	5rfPkVi70/06N7vEQ3ke0pajePnqVJyW/VDxIw++2jYirySLgyECkHumpFsm3S3Y5FJu
	gMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=75H3K9m787XYRCc+hDV2TLbR5lvpCyipSmVAv0Xe9g0=;
	b=FMAKAVThA9vKt88STLNjQdvvTfaS7TMqSnQXto4ZLfAcoYH7sQuI12rK6+7jYDDHDY
	Gx96CinuEmkQw8sBRs9Pk3hnA+QzXJzUwdWFNkMrgUXSXp9kWlOkGToL/E2g9HuY08oI
	1QPC8E5HvLifupM1q704vcwCDWLUjhJJ8kdz4566i0myZgmXp1gLW8fV3WRNDXppW/UT
	HvSb+1aVO6TzrT5qi9GNCIEvCO4kHK+c/NBOIKhmc7sut5WNneuO9ZkInJWILibwvCkz
	+M0CmgNlc0RdwilpBGOCAvuls1iq430UOSROf8EHgkWIOBhBaBb/pRuoncLcRCn5JnXO
	bQ0Q==
X-Gm-Message-State: ALyK8tIryG8jj8LNo4wuCGmBXyPWOoqG/4geGmZcRtZef5wiS6b4u7a5KxiqB+d2oP0KZg==
X-Received: by 10.67.3.7 with SMTP id bs7mr22731039pad.86.1468112895342;
	Sat, 09 Jul 2016 18:08:15 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	d65sm6470421pfa.45.2016.07.09.18.08.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jul 2016 18:08:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, akuster808@gmail.com,
	liezhi.yang@windriver.com
Date: Sat,  9 Jul 2016 18:08:05 -0700
Message-Id: <cover.1468111537.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 00/17] Jethro-next security fixes
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
X-List-Received-Date: Sun, 10 Jul 2016 01:08:17 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider these changes for jethro-next.

The libxml2 changes don't affect Master nor krogoth.
Glibc changes have been sent for Master and soon for Krogoth.

The following changes since commit 118380bc5d01e52b5edc574abb4176f6e70a54a6:

  documentation: Updated date in the manual revision tables. (2016-06-21 12:59:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro-next

Armin Kuster (17):
  glibc: Security Fix for CVE-2016-3706
  glibc: Security fix for CVE-2016-4429
  libxml2: Security fix for CVE-2016-1762
  libxml2: Security fix for CVE-2016-3705
  libxml2: Security fix for CVE-2016-1834.patch
  libxml2: Security fix for CVE-2016-4483.patch
  libxml2: Security fix for CVE-2016-1840
  libxml2: Security fix for CVE-2016-1838
  libxml2: Security fix for CVE-2016-1839
  libxml2: Security fix for CVE-2016-1836
  libxml2: Security fix for CVE-2016-4449
  libxml2: Security fix for CVE-2016-1837
  libxml2: Security fix for CVE-2016-1835
  libxml2: Security fix for CVE-2016-1833
  libxml2: Security fix for CVE-2016-3627
  libxml2: Security fix for CVE-2016-4447
  libxml2: Security fix for CVE-2016-4448

 meta/recipes-core/glibc/glibc/CVE-2016-3706.patch  |  226 +++++
 meta/recipes-core/glibc/glibc/CVE-2016-4429.patch  |   89 ++
 meta/recipes-core/glibc/glibc_2.22.bb              |    2 +
 .../libxml/libxml2/CVE-2016-1762.patch             |   84 ++
 .../libxml/libxml2/CVE-2016-1833.patch             |  368 +++++++
 .../libxml/libxml2/CVE-2016-1834.patch             |   55 +
 .../libxml/libxml2/CVE-2016-1835.patch             |   95 ++
 .../libxml/libxml2/CVE-2016-1836.patch             |  443 ++++++++
 .../libxml/libxml2/CVE-2016-1837.patch             |  143 +++
 .../libxml/libxml2/CVE-2016-1838.patch             |   96 ++
 .../libxml/libxml2/CVE-2016-1839.patch             |  127 +++
 .../libxml/libxml2/CVE-2016-1840.patch             |   37 +
 .../libxml/libxml2/CVE-2016-3627.patch             |   64 ++
 .../libxml/libxml2/CVE-2016-3705.patch             |   71 ++
 .../libxml/libxml2/CVE-2016-4447.patch             |  208 ++++
 .../libxml/libxml2/CVE-2016-4448_1.patch           | 1067 ++++++++++++++++++++
 .../libxml/libxml2/CVE-2016-4448_2.patch           |  208 ++++
 .../libxml/libxml2/CVE-2016-4449.patch             |   47 +
 .../libxml/libxml2/CVE-2016-4483.patch             |   55 +
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |   17 +
 20 files changed, 3502 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-3706.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1762.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1833.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1834.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1835.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1836.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1837.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1838.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1839.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1840.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3627.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3705.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4447.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_2.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4449.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4483.patch

-- 
2.3.5


