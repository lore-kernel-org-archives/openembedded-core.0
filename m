Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4BADD77EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:46:05 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id b1so8928384qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=y4iN4mCW1Y/cfsrF6jQSOT3PDwNeZul/OZQNOb0KG+U=;
	b=A/ndup2PfZwKSglzMNw3/u4tOWSUNbZ2T7vXpKQa4himV17AxfX3xi1Gshg0e0PW14
	p48YTefDZi1tI79cEx9ZGx44M9snViBvj9Fb3wiA6rkBWmBVV52dqLrgR4HipMEXSqDp
	Tl7nMYnOnagJWsJR3PAw/HAeKfRj/EpXutAIJGrjDhtj7N2skHPhGnCQH9aXLL5hDTKd
	gKvABSbzzBut+Y7/TMeB9uKIrW6YVgE+QVSJsDh0LAr2bO/HTyGdonTlNxREwWzWhqF4
	a+D9zHJseTIxgrXRfpaceaHTJ8MaiUg61TlRwVtA9svgpoQHxB2Jb1x/0+/toLkMutoy
	IxzA==
X-Gm-Message-State: AHPjjUj1Skj3+YAi0oa4ZEf6+3Hll583xRBc9DxxRstyyPmkkvCmt2aS
	SdPSiBncaQihqPRF
X-Google-Smtp-Source: AOwi7QAz1X7aJcuTY1hQ+1MdXumrlqFjk8Y7JWtp3xdji6Nqi/wzr31hOGnZUkmL9i0EM2hH4bU1RQ==
X-Received: by 10.200.34.167 with SMTP id f36mr5906999qta.173.1505133966663;
	Mon, 11 Sep 2017 05:46:06 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id c1sm5774091qkg.55.2017.09.11.05.46.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:46:05 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:00 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:32 -0300
Message-Id: <20170911124558.2863-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 00/26] Revamp the Go support
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
X-List-Received-Date: Mon, 11 Sep 2017 12:46:06 -0000

This improves the Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

This fixes issues in existing support as well as add support for SDK
generation which supports Go.

Changes in v6:
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch

Changes in v5:
- new patch
- use new unpack support
- new patch

Changes in v4:
- new patch to consolidade in a single patchset all golang changes
- rebase on top of new "goarch.bbclass: Replace logic for setting
  GOARM"

Changes in v3:
- new patch
- new patch
- new patch

Changes in v2:
- Remove -x flag (madisongh)
- Remove GO_EXTLDFLAGS for now (madisongh)
- new patch

Matt Madison (16):
  go.bbclass: exported function cleanup
  go.bbclass: separate ${S} and ${B}
  go.bbclass: add do_unpack function to handle common cases
  go.bbclass: add GO_INSTALL_FILTEROUT variable
  go-native: remove dependency on go-bootstrap-native
  go-bootstrap-native: remove recipe
  go: split out go-runtime into separate recipe
  go.bbclass: remove GO_GCFLAGS nad GO_LDFLAGS
  go.bbclass: remove some xxx_FINAL variables
  go.bbclass: clean up CGO_xxx settings
  go: rename go.inc -> go-target.inc
  go-cross: take GOARM environment setting
  go: enable nativesdk builds for the toolchain
  go-crosssdk: add recipe
  go.bbclass: enable nativesdk builds for Go packages
  go-cross-canadian: add recipe

Otavio Salvador (9):
  goarch.bbclass: Stop passing True as second argument of d.getVar
  go.bbclass: Fix binary installation path detection
  go: Remove Go 1.6 and 1.7 releases
  goarch.bbclass: Add support for ARMv5
  go.bbclass: Use a global Go build flags
  go.bbclass: Enable parallel build
  go.bbclass: Use an auxiliary variable to add the build dependencies
  go-dep: Add 0.3.0 release
  go-helloworld: Use the Golang examples repository

