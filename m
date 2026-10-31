Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3722.1793405745388189869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=dXaG7dnC;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so10209165e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405744; x=1794010544; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ttd90mwM0q8AxxiAWDKwpYRcDcvgc9nGWSzuBwqJCBE=;
        b=dXaG7dnC2WZuL19Hb7c1k23JWI3blUA7y6ZgBq0AwNOYEz1wkvVNIz556M+ZyS0ofl
         cREUjOIire/pCBZCvnOWXieKZHw+XsRj/RTkkY9gbL0bWrCcbAjbY+e7wYOCHrhOEToO
         ZC4cNBC0o+jb8aE9GES4tomr+A6NiSot7l+o5QwOWUNRHunozL6VaKsP1fZ3Ev3+O2KF
         RSVa21Hi8J6+dT2HF6x0/TIHAAyOzzLEeS8iO8IJGbS3x71FAhDDbM/J2pDlesYsnH/4
         aqlJSSXk+5myMgzl7ROOLRx/gPm4tgkt4ghPAQcQ0cxYGLHRxQpC3gWnLqA0TfHSEiY5
         gmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405744; x=1794010544;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ttd90mwM0q8AxxiAWDKwpYRcDcvgc9nGWSzuBwqJCBE=;
        b=A3CH/kFX3qQuKo9b96mMamu1/Hum6hLpR1VSzSLi+GRV9ynyQPkxlHdqHN90cCM8tI
         x26kcKc9rLwJhRPg5Wp0EdnoGKP60O87rGEyhMXumDO2J0JG/Q2NEupJnAgSWOhYTKea
         TJATehClNkBmj/ZfT3yJeBKb0S5gcEB/+Vub9Q1xxSbG7QSoRZwmR1lJ33u4HrYsIIoX
         4qrGqvi3JviWtfNucSvOJJ4PIWlbqKjzNqnblg9GyTdT5XgCM2Y+SmVrz5msGecHTCBU
         G+cbzmR6gulwtNXGxFIRG/N9dw/dDKre8FJVEkSLRDLQOAMa4GHvIqnM5QOyaBKXC5QC
         11dA==
X-Gm-Message-State: AFq9FYJwCFQbByL28Lvdj8/rdIWCrLBTFM21C1JODMlha139srp8+0M3
	p/DnTisU4u8hYhj+y5ZcUDk8mACJ1BgbcZw69asq2izFuPis0vYHw/Yolr7g85QQ9oHwk4A3909
	EaXpuiaQ=
X-Gm-Gg: AYBFou0GlUls02Bwdgt1Z2zdenp+x5sFqb42Of49we30Bct7AGsgXyib02z3+2XWdc8
	1gjxcy5XI2zxLsig0r8WfiymXrQiji1CHqkKlmgDFjFdZ1A3phzgG7kTKsYv/T8BvT/iLfLFrYD
	HONUsnZ84qGwU2+T5KNjwGJhx9CdZ8FDjaBjq2dW4foOzGd2Xxmf34nFX1WutXKhRdWZXXXFpKj
	vKXq3R/6Lk+TeecXstbB4NXfB80HjqaFtJRaLgvp7MY2Rx/iaaE3OslKGZ7eztt6nEh/MRxs889
	/XQ4NhqKFcIU308WmnYjf1yiDkbhHkiXEzRb8vfqIRM17cY/P7txhfgSK7blC94wRTzWVX+8mfd
	HU+/p4AyRVxp1KqbGBpDeB3OjVhGoMnmyRANv2t4G3gx47cSquSQIoHiZxo3m/APdWGtUiHJ8d4
	IIAkBKDU9TMb+XUCe+uRVWchJAkpM72Ag5UNOUpiBbdo16pqxw8XgsH7b942D3RB++6gSuDZGIM
	WC8DnSkoaKdLXuhuigSYHqdovjMeIGI6hCml08Lbo6e/ql8Zi5Dy2aXhy/n/QGzz7pWcK37heOe
	id87wK512qI2eFhYYy78BeIf93GjNWTueRjowMRCXNkxfqH/DF5E32f5G6TswxNt+EmkhDUi2Oo
	tMYFt1isLVQqelH1G1IuuG31n/iAw
X-Received: by 2002:a05:600c:198c:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4ac15584c05mr93676175e9.2.1793405743302;
        Fri, 30 Oct 2026 17:15:43 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/55] Patch review
Date: Sat, 31 Oct 2026 01:14:21 +0100
Message-ID: <cover.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249076
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, November 3.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5029
* qemuarm64-ptest failed with 16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4818

The following changes since commit 44b46b8ad6e461dd9289face17cbfaeca6f5d0f2:

  python3-certifi: upgrade 2026.7.22 -> 2026.10.19 (2026-10-22 12:49:16 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to d8d1c0ccd8b51574af64c8781aaa4cf46f1d3211:

  util-linux: patch CVE-2026-53615 (2026-10-30 19:26:06 +0100)

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

Peter Marko (32):
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
  popt: patch CVE-2026-18739
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
 .../popt/popt/CVE-2026-18739.patch            |   92 +
 .../popt/popt/CVE-2026-18743.patch            |   97 +
 meta/recipes-support/popt/popt_1.19.bb        |    3 +
 scripts/install-buildtools                    |    4 +-
 80 files changed, 14838 insertions(+), 982 deletions(-)
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
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch

