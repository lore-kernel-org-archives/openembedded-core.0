Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 45F5F7FDCF
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:51 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id s21so2030320plr.7
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2OpYPB66oT2BQZ2cNviIeE6GdDnplKmQ3cqTRtAi9bM=;
	b=CloTLMr9y02LhNxyfe3Ehvi0FQTgERB9p95HXCoEhY6/jL0F5lgYjrHMzsuVKuTvya
	9WFJ/yTABF2NwOKM3kDLEWBRbEtcthzdTCQaZqhQL4jihOhT68oBJEML399aVoChK+mE
	XenI7pcr6Xzh8R3VAXIQ/dD9l++f+h4+29mW7ORnMAgYZdgXWgrPUqcPDkg3Tx4/CkPW
	0Dbe1i7t9h3ecM+FXDSjlCc9ggj1g7NXKc9raYiG9GKZRFdPcxsfsgLMyKedHJdj02xX
	ajrp9tLoXGzZI8ThZqV0p+jRgdniawWh1fmyeg1w554RWIDWHuqKhISPlz+/uODqdKAB
	cwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2OpYPB66oT2BQZ2cNviIeE6GdDnplKmQ3cqTRtAi9bM=;
	b=FqIgvh1h11vJ2EK89nCj/K9QXWe3aQW6bBvg8NHs3U+Rz7Yf5KIYDWlIaxRoxwvEGq
	VdsJNCQ9CBiV6VkjO4ZzGK2sgDb/ybOB9yy8m1tPBXo8CM57c6RG4/H0nwxUfgAXQ6S1
	mL88Q41t7WI2Hfx5/ATKeselqbyyVI8o5VVfnEamsjDRBNh+GPKr6gkIoNbR3qmKVg5A
	dloHGhxGNzNypGfr2SQSvJCe+ov2ocxd7ZBC2WmF2gm59QafO0lz25W5xQUCYqAUyUyy
	YeFRbnwbiG9Wa4bIwsROSgOQkCHmPPICKwgPmBTAg/NtIZDfZsn+gWe/AaWjJRIe751J
	HASg==
X-Gm-Message-State: APjAAAU+JLMA6ebU919AuVGhetvjfZNs4czIovYv7MHSNGfibYOHnQMi
	Mcc78zkjb63j7s3RW9LpldIrEqok
X-Google-Smtp-Source: APXvYqzfS+gkdInCE5Nkl7EsXYsxLXXCoB/VOHyEmgKMaVWiisOTY6T1M4ESZtccmeaJYQ5ZZbtuMg==
X-Received: by 2002:a17:902:10e:: with SMTP id
	14mr9643627plb.122.1578545392004; 
	Wed, 08 Jan 2020 20:49:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.50
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:49:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:19 -0800
Message-Id: <cover.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus 00/28][v2] Pull request
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
X-List-Received-Date: Thu, 09 Jan 2020 04:49:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V2 pull request with valgrind change removed.

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
 .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
 .../linux/linux-yocto-rt_4.19.bb              |  6 +-
 .../linux/linux-yocto-rt_5.2.bb               |  6 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++----
 19 files changed, 167 insertions(+), 68 deletions(-)
 create mode 100644 meta/classes/podfix.bbclass
 rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17027.bb => liberror-perl_0.17028.bb} (85%)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (98%)

-- 
2.17.1


