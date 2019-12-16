Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id DBD007FDA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:10 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k20so4639117pll.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=XqJEWZuNg/rk6dkuLNwMUzADel+AZpWo0rWXHBxsD5E=;
	b=rOW16feSpB155Gg8oSKDr1umJBlpFMHnuUWdP/dKgQlwoaJofzt6+JJfiRSLGptxzd
	aWhlAcdLBhkXfmtlbpjaOteGPSavE0630m/qTmcm+Rz8IIRxB1YKh34188WrL16Vk7oS
	lNS9V/28Xs+Tub2KIfgUp6/Jkb53A4dt+HvwI+gYvN2t3Fh+bMV6/hwtf9kqrjHT8Ihv
	IZTCMt3BoNLMqcy8c+kBWsYz451UjtwlMfORKOC19zpaTGYOUQR0mPdlLsf/mF2aMM9v
	WaUobBVdb94jNv0YvvLliZIyo4zh46+pFr3xbksNADPC1ifAGnuHWl/VkZJwAbXawLD2
	leCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XqJEWZuNg/rk6dkuLNwMUzADel+AZpWo0rWXHBxsD5E=;
	b=GR2iL3lEBtHev/J7celMPNs7MvjkRwxrgDuZWn7zEw3klzKcPPrvvS4AlAg3lkyO1C
	3CX2k4WJjEd1Zx7k4oVwfCS7gZo2IWndqe66u6q0ITQ8UfuMBraHfxfzIgxaBB4u1zUB
	qpJ+4v8QOh9ZDN7gO636JVeooV2KmAEnvQgzdaOQS02WJ8DMfzG9wuM0W54gVyFcniyX
	NLrJ2XnRqGkZKaCakpboKkDMJuj98E3WgVPvMdGv14YfgH8cPX0mS02AGenBmiWdRavN
	bJETHtZwLa6/di6/tGNeaIbf9/pVboAzF8ysdiVhdL0G0ZrGjISZLfLW++YqgZWriB/5
	q1hQ==
X-Gm-Message-State: APjAAAUPjC8gxAWP9QujdlvlBiOYVAP6RzB5sp6u6WB6xaPe5E4S9FMD
	kTin/xNch2Awo4xhKjxNsp5dW8n3mGw=
X-Google-Smtp-Source: APXvYqwpsoWIylyTdSf8BvXJpJgkf9djedT3Xk9wknMLIXNEpmGGjEhtywoUmaGifn+p/FJinrleGw==
X-Received: by 2002:a17:90a:da01:: with SMTP id
	e1mr18874993pjv.29.1576512011294; 
	Mon, 16 Dec 2019 08:00:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:50 -0800
Message-Id: <cover.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud 00/18] thud pull request
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:11 -0000

Here are the next series for thud. Passed A-full


The following changes since commit cd7cf933b3235560ec71576d8f3836dff736a39f:

  build-appliance-image: Update to thud head revision (2019-10-17 16:45:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/thud-next

Armin Kuster (1):
  linux-yocto/4.14: update to 4.14.154

Dan Tran (2):
  tar: Fix CVE-2018-20482
  sudo: Fix CVE-2019-14287

Jed (1):
  at-spi2: fix dbus-daemon path

Khem Raj (1):
  sdk: Install nativesdk locales for all TCLIBC variants

Ross Burton (12):
  cve-check: backport rewrite from master
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
  glibc: finish incomplete fix for CVE-2016-10739

Shubham Agrawal (1):
  libgcrypt: CVE-2019-12904

 meta/classes/cve-check.bbclass                     | 181 ++--
 meta/conf/distro/include/maintainers.inc           |   1 +
 meta/lib/oe/sdk.py                                 |   4 -
 meta/recipes-core/glibc/glibc-locale.inc           |   3 +
 meta/recipes-core/glibc/glibc-mtrace.inc           |   3 +
 meta/recipes-core/glibc/glibc-scripts.inc          |   3 +
 meta/recipes-core/glibc/glibc/CVE-2016-10739.patch | 910 ++++++++++++++++++++-
 meta/recipes-core/meta/cve-update-db-native.bb     | 185 +++++
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  62 --
 ...01-Fix-freeing-memory-allocated-by-sqlite.patch |  50 --
 ...ow-overriding-default-CA-certificate-file.patch | 215 -----
 ...ogress-in-percent-when-downloading-CVE-db.patch | 135 ---
 ...are-computed-vs-expected-sha256-digit-str.patch |  52 --
 .../check-for-malloc_trim-before-using-it.patch    |  51 --
 .../sudo/sudo/CVE-2019-14287_p1.patch              | 170 ++++
 .../sudo/sudo/CVE-2019-14287_p2.patch              |  98 +++
 meta/recipes-extended/sudo/sudo_1.8.23.bb          |   2 +
 meta/recipes-extended/tar/tar/CVE-2018-20482.patch | 405 +++++++++
 meta/recipes-extended/tar/tar_1.30.bb              |   1 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  20 +-
 meta/recipes-support/atk/at-spi2-core_2.28.0.bb    |   2 +-
 .../libgcrypt/files/CVE-2019-12904_p1.patch        | 176 ++++
 .../libgcrypt/files/CVE-2019-12904_p2.patch        | 330 ++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb  |   2 +
 26 files changed, 2410 insertions(+), 663 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2018-20482.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2019-12904_p1.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2019-12904_p2.patch

-- 
2.7.4


