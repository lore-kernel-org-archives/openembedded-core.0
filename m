Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id B2F846B54F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 02:33:31 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id g62so17548005pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 18:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XztepxtucIWHqjnlZ9vGMxE/TZONOjod/0eAhuT69qw=;
	b=sRiT1uSUrfebIrq0himE5W/pUG6PVFU5cA+pbdSYbBHS3p9nk1bxDdf9zhvfYsBY0b
	zJbcNFpOpzMNP4dO2wPFn0Tq+DnLxyGxcbzrz/8+FtDVIvRDEBS3EIzRV/iwbeNEMXt0
	yMmgByFiQPMDEimDfoT0x+yLEp2VXiZ927wPMXbD0nLxe+nof8gRShZN8NOEUlT1UDJK
	8e+4cy/eQa6TYALMNrxMo9egZtYXM12t/CraugNkQM0B/SFwTS/q6jXzchO/LGkuvG2W
	KdLm8BSEjU5WvtQWHnF2VADLTOCPCYKaDRpa90EncCs55PKlPkxUoM63ZxVPJ8emFrKp
	W/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XztepxtucIWHqjnlZ9vGMxE/TZONOjod/0eAhuT69qw=;
	b=kCh/5UBonqYkvSqftyBvEnZcbzF8IwQjYuPna3oRqdi/YYixCfPQkpYGo46QHqM+MX
	LV57bZK1VhLfLusIg11hn8rhcnE1ZLhCGFl4JD+kbMSOzF9QPSHVWyOjkdXuT7XwzN43
	9ps2XhbPLXxt3svFqJijuPn/B8N/g8ROhnF0t4q27k20BepPNgvi8v1w4iQUGpeYdgp2
	isfI0gpuNbrjHuc7Z93Rk7psLckI5boQDqZp7rcIzNqT4AKZL71ecZ091eFajMNzf2Tf
	8J066GpTkD0ZNKJYuP8X75mkbqlWIXE5h/6yfpOSKoIG/MZuhJcIIhWJOsXdsl2V3999
	DNqg==
X-Gm-Message-State: AJcUukcktSPaJdIefBjyfhUG4jVUQj1/f/si+bmDxaIooYgqrnU7MYI5
	qU9WWtQ/loMmqCi1jMtcHOg=
X-Google-Smtp-Source: ALg8bN6kNjZOrmon3+N9UpJA9svZuRe1xdo6owp6S6YdjTfO5q88UvX1HAeA+MqK8gZv4tk4uBG+lg==
X-Received: by 2002:a63:134f:: with SMTP id 15mr128954pgt.19.1546569212260;
	Thu, 03 Jan 2019 18:33:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7144:30fa:a7a1:7688])
	by smtp.gmail.com with ESMTPSA id
	62sm67821168pgc.61.2019.01.03.18.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Jan 2019 18:33:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2019 18:31:37 -0800
Message-Id: <cover.1546568791.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 000/101][thud] Pull request
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
X-List-Received-Date: Fri, 04 Jan 2019 02:33:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review and concider these changes for the next thud release 2.6.1

Package updates are bug fix only.

Clean A-quick build

