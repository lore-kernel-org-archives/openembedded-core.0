Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4FAA7F874
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:43 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id kx11so1662970pjb.4
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=eL22k9B3F6nHF0XS8JINlYRtacgsy46WUkkGPrLGMMU=;
	b=EeIQWZ0+mT1OMEhRCB/KPi4wpIrw7PhxcWjdxMOYuOkCOWti4kvTXg1pTRo4AvhRuE
	OLBGWcWEcKfwALlg7GDpQ2WFaN93xI03CP5B0/f4jt7lBNEwSFm3M4Nxi8NH5nMiKFTL
	3hEN+0mEMdRZDx5MESOeQd6hjZCiw8MbX6Tk87eJL1af7ftMIL3mffhtbF8Anzdb+dLt
	BJGYiHOSeZ3I92C6uz+AwMAPoMglAwi8QD5UXyeqEl54zePVvnIXqI9p1FcxZdDW3iMI
	dQgz29k77tLrGvqAR9QUwJe3bL53CwwbCHkYQ24IAWL8X83JMEZC0IisbhTsKq0i3+T8
	zang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eL22k9B3F6nHF0XS8JINlYRtacgsy46WUkkGPrLGMMU=;
	b=J8DVy+NaOiFdcxdJ1grIKF3jxzMXYbOYD4uzRX5Xg0UydR160iSDcrSbk2a3Rv+dkO
	dJjkzR2dNzAwXqhAQMVuDahQwk/TX9JBfKde9Voe+7seEdOg15D+XePSHSfZdjcJHyIm
	k/oGygxDzyxi8D7GhIsb07GDcHrDP7tOYOJQuOBei4QGfXekb77UvHQ8kk3BMlYgXnVd
	yLkoZIE/peIPCsyr31zlw2wOclLQIsLNmN050UZR1akCsKOZzaJfZM2Fa651aDPc4kIS
	bmJaxz68ceUlwIJw8qMl6UkiNn235fJz+EOQxhb9XXljlCDEQc2p4+USRgwirmqjfwPc
	wstA==
X-Gm-Message-State: APjAAAVzTUxjTQoNZG73KtMUixDOECuti+WN1nErhSHqcBldhU1gDsRW
	UmUDWt00gNedmm2jbvy3w32cvTce
X-Google-Smtp-Source: APXvYqyYt7cNeB2PJHGNsZrCGdf/Jw4bqxLc16WAXQk9YePcLZJBgb2o38rAzqWjcB96FwLbVX5jww==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
	cm7mr7316538pjb.119.1579188044511; 
	Thu, 16 Jan 2020 07:20:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.43
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:09 -0800
Message-Id: <cover.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior 00/32] Pull request
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:43 -0000

Please consider this series for the next warrior release.

