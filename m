Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 57FBA60B31
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:20 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id mj6so39867pjb.5
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=BAVF1sDmAkDm1l/2UDg5QGHCHEyLp+IIGg676qIlcDA=;
	b=hXmfVQriW3F1+Mh3t2O1jZsQmug3eTTgQcSpwZO8dX3j3vOjuvnAAiYd6t2g/Ud2v0
	eXmCvhB4wZdDgRh6yJtIjMHu9joKpQAcKJoB0Hl0OZ70CaSDdeh/a4gwaSgmVP1rR4H1
	InZHhR7LPGRMVcN+VUOzS31dtHv/IudHsxZJXSMTW8OJQBiRC8NCEERNgKUYRNbBQPm8
	UhrUymMVb8vINmNMIYeNQmjSj/510MQAsHOwYF7tKxS/TwrJu4MOdB6oWQ1Cc3v0DH2H
	ICPTpLNGab4GS6laMkDUCKoBqETQRqLpQIVAGfQ8ZgDfi5xqdZqpukSD6SZ2ugTV1wFr
	QE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BAVF1sDmAkDm1l/2UDg5QGHCHEyLp+IIGg676qIlcDA=;
	b=Y9bw8Ukj1uMdwcqQaEBGJ2kqI7Ql9VEB59NYZPOBUvlMKaFPnqA9x2p5/1EOCdYdD2
	1SRER+l3bO+5Z8MTZv9gOrUnuWmqQ2EM6tqfAyS6mLbZ1byU2vpsDZqYxKeSQjpcTPG4
	3RSOma+wT5LYy8H9mp+vlK31eVcvxNlT7zl2OWorwur25u21e+0lNGkVoF8SgoEJRyfz
	01UBXVllvKbqOk8bq2PUUQxltNjRTt/YNSt+PjxasKGZqkuXIWEOTxYMaHRRbQzsLgE+
	QKa80uAWULvqN4n+jHgx1jZbnx2zTgtmElpExW4ewGFR6zzqnpbxa2h4rFo5pv+ojTK6
	8gtA==
X-Gm-Message-State: ANhLgQ1T6IFkpbX9AogTTIfMBvvmDRd2rklnB+UBBhFpG/hR2PcfKU19
	dnTbOMvoq5pHU4mqk0/V54UIpW4j
X-Google-Smtp-Source: ADFU+vtRlPNsiC8bZL0Ag0RkfEASshEgXKKTr7kkEihHiRsE6i1NeXTJ8h1U8R8MezfiD/BbqKHdqw==
X-Received: by 2002:a17:902:868d:: with SMTP id
	g13mr969099plo.36.1583893581013; 
	Tue, 10 Mar 2020 19:26:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.20
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:01 -0700
Message-Id: <cover.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 00/16] Patch review
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:20 -0000

Please review this next set and have comments back by Friday

The following changes since commit c78140941f8a98e013932023a63501ba3b7e975a:

  linux-yocto/5.2: update to v5.2.32 (2020-02-28 11:54:08 +0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-nut2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-nut2

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


