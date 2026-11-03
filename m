Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2569.1793747234975837780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 15:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=P9PHMP6P;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so47832f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 15:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793747233; x=1794352033; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9kE1fqTGdINb8EulisdUjPQ+qss8Td3PmozeqBN0sA=;
        b=P9PHMP6P/gje8Mwap/qJv/TL56U8pAVIoc2+J/Q6HZ0ryc3lF6VhvyNsm9T6CaoKbw
         wX8D2mvQDL9cN1GZpNlLHfR16zi9wUF1hghvZFQVxUmzvYLqYMCzZQ6CB8/BcT+ywMY2
         t8yT1iNBlQdaUmnfmeAVoZiJ+8RQTzO6BDS0RRmHSP3t7RKzvGnpiB68QYPOxWPl7Lf+
         eO33ayTgfACT6b/SooxU6z+k36Fvl8bSLoZyNqvv3tKgBz1HEvsOXLFfjK4MIW7zmq3/
         eFXQg9sc19wPeJ8eiWz5z07/CWy3I4eel+MpLH9L6x7C/M4+SeYZQX0R4i5Z5FIsijjE
         dsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747233; x=1794352033;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9kE1fqTGdINb8EulisdUjPQ+qss8Td3PmozeqBN0sA=;
        b=j4hfpOVk+CY02HUZ3EQUUybY0xc20KYDSN7OHhrTmBniMQy73olaB10EyCEmEQ9bR0
         UATW5jsEWqoxdFu+1n8TyuQ9lJStkcfDvDw2LgfKpuOlGukKKDRFPppc3ZbRD2wdrqjM
         KCX2F6bbROvcwMm9u8RpcXMeDnFvqwDAhx+VflFARg4/AkbvG5ocx9ANtLD8P1Dm3TpX
         XJnYOouOJ2mOxrLkLGm4rAF50n/nhdeR5caJAvfQfOqsjl0bbBKhoCsUj2aaje67VxM4
         iHNU4+TnMG2tqW4/TBn0S56tefsqKbkGS2cYDy2FVktlTtqDmNT2Sl6cg+wz01qGocBJ
         /thg==
X-Gm-Message-State: APuU4Z/SN88c79kEWhyppzMrZWULzCxL/9T6fRmjqjMLmKHFvdovzUDY
	qJwwBZyma8wfvp7i7KlIm1D2P5/EOeSdk/kNZTwv4ImoqHtlX9/lsYUHg2tnB9uQdwm6yyrFfPY
	2NEliQJ0=
X-Gm-Gg: AYBFou2tQ1/8B6f20W0MggtWniyL9Dj2TRNwPj6VM0bAEllcf0mXKP7PosVcoPFH5y5
	Rhk+lr4ZGk3kbp3NAw04GuUziOp7GwGg32eMiQV5vdMax7aUeRwQhSGNk1uq6zCLnQXgDalDJgr
	16GCExjPKKm06f00xGUy0EQqe0ZyY3EZf4JhLU3V53dv2d6hahV2gKyoD5WWj1p+gtI54fzVcZ/
	WQdkGSrAmSHdbdqRtR7LH8AIIxtMLkh0mjS7js1/uGG2UbUUBsisT7wKZ8j+Hj5YzmptJZhsZAg
	9lI2Lo9FV6GGxjoc+nySaAyinhAlYxPnVcQh2H9blehhzGp1tARThMDM45RmI0gdBFg0duyfJ93
	/N50gmvOtTlKqqiPdvJfxKj+T5NQLtzzT0b+4K8MydPtbHUHCi3ZwhnEX2fc/OqScX8sGGERIdf
	kZSuy8wijFq7/lccO4znl5OQaXb+FGCAiT+1GKO3a2ptxlpEajmxvBR9w88QeNCSOSKj9Y4Jp1C
	qM1rVsrHGiT5jW71NldJrp8wxRjRriYMHswGuXjVqOLQ8kOtdZbe4oslqqsSoEQNgz3jJjFLLbQ
	1hHK4tyb6z7Nbfm9iF8I0iNmG5ZkUMqLR2NlWWlx+6QVkt3Jqi2tPOnVKPcHTAyE7vrps9bN98M
	ky2LH1KzeyaliJ7eVfAsIzXo69Kfz
X-Received: by 2002:a05:6000:2904:b0:48d:b75d:30f6 with SMTP id ffacd0b85a97d-48e6e308d92mr33983784f8f.35.1793747232926;
        Tue, 03 Nov 2026 15:07:12 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm472192f8f.59.2026.11.03.15.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:07:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/54] Pull request (cover letter only)
Date: Wed,  4 Nov 2026 00:06:56 +0100
Message-ID: <cover.1793746099.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 23:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249301
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1793405493.git.yoann.congal@smile.fr/
There was some reviews:
* I removed "[scarthgap 13/55] popt: patch CVE-2026-18739": There is an
  error in the "CVE:" tag that needs to be fixed.
* [scarthgap 18/55] libpcre2: update to latest release branch hash 50b3c0d7ce
  => nitpick that, IMHO, is not worth a respin. 
