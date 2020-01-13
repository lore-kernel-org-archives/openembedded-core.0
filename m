Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id B8F957FC51
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:30 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k25so4861181pgt.7
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fyFa7zpzbSJfkxZ50ndN3UEu6tJq57by9EkxjkMhoNs=;
	b=TJiu87/WwK9Rkg9lxr9RBoCU5DQWC8XiyJ5fC+DvWaj0S7iUkIGWhbzRR/dow+81ED
	OU80vSb+8tpF+Ha+bPvyPNK8+EuN/HMx+cTSlxKAN6NveDy35sUj9JnxfT0Pe59i/POO
	HnSmh0Qrbb9FqXcAJ1tYIqzn8zyKnCtMlEdUWwXn7N0TfVQ1pDdlIHpr0waR9qe6XlAY
	J7TRlYxsFzXk7Xfdx0lQ67f4TG98yYk51lRFLva7ko0qjofhlyzE+9mr8HLPBkMIT8/t
	m4uwfD/lvG7D3pX+HJu8mdvuaX2laBhmCLUbM1sCffIfn1MYk5/bE+fKgUBB9jQKeixH
	VfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fyFa7zpzbSJfkxZ50ndN3UEu6tJq57by9EkxjkMhoNs=;
	b=GVVKBvg0xSN4T/6EAj5/+xWpjncDfm1BPMVsrb9eY33mvf8Mx9AlGPXYlhM5dJOBiV
	9daYnq/P+rdQ8tVre9qoJF6YnClPswxxssJIJvx/bOJgD1Qodoc4lbV9Ss3PTHJvF6ML
	GdioCBiKBuXweX2+EDhuZFHD0/VvwEuHToJqwIA/Rnl8T7sNKoPddfcKO+fCO5DguwIg
	MeboZo9dhl7PMpBcN8PSh9lBKoYeCPlmrhMICKkll1959snEoEvWb2vt1p+P1bcntHi6
	MQ0dr3O9IA4CjIDJNev6bZyjwkmnZOGPYSkxaUoo8VzjB73mQj4bUZUtzC1aRAyCBh0M
	jV3g==
X-Gm-Message-State: APjAAAVxUFmfm4XvrMLk0G0Sb0Cy0pZX/hqINySrjYfeePZ/U12wqUP4
	OvUUeTsV0XaKmjQ4YPUiYrpzMZqJ
X-Google-Smtp-Source: APXvYqz2TPTRBpxz/pGKZ1VmcC1fcAN8NKzHTweObXe5x1CMwxMWqHBhBOg0v4BQCAMqUkLSZ9MOmg==
X-Received: by 2002:a63:2355:: with SMTP id u21mr20960601pgm.179.1578929431634;
	Mon, 13 Jan 2020 07:30:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:29:59 -0800
Message-Id: <cover.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: akuster808@gnail.com
Subject: [warrior 00/28] Patch review
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:30 -0000

Please have review comments back by Wednesday

The following changes since commit 7009d823a0799ce7132bd77329b273a476718c8c:

  python: update to 2.7.17 (2019-11-23 21:01:39 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nut
  http://cgit.openembedded.org//log/?h=stable/warrior-nut

Alexander Kanavin (1):
  sudo: correct SRC_URI

Anuj Mittal (1):
  openssl: set CVE vendor to openssl

Armin Kuster (1):
  stress: update SRC_URI

Chen Qi (2):
  libxfont2: set CVE_PRODUCT
  webkitgtk: set CVE_PRODUCT

Ferry Toth (1):
  sudo: Fix fetching sources

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

 meta/classes/cve-check.bbclass                | 105 +++++++++---------
 meta/lib/oe/sdk.py                            |   4 -
 ...-add-missing-limits.h-for-musl-syste.patch |  29 -----
 .../{libpcap_1.9.0.bb => libpcap_1.9.1.bb}    |   5 +-
 .../openssl/openssl_1.1.1b.bb                 |   2 +
 .../recipes-core/meta/cve-update-db-native.bb |  46 +++-----
 meta/recipes-devtools/flex/flex_2.6.0.bb      |   3 +
 meta/recipes-devtools/git/git.inc             |   2 +
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
 19 files changed, 101 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} (88%)

-- 
2.17.1


