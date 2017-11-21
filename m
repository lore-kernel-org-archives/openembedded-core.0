Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B2CB37868A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:07:17 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p9so8696705pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 16:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=olUvPxuSue5e8H9XSzKfMFc0G3G5PcYVwMM1ernFicY=;
	b=rQzUZ0nqe2eqe4PhPDYCkpkJiQVgHrW2yKRs9f640OVtB3nrBFS3wlMe1rsitY2kVY
	OVZ+qhqBsZVCV/ENwp/oa8w9UKN6U7IJk9Bp+4x1EkP4FyH+XmlFfrDtSuc0kEdc96eT
	0MCgL4xyVjMSQS91M5/B2Y99P/uBF0m6ptkMTQvxhO5VUsb8d0niE8Eyb1iK4/Enmlz4
	UalIhaX1wJsIrBK+gVgAyWE5mLfUJjQKfYNmyAKlySxVJkMpHxH+WZoIn9J7kaSzhL19
	71gdvo8O+U0Oug7o/j26rCSX2bpX5M+kDHMb9OsNPuTARcqJxLwJz2XW1WzUcvzagxuM
	9bSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=olUvPxuSue5e8H9XSzKfMFc0G3G5PcYVwMM1ernFicY=;
	b=oyrVaF6cDlBMgTRPIEgrxDWRhaOdCQThmv3O7EGp3tC7V5WjgswOpqEC10yGkJwCH4
	dBfKNbtv4C9/P/Uk/PBGw38BpYWgX6bjAhED/edi64Oe4Lt78pA/1CRP9cAvapPUgQN7
	GahChYa9/87F71yEhnxdSvGcEymDhpSOmca94k+C5R4dijCIxNtzvDWSTnLqjUh5hFAF
	lMNC1C/fwVDJEU+WCQvkq+A7YKXow5tGEhNk+Rs52HBU7e2Ps/HgSnny72y/X1HozPz8
	Ydt8yY5ocjba1OXFVOwCEV7DejwEFsjXwP57z0ETlZzwQCApNIaAIigXSe1E1f2bTVkL
	bISQ==
X-Gm-Message-State: AJaThX7/icrQLy9zsCwsvY4QXOahAgmZ1lurpsJHcHypdQkdlch10Fmv
	tcUXlRCzcsYDHVBrTU+n7Oxf7Q==
X-Google-Smtp-Source: AGs4zMZ6wC3R/Qz9xR56Ns7XJD/mrpqV2Gomnj9lQ55FB7Spst7HuaDQ5QglGMnedO9sa2uaFvKN7A==
X-Received: by 10.99.43.71 with SMTP id r68mr15384369pgr.348.1511222838930;
	Mon, 20 Nov 2017 16:07:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:b90e:aa41:7e0b:9c90])
	by smtp.gmail.com with ESMTPSA id m9sm4221109pgt.17.2017.11.20.16.07.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 16:07:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:07:10 -0800
Message-Id: <cover.1511222485.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/5] Master package updates
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
X-List-Received-Date: Tue, 21 Nov 2017 00:07:17 -0000

From: Armin Kuster <akuster@mvista.com>


I suspect curl may have conflicts if the changes in mut are applied.

The gnutls changes built with meta-oe world. boot tested on a few arm machines.

The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/master-updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=akuster/master-updates

Armin Kuster (5):
  gnutls: update to  3.6.1
  nettle: update to 3.4 and cleanup
  nss: update to 3.34
  libassuan: update to 2.4.4
  curl: update to 7.56.1

 .../curl/{curl_7.54.1.bb => curl_7.56.1.bb}        | 12 +---
 meta/recipes-support/gnutls/gnutls.inc             |  3 +-
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
 13 files changed, 116 insertions(+), 139 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (89%)
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