* [scarthgap 19/55] python3-urllib3: Fix CVE-2026-97689
  => Question about backport changes, answered. No change needed.

Passed a-full on autobuilder (before removing the popt patch):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5029
* qemuarm64-ptest failed with 16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4818

The following changes since commit 44b46b8ad6e461dd9289face17cbfaeca6f5d0f2:

  python3-certifi: upgrade 2026.7.22 -> 2026.10.19 (2026-10-22 12:49:16 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to d40b840d5c7e7b0f9e94c2b434010fb63b306a72:

  util-linux: patch CVE-2026-53615 (2026-11-03 23:41:28 +0100)

----------------------------------------------------------------

Alexander Kanavin (1):
  gstreamer1.0: disable an intermittently failing test

Ankur Tyagi (1):
  tzdata/tzcode-native: upgrade 2026d -> 2026e

Benhur Tessele (1):
  go: fix CVE-2026-56862

Bruce Ashfield (5):
  linux-yocto/6.6: update to v6.6.156
  linux-yocto/6.6: update to v6.6.157
  linux-yocto/6.6: update to v6.6.159
  linux-yocto/6.6: update to v6.6.160
  linux-yocto/6.6: aufs: refresh to upstream aufs6.6.84

Hetvi Thakar (5):
  apr-util: Fix CVE-2025-49506
  apr-util: Fix CVE-2026-32327
  apr-util: Mark CVE-2026-34191 not applicable
  apr-util: Fix CVE-2026-34501
  apr-util: Fix CVE-2026-34502

Jaipaul Cheernam (2):
  python3-urllib3: Fix CVE-2026-97689
  curl: fix CVE-2026-80230

Jakub Szczudlo (Nokia) (1):
  libarchive: fix CVE-2026-15028

Paul Barker (1):
  b4-config: Add configuration for scarthgap

Peter Marko (31):
  util-linux: patch CVE-2026-53614
  util-linux: patch CVE-2026-53613
  util-linux: patch CVE-2026-53612
  util-linux: patch CVE-2024-28085 regression
  util-linux: patch CVE-2026-78408
  util-linux: patch CVE-2026-78410
  util-linux: patch CVE-2026-76642
  expat: patch CVE-2026-102633
  expat: patch CVE-2026-77214
  popt: patch CVE-2026-18743
  glib-2.0: patch CVE-2026-15588
  glib-2.0: patch CVE-2026-16118
  libpng: patch CVE-2026-46675
  libpcre2: update to latest release branch hash 50b3c0d7ce
  glibc: patch CVE-2026-5928
  glibc: patch CVE-2026-5450
  glibc: patch CVE-2026-6791
  glibc: patch CVE-2026-6368
  glibc: patch CVE-2026-19542
  glibc: patch CVE-2026-19499
  glibc: patch CVE-2026-77117
  glibc: patch CVE-2026-80489
  glibc: add tests for CVE-2026-77117 and CVE-2026-80489.
  glibc: patch CVE-2026-18374
  glibc: patch CVE-2026-8674
  glibc: patch CVE-2026-89092
  glibc: patch CVE-2026-97399
  glibc: stable 2.39 branch updates to b7a0de2c8f
  dhcpcd: patch CVE-2025-70102
  python3: upgrade 3.12.15 -> 3.12.16
  util-linux: patch CVE-2026-53615

Richard Purdie (1):
  shadow-native: Disable syslog usage

Ross Burton (1):
  gstreamer: skip test_queue:test_leaky_downstream test as it's flakey

Suresh H A (1):
  systemd: try AT_EMPTY_PATH for access_fd() first

Theo GAIGE (1):
  python3-pyelftools: add python3-logging to RDEPENDS

Yoann Congal (2):
  scripts/install-buildtools: Update to 5.0.21
  linux-yocto/6.6: update CVE exclusions (6.6.160)

 .b4-config                                    |    4 +
 .../dhcpcd/dhcpcd_10.0.6.bb                   |    1 +
 .../dhcpcd/files/CVE-2025-70102.patch         |   30 +
 .../expat/expat/CVE-2026-102633.patch         |   68 +
 .../expat/expat/CVE-2026-77214.patch          |  106 +
 meta/recipes-core/expat/expat_2.8.3.bb        |    2 +
 .../glib-2.0/glib-2.0/CVE-2026-15588.patch    |  267 +
 .../glib-2.0/glib-2.0/CVE-2026-16118.patch    |   48 +
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |    2 +
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 .../glibc/glibc/0031-CVE-2026-5928.patch      |  112 +
 .../glibc/glibc/0032-CVE-2026-5450.patch      |  133 +
 .../glibc/glibc/0033-CVE-2026-6791.patch      |  364 +
 .../glibc/glibc/0034-CVE-2026-6368.patch      |  577 ++
 .../glibc/glibc/0035-CVE-2026-19542.patch     |   99 +
 .../glibc/glibc/0036-CVE-2026-19499.patch     |  100 +
 .../glibc/glibc/0037-CVE-2026-77117.patch     |   32 +
 .../glibc/glibc/0038-CVE-2026-80489.patch     |   32 +
 .../0039-CVE-2026-77117-CVE-2026-80489.patch  |  172 +
 .../glibc/glibc/0040-CVE-2026-18374-01.patch  |   53 +
 .../glibc/glibc/0041-CVE-2026-18374-02.patch  |  103 +
 .../glibc/glibc/0042-CVE-2026-8674.patch      |  118 +
 .../glibc/glibc/0047-CVE-2026-89092.patch     |  245 +
 .../glibc/glibc/0048-CVE-2026-97399.patch     |  128 +
 meta/recipes-core/glibc/glibc_2.39.bb         |   14 +
 ...ry-AT_EMPTY_PATH-for-access_fd-first.patch |   34 +
 meta/recipes-core/systemd/systemd_255.22.bb   |    1 +
 meta/recipes-core/util-linux/util-linux.inc   |   15 +
 ...ib-fileutils-add-ul_open_no_symlinks.patch |   98 +
 ...dd-ul_openat_resolve-openat2-wrapper.patch |   85 +
 ...x-RESOLVE_NO_SYMLINKS-fallback-value.patch |   71 +
 ...x-unused-parameter-warnings-without-.patch |   64 +
 ..._open_tree-helper-for-safe-tree-open.patch |   85 +
 .../util-linux/CVE-2024-28085-0003.patch      |   77 +
 .../util-linux/CVE-2026-53612.patch           |   92 +
 .../util-linux/CVE-2026-53613.patch           |  192 +
 .../util-linux/CVE-2026-53614.patch           |   83 +
 .../util-linux/CVE-2026-53615.patch           |  109 +
 .../util-linux/CVE-2026-76642.patch           |  136 +
 .../util-linux/CVE-2026-78408.patch           |   98 +
 .../util-linux/CVE-2026-78410-01.patch        |   94 +
 .../util-linux/CVE-2026-78410-02.patch        |   96 +
 .../util-linux/CVE-2026-78410-03.patch        |  115 +
 meta/recipes-devtools/go/go-1.22.12.inc       |    1 +
 .../go/go/CVE-2026-56862.patch                |   98 +
 .../python/python3-pyelftools_0.30.bb         |    2 +-
 .../python3-urllib3/CVE-2026-97689.patch      |  251 +
 .../python/python3-urllib3_2.2.2.bb           |   14 +-
 ...shebang-overflow-on-python-config.py.patch |    2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |    2 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |    2 +-
 ...pes.test_find-skip-without-tools-sdk.patch |    2 +-
 .../python/python3/makerace.patch             |    2 +-
 ...{python3_3.12.15.bb => python3_3.12.16.bb} |    2 +-
 .../libarchive/CVE-2026-15028.patch           |   41 +
 .../libarchive/libarchive_3.7.9.bb            |    1 +
 .../shadow/files/disable_syslog.patch         |   22 +
 meta/recipes-extended/shadow/shadow.inc       |    1 +
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 .../linux/cve-exclusion_6.6.inc               | 7716 +++++++++++++++--
 .../linux/linux-yocto-rt_6.6.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
 .../gstreamer/gstreamer1.0/run-ptest          |    7 +
 .../libpng/files/CVE-2026-46675.patch         |  115 +
 .../libpng/libpng_1.6.42.bb                   |    1 +
 .../apr/apr-util/CVE-2025-49506.patch         |  310 +
 .../apr-util/CVE-2026-32327-dependent.patch   |   34 +
 .../apr/apr-util/CVE-2026-32327.patch         | 2162 +++++
 .../apr/apr-util/CVE-2026-34501.patch         |  128 +
 .../apr/apr-util/CVE-2026-34502_p1.patch      |  106 +
 .../apr/apr-util/CVE-2026-34502_p2.patch      |   38 +
 meta/recipes-support/apr/apr-util_1.6.3.bb    |    8 +
 .../curl/curl/CVE-2026-80230.patch            |   63 +
 meta/recipes-support/curl/curl_8.7.1.bb       |   70 +-
 .../recipes-support/libpcre/libpcre2_10.43.bb |   20 +-
 .../popt/popt/CVE-2026-18743.patch            |   97 +
 meta/recipes-support/popt/popt_1.19.bb        |    1 +
 scripts/install-buildtools                    |    4 +-
 79 files changed, 14744 insertions(+), 982 deletions(-)
 create mode 100644 .b4-config
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-15588.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-16118.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0033-CVE-2026-6791.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0034-CVE-2026-6368.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0042-CVE-2026-8674.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0048-CVE-2026-97399.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_open_no_symlinks.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-libmount-add-mnt_open_tree-helper-for-safe-tree-open.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53613.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78410-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78410-02.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78410-03.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-56862.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
 rename meta/recipes-devtools/python/{python3_3.12.15.bb => python3_3.12.16.bb} (99%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch
 create mode 100644 meta/recipes-extended/shadow/files/disable_syslog.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-46675.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34501.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch

