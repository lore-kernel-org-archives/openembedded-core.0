Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 63EA360214
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 16:51:34 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x8so1934779pgk.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WMX4HIVHblzDSSuBVKKJsHN00n97hqTqdnAi2WKhIsM=;
	b=bvH0Y3KrSRm7+NSOPGRcqVjV6j4+tcY61SWEZqZ38Vj7LmuCuEOSNHfPyWfLf3e0N5
	TBX5qJayUxYo9cqQq2z0bXYsjlUKMb2PNH8o72WpxRH07t7O+l/FfWXTJ+d3Vj2qCz20
	r/Yvh+qNqUlSJ25aOj9pvrDBE8TY01r1zFKze3pVc5Sc7+NEx4dupRNfHuGZn1hQxaXP
	SyspBTIQ2eLiQK29foJsi31Mzd1oEQs9cj71HfCPny4gPvfQatsV4JLen83LbZBIeQY3
	WCHkU7OSPIPQdD6TkLKKEDb3w23l5F8asGui5z0d6e3LDg10sPrUzHLdaVmWMBARP4I1
	Y6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WMX4HIVHblzDSSuBVKKJsHN00n97hqTqdnAi2WKhIsM=;
	b=Qwkqs6xxbobJDeyZXRhfbfNiDhFGh3KBW1Wpz2MyBE5hTEhGNoLxEDDtWsWqt7P9ri
	IK8wzNDpS8ievcsVXIGkjENfuail1vxSlpEpXWk9K12ojPvFEQLUzTVJWEhKkEVNXRNi
	u5DA1PQM0jCB7hhZA2yVDFO9oaJMIBXBtZ7PSMPvmClKl3BCUPXX9B3DL0awPmd5/E9V
	PzAxqAMLpWeK3yGpTiGi3Enp/qMcfFOnHmyghtKzTGaxlKXCXVO11uriTW2rn3FQ0B+G
	+f7Y1aVkmMSDyiT+0f0DwhXwAa9Axf1D/lX6yt2Ak/PL/PwYumTzjH4ut9G36T7XbjbU
	oN2w==
X-Gm-Message-State: APjAAAWkvmYG+TOOsqNJWrNRC2DR1duuaRG1a7CCIJqclRTmRvycgomg
	1IPFY5JON8UST6d7jMYG3kCvzz/vk5w=
X-Google-Smtp-Source: APXvYqy6byhnQSMja5WipnXrDL6HVyoaBRpQ0RkDFHuY7V1Tr9m0aGiaN4EXEl67JxiMhQ4RuRTIXw==
X-Received: by 2002:a63:214e:: with SMTP id s14mr5538613pgm.428.1580403094788; 
	Thu, 30 Jan 2020 08:51:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	a12sm7131037pga.11.2020.01.30.08.51.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jan 2020 08:51:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 08:51:33 -0800
Message-Id: <cover.1580403003.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 0/1] runit: Add runit init system and related recipes
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:18 -0000
Content-Transfer-Encoding: 8bit

runit is a small init system with supervisory and monitoring
capabilities like systemd

