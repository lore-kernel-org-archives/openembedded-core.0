Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id E8CC37D1E9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:12 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id n9so17035579pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nr0jdAM7wQVpNDZ4BQr8d49VQIvwLbGoxIIYtfvTpjw=;
	b=AVjbSXwcNzbU+WmLUlJYhfTs0mhjqBHXiUZaCpkg0ZMhJPfNJpC+8v4GXANKXTNAbX
	mz6md/TkvhPoBEgVGzAHWXpdhKA01Bw/loB5lXTYz7qni5oHpbiMiTcv2Yi4mRZAG5E9
	glSgsSQaDXZXlcfgDJwvHzkbcB2QHKoRNuSqfgvwzWLU2A3AinS6CBHaPTM2peixgSUw
	NyFyZHhKopGm+nCdYHqsSQj5/sRgn1kmeNAmLgs0G0kwSyUvYq8NMU8ALhjYaM30/rVc
	Yuy/b6atT9zWh6iGg4TmfyVNpl21SjVBQNtOKC+JD4KMIlQcbI3eQAIECz39dLLrvTId
	6iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nr0jdAM7wQVpNDZ4BQr8d49VQIvwLbGoxIIYtfvTpjw=;
	b=ZGRsZ2cYglkiZ50oJJQ+rW2IAM42RT9SbT0LfEznpsrWZQC6DQus6unN6q0VVzex6d
	dfapqP1meaTMUTQKrLzwJWoGC4knwxJhTcygGfJJ/30K8x3nvsFFq+l4O3LvV2BX4EfA
	eqa3iUyj1eglAcz5o3ssBcriFT1eU4wibdW/4GAcl3MACHfkTA6e3w2JVdiJEWhqKCmO
	CTGKCw3I1grUK7Bg7/XlcI57OeyuPs8AeN3+NhNEfoaDvpcZw0Kj3sqU2nDvlaOD1mn5
	wUEdNpBis0cKyxJX4CqtwM7WZfYn1Y5hlBH/P2FvMhI7oZiTpNnpOBkg+OIVyhsF6bYm
	78eg==
X-Gm-Message-State: APjAAAWuLi+oEOn2qdfJKh1OZZnDGCZBMhcTLX3w8n6/UTKBeGUEK5Fa
	FMyGST9mx781X+APleXojpT97PG/UPc=
X-Google-Smtp-Source: APXvYqzt0xn3ktYnoWKMeCLuLuY4r6L+qBxwq0z5eRr5tNUZpON4IjhN9OPeHRdx2dPtJSi8J0zFJw==
X-Received: by 2002:a65:4344:: with SMTP id k4mr101112224pgq.193.1578155173722;
	Sat, 04 Jan 2020 08:26:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:41 -0800
Message-Id: <cover.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus 00/29] Patch review
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here is the next set for zeus.

Please have comments back by Monday.

The following changes since commit 754d0ae5a960056468cdf50e5965a4c22515f8f9:

  lttng-modules: fix NULL pointer deference error when testing rpc_task_running (2019-12-31 10:36:32 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-nut

Adrian Bunk (2):
  systemd: Upgrade 243 -> 243.2
  python3: Upgrade 3.7.5 -> 3.7.6

Bruce Ashfield (11):
  linux-yocto/5.2: update to v5.2.21
  linux-yocto/5.2: update to v5.2.22
  linux-yocto/5.2: update to v5.2.23
  linux-yocto/4.19: update to v4.19.84
  linux-yocto/5.2: update to v5.2.24
  linux-yocto/4.19: update to v4.19.87
  linux-yocto/5.2: update to v5.2.25
  linux-yocto/5.2: update to v5.2.26
  linux-yocto/5.2: update to v5.2.27
  linux-yocto/4.19/5.2/-dev: fix gcc10 build
  linux-yocto/5.2: update to v5.2.28

Joshua Watt (1):
  python3: RDEPEND on libgcc

Khem Raj (1):
  valgrind: Fix build with -fno-common

Martin Jansa (1):
  sstate.bbclass: Fix for consistent whitespace

Richard Purdie (6):
  sstate: Add ability to hide summary output for sstate
  sstate: Stop overwriting SSTATE_PKG
  sstate: Ensure SSTATE_PKG is reloaded when handling siginfo
  sstate: Ensure target sstate directory exists if unihash changes
  sstate: Ensure mkdir happens before mktemp
  python3: Update to apply libgcc fix to libpython, glibc only

Robert Yang (1):
  pseudo: Make realpath() remove trailing slashes

Ross Burton (3):
  podfix: class to remove Pod::Man versions from manpages
  reproducible_build_simple: inherit podfix
  podfix: only alter normal files

Tim Orling (1):
  liberror-perl: update 0.17027 -> 0.17028

Vasyl Gomonovych (1):
  kernel: Make symbol link to vmlinux.64 in boot directory

Yanfei Xu (1):
  libsdl2: fix failure appeared in bitbake libsdl2-native

 meta/classes/kernel.bbclass                   |  3 +
 meta/classes/podfix.bbclass                   | 35 ++++++++++++
 .../classes/reproducible_build_simple.bbclass |  1 +
 meta/classes/sstate.bbclass                   | 51 +++++++++--------
 ...temd-boot_243.bb => systemd-boot_243.2.bb} |  0
 ...temd-conf_243.bb => systemd-conf_243.2.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 .../{systemd_243.bb => systemd_243.2.bb}      |  0
 ...rl_0.17027.bb => liberror-perl_0.17028.bb} |  6 +-
 ...1-realpath.c-Remove-trailing-slashes.patch | 57 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 .../{python3_3.7.5.bb => python3_3.7.6.bb}    |  6 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    | 19 +++++++
 .../valgrind/valgrind_3.15.0.bb               |  1 +
 .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
 .../linux/linux-yocto-rt_4.19.bb              |  6 +-
 .../linux/linux-yocto-rt_5.2.bb               |  6 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++----
 21 files changed, 187 insertions(+), 68 deletions(-)
 create mode 100644 meta/classes/podfix.bbclass
 rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17027.bb => liberror-perl_0.17028.bb} (85%)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (98%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch

-- 
2.17.1


