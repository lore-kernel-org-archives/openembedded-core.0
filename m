Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id A299B6010B;
	Wed, 18 Nov 2015 20:37:36 +0000 (UTC)
Received: by igvi2 with SMTP id i2so127367621igv.0;
	Wed, 18 Nov 2015 12:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=eFIHMXh+vPWrD8bbkWUatAs+qFbMUVzyv1EDhpZyUNA=;
	b=kTHDnYUDmf4mtiox/Ei8nMj0Q7Xxev0ubt/bOPxaD+/jpjjRO5nFMEkUmKZSUHmSvk
	Jo2W0j+AiQ17RIigk5df1mNpb87xX32CzYOhj1HlvjxoqImnAogobdl98LDOnmIMEwIS
	70etO5FkHElxghYUY86hAL1DGJUdvt16UdA/4O18Qk2YcVJP3NijRn9LuUwnZ/AZZ9EP
	AuYwswhp9ZHlqE4/jffPkvrurcO8DdK25kEkie0qzGZ9QVZZJKtw5FjE6nFl6fdPJQXw
	rkIc3r149C8N9N86wiUaY95l5gkeDNwg+ImVMHm6rWH06UjMWh7Y3SL29Ho9RRjxQA52
	akPw==
X-Received: by 10.50.6.104 with SMTP id z8mr10003792igz.58.1447879057239;
	Wed, 18 Nov 2015 12:37:37 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	x1sm10670575igl.14.2015.11.18.12.37.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 12:37:34 -0800 (PST)
Date: Wed, 18 Nov 2015 12:37:34 -0800 (PST)
X-Google-Original-Date: Wed, 18 Nov 2015 20:37:33 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1447879053597.5d181a57@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-11-08 until 2015-11-15
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
X-List-Received-Date: Wed, 18 Nov 2015 20:37:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-11-08 until 2015-11-15.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-bug: git://github.com/buglabs/meta-bug.git
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
meta-fsl-arm-extra: git://github.com/Freescale/meta-fsl-arm-extra.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-opie: git://git.openembedded.org/meta-opie
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
meta-slugos: git://github.com/kraj/meta-slugos
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-webos: git://github.com/openwebos/meta-webos.git
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-yocto: git://git.yoctoproject.org/meta-yocto
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Amarnath Valluri (2):
=20=20nginx: Add support for altering build configuration
=20=20nginx: Fix systemd service file

Hongxu Jia (2):
=20=20libmodule-build-perl: add 0.31
=20=20libhtml-tree-perl: add version 5.03

Jens Rehsack (1):
=20=20samba: systemv-init script must be executable

Martin Jansa (3):
=20=20Revert "luajit: Upgrade to 2.1 beta1"
=20=20ktap: add libelf PACKAGECONFIG also to ktap-module
=20=20snort: fix indentation

Wenzong Fan (1):
=20=20ntp: upgrade 4.2.8p3 -> 4.2.8p4

Zhiquan Li (1):
=20=20snort: fix m4 causes out of memory during configure

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (6):
=20=20busybox: enable chrt command
=20=20linux-ti-staging: localversion with latest commit is set in meta-ti =
now
=20=20linux-ti-staging-rt: enable copying defconfig and AUTOREV-ing
=20=20nativesdk-qtbase: drop locally applied patch that was upstreamed
=20=20arago.conf, arago-prefs: add ARAGO_RT_ENABLE and ARAGO_RT_SUFFIX =
variables
=20=20ltp-ddt: temporarily patch k2g support

Gou, Hongmei (7):
=20=20branding-processor-sdk: add back wayland DISTRO_FEATURES for ti43x
=20=20arago.conf: enable hardware mode weston for ti43x
=20=20qtbase: add wayland dependency for ti43x
=20=20img-pvr-sdk: modify BRANCH and SRCREV to update the demos for ti43x
=20=20kmscube: add support on ti43x
=20=20matrix-gui-3d-demos: add kmscube for ti43x
=20=20packagegroup-arago-tisdk-matrix: update the SGX demos for ti43x

Jacob Stiffler (4):
=20=20nativesdk-packagegroup-arago-sdk-host: Add ti-cgt-pru
=20=20arago-source-ipk: Enable pru-icss sourceipk
=20=20packagegroup-arago-tisdk-addons*: Add pru-icss
=20=20ti-tisdk-makefile: Add pru-icss makefile fragment

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Alexandre Belloni (2):
=20=20linux: add linux-at91-4.1
=20=20kernel: be more specific about defconfg kernel versions

Josh Wu (1):
=20=20gstreamer1.0-plugins-hantro: bump to version 1.1

