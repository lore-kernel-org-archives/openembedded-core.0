Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C2375786D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 20:01:40 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id c123so11000426pga.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 12:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=B1/i3iy4LIwiTcW4U8MWQtdGNiDtF1aExWC6cmx9e9E=;
	b=PXNUvRb0pf/uIBS4quMnn2JbyNpxNMVqz6HHCDlC7HcXXqvSshBNCOhrjTUgifSg4i
	hs8ItQVS9GKDucGfnPRoTRsHc1nEdqLSnJJCOFKYwRzzKvn2NbYgdA+cTBw4SLg0Fwa1
	NlF0k5onalWugAlkC7Li8XeeW0JNjXNI4hF8UsUlbg9uu4iouBnFL8NEiv7XrfODbCCG
	N4McZqgP526nTEYb7VsoiQ8TypczmnCEXNkeHq27y9MNeBC+8GTiB2vR85Ri3jzzYQ38
	lotr4CDu5lVVTuqrQwb9HO3udLBji/RMkez/p4WDPWNSHpYRo4t/k8gbxtEPIZXJ/KrN
	tf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B1/i3iy4LIwiTcW4U8MWQtdGNiDtF1aExWC6cmx9e9E=;
	b=BqErLOH52r5Y8BI5/H1Pxs5WRPVptFXNPE10haeeEtFMrrt0fYfLNdIb++WG97gt5T
	OF9V9MphMh5Ii1JbZhBFMAhGkfdjLgtgobCutWndJMl1kaxz1Dsm2SCTI5Tgn7/PMOC8
	aCjpyE4fpbCrOsL+fstlNTX4rFLMgD753vGAc8Wne2phdaFLKYfIKDN9gPnY9y5v74kL
	M8TL1r+h17w9JskwjOJW7kkUuf009rCUutizDR7kb24+WaqEDgi1ExP2FOkeIQ1kCZlu
	b6rosPQrWSSHk5UagCn4ZJ5+nUvR+VqqiH1Bdnf7+mGwl+vPKVDu8Oh5JXhysgMNfdic
	9I4w==
X-Gm-Message-State: AJaThX5jltvOq8nlcUFtoSFg7iurbXkaYXqwZQ1WQItq7scHiAPTeVTk
	XXYpBkGab3IT6WBbPCozJy4=
X-Google-Smtp-Source: AGs4zMYEtzp3WsrKmAcLmPbE6OL2YPoftNbmHuGUb0BACFitKULhxsOpNnITB2yuNmj5UD6DzZRYCQ==
X-Received: by 10.84.240.136 with SMTP id z8mr18774536plk.240.1511294500897;
	Tue, 21 Nov 2017 12:01:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	d28sm26770154pfb.105.2017.11.21.12.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Nov 2017 12:01:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 12:01:31 -0800
Message-Id: <cover.1511294278.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/5][V2] Master package updates
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
X-List-Received-Date: Tue, 21 Nov 2017 20:01:40 -0000


I suspect curl may have conflicts if the changes in mut are applied.

The gnutls changes built with meta-oe world. boot tested on a few arm machines.

v2:
remove dangling patch
removed inherit
added checksum changes

The following changes since commit 33418ed064fe9cff5b4803f09135a81d9170c189:

  runqemu: Also specialcase resolution of '.' to the file's location (2017-11-21 17:58:36 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/master-updates
  http://cgit.openembedded.org//log/?h=akuster/master-updates

Armin Kuster (5):
  gnutls: update to 3.6.1
  nettle: update to 3.4 and cleanup
  nss: update to 3.34
  libassuan: update to 2.4.4
  curl: update to 7.56.1

 .../curl/{curl_7.54.1.bb => curl_7.56.1.bb}        | 14 +---
 meta/recipes-support/gnutls/gnutls.inc             |  3 +-
 .../gnutls/use-pkg-config-to-locate-zlib.patch     | 75 ---------------------
 .../gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb}   |  5 +-
 .../libassuan-add-pkgconfig-support.patch          | 77 +++++++++++-----------
 .../{libassuan_2.4.3.bb => libassuan_2.4.4.bb}     | 11 ++--
 ...d-target-to-only-build-tests-not-run-them.patch | 46 -------------
 ...d-target-to-only-build-tests-not-run-them.patch | 38 +++++++++++
 ...k-header-files-of-openssl-only-if-enable_.patch | 26 ++++----
 .../{nettle-3.3 => nettle-3.4}/dlopen-test.patch   |  0
 .../nettle/{files => nettle-3.4}/run-ptest         |  0
 meta/recipes-support/nettle/nettle_3.3.bb          | 19 ------
 .../nettle/{nettle.inc => nettle_3.4.bb}           | 14 ++++
 .../nss/{nss_3.33.bb => nss_3.34.bb}               |  4 +-
 14 files changed, 117 insertions(+), 215 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (87%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb} (45%)
 rename meta/recipes-support/libassuan/{libassuan_2.4.3.bb => libassuan_2.4.4.bb} (67%)
 delete mode 100644 meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
 rename meta/recipes-support/nettle/{nettle-3.3 => nettle-3.4}/check-header-files-of-openssl-only-if-enable_.patch (63%)
 rename meta/recipes-support/nettle/{nettle-3.3 => nettle-3.4}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{files => nettle-3.4}/run-ptest (100%)
 delete mode 100644 meta/recipes-support/nettle/nettle_3.3.bb
 rename meta/recipes-support/nettle/{nettle.inc => nettle_3.4.bb} (60%)
 rename meta/recipes-support/nss/{nss_3.33.bb => nss_3.34.bb} (98%)

-- 
2.7.4


