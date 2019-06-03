Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB44D7E31E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s11so10767264pfm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YfIoi5CNG32x+mdNbhtBcmiKULKw+JkWwbeo4YyGXmg=;
	b=fmTipzhbvDF24kgvv9EKVgcy8weSlj2bNx4/ioUQXMAoDCgTtw+IZW+J76bbBOB5X2
	n/mgCOCCrWJ0YZEDpYvtZ+p4bS7K7CzQBYFqaapRVijJa8E32nRc6/Z3Kw3B0nvRNVP4
	rxagQW+/KcJjZp9/XJ7WC5EFDjAhhLKYLADCzEQ6QNfeggPbjK6w181QjfR8X0wdDT0g
	lfnxo7m9h11AnjZPV4PDxqimB4jPQuKXoEBAYthlu4OQstBFUqhMLMqaVDH5cstq/+wC
	LF/wF7EDMMdoDR3HUYZqhCxTm4qv8G/yiXzckiIJ5AnyYP8WgNBAfgxW97K8ytVMOO9m
	VutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YfIoi5CNG32x+mdNbhtBcmiKULKw+JkWwbeo4YyGXmg=;
	b=uimOPUF+DPueZnN7+2pEB7v8307jAmKuIgLOhzu7KtUl5Nq6FvA9LpQ72UusjguRqM
	nfv5ePKSrSPJ8iGK3Is+Ujqi0ZBaxCTkcd23BeQSKIpvF16c+fV045PgBL+PHoq0Jtb5
	zVH3wpjzHgtiABlFgLEgMkPckhlA8L3YEXr+c3mMrDa8a7atLborZS+D0uXjhv3nHojT
	5mXYLy35/mGSwsypjuOF3RAZIKF8cNoDUEE2g7ZeTiXSfQyN9XxtB1qN6ithiiNJPds+
	RUr1pJV4NTOo224Nh0XMHbRk4ELSmOFLm+d3vDwRwhwJvxYP4SepvDcZw2kkXhULfEGi
	DolQ==
X-Gm-Message-State: APjAAAUvQHzUXnLFUMjK6xMva6IzjPKZxE323JoJ+ekrR8hJVyGoNi7j
	QzKM3Y5g4PzwksyhaInmnF36E84N
X-Google-Smtp-Source: APXvYqxYeYh/hKfPF9gcf+VnRKUGvbDprnom1gRoMbUWl72yDtAgwhJBLBJqDDJ3iIyaRqlTvsXHZg==
X-Received: by 2002:a63:ec42:: with SMTP id r2mr29559500pgj.262.1559574429668; 
	Mon, 03 Jun 2019 08:07:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:43 -0700
Message-Id: <cover.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/21] Warrior-next patch review
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Next set for review for Warrior.
Ends Wednesday.