Nicolas Ferre (2):
=20=20images: add dtc & dtdiff to images

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Max Krummenacher (6):
=20=20chromium: fix gcc5 compile issues
=20=20cef3_280796.bb: change indent to 4 spaces
=20=20cef3: fix gcc5 compile issues
=20=20cef3: fix build of x86-64
=20=20cef3: fix build with gcc 4.9.4
=20=20cef3: rework "fix build with gcc 4.9.4"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Fabio Berton (219):
=20=20chicken-egg-awful: Update to version 0.42.0
=20=20chicken-egg-comparse: Update to version 0.2.3
=20=20chicken-egg-dbus: Update to version 0.93
=20=20chicken-egg-http-client: Update to version 0.9
=20=20chicken-egg-intarweb: Update to version 1.5
=20=20chicken-egg-lazy-seq: Update to version 0.0.7
=20=20chicken-egg-medea: Update to version 0.1.8
=20=20chicken-egg-pastiche: Update to version 0.23
=20=20chicken-egg-sendfile: Update to version 1.7.31
=20=20chicken-egg-spiffy-request-vars: Update to version 0.18
=20=20chicken-egg-spiffy: Update to version 5.3.2
=20=20chicken-egg-test: Update to version 0.9.9.9
=20=20chicken-egg-utf8: Update to version 3.4.1
=20=20gen-egg-recipes: Add anaphora
=20=20chicken-egg-anaphora: Add recipe for version 0.7
=20=20chicken-egg-*: Update SRC_URI on existing recipes
=20=20chicken-egg-charconv: Update to version 1.3.6
=20=20chicken-egg-clojurian: Update to version 0.0.6
=20=20chicken-egg-iconv: Update to version 1.9
=20=20chicken-egg-numbers: Update to version 4.4
=20=20chicken-egg-openssl: Update to version 1.7.0
=20=20chicken-egg-setup-helper: Update to version 1.5.5
=20=20chicken-egg-sql-de-lite: Update to version 0.6.6
=20=20chicken-egg-srfi-42: Update to version 1.73
=20=20chicken-egg-srfi-99: Update to version 1.4.4
=20=20gen-egg-recipes: Add box egg
=20=20chicken-egg-box: Add recipe for version 2.3.2
=20=20gen-egg-recipes: Add datatype egg
=20=20chicken-egg-datatype: Add recipe for version 1.4
=20=20gen-egg-recipes: Add arrays egg
=20=20chicken-egg-arrays: Add recipe for version 0.1
=20=20Add autoload egg
=20=20chicken-egg-autoload: Add recipe for version 2.2
=20=20gen-egg-recipes: Add awk egg
=20=20chicken-egg-awk: Add recipe for version 1.7
=20=20gen-egg-recipes: Add bindings egg
=20=20chicken-egg-bindings: Add recipe for version 3.5.2.2
=20=20gen-egg-recipes: Add char-set-literals egg
=20=20chicken-egg-char-set-literals: Add recipe for version 0.3
=20=20chicken-egg-*: Update S on existing recipes
=20=20gen-egg-recipes: Add F-operator egg
=20=20chicken-egg-f-operator: Add recipe for version 2.0.4
=20=20gen-egg-recipes: Add to all-eggs all recipes that currently exist
=20=20gen-egg-recipes: Add continuations egg
=20=20chicken-egg-continuations: Add recipe for version 1.3
=20=20gen-egg-recipes: Add datatypes egg
=20=20chicken-egg-datatypes: Add recipe for version 1.2
=20=20gen-egg-recipes: Add condition-utils egg
=20=20chicken-egg-condition-utils: Add recipe for version 1.1.1
=20=20gen-egg-recipes: Add locale egg
=20=20chicken-egg-locale: Add recipe for version 0.6.13
=20=20gen-egg-recipes: Add posix-utils egg
=20=20chicken-egg-posix-utils: Add recipe for version 1.0.0
=20=20gen-egg-recipes: Add dbc egg
=20=20chicken-egg-dbc: Add recipe for version 1.0.3
=20=20gen-egg-recipes: Add hahn egg
=20=20chicken-egg-hahn: Add recipe for version 0.9.3
=20=20gen-egg-recipes: Add define-record-and-printer egg
=20=20chicken-egg-define-record-and-printer: Add recipe for version 0.1.4
=20=20gen-egg-recipes: Add nondeterminism egg
=20=20chicken-egg-nondeterminism: Add recipe for version 1.2
=20=20gen-egg-recipes: Add define-structure egg
=20=20chicken-egg-define-structure: Add recipe for version 2.2
=20=20gen-egg-recipes: Add environments egg
=20=20chicken-egg-environments: Add recipe for version 1.53
=20=20gen-egg-recipes: Add fast-loop egg
=20=20chicken-egg-fast-loop: Add recipe for version 0.4
=20=20gen-egg-recipes: Add feature-test egg
=20=20chicken-egg-feature-test: Add recipe for version 0.1
=20=20gen-egg-recipes: Add fluids egg
=20=20chicken-egg-fluids: Add recipe for version 1.1
=20=20gen-egg-recipes: Add foof-loop egg
=20=20chicken-egg-foof-loop: Add recipe for version 8.1
=20=20gen-egg-recipes: Add records egg
=20=20chicken-egg-records: Add recipe for version 1.3
=20=20gen-egg-recipes: Add interfaces egg
=20=20chicken-egg-interfaces: Add recipe for version 0.3
=20=20gen-egg-recipes: Add shell egg
=20=20chicken-egg-shell: Add recipe for version 0.3
=20=20gen-egg-recipes: Add moremacros egg
=20=20chicken-egg-moremacros: Add recipe for version 1.3.1
=20=20gen-egg-recipes: Add list-of egg
=20=20chicken-egg-list-of: Add recipe for version 0.1
=20=20gen-egg-recipes: Add list-utils egg
=20=20chicken-egg-list-utils: Add recipe for version 1.1.1
=20=20gen-egg-recipes: Add loop egg
=20=20chicken-egg-loop: Add recipe for version 1.4
=20=20gen-egg-recipes: Add loops egg
=20=20chicken-egg-loops: Add recipe for version 1.0.4
=20=20gen-egg-recipes: Add loopy-loop egg
=20=20chicken-egg-loopy-loop: Add recipe for version 0.5.4
=20=20gen-egg-recipes: Add module-declarations egg
=20=20chicken-egg-module-declarations: Add recipe for version 0.0.1
=20=20gen-egg-recipes: Add options egg
=20=20chicken-egg-options: Add recipe for version 0.2
=20=20gen-egg-recipes: Add r7rs egg
=20=20chicken-egg-r7rs: Add recipe for version 0.0.2
=20=20gen-egg-recipes: Add regex-case egg
=20=20chicken-egg-regex-case: Add recipe for version 1.2
=20=20gen-egg-recipes: Add regex-literals egg
=20=20chicken-egg-regex-literals: Add recipe for version 1.0.4
=20=20gen-egg-recipes: Add sandbox egg
=20=20chicken-egg-sandbox: Add recipe for version 1.8
=20=20gen-egg-recipes: Add schemeweb egg
=20=20chicken-egg-schemeweb: Add recipe for version 0.2
=20=20gen-egg-recipes: Add simple-exceptions egg
=20=20chicken-egg-simple-exceptions: Add recipe for version 0.1
=20=20gen-egg-recipes: Add special-case egg
=20=20chicken-egg-special-case: Add recipe for version 0.1
=20=20gen-egg-recipes: Add srfi-101 egg
=20=20chicken-egg-srfi-101: Add recipe for version 0.0.2
=20=20gen-egg-recipes: Add srfi-45 egg
=20=20chicken-egg-srfi-45: Add recipe for version 3.1.0
=20=20gen-egg-recipes: Add srfi-71 egg
=20=20chicken-egg-srfi-71: Add recipe for version 1.1
=20=20gen-egg-recipes: Add static-modules egg
=20=20chicken-egg-static-modules: Add recipe for version 1.8
=20=20gen-egg-recipes: Add s11n egg
=20=20chicken-egg-s11n: Add recipe for version 0.9.7
=20=20gen-egg-recipes: Add suspension egg
=20=20chicken-egg-suspension: Add recipe for version 0.4
=20=20gen-egg-recipes: Add syn-param egg
=20=20chicken-egg-syn-param: Add recipe for version 0.2
=20=20gen-egg-recipes: Add type-extensions egg
=20=20chicken-egg-type-extensions: Add recipe for version 0.0.1
=20=20gen-egg-recipes: Add typeclass egg
=20=20chicken-egg-typeclass: Add recipe for version 1.3
=20=20gen-egg-recipes: Add typed-lists egg
=20=20chicken-egg-typed-lists: Add recipe for version 2.2
=20=20gen-egg-recipes: Add typed-modules egg
=20=20chicken-egg-typed-modules: Add recipe for version 0.1
=20=20gen-egg-recipes: Add format egg
=20=20chicken-egg-format: Add recipe for version 3.1.6
=20=20gen-egg-recipes: Add animation egg
=20=20chicken-egg-animation: Add recipe for version 0.3.3
=20=20gen-egg-recipes: Add banterpixra egg
=20=20chicken-egg-banterpixra: Add recipe for version 0.1
=20=20gen-egg-recipes: Add cairo egg
=20=20chicken-egg-cairo: Add recipe for version 0.1.16
=20=20gen-egg-recipes: Add srfi-63 egg
=20=20chicken-egg-srfi-63: Add recipe for version 0.4
=20=20gen-egg-recipes: Add charplot egg
=20=20chicken-egg-charplot: Add recipe for version 0.5
=20=20gen-egg-recipes: Add fps egg
=20=20chicken-egg-fps: Add recipe for version 1.1.4
=20=20gen-egg-recipes: Add bind egg
=20=20chicken-egg-bind: Add recipe for version 1.5.2
=20=20gen-egg-recipes: Add coops egg
=20=20chicken-egg-coops: Add recipe for version 1.93
=20=20gen-egg-recipes: Add gl-math egg
=20=20chicken-egg-gl-math: Add recipe for version 0.8
=20=20gen-egg-recipes: Add z3 egg
=20=20chicken-egg-z3: Add recipe for version 1.44
=20=20gen-egg-recipes: Add fmt egg
=20=20chicken-egg-fmt: Add recipe for version 0.805
=20=20gen-egg-recipes: Add graphviz egg
=20=20chicken-egg-graphviz: Add recipe for version 0.8.2
=20=20gen-egg-recipes: Add groc egg
=20=20chicken-egg-groc: Add recipe for version 1.3
=20=20gen-egg-recipes: Add hexgrid egg
=20=20chicken-egg-hexgrid: Add recipe for version 0.1.3
=20=20gen-egg-recipes: Add hyperscene egg
=20=20chicken-egg-hyperscene: Add recipe for version 0.3.0
=20=20gen-egg-recipes: Add linden-scheme egg
=20=20chicken-egg-linden-scheme: Add recipe for version 0.1.4
=20=20gen-egg-recipes: Add octave egg
=20=20chicken-egg-octave: Add recipe for version 0.4
=20=20gen-egg-recipes: Add pdf egg
=20=20chicken-egg-pdf: Add recipe for version 1.0.3
=20=20gen-egg-recipes: Add qrencode egg
=20=20chicken-egg-qrencode: Add recipe for version 0.1.1
=20=20gen-egg-recipes: Add rfb egg
=20=20chicken-egg-rfb: Add recipe for version 0.3
=20=20gen-egg-recipes: Add parley egg
=20=20chicken-egg-parley: Add recipe for version 0.9.2
=20=20gen-egg-recipes: Add x11-colors egg
=20=20chicken-egg-x11-colors: Add recipe for version 1.0
=20=20gen-egg-recipes: Add xlib egg
=20=20chicken-egg-xlib: Add recipe for version 1.2
=20=20chicken-egg-spiffy: Update to version 5.4
=20=20gen-egg-recipes: Add xlib-utils egg
=20=20chicken-egg-xlib-utils: Add recipe for version 0.4.3
=20=20gen-egg-recipes: Add syslog egg
=20=20gen-egg-recipes: Add debug egg
=20=20chicken-egg-debug: Add recipe for version 0.3.16
=20=20gen-egg-recipes: Add dissector egg
=20=20chicken-egg-dissector: Add recipe for version 1.7.7
=20=20gen-egg-recipes: Add nrepl egg
=20=20chicken-egg-nrepl: Add recipe for version 0.1
=20=20gen-egg-recipes: Add combinator-birds egg
=20=20chicken-egg-combinator-birds: Add recipe for version 0.3
=20=20gen-egg-recipes: Add kanren egg
=20=20chicken-egg-kanren: Add recipe for version 4.505
=20=20gen-egg-recipes: Add schelog egg
=20=20chicken-egg-schelog: Add recipe for version 3.5
=20=20gen-egg-recipes: Add tiny-prolog egg
=20=20chicken-egg-tiny-prolog: Add recipe for version 2.0
=20=20gen-egg-recipes: Add 9p egg
=20=20chicken-egg-9p: Add recipe for version 0.9
=20=20gen-egg-recipes: Add bitcoin egg
=20=20chicken-egg-bitcoin: Add recipe for version 0.0.2
=20=20gen-egg-recipes: Add dict egg
=20=20chicken-egg-dict: Add recipe for version 2.8.0
=20=20gen-egg-recipes: Add ftp egg
=20=20chicken-egg-ftp: Add recipe for version 1.4
=20=20gen-egg-recipes: Add dsssl-utils egg
=20=20chicken-egg-dsssl-utils: Add recipe for version 2.0.1
=20=20gen-egg-recipes: Add hostinfo egg
=20=20chicken-egg-hostinfo: Add recipe for version 1.4
=20=20gen-egg-recipes: Add irc egg
=20=20chicken-egg-irc: Add recipe for version 1.9.8
=20=20gen-egg-recipes: Add memcached egg
=20=20chicken-egg-memcached: Add recipe for version 1.3
=20=20gen-egg-recipes: Add pop3 egg
=20=20chicken-egg-pop3: Add recipe for version 1.5
=20=20gen-egg-recipes: Add tcp-server egg
=20=20chicken-egg-tcp-server: Add recipe for version 1.2
=20=20gen-egg-recipes: Add rpc egg
=20=20chicken-egg-rpc: Add recipe for version 1.1.2