The following changes since commit 4a61e9fa5f39eac6911a3ff264808c259385a70c:

  MEMORIAM: Add recognition for contributors no longer with us (2020-01-30 15:22:35 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (1):
  runit: Add runit and related recipes

 meta/conf/distro/include/maintainers.inc      |   2 +
 meta/conf/layer.conf                          |   1 +
 meta/recipes-core/runit/runit-serialgetty.bb  |  43 ++++++++
 .../runit/runit-serialgetty/finish            |   2 +
 meta/recipes-core/runit/runit-serialgetty/run |   2 +
 meta/recipes-core/runit/runit-services.bb     |  50 +++++++++
 ...y-for-services-on-Debian-is-etc-servi.diff |  87 +++++++++++++++
 ...t-nosync-file-to-make-sync-on-shutdow.diff |  95 ++++++++++++++++
 ...03-utmpset.c-mixes-int32_t-and-time_t.diff |  57 ++++++++++
 ...-t-use-static-to-link-runit-runit-ini.diff |  30 ++++++
 .../0005-patch-etc-runit-2-for-FHS.patch      |  17 +++
 ...0006-make-buildsystem-respect-CFLAGS.patch |  21 ++++
 .../runit/0007-move-communication-files.patch | 102 ++++++++++++++++++
 .../runit/0008-emulate-sysv-runlevel-5.patch  |  20 ++++
 .../runit/0009-fix-error-in-manpage.patch     |  23 ++++
 meta/recipes-core/runit/runit/clearmem.patch  |  22 ++++
 meta/recipes-core/runit/runit/cross.patch     |  50 +++++++++
 ...h-disable-chkshgrp-test-that-fails-i.patch |  19 ++++
 ...h-fix-spin-lock-on-systems-with-poor.patch |  20 ++++
 ...h-make-build-system-print-compilatio.patch |  15 +++
 meta/recipes-core/runit/runit/svlogd.patch    |  19 ++++
 meta/recipes-core/runit/runit_2.1.2.bb        |  68 ++++++++++++
 meta/recipes-core/runit/socklog-services.bb   |  23 ++++
 ...-options-to-cp-to-ensure-proper-mods.patch |  33 ++++++
 meta/recipes-core/runit/socklog/cross.patch   |  58 ++++++++++
 meta/recipes-core/runit/socklog_2.1.0.bb      |  32 ++++++
 26 files changed, 911 insertions(+)
 create mode 100644 meta/recipes-core/runit/runit-serialgetty.bb
 create mode 100644 meta/recipes-core/runit/runit-serialgetty/finish
 create mode 100644 meta/recipes-core/runit/runit-serialgetty/run
 create mode 100644 meta/recipes-core/runit/runit-services.bb
 create mode 100644 meta/recipes-core/runit/runit/0001-default-directory-for-services-on-Debian-is-etc-servi.diff
 create mode 100644 meta/recipes-core/runit/runit/0002-support-etc-runit-nosync-file-to-make-sync-on-shutdow.diff
 create mode 100644 meta/recipes-core/runit/runit/0003-utmpset.c-mixes-int32_t-and-time_t.diff
 create mode 100644 meta/recipes-core/runit/runit/0004-src-Makefile-don-t-use-static-to-link-runit-runit-ini.diff
 create mode 100644 meta/recipes-core/runit/runit/0005-patch-etc-runit-2-for-FHS.patch
 create mode 100644 meta/recipes-core/runit/runit/0006-make-buildsystem-respect-CFLAGS.patch
 create mode 100644 meta/recipes-core/runit/runit/0007-move-communication-files.patch
 create mode 100644 meta/recipes-core/runit/runit/0008-emulate-sysv-runlevel-5.patch
 create mode 100644 meta/recipes-core/runit/runit/0009-fix-error-in-manpage.patch
 create mode 100644 meta/recipes-core/runit/runit/clearmem.patch
 create mode 100644 meta/recipes-core/runit/runit/cross.patch
 create mode 100644 meta/recipes-core/runit/runit/patch-disable-chkshgrp-test-that-fails-i.patch
 create mode 100644 meta/recipes-core/runit/runit/patch-fix-spin-lock-on-systems-with-poor.patch
 create mode 100644 meta/recipes-core/runit/runit/patch-make-build-system-print-compilatio.patch
 create mode 100644 meta/recipes-core/runit/runit/svlogd.patch
 create mode 100644 meta/recipes-core/runit/runit_2.1.2.bb
 create mode 100644 meta/recipes-core/runit/socklog-services.bb
 create mode 100644 meta/recipes-core/runit/socklog-services/0001-Use-options-to-cp-to-ensure-proper-mods.patch
 create mode 100644 meta/recipes-core/runit/socklog/cross.patch
 create mode 100644 meta/recipes-core/runit/socklog_2.1.0.bb

-- 
2.25.0


