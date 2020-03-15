Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4091A605AE
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:01 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id hg10so2947671pjb.1
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ss5aYzZCGjHbzgwTHeZ/rszo5NlENSB/yMBuqKzndm4=;
	b=d/wZ0yPwRMAXeN3CpIcfhp2iPDY4ES/5d1Gyxf/opykBc5VwoM3etQPuCs+hglwm5m
	iH2gFnsNAR1HUswG0GmhH/Cb6wJo+myt4l1aHfZFelD1CtbOcX11cae2S2yVeT5D7Mxc
	f4eVwKsRxRziSgLyCyx17a0Sjjp/6G4GegC9ZDSgpUs20wyFlnY+G52HtdnepGcFDeyB
	2FkOxDNMGUzWPAJLVqbjgitrBEU57FH18vcPdRZucsaeoslgmHFaGNUQBqZf1k+aflwQ
	nSooKs58saZ8qIfS7y8esN+mKB28RPIu1yTtWk3fwloqOy+UI1Fd5cqqQjyGYVGRcE8l
	sCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ss5aYzZCGjHbzgwTHeZ/rszo5NlENSB/yMBuqKzndm4=;
	b=QIR3O2UbhPx00fk00eeQJ56iF6Fg4M2douiCLjfIx+Z58LeLQ3kQZpK7ionJExFwkd
	y/77lQmNAh2S6WFSdna9mhxXErFhruT0CBRfPRX5uw5R+QPUUojJWUj0+NRm7MD5IOHN
	icihU4oqyayGFCuxKAiVgIZknhDShsoaGTlcJnw64xBAD4+YIaqwpRSq7fBd0u9NO5qc
	jwhtrtaTPIJe0zookxv9OKJh+wyFAwI/n4D+144IBhF+peRza5Sf8OUfxcY720EQsjCI
	+2QzBCPMBtHIzWZVd1JVufB9brgwobB/BkTKbdQ/6c8gM9ZlKeug8fD0gJSgadlQfE2S
	LZug==
X-Gm-Message-State: ANhLgQ3BT7Nz/ictzpkuGDX1QQBhQBgJ8yuXhrTTnY1RQKvXabpRsMQq
	lg6lapR560Pzi234rHeIlu8nAdtH
X-Google-Smtp-Source: ADFU+vsqcsvjzpk/13DP93/FrutUrDqNkzUR06+OPjqgFasJ2HRNXaMr6bvUmaiqoFBkf56wiYBQrw==
X-Received: by 2002:a17:90a:2663:: with SMTP id
	l90mr19526445pje.188.1584295921966; 
	Sun, 15 Mar 2020 11:12:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.01
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:42 -0700
Message-Id: <cover.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 00/16] pull request
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:01 -0000

Please merge these changes to zeus

The following changes since commit c78140941f8a98e013932023a63501ba3b7e975a:

  linux-yocto/5.2: update to v5.2.32 (2020-02-28 11:54:08 +0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Armin Kuster (2):
  cve-check: fail gracefully when file not found
  wic/engine: lets display an error not a traceback

Bruce Ashfield (1):
  linux-yocto/5.2: backport perf build fix for latest binutils

Chee Yang Lee (2):
  cve-check: show whitelisted status
  cve-check: fix ValueError

Khem Raj (1):
  valgrind: Fix build with -fno-common

Lee Chee Yang (1):
  virglrenderer: fix multiple CVEs

Mark Hatle (1):
  gcc-cross-canadian: A missing space in an append caused an invalid
    option

Michael Halstead (1):
  yocto-uninative.inc: version 2.8 updates glibc to 2.31

Nathan Rossi (2):
  gcc-cross.inc: Prevent native sysroot from leaking into configargs.h
  gcc-target.inc: Prevent sysroot from leaking into configargs.h

Ovidiu Panait (1):
  dhcp: Fix REQUIRE(ctx->running) assertion triggered on SIGTERM/SIGINT

Rahul Chauhan (1):
  ruby: fix CVE-2019-16254

Richard Purdie (2):
  dummy-sdk-package: Add DUMMYPROVIDES_PACKAGES
  maintainers: Add entry for buildtools-extended-tarball

Zhixiong Chi (1):
  glibc: CVE-2020-10029

 meta/classes/cve-check.bbclass                |  25 ++-
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 ...s-running-prior-to-calling-isc_app_c.patch | 165 ++++++++++++++++++
 ...ed-shutdown-log-statment-to-dhcrelay.patch |  29 +++
 .../dhcp/0003-Addressed-review-comment.patch  |  31 ++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb  |   3 +
 .../glibc/glibc/CVE-2020-10029.patch          | 128 ++++++++++++++
 meta/recipes-core/glibc/glibc_2.30.bb         |   1 +
 meta/recipes-core/meta/dummy-sdk-package.inc  |   3 +
 .../meta/nativesdk-buildtools-perl-dummy.bb   |   5 +-
 .../meta/nativesdk-sdk-provides-dummy.bb      |   5 +-
 .../meta/target-sdk-provides-dummy.bb         |   1 -
 .../gcc/gcc-cross-canadian.inc                |   4 +-
 meta/recipes-devtools/gcc/gcc-cross.inc       |   7 +
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   4 -
 meta/recipes-devtools/gcc/gcc-target.inc      |   8 +
 .../ruby/ruby/fix-CVE-2019-16254.patch        | 106 +++++++++++
 meta/recipes-devtools/ruby/ruby_2.5.5.bb      |   1 +
 .../valgrind/valgrind/s390x_vec_op_t.patch    |  19 ++
 .../valgrind/valgrind_3.15.0.bb               |   1 +
 .../virglrenderer/CVE-2019-18390.patch        |  66 +++++++
 .../virglrenderer/CVE-2019-18391.patch        |  51 ++++++
 .../virglrenderer/CVE-2020-8002.patch         |  39 +++++
 .../virglrenderer/virglrenderer_0.8.0.bb      |   3 +
 .../linux/linux-yocto-rt_5.2.bb               |   2 +-
 .../linux/linux-yocto-tiny_5.2.bb             |   4 +-
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  |  18 +-
 scripts/lib/wic/engine.py                     |   5 +-
 29 files changed, 710 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-Ensure-context-is-running-prior-to-calling-isc_app_c.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0002-Added-shutdown-log-statment-to-dhcrelay.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0003-Addressed-review-comment.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-10029.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch

-- 
2.17.1