Will Newton (1):
  goarch.bbclass: Replace logic for setting GOARM

 meta/classes/go.bbclass                            | 146 +++++++------
 meta/classes/goarch.bbclass                        |  27 ++-
 meta/recipes-devtools/go/go-1.4.inc                |  16 --
 ...alignment-for-the-.rel.plt-section-on-32-.patch |  33 ---
 .../go/go-1.4/016-armhf-elf-header.patch           |  24 ---
 ...ckport-cmd-link-support-new-386-amd64-rel.patch | 225 ---------------------
 meta/recipes-devtools/go/go-1.4/syslog.patch       |  62 ------
 meta/recipes-devtools/go/go-1.6.inc                |  19 --
 .../go/go-1.6/armhf-elf-header.patch               |  23 ---
 .../go/go-1.6/fix-cc-handling.patch                |  50 -----
 .../go/go-1.6/fix-target-cc-for-build.patch        |  17 --
 meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 ---
 .../go/go-1.6/split-host-and-target-build.patch    |  63 ------
 meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ------
 meta/recipes-devtools/go/go-1.7.inc                |  19 --
 .../go/go-1.7/armhf-elf-header.patch               |  23 ---
 .../go/go-1.7/fix-cc-handling.patch                |  50 -----
 .../go/go-1.7/fix-target-cc-for-build.patch        |  17 --
 meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 ---
 .../go/go-1.7/split-host-and-target-build.patch    |  62 ------
 meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ------
 meta/recipes-devtools/go/go-1.8.inc                |   6 +-
 .../go/go-1.8/make-goroot-precious.patch           |  21 ++
 .../go/go-1.8/set-gotooldir-during-bootstrap.patch |  17 ++
 .../recipes-devtools/go/go-bootstrap-native_1.4.bb |   3 -
 meta/recipes-devtools/go/go-common.inc             |   2 +-
 meta/recipes-devtools/go/go-cross-canadian.inc     |  64 ++++++
 meta/recipes-devtools/go/go-cross-canadian_1.8.bb  |   2 +
 meta/recipes-devtools/go/go-cross.inc              |  61 +++++-
 meta/recipes-devtools/go/go-cross_1.7.bb           |   5 -
 meta/recipes-devtools/go/go-cross_1.8.bb           |   5 +-
 meta/recipes-devtools/go/go-crosssdk.inc           |  55 +++++
 meta/recipes-devtools/go/go-crosssdk_1.8.bb        |   2 +
 meta/recipes-devtools/go/go-dep_0.3.0.bb           |  18 ++
 meta/recipes-devtools/go/go-native.inc             |  48 +++--
 meta/recipes-devtools/go/go-native_1.8.bb          |   1 -
 meta/recipes-devtools/go/go-runtime.inc            |  58 ++++++
 meta/recipes-devtools/go/go-runtime_1.8.bb         |   2 +
 meta/recipes-devtools/go/go-target.inc             |  54 +++++
 meta/recipes-devtools/go/go.inc                    |  81 --------
 meta/recipes-devtools/go/go_1.6.bb                 |   4 -
 meta/recipes-devtools/go/go_1.7.bb                 |   2 -
 meta/recipes-devtools/go/go_1.8.bb                 |   2 +-
 .../go-examples/files/helloworld.go                |  10 -
 meta/recipes-extended/go-examples/go-examples.inc  |  10 -
 .../go-examples/go-helloworld_0.1.bb               |  24 ++-
 46 files changed, 500 insertions(+), 1117 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.4.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
 create mode 100644 meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
 create mode 100644 meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch
 delete mode 100644 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian.inc
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.8.bb
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
 create mode 100644 meta/recipes-devtools/go/go-crosssdk.inc
 create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.8.bb
 create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb
 create mode 100644 meta/recipes-devtools/go/go-runtime.inc
 create mode 100644 meta/recipes-devtools/go/go-runtime_1.8.bb
 create mode 100644 meta/recipes-devtools/go/go-target.inc
 delete mode 100644 meta/recipes-devtools/go/go.inc
 delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.7.bb
 delete mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
 delete mode 100644 meta/recipes-extended/go-examples/go-examples.inc

-- 
2.14.1


