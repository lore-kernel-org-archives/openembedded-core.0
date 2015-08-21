Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1C560557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:24:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAOv3j012058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:24:57 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:24:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 03:24:55 -0700
Message-ID: <cover.1440152645.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] meta: remove unneeded INSANE_SKIP
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
X-List-Received-Date: Fri, 21 Aug 2015 10:24:58 -0000
Content-Type: text/plain

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/insane
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/insane

Robert Yang (1):
  meta: remove unneeded INSANE_SKIP

 meta/recipes-bsp/grub/grub_2.00.bb              |    3 ---
 meta/recipes-bsp/grub/grub_git.bb               |    3 ---
 meta/recipes-core/dbus/dbus.inc                 |    2 --
 meta/recipes-core/glib-2.0/glib.inc             |    2 --
 meta/recipes-devtools/pseudo/pseudo.inc         |    2 --
 meta/recipes-devtools/syslinux/syslinux_6.03.bb |    2 --
 meta/recipes-extended/ltp/ltp_20150420.bb       |    2 --
 meta/recipes-kernel/kexec/kexec-tools.inc       |    2 --
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb  |    2 --
 9 files changed, 20 deletions(-)

-- 
1.7.9.5


