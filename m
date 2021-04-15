Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.3282.1618466917451769559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xNRrMdeR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618466916; i=@fujitsu.com;
	bh=hbnEqn59/U+yMlNHYhyyohq7lJdW6tU4qFHXh7hDjq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xNRrMdeRLxei2NfZtnY5QpVaqgdJH+9zNppfCnp044qRP8vwsJq4VKyLLFl07ummv
	 LKtzuFqThF5wNH85y0xD1QOOId9j0K6CbqCecQKAA2p6NA0xBlv/7fI0GereZVYLyt
	 t5kI/3MY2wdvsrxF11DMhsMj2RFS4ZiVo6lK7UmfL3lr53/urQZYrNIGhRprxTKhim
	 0J+oKSS0yco8iwSojVDVGGjkl68E8rx7MinJsjY3kiBJGu4DozGTLpjbPF3/LektOP
	 FVjM7UKjgkPggUwUHnM/5UTMZAlOstDIzhjZ2t52M7rKjPNVDCA9ZcyLqltZ6l7owH
	 acpigNnTFDvvg==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 95/8E-56778-368D7706; Thu, 15 Apr 2021 06:08:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MRqpt8ozz
  B4OlHJYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPzor0sBT0iFTuXHWZvYPwu2MXIxSEkMItJ
  Yu3hp0wQznFGiW13e1i7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7hx3EFhawlejdM
  psFxGYRUJX4fvk3WJxXwEli2+29TCC2hICCxJSH75lBbE4BZ4lz11eA1QgB1Tx/cJYJol5Q4u
  TMJywQ8yUkDr54wQzRqygx+3IzC4RdKdG5fgHjBEb+WUhaZiFpWcDItIrRIqkoMz2jJDcxM0f
  X0MBA19DQSNfQ0kjXyMBEL7FKN1EvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwHFMKDpzZ
  wXjq9Qe9Q4ySHExKoryHVpQlCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgVQQGuJBgUWp6akVaZ
  g4wNmDSEhw8SiK8364DpXmLCxJzizPTIVKnGO053qxdsoiZo+3eXSA5c8HB1cwc99sPrWYWYs
  nLz0uVEueVAWkTAGnLKM2DGwqL5UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlrQKbwZOa
  VwO1+BXQWE9BZFatKQc4qSURISTUwiU5r+ywdWLh6Udo8kYd/ircfcrn+/Ow7vVcOFct3T2b1
  8gyWFI08sTDBXmHJE0fX6KC55+Q2/5JS1dqS1LzJWXP5v45nZV3XD5bZzvr0QoJtiZI1B/uGD
  0v/P3nz8NjcGdcOCqzKunhJWGjZ/d8FOktnBT38rTL7wX61h99OOBQ0vZA9e77LXp2hwrbIV/
  CPdtiW/Yd33H4WdzdhjY6x5ZkpT0/Olvzqkrn0StyG1oO5s3fciil9XS+/1vWsg9bJZzeetfH
  M/f3j9ptkV7+CZ8xMp3Y2Tf7xTn5bc0NSVt/6/WGvRETKfWb9CljQF3KXZ9nDK5kHApfliPTc
  mTG/Ss5f2nZV3SffxbPPTzRxWvhJiaU4I9FQi7moOBEAXU0TvGADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-267.messagelabs.com!1618466915!875304!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25844 invoked from network); 15 Apr 2021 06:08:35 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-24.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:08:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F68ZVj027425
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:08:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:08:33 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcomps: upgrade 0.1.15 -> 0.1.16
Date: Thu, 15 Apr 2021 14:08:20 +0800
Message-ID: <1618466900-24355-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1618466900-24355-1-git-send-email-wangmy@fujitsu.com>
References: <1618466900-24355-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0001-Add-crc32.c-to-sources-list.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcomps/0001-Add-crc32.c-to-sources-list.patch         | 6 +++---
 .../libcomps/{libcomps_0.1.15.bb => libcomps_0.1.16.bb}     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.15.bb => libcomps_0.1.16.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
index f4fb6d3b20..76fce19767 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index adabb31..b9b96ab 100644
+index 89b9c91..08cd6b5 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
 @@ -9,13 +9,13 @@ set (pycomps_SRCDIR ${CMAKE_CURRENT_SOURCE_DIR})
@@ -23,7 +23,7 @@ index adabb31..b9b96ab 100644
 -     pycomps_hash.c pycomps_exc.c pycomps_lbw.c)
 +     pycomps_hash.c pycomps_exc.c pycomps_lbw.c crc32.c)
  
- set (pycomps_HEADERS pycomps_23macros.h pycomps_sequence.h
+ set (pycomps_HEADERS pycomps_macros.h pycomps_sequence.h
       pycomps_envs.h pycomps_categories.h pycomps_groups.h
       pycomps_gids.h pycomps_utils.h pycomps_dict.h pycomps_mdict.h
       pycomps_hash.h pycomps_exc.h pycomps_lbw.h
@@ -46,5 +46,5 @@ index d8f5e34..f266067 100644
  static uint32_t crc32_tab[] = {
  	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
index 58d2dee897..851ec5b817 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "b213f749405d84e989b25e183bcf28ce701696dd"
+SRCREV = "f3289ed1d812648558ab48ade4fae850b375fa65"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