Mario Domenech Goulart (11):
=20=20gen-egg-recipes: support henrietta-cache's new cache directory layout
=20=20gen-egg-recipes: respect egg name capitalization when generating =
SRC_URI
=20=20gen-egg-recipes: respect egg name capitalization when generating "S"
=20=20gen-egg-recipes: use lowercase egg names for recipe names
=20=20gen-egg-list: generate list of nativesdk eggs
=20=20all-chicken-egg-recipes.inc: update with the list of eggs so far
=20=20gen-egg-recipes: typo fix (s/data-strucutures/data-structures/)
=20=20gen-egg-recipes: generate recipes for all eggs, except those in =
skip-eggs
=20=20gen-egg-recipes: add license mappings for "GPL-2 or later" and "Free =
Use"
=20=20gen-egg-recipes: handle line breaks in egg synopsis
=20=20gen-egg-recipes: add all obsolete eggs to skip-eggs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Otavio Salvador (2):
=20=20linux-fslc: Upgrade to 4.3-based kernel
=20=20Revert "linux-fslc: Upgrade to 4.3-based kernel"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Ian Coolidge (1):
=20=20u-boot-script-boundary: Bump SRCREV to 4221d72

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Zhenhua Luo (1):
=20=20linux-qoriq: fix the kernel hang issue with gcc-5.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kinsella, Ray (1):
=20=20mkgalileodisk.wks: WiC image for Galileo Gen 1/2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (2):
=20=20mono: add support for 4.2.1.102
=20=20README: update release notes link/testing of 4.2.1.102 on qemux86

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Andreas M=C3=BCller (1):
=20=20qtbase: add glib to PACKAGECONFIG_X11

