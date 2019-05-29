Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5292A7E31C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:40 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id n19so1697685pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=oDM7DBtSU9sNhGTVTSP2WJvJ5ShF0AQABeABDtbmcBw=;
	b=ktSuc7w9z6T/WZ1VDoDlITnOXyr+o4mkVK3BRcnp4sIcIXA7ZFjS8Adn9hZHyutYp2
	Z3ayP6bQ60DiKTCuxqTaYfmqTpe3yxEiMx0oyWsN+0mcp4d4L/J+2eN2W9KBtN3gBeOh
	aDKEDKdfIxUxlWevk2OKtEV2ALrI3EXINW5Iby75TDAVNDKvBuCaZbbq+T3uwuNsXnbp
	W61BTZDPOSpJUqotX58OZaVv3DFQ5DnLqPGJOsw7wpCX+VlCyatqTlEMVoHbYvQQo867
	wQnALSXzH3gynLsO27XO1woBrXrXmfug7pv0adjoXBasGsRMZtIUkdCTWYhOTAj7qEyz
	s+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=oDM7DBtSU9sNhGTVTSP2WJvJ5ShF0AQABeABDtbmcBw=;
	b=tMgV0jiGWl4M280s9cj2G0+PG2iYH21kYfRDkAab7Y7B/jPByXy3YV3jXZ4okxw2Y5
	IN6RaT82uq4L3UW6SdCsUW53N1rlFl/Cnir3CsQfLXyfnYveYdXBvtR0zNTZCh4e/tIb
	W79tLbc1zih8Kq1kwrl9jTK5izLS5V/P1WAbzylJFHAGoTg4pbf7yFPHbc2Y08U90NnE
	bQrFXYLOWRl/EjOY9SiMMHBO0KMX/FzuV9o1NSJ7IITaaec9qCbZY+kpovnRGIu4G+r4
	zPvhn2vfAFvhF4KpJ+i3v2jZr4F4QI9UzQEgZ2k5O3BOima/AEKHwiiK87DKq/PDkYHh
	JxEg==
X-Gm-Message-State: APjAAAUlRu1XNjGemcZSuHfk76Vjwe3T0zG/R0D/h7ZeKf9SRpMslY61
	SGDDiwXngTFfH+KVM/nvnhLddtxB
X-Google-Smtp-Source: APXvYqz/i8spXYgZm6+M+k92H2/V6ZgkMXcbVSL9o8Q6vYCie2ivVcePkXTVSAb6e6VAj5WRz5Nn6w==
X-Received: by 2002:a65:51cb:: with SMTP id i11mr955485pgq.390.1559137841076; 
	Wed, 29 May 2019 06:50:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:29 -0700
Message-Id: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH 0/9] Fixes for Thud
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
X-List-Received-Date: Wed, 29 May 2019 13:50:40 -0000

These are backports and Secruity fixes for thud 
already in Warrior or not affecting the versions in warrior.

Adrian Bunk (1):
  gnutls: upgrade 3.6.5 -> 3.6.7

Armin Kuster (4):
  glibc: Security fix CVE-2019-9169
  elfutils: Security fixes  CVE-2019-7146,7149,7150
  gnutls: update to 3.6.5
  nettle: update to 3.4.1

Mingli Yu (2):
  nettle: fix ptest failure
  nettle: fix the Segmentation fault

Richard Purdie (1):
  Revert "nettle: fix ptest failure"

Ross Burton (1):
  gnutls: no need to inherit binconfig

 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch  |  63 +++++++++
 meta/recipes-core/glibc/glibc_2.28.bb              |   1 +
 meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   4 +
 .../elfutils/files/CVE-2019-7146_p1.patch          |  52 ++++++++
 .../elfutils/files/CVE-2019-7146_p2.patch          |  65 +++++++++
 .../elfutils/files/CVE-2019-7149.patch             | 148 +++++++++++++++++++++
 .../elfutils/files/CVE-2019-7150.patch             |  51 +++++++
 .../gnutls/{gnutls_3.6.4.bb => gnutls_3.6.7.bb}    |   9 +-
 ...d-target-to-only-build-tests-not-run-them.patch |   0
 ...k-header-files-of-openssl-only-if-enable_.patch |   0
 .../{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch |   0
 .../nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest  |   0
 .../nettle/{nettle_3.4.bb => nettle_3.4.1.bb}      |   5 +-
 13 files changed, 391 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7146_p1.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7146_p2.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7149.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7150.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.4.bb => gnutls_3.6.7.bb} (84%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/Add-target-to-only-build-tests-not-run-them.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/check-header-files-of-openssl-only-if-enable_.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest (100%)
 rename meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb} (90%)

-- 
2.7.4