The following changes since commit 0a1b1e88b936177344392e185fbd077622d88b3e:

  file: fix CVE-2019-18218 (2019-11-11 20:49:54 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org//log/?h=stable/warrior-next

Alexander Kanavin (2):
  python: update to 2.7.17
  sudo: correct SRC_URI

Anuj Mittal (2):
  python: fix CVE-2018-20852
  openssl: set CVE vendor to openssl

Armin Kuster (1):
  stress: update SRC_URI

Chen Qi (3):
  python: fix CVE-2019-16935
  libxfont2: set CVE_PRODUCT
  webkitgtk: set CVE_PRODUCT

Ferry Toth (1):
  sudo: Fix fetching sources

Kai Kang (1):
  bind: fix CVE-2019-6471 and CVE-2018-5743

Khem Raj (1):
  sdk: Install nativesdk locales for all TCLIBC variants

Niko Mauno (1):
  cve-check: Switch to NVD CVE JSON feed version 1.1

Oleksandr Kravchuk (1):
  popt: fix SRC_URI

Ross Burton (18):
  flex: set CVE_PRODUCT to include vendor
  git: set CVE vendor to git-scm
  subversion: set CVE vendor to Apache
  ed: set CVE vendor to avoid false positives
  boost: set CVE vendor to Boost
  libpam: set CVE_PRODUCT
  libsndfile1: whitelist CVE-2018-13419
  procps: whitelist CVE-2018-1121
  cve-check: ensure all known CVEs are in the report
  cve-check: failure to parse versions should be more visible
  cve-check: we don't actually need to unpack to check
  cve-update-db-native: don't refresh more than once an hour
  cve-update-db-native: don't hardcode the database name
  cve-update-db-native: add an index on the CVE ID column
  cve-update-db-native: clean up proxy handling
  cve-check: rewrite look to fix false negatives
  cve-check: neaten get_cve_info
  cve-check: fetch CVE data once at a time instead of in a single call

Zang Ruochen (1):
  libpcap: upgrade 1.9.0 -> 1.9.1

 meta/classes/cve-check.bbclass                | 105 +-
 meta/lib/oe/sdk.py                            |   4 -
 .../bind/0001-bind-fix-CVE-2019-6471.patch    |  64 ++
 ...01-fix-enforcement-of-tcp-clients-v1.patch |  60 ++
 ...p-clients-could-still-be-exceeded-v2.patch | 670 +++++++++++++
 ...rence-counter-for-pipeline-groups-v3.patch | 278 ++++++
 ...accounting-and-client-mortality-chec.patch | 512 ++++++++++
 ...a-and-pipeline-refs-allow-special-ca.patch | 911 ++++++++++++++++++
 ...allowance-for-tcp-clients-interfaces.patch |  80 ++
 ...perations-in-bin-named-client.c-with.patch | 140 +++
 .../bind/bind_9.11.5-P4.bb                    |   8 +
 ...-add-missing-limits.h-for-musl-syste.patch |  29 -
 .../{libpcap_1.9.0.bb => libpcap_1.9.1.bb}    |   5 +-
 .../openssl/openssl_1.1.1b.bb                 |   2 +
 .../recipes-core/meta/cve-update-db-native.bb |  46 +-
 meta/recipes-devtools/flex/flex_2.6.0.bb      |   3 +
 meta/recipes-devtools/git/git.inc             |   2 +
 ...-fix-one-do_populate_sysroot-warning.patch |  25 +-
 ...tive_2.7.16.bb => python-native_2.7.17.bb} |   2 +-
 meta/recipes-devtools/python/python.inc       |   9 +-
 ...nt-parse-domains-containing-GH-13079.patch |  90 --
 ...Resolve-intermediate-staging-issues.patch} |  53 +-
 .../python/python/CVE-2019-9740.patch         | 215 -----
 .../python/bpo-35907-cve-2019-9948-fix.patch  |  55 --
 .../python/bpo-35907-cve-2019-9948.patch      |  55 --
 .../python/bpo-36216-cve-2019-9636-fix.patch  |  28 -
 .../python/bpo-36216-cve-2019-9636.patch      | 111 ---
 .../python/bpo-36742-cve-2019-10160.patch     |  81 --
 .../{python_2.7.16.bb => python_2.7.17.bb}    |   2 -
 .../subversion/subversion_1.11.1.bb           |   2 +
 meta/recipes-extended/ed/ed_1.15.bb           |   2 +
 meta/recipes-extended/pam/libpam_1.3.0.bb     |   2 +
 meta/recipes-extended/procps/procps_3.3.15.bb |   3 +
 meta/recipes-extended/stress/stress_1.0.4.bb  |   2 +-
 meta/recipes-extended/sudo/sudo_1.8.27.bb     |   2 +-
 .../xorg-lib/libxfont2_2.0.3.bb               |   2 +
 .../libsndfile/libsndfile1_1.0.28.bb          |   3 +
 meta/recipes-sato/webkit/webkitgtk_2.22.7.bb  |   2 +
 meta/recipes-support/boost/boost.inc          |   2 +
 meta/recipes-support/popt/popt_1.16.bb        |   2 +-
 40 files changed, 2873 insertions(+), 796 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} (88%)
 rename meta/recipes-devtools/python/{python-native_2.7.16.bb => python-native_2.7.17.bb} (97%)
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 rename meta/recipes-devtools/python/python/{builddir.patch => 0001-python-Resolve-intermediate-staging-issues.patch} (58%)
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2019-9740.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
 rename meta/recipes-devtools/python/{python_2.7.16.bb => python_2.7.17.bb} (98%)

-- 
2.17.1


