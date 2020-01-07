Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id CAF6F6D6F5
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:37 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id kx11so8344145pjb.4
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yCPoJ4pCcgJ50chu4yAWzqO41B2TTi0bGqa2QJDUlaQ=;
	b=m/enws832tSrMKnJdRJt7P9BEJI5uYXjkL5DLXS2cVHtOMpo0ci7XBhxcKnI/nmwDu
	MSY8b8Mgljx03myr3UsYAGHIj0yGvLFIfyYHFSmKqoz0vnBqdjX8spVzd1oZ0sRI0TkV
	8jN3UhH1fOtZjXztlHIa4BKWARRn7Uoqr7Hrhn0CW/n+yazPt+w4/fnCIjWkcBY4bQRk
	3D3y/EcssvhzOrslG5OKef+4msnzV2EPX3VaY79s8gESePXLJ/zv+XchLYPO/i81RDtg
	WzG3OpFTISDB4HlKIwYp6eziNboplSz4WQCrBDmzfjpqSmaoVE+YBZ9woQWqPm5lUSkq
	bbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yCPoJ4pCcgJ50chu4yAWzqO41B2TTi0bGqa2QJDUlaQ=;
	b=OXoYAOu3pHxurkXuHZxpUeCWBMGvUFP8M06E/NZzWqqNZ9MwEOD5Ld+oQ0cDfq2HGe
	175qwrdN9RKcRusxTSaZ1txYHuweC3Q1HHmAS2NW1aWlUOc3qaJb2KdJQqx2w/KNXROS
	TGQgeHpFtCYZnvrehXCSyO/ovx4okPsg3mIfKaMHrviSeBwOZ8J1F7cxu7+kkusVW39u
	4j9MaH9nB3gK1niVFuBiDr9jxDUt6orrlaYxOOjqWndHDausKjxOBz47eq7KiogWWHuF
	9ok+Amd3dy6UjEcn/gY96kYM8XFNohaV44yJs9gGzUmqVgSOBHhH3myLOOk2Ha95dDPz
	GORw==
X-Gm-Message-State: APjAAAUxcZdC1ijEkvyGKlvpo/6mpw77TkjP4MDAtMljYTbB/8Pep9bX
	qBkw//9lm30FcKFMEJn9V5nFF2Oi
X-Google-Smtp-Source: APXvYqwMt/FhUcMiIsXxeo6+s4riKyicBaMsACI1xF9Agsr1MeoSIqcOF2HVJX3mBMan1MbK0girig==
X-Received: by 2002:a17:902:7603:: with SMTP id
	k3mr58910337pll.93.1578364478511; 
	Mon, 06 Jan 2020 18:34:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.36
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:05 -0800
Message-Id: <cover.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus 00/28] Pull request
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for zeus update.
Passed A-full.


The following changes since commit 754d0ae5a960056468cdf50e5965a4c22515f8f9:

  lttng-modules: fix NULL pointer deference error when testing rpc_task_running (2019-12-31 10:36:32 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

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

Yanfei Xu (1):
  libsdl2: fix failure appeared in bitbake libsdl2-native

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
 20 files changed, 184 insertions(+), 68 deletions(-)
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