Martin Jansa (9):
=20=20qt5: upgrade to latest revision in 5.6 branch (5.6.0-alpha1+)
=20=20qtsvg: fix incorrect heart.svg installation path
=20=20qttranslations: add ${PN}-qtserialport
=20=20qtwebengine: bump SRCREV and re-add =
0003-functions.prf-allow-build-for-linux
=20=20qtwebengine: add dependency on libxscrnsaver with x11 in =
DISTRO_FEATURES
=20=20qtwebengine: fix QMAKE_AR variable
=20=20qtwebengine: add dependency on yasm-native and use it
=20=20qtwebengine: disable autodetection from sysroot
=20=20qt5-creator: upgrade to 3.5.1

Samuli Piippo (2):
=20=20qtbase: include oe-device-extra.pri unconditionally
=20=20qtwayland: remove unnecessary header install

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (12):
=20=20omap5-sgx-ddk-um-linux: explicitly specify RDEPENDS on libdrm
=20=20linux-ti-staging: update to the latest
=20=20linux-ti-staging-rt: introduce RT version of staging kernel
=20=20multi-kernel: don't fail removing symlinks when config or commit =
changes
=20=20u-boot-ti-staging: update to the latest, change am57/x15 defconfig =
name
=20=20linux-ti-staging: update to 4.1.13, add am571-idk DTB
=20=20kselftests: make machine-specific due to kernel-specific conditionals
=20=20ti-ipc: update to 3.41.00.02-eng
=20=20u-boot-ti-staging: update with latest fixes, including Keystone builds
=20=20ti-ipc: add k2g platform variables
=20=20HACK: ti-ipc: temporarily use k2e variables for k2g platform
=20=20cppi, qmss, traceframework: set sane defaults when platform is not =
defined

Gou, Hongmei (3):
=20=20omapdrm-pvr: disable PVR_NULLDRM to support DRI_DRM for AM4
=20=20omap5-sgx-ddk-um-linux: bump SRCREV and other changes to support =
wayland/DRM
=20=20omap5-sgx-ddk-um-linux: bump SRCREV and update powervr.ini and .so =
inclusion

Jacob Stiffler (2):
=20=20pru-icss: install multiple example firmwares
=20=20linux: cmem: k2hk-evm: Reduce reserved memory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