The following changes since commit ba36b0c5c1db632dd849f3f28f83c272530f67b6:

  Revert "acpica: use update-alternatives for acpidump" (2019-06-01 14:48:32 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Alexander Kanavin (2):
  linux-firmware: upgrade to latest revision
  python: update to 2.7.16

Andrej Valek (1):
  dropbear: update to 2019.78

Armin Kuster (1):
  Tar: Security fix CVE-2019-0023

Jean-Marie LEMETAYER (3):
  npm: get npm package name from npm pack
  npm: fix node and npm default directory conflict
  npm: remove some temporary build files

Mariano López (1):
  util-linux: Add missing ptest dependencies

Martin Jansa (1):
  python: add a fix for CVE-2019-9948 and CVE-2019-9636

Richard Purdie (11):
  openssh: Avoid PROVIDES warning from rng-tools dependency
  ptest: Add RDEPENDS frpm PN-ptest to PN package
  gettext/flex/m4/bzip2/gzip/parted/slang/attr: Add make to -ptest
    packages
  apr/apr-util: Add ptest dependency on libgcc
  perl-rdepends: Add missing module dependencies
  bash: Fix bash-ptest dependencies
  openssh: Add sudo dependency for ptest
  libpcre: Add make dependency for ptest
  perl/modules: Add various missing ptest perl module dependencies
  strace: Tweak ptest disk space management
  util-linux: Fix ptest dependencies

Ross Burton (1):
  glib-2.0: add missing libgcc dependency to glib-2.0-ptest

 meta/classes/npm.bbclass                           |  11 +-
 meta/classes/ptest.bbclass                         |   1 +
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb |   4 +-
 meta/recipes-core/dropbear/dropbear_2019.77.bb     |   4 -
 meta/recipes-core/dropbear/dropbear_2019.78.bb     |   4 +
 meta/recipes-core/glib-2.0/glib.inc                |   1 +
 meta/recipes-core/util-linux/util-linux.inc        |   3 +-
 meta/recipes-devtools/flex/flex_2.6.0.bb           |   2 +-
 .../perl-sanity/files/perl-rdepends.txt            |   7 ++
 meta/recipes-devtools/perl/liburi-perl_1.74.bb     |   2 +-
 .../perl/libxml-parser-perl_2.44.bb                |   2 +
 meta/recipes-devtools/perl/libxml-perl_0.08.bb     |   1 +
 ...on-native_2.7.15.bb => python-native_2.7.16.bb} |   2 -
 meta/recipes-devtools/python/python.inc            |  11 +-
 ...23-Use-XML_SetHashSalt-in-_elementtree-GH.patch |  96 ----------------
 ...ix-test_ssl-when-a-filename-cannot-be-enc.patch |  55 ---------
 ...LS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch | 120 -------------------
 ...34540-Convert-shutil._call_external_zip-t.patch |  67 -----------
 ...dd-missing-closing-wrapper-in-test_tls1_3.patch |  37 ------
 ...ix-test_ssl.test_options-to-account-for-O.patch |  37 ------
 ...ix-test_default_ecdh_curve-needs-no-tlsv1.patch |  34 ------
 .../python/bpo-35907-cve-2019-9948-fix.patch       |  55 +++++++++
 .../python/python/bpo-35907-cve-2019-9948.patch    |  55 +++++++++
 .../python/bpo-36216-cve-2019-9636-fix.patch       |  28 +++++
 .../python/python/bpo-36216-cve-2019-9636.patch    | 111 ++++++++++++++++++
 .../python/{python_2.7.15.bb => python_2.7.16.bb}  |  58 +++++-----
 .../strace/strace/ptest-spacesave.patch            |  19 +++
 meta/recipes-devtools/strace/strace_4.26.bb        |   1 +
 meta/recipes-extended/bash/bash.inc                |   4 +-
 meta/recipes-extended/gzip/gzip_1.10.bb            |   2 +
 meta/recipes-extended/parted/parted_3.2.bb         |   2 +-
 .../recipes-extended/perl/libtimedate-perl_2.30.bb |   1 +
 .../perl/libxml-sax-base-perl_1.09.bb              |   2 +
 meta/recipes-extended/perl/libxml-sax-perl_1.00.bb |   2 +
 meta/recipes-extended/slang/slang_2.3.2.bb         |   2 +
 meta/recipes-extended/tar/tar/CVE-2019-9923.patch  |  38 ++++++
 meta/recipes-extended/tar/tar_1.31.bb              |   1 +
 .../linux-firmware/linux-firmware_git.bb           | 128 +++++++++++----------
 meta/recipes-support/apr/apr-util_1.6.1.bb         |   1 +
 meta/recipes-support/apr/apr_1.6.5.bb              |   2 +
 meta/recipes-support/attr/attr.inc                 |   2 +-
 meta/recipes-support/libpcre/libpcre_8.43.bb       |   2 +
 42 files changed, 452 insertions(+), 565 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2019.77.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2019.78.bb
 rename meta/recipes-devtools/python/{python-native_2.7.15.bb => python-native_2.7.16.bb} (96%)
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
 delete mode 100644 meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
 delete mode 100644 meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
 delete mode 100644 meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
 rename meta/recipes-devtools/python/{python_2.7.15.bb => python_2.7.16.bb} (85%)
 create mode 100644 meta/recipes-devtools/strace/strace/ptest-spacesave.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2019-9923.patch

-- 
2.7.4