The following changes since commit 004ec4fb4de5648db9aafcbd2f8dbe24a8b5f9d6:

  Documentation: Prepare for 2.6.1 release. (2018-12-27 22:54:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stable/thud-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/thud-next

Adrian Bunk (1):
  archiver.bbclass: Fix COPYLEFT_LICENSE_{IN, EX}CLUDE

Adrian Freihofer (2):
  systemd: fix PN-container package splitting
  devtool: fix target-deploy --strip

Alejandro Enedino Hernandez Samaniego (1):
  python: Adds instructions to the manifest file

Alexander Kanavin (3):
  meson: do not manipulate the environment when looking for python via
    pkg-config
  openssl: update to 1.1.1a
  libc-package: fix postinst error when ENABLE_BINARY_LOCALE_GENERATION
    = "0"

Alexey Brodkin (1):
  gdb: Remove long ago upstreamed patch

André Draszik (1):
  linux-firmware: better packaging for TI wl12xx & wl18xx firmwares

Anuj Mittal (13):
  maintainers.inc: update Intel owners
  gst-plugins-bad: add PACKAGECONFIG for msdk
  gstreamer1.0: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-plugins-base: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-plugins-good: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-plugins-bad: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-plugins-ugly: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-libav: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-vaapi: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-rtsp-server: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-omx: upgrade 1.14.3 -> 1.14.4
  gstreamer1.0-python: upgrade 1.14.3 -> 1.14.4
  gst-validate: upgrade 1.14.2 -> 1.14.4

Armin Kuster (1):
  gnutls: update to 3.6.4

Bruce Ashfield (13):
  linux-yocto: remove obselete options from lxc config
  linux-yocto/4.14: configuration cleanups
  linux-yocto/4.18: -rt sync and config cleanups
  linux-yocto/tiny: switch default branch to standard/tiny/base
  linux-yocto/tiny: restore qemuarm support
  linux-yocto/4.18: bug fixes and configuration tweaks
  linux-yocto/4.18: update to v4.18.17
  linux-yocto/4.14: update to v4.14.79
  linux-yocto/4.18: integrate CVE fixes
  linux-yocto/4.18: update to v4.18.20
  linux-yocto/4.18: update to v4.18.21
  linux-yocto: configuration updates (virtio and tpm)
  linux-yocto: correct qemumips64el definition

Carlos Rafael Giani (10):
  gstreamer1.0: upgrade to version 1.14.3
  gstreamer1.0-plugin-base: upgrade to version 1.14.3
  gstreamer1.0-plugin-good: upgrade to version 1.14.3
  gstreamer1.0-plugin-bad: upgrade to version 1.14.3
  gstreamer1.0-plugin-ugly: upgrade to version 1.14.3
  gstreamer1.0-libav: upgrade to version 1.14.3
  gstreamer1.0-rtsp-server: upgrade to version 1.14.3
  gstreamer1.0-vaapi: upgrade to version 1.14.3
  gstreamer1.0-omx: upgrade to version 1.14.3
  gstreamer1.0-python: upgrade to version 1.14.3

Changhyeok Bae (2):
  iproute2: 4.18.0 -> 4.19.0
  ethtool: 4.17 -> 4.19

Christophe PRIOUZEAU (1):
  openssl: correct bad path on package preprocess

Douglas Royds (4):
  boost-context: Reproducibility: Set .file section for all *_elf_gas.S
    files
  reproducible: Refactor: Break out fixed_source_date_epoch() function
  reproducible: Don't look for youngest file when no source tarball
  ptest: Reproducibility: Take control of umask

Eric Chanudet (1):
  licence: Add license file CC-BY-SA-4.0

Hongxu Jia (6):
  elfutils: 0.174 -> 0.175
  gnupg: upgrade 2.2.9 -> 2.2.10
  gnupg: upgrade 2.2.10 -> 2.2.11
  libgcrypt: upgrade 1.8.3 -> 1.8.4
  ghostscript: 9.25 -> 9.26
  go 1.9/1.11: fix textrel qa warning for non mips arch

Joshua Watt (3):
  meta/icecc.bbclass: Move system blacklist to variables
  meta/icecc.bbclass: Update system blacklists
  classes/icecc.bbclass: Fix ccache disable

Kai Kang (1):
  multilib_script: fix packages split

Khem Raj (3):
  local.conf.sample: Update the sample config as per new migration
    manual
  valgrind: Skip vgpreload_memcheck shared object from stripping
  populate_sdk_ext.bbclass: Include site.conf in parsing for contents
    for local.conf

Ming Liu (1):
  image.bbclass: fix a wrong position blank

Mingli Yu (2):
  mdadm: improve the run-ptest
  nspr: improve reproducibility

Niko Mauno (1):
  opkg-utils: Fix update-alternatives link relocation

Otavio Salvador (1):
  linux-firmware: Bump revision to 1baa348

Paul Eggleton (1):
  socat: fix LICENSE

Peter Kjellerstedt (2):
  bitbake: siggen: Adapt colors used by bitbake-diffsigs to support
    light themes
  meson: Correct use of the _append operator

Richard Purdie (7):
  poky.conf: Update the distros we test against on the autobuilder
  meson: Disable rpath stripping at install time
  bitbake: server/process: Make lockfile handling clearer
  bitbake: server/process: Show last 60 lines of the log if the server
    didn't start
  bitbake: server/process: Show the last 60 log lines, not the last 10
  scripts/runqemu: Fix logic error causing failures with MACHINE from
    the environment
  meta-selftest/error: Cleanup large trailing whitespace

Robert Yang (5):
  classes: Remove tab indentations in python code
  recipes: Remove tab indentations in python code
  bugzilla.bbclass: Remove it since obsoleted
  sstate.bbclass: Only remove sstate file when task is existed
  bitbake: server/process: print a message when no logfile

Ross Burton (12):
  bitbake: layerindex: don't use shell=True when cloning
  bitbake: fetch: don't use shell=True when listing ar files
  cpio: fix crash when appending to archives
  image_types: use cpio-native to build cpio images
  libtasn1: no need to inherit binconfig
  binconfig: only try to mangles files
  piglit: add missing waffle-bin dependency
  ruby: upgrade 2.5.1 -> 2.5.3
  insane: Clarify GNU_HASH warning
  patchreview: Various fixes/improvements
  python3: don't cripple target distutils
  python3: drop redundant patch

Zheng Ruoqin (2):
  nss: Fix SHA_HTONL bug for arm 32be.
  createrepo-c: Fix setup of logging (log domains)

 bitbake/lib/bb/fetch2/__init__.py                  |   2 +-
 bitbake/lib/bb/server/process.py                   |  24 +-
 bitbake/lib/bb/siggen.py                           |   8 +-
 bitbake/lib/bblayers/layerindex.py                 |   2 +-
 meta-poky/conf/distro/poky.conf                    |   8 +-
 meta-poky/conf/local.conf.sample                   |  10 +-
 meta-selftest/recipes-test/error/error.bb          |   2 +-
 meta/classes/archiver.bbclass                      |   3 -
 meta/classes/binconfig.bbclass                     |   6 +-
 meta/classes/bugzilla.bbclass                      | 187 ---------
 meta/classes/crosssdk.bbclass                      |   4 +-
 meta/classes/icecc.bbclass                         |  41 +-
 meta/classes/image.bbclass                         |   2 +-
 meta/classes/image_types.bbclass                   |   1 +
 meta/classes/insane.bbclass                        |   2 +-
 meta/classes/libc-package.bbclass                  |  10 +-
 meta/classes/license.bbclass                       |   2 +-
 meta/classes/linux-kernel-base.bbclass             |   4 +-
 meta/classes/multilib_script.bbclass               |   4 +-
 meta/classes/populate_sdk_ext.bbclass              |   5 +
 meta/classes/ptest.bbclass                         |   1 +
 meta/classes/reproducible_build.bbclass            |  22 +-
 meta/classes/siteconfig.bbclass                    |  18 +-
 meta/classes/sstate.bbclass                        |   5 +-
 meta/conf/distro/include/maintainers.inc           | 170 ++++----
 meta/conf/licenses.conf                            |   2 +-
 meta/files/common-licenses/CC-BY-SA-4.0            | 428 ++++++++++++++++++++
 .../{iproute2_4.18.0.bb => iproute2_4.19.0.bb}     |   4 +-
 .../openssl/openssl/0002-fix-CVE-2018-0734.patch   | 108 -----
 .../openssl/openssl/0003-fix-CVE-2018-0735.patch   |  50 ---
 .../openssl/openssl10_1.0.2p.bb                    |   6 +-
 .../{openssl_1.1.1.bb => openssl_1.1.1a.bb}        |   6 +-
 meta/recipes-connectivity/socat/socat_1.7.3.2.bb   |   2 +-
 meta/recipes-core/busybox/busybox.inc              |  42 +-
 meta/recipes-core/coreutils/coreutils_8.30.bb      |   8 +-
 .../images/build-appliance-image_15.0.0.bb         |   6 +-
 meta/recipes-core/systemd/systemd_239.bb           |  61 ++-
 ...etup-of-logging-log-domains-RhBug-1645897.patch |  73 ++++
 .../createrepo-c/createrepo-c_git.bb               |   1 +
 .../{elfutils_0.174.bb => elfutils_0.175.bb}       |  24 +-
 ...01-arlib-Check-that-sh_entsize-isn-t-zero.patch |  36 --
 ...Sanity-check-partial-core-file-data-reads.patch |  60 ---
 .../0001-size-Handle-recursive-ELF-ar-files.patch  |  40 --
 .../files/0005-fix-a-stack-usage-warning.patch     |  35 --
 ...de-alternatives-for-glibc-assumptions-hel.patch |  14 +-
 ...ferences-between-mips-machine-identifiers.patch |   5 +-
 .../files/debian/0001-fix-gcc7-ftbfs.patch         |  57 ---
 .../debian/0001-testsuite-ignore-elflint.patch     |  57 ---
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   5 +-
 .../0003-Add-mips-n64-relocation-format-hack.patch |  41 +-
 .../{0001-arm_backend.patch => arm_backend.diff}   | 342 ++++++++--------
 ...1-disable_werror.patch => disable_werror.patch} |  29 +-
 .../{0001-hppa_backend.patch => hppa_backend.diff} | 174 ++++-----
 .../elfutils/files/debian/hurd_path.patch          |  16 +
 .../elfutils/files/debian/kfreebsd_path.patch      |  19 +
 .../{0001-mips_backend.patch => mips_backend.diff} | 139 +++----
 ...1-mips_readelf_w.patch => mips_readelf_w.patch} |  26 +-
 meta/recipes-devtools/gdb/gdb-8.2.inc              |   1 -
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  |  29 --
 meta/recipes-devtools/go/go-1.11.inc               |   1 +
 .../0008-use-GOBUILDMODE-to-set-buildmode.patch    |  40 ++
 meta/recipes-devtools/go/go-1.9.inc                |   1 +
 .../0011-use-GOBUILDMODE-to-set-buildmode.patch    |  40 ++
 meta/recipes-devtools/go/go_1.11.bb                |  12 +
 meta/recipes-devtools/go/go_1.9.bb                 |  16 +-
 meta/recipes-devtools/meson/meson.inc              |   9 +-
 ...01-Support-building-allarch-recipes-again.patch |  13 +-
 ...le-do-not-manipulate-the-environment-when.patch |  43 ++
 .../meson/meson/disable-rpath-handling.patch       |  26 ++
 ...-alternatives-Fix-link-relocation-support.patch |  40 ++
 .../opkg-utils/opkg-utils_0.3.6.bb                 |   1 +
 .../python/python-native_2.7.15.bb                 |   6 +-
 .../python/python/create_manifest2.py              |  21 +-
 .../python/python/python2-manifest.json            |  90 +++++
 .../python/python3-native_3.5.6.bb                 |   1 -
 .../python3/070-dont-clean-ipkg-install.patch      |  38 --
 meta/recipes-devtools/python/python3_3.5.6.bb      |   4 +-
 meta/recipes-devtools/python/python_2.7.15.bb      |   6 +-
 .../ruby/{ruby_2.5.1.bb => ruby_2.5.3.bb}          |   4 +-
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb  |  13 +
 .../cpio-2.12/0001-Fix-segfault-with-append.patch  |  87 +++++
 meta/recipes-extended/cpio/cpio_2.12.bb            |   1 +
 .../ethtool/ethtool/avoid_parallel_tests.patch     |   2 +-
 .../ethtool/{ethtool_4.17.bb => ethtool_4.19.bb}   |   4 +-
 ...add-operand-checking-to-.setnativefontmap.patch |  59 ---
 ...Improve-hiding-of-security-critical-custo.patch | 434 ---------------------
 ...32-add-control-over-hiding-error-handlers.patch | 172 --------
 ...operators-pass-a-name-object-to-error-han.patch | 105 -----
 ...-699938-.loadfontloop-must-be-an-operator.patch |  31 --
 ...define-some-additional-internal-operators.patch |  42 --
 ...don-t-include-operator-arrays-in-execstac.patch | 197 ----------
 ...put-unavailable-from-.policyprocs-helper-.patch | 245 ------------
 .../{ghostscript_9.25.bb => ghostscript_9.26.bb}   |  14 +-
 meta/recipes-extended/mdadm/files/run-ptest        |  25 +-
 .../net-tools/net-tools_1.60-26.bb                 |   8 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |   2 +-
 .../linux-firmware/linux-firmware_git.bb           |  21 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  13 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      |  20 +-
 ...t-validate_1.14.2.bb => gst-validate_1.14.4.bb} |   4 +-
 ...ibav_1.14.2.bb => gstreamer1.0-libav_1.14.4.bb} |   4 +-
 ....0-omx_1.14.2.bb => gstreamer1.0-omx_1.14.4.bb} |   4 +-
 ....14.2.bb => gstreamer1.0-plugins-bad_1.14.4.bb} |   8 +-
 ...14.2.bb => gstreamer1.0-plugins-base_1.14.4.bb} |   4 +-
 ...14.2.bb => gstreamer1.0-plugins-good_1.14.4.bb} |   4 +-
 ...14.2.bb => gstreamer1.0-plugins-ugly_1.14.4.bb} |   4 +-
 ...hon_1.14.2.bb => gstreamer1.0-python_1.14.4.bb} |   4 +-
 ....14.2.bb => gstreamer1.0-rtsp-server_1.14.4.bb} |   4 +-
 ...aapi_1.14.2.bb => gstreamer1.0-vaapi_1.14.4.bb} |   4 +-
 ...treamer1.0_1.14.2.bb => gstreamer1.0_1.14.4.bb} |   4 +-
 ...e_x86_64_sysv_elf_gas.S-set-.file-section.patch |  48 ---
 ...ucibility-add-file-directive-to-assembler.patch | 243 ++++++++++++
 meta/recipes-support/boost/boost_1.68.0.bb         |   2 +-
 ...c-use-a-custom-value-for-the-location-of-.patch |   4 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch    |  12 +-
 .../gnupg/{gnupg_2.2.9.bb => gnupg_2.2.11.bb}      |   4 +-
 .../gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb}    |   4 +-
 meta/recipes-support/gnutls/libtasn1_4.13.bb       |   2 +-
 .../{libgcrypt_1.8.3.bb => libgcrypt_1.8.4.bb}     |   4 +-
 ...e.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch | 103 +++++
 meta/recipes-support/nspr/nspr_4.19.bb             |   1 +
 .../nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch   |  34 ++
 meta/recipes-support/nss/nss_3.39.bb               |   1 +
 scripts/contrib/patchreview.py                     |  46 ++-
 scripts/lib/devtool/deploy.py                      |   2 +-
 scripts/runqemu                                    |   5 +-
 130 files changed, 2145 insertions(+), 2854 deletions(-)
 delete mode 100644 meta/classes/bugzilla.bbclass
 create mode 100644 meta/files/common-licenses/CC-BY-SA-4.0
 rename meta/recipes-connectivity/iproute2/{iproute2_4.18.0.bb => iproute2_4.19.0.bb} (72%)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1.bb => openssl_1.1.1a.bb} (96%)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch
 rename meta/recipes-devtools/elfutils/{elfutils_0.174.bb => elfutils_0.175.bb} (76%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
 rename meta/recipes-devtools/elfutils/files/debian/{0001-arm_backend.patch => arm_backend.diff} (85%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-disable_werror.patch => disable_werror.patch} (46%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-hppa_backend.patch => hppa_backend.diff} (90%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
 rename meta/recipes-devtools/elfutils/files/debian/{0001-mips_backend.patch => mips_backend.diff} (91%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-mips_readelf_w.patch => mips_readelf_w.patch} (48%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
 create mode 100644 meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
 create mode 100644 meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch
 delete mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
 rename meta/recipes-devtools/ruby/{ruby_2.5.1.bb => ruby_2.5.3.bb} (93%)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
 rename meta/recipes-extended/ethtool/{ethtool_4.17.bb => ethtool_4.19.bb} (88%)
 delete mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-699795-add-operand-checking-to-.setnativefontmap.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-699816-Improve-hiding-of-security-critical-custo.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0003-Bug-699832-add-control-over-hiding-error-handlers.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0004-For-hidden-operators-pass-a-name-object-to-error-han.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0005-Bug-699938-.loadfontloop-must-be-an-operator.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0006-Undefine-some-additional-internal-operators.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0007-Bug-699927-don-t-include-operator-arrays-in-execstac.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0008-Make-.forceput-unavailable-from-.policyprocs-helper-.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.25.bb => ghostscript_9.26.bb} (83%)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.14.2.bb => gst-validate_1.14.4.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.14.2.bb => gstreamer1.0-libav_1.14.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.14.2.bb => gstreamer1.0-omx_1.14.4.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.2.bb => gstreamer1.0-plugins-bad_1.14.4.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.14.2.bb => gstreamer1.0-plugins-base_1.14.4.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.14.2.bb => gstreamer1.0-plugins-good_1.14.4.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.14.2.bb => gstreamer1.0-plugins-ugly_1.14.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.14.2.bb => gstreamer1.0-python_1.14.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.14.2.bb => gstreamer1.0-rtsp-server_1.14.4.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.14.2.bb => gstreamer1.0-vaapi_1.14.4.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.14.2.bb => gstreamer1.0_1.14.4.bb} (96%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch
 create mode 100644 meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
 rename meta/recipes-support/gnupg/{gnupg_2.2.9.bb => gnupg_2.2.11.bb} (92%)
 rename meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} (93%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.3.bb => libgcrypt_1.8.4.bb} (93%)
 create mode 100644 meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
 create mode 100644 meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch

-- 
2.7.4


