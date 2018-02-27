Return-Path: <matt@madison.systems>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8913E786D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:36:51 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 93-v6so694267plc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9wP4FfTc+fwqexKRA3mxMX6KvZV1UeFLuFlB/0GFWFM=;
	b=vEAnB6csxLWowpWnEnwZ7fKPjowNNFPRwBqGXR8AEwewUd6M3uIymWVjJU8jjAsWnu
	mmlgmZsmTL6zlNRNT6beA456CUJ+jn6bpFDQ8xnr2Ao2UD4rHTlHrDZp0MNXp3tJhwLW
	zUXuFYU4YheQQTQHqBuYQY5kJyiiOe894aoLgsFUC4hgGLOWwBzbiNpDSf868GdLKMf8
	qnUqCKIg0F/Ks1IuJPijoQ+r/iuy+fOXXpngvUwMJq9piWS/ooIaN8P83EVpkTFo1Sil
	XqB2Y5jqiN8pa72OY0chYda0igpQCP6zNxtOTjLc1HnXemZ8Yai8z6AjTnejNpWr8bgh
	/nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9wP4FfTc+fwqexKRA3mxMX6KvZV1UeFLuFlB/0GFWFM=;
	b=HDHUBRCPlfyw3FRgCii9sHS7BTdv5V/ocmDy1/Xp9GgmR2LnaC+Cs8lYr/roIIXBip
	Sjo7vzGzEqaU9JOgEsfivbJEZ7FtD3hko+K4xwLXHHu+puw4BdYEiKsPrXjWrObqcrZU
	8mOnFUAPlWumvT27oIa2AWMJKRLtMj7hcOueFs92kA5v5/mTX/Q8AKtqyOuX+pTJklz/
	irt5994neZzH8Vdm2YR++U7bUxGnwi3wfEAhBHps0vLKzwY9l9/bj0XNpijyQARCOI9J
	3kiLQcsVDQ8wjpviDOOsKuLmLwvcvomHN97Bf5u4eYq7VoVBR6x1mK5AoO1KcQX+rojZ
	OI2g==
X-Gm-Message-State: APf1xPDXPy/364+AYdekBJb3OpEtyqlh02zHU2+bWDD/dVqssCOudxQQ
	H81nUY2ug65TinoJPI2YXjsDLaLh
X-Google-Smtp-Source: AH8x225u4vU/yoiSsd73OSJrUmRGHFA0cRf7gppVQ8v/gUwKZjhGORWtzQT5kK00BZu3s6kJWjCFPg==
X-Received: by 2002:a17:902:26:: with SMTP id
	35-v6mr14216441pla.42.1519735012392; 
	Tue, 27 Feb 2018 04:36:52 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:36:51 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:26 -0800
Message-Id: <20180227123634.2812-1-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH v2 0/8] go1.10 update and misc improvements
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
X-List-Received-Date: Tue, 27 Feb 2018 12:36:52 -0000

New in v2:
    * Fixed Upstream-Status line in go patches
    * Added GOTMPDIR to do_configure[dirs]

Updates to the go recipes and bbclasses for go1.10, which
moves the bulk of the toolchain bootstrap and build out
of the 'make.bash' script and to the 'dist' tool.  This
required a rework of the patches.

go1.10 introduces significant changes to the go build
tool as well, requiring some further patches to make
it work for OE builds.

See https://golang.org/doc/go1.10 for a complete list
of new features and changes.

Following the update are some cleanup/improvement
patches.


Matt Madison (8):
  go: update go 1.9 -> go 1.10
  go: set GOMIPS envrionment variable
  go.bbclass: rename GO_TMPDIR -> GOTMPDIR
  go.bbclass: remove debug-related commands
  go.bbclass: don't stage test data with sources
  go.bbclass: ptest cleanup and improvements
  goarch.bbclass: disable shared runtime for nativesdk builds
  go: move common settings to go-common.inc

 meta/classes/go.bbclass                            | 105 ++++----
 meta/classes/goarch.bbclass                        |  12 +
 meta/recipes-devtools/go/go-1.10.inc               |  21 ++
 ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  49 ++++
 ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
 ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
 .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
 ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
 ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++++++++
 ...07-cmd-go-make-GOROOT-precious-by-default.patch |  97 ++++++++
 ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
 meta/recipes-devtools/go/go-1.9.inc                |  26 --
 .../0001-make.bash-quote-CC_FOR_TARGET.patch       |  32 ---
 ...CC-and-CXX-environment-variable-construct.patch |  67 -----
 ...sh-better-separate-host-and-target-builds.patch |  92 -------
 ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch |  68 -----
 ...05-cmd-go-make-GOROOT-precious-by-default.patch |  41 ---
 ...dd-GOTOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ---
 .../0007-ld-add-soname-to-shareable-objects.patch  |  46 ----
 ...dd-GOHOSTxx-indirection-for-cross-canadia.patch |  33 ---
 ...dmode-pie-forces-external-linking-mode-on.patch |  47 ----
 ...verride-CC-when-building-dist-and-go_boot.patch |  43 ----
 .../go/go-1.9/set-external-linker.patch            | 111 ---------
 meta/recipes-devtools/go/go-common.inc             |   6 +
 meta/recipes-devtools/go/go-cross-canadian.inc     |  26 +-
 ...s-canadian_1.9.bb => go-cross-canadian_1.10.bb} |   0
 meta/recipes-devtools/go/go-cross.inc              |  56 ++---
 .../go/{go-cross_1.9.bb => go-cross_1.10.bb}       |   0
 meta/recipes-devtools/go/go-crosssdk.inc           |  14 +-
 .../go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} |   0
 meta/recipes-devtools/go/go-native.inc             |  25 +-
 .../go/{go-native_1.9.bb => go-native_1.10.bb}     |   0
 meta/recipes-devtools/go/go-runtime.inc            |  58 ++---
 .../go/{go-runtime_1.9.bb => go-runtime_1.10.bb}   |   0
 meta/recipes-devtools/go/go-target.inc             |  20 +-
 meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} |   0
 36 files changed, 1110 insertions(+), 799 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.10.inc
 create mode 100644 meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch
 rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb => go-cross-canadian_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.9.bb => go-cross_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.9.bb => go-native_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.9.bb => go-runtime_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} (100%)

-- 
2.14.1


