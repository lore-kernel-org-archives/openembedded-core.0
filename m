Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9134BC47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:38:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9249.1706765926056763058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jE0iWptn;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706765926; x=1738301926;
  h=from:to:cc:subject:date:message-id;
  bh=E6qZ19SI7c2H2uDMwaAjHF+xcCYPCbFKo/krBW0YtHA=;
  b=jE0iWptnq4gCAZWLGLSWTjrGg3U627UBlAEYnBRbQVUe8rfxvzRdnZOV
   Kf39W54KFYAVqtpo/BQAhPf7Y67j0yLovkBSw+xs0zUopxhdEtq8uk8qm
   ji/y4qAPtyrvEqkVopLsehPnIZJ59PVQvV6dd0IoMRzSwLRF5+oKzNrE5
   FNpDu5OmVj5X4ui7hluDuQjBeQVX1HUrHHc11xcJYWh5xPsCEP8MIjrLO
   mvAnRqgtOBtVfQAClh+wwHdeeu/XVSOBHE5nyGPliSNeGZ0XUdnLQyOgm
   bhCLoXCZo+VBKOLWZVQjP1WN0T02QaEipCnPx2mwWH2oty8dGy/pNwWQ3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="136448784"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="136448784"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:38:43 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 38D7219C465
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:38:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B4632E9C9
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:38:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DEA956B824
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:38:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 83CA01A006A;
	Thu,  1 Feb 2024 13:38:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mc: upgrade 4.8.30 -> 4.8.31
Date: Thu,  1 Feb 2024 13:37:41 +0800
Message-Id: <1706765861-12895-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--3.230100-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrXLILvyEBT84xuO/XY9aFx3fL
	uRKrFFnfaNzYnzfrA9TPVObWexNsYKk5+6tQ+lSgCKKJ1/F/gpkbbhhV65kaY75/tqn0MloNrUn
	QUdjG6vV3jQwfcd9T8waNwLtRCo9dvpqH3qD3pwtO5y1KmK5bJSeHMCGC+irnocyHLuOruEKC2l
	1gi9ieKggvGgJhnjuprJLN1+nQfDsdj9vNGYhpke9VsdrlGzy3xMZq+YajS9YPGMG6AkHPPFGhi
	O5E4/q+g/0qbmKKjw15OPD8XJFfpB8TzIzimOwPFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOfryS
	J1wgkYBErRc9RUxN4okciZfcR7txJw1c7L9whgHdAzcIPSshac1jz4zlfuGDiz9v51uMOmbynhg
	gp3l2LUqQTzY8KQmugr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194571

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Core
  * Minimal version of GLib is 2.32.0.

- VFS
  * fish: drop support of native FISH server and protocol. Rename VFS to shell (#4232)
  * extfs;
    * uc1541 extfs: update up to 3.6 version (#4511)
    * s3+: port to Python3 (#4324)
  * Support for LZO/LZOP compression format (#4509)

- Misc
  * Skins: add color for non-printable characters in editor (#4433)

- Fixes
  * FTBFS on FreeBSD with ext2fs attribute support (#4493)
  * Broken stickchars (-a) mode (#4498)
  * Wrong timestamp after resuming of file copy operation (#4499)
  * Editor: wrong deletion of marked column (#3761)
  * Diff viewer: segfault when display of line numbers is enabled (#4500)
  * Tar VFS: broken handling of hard links (#4494)
  * Sftp VFS: failure establishing SSH session due hashed host names in ~/.ssh/known_hosts (#4506)
  * Shell VFS: incorrect file names with cyrillic or diacritic symbols (#4507)
  * mc.ext.ini: incorrect description of of how multiple sections and keys with same names are processed (#4497)
  * mc.ext.ini: unescaped backslash \ is treated as invalid escape sequence in glib-2.77.3 and glib-2.79 (#4502)
  * mc.ext.ini: file "Makefile.zip" is handled as Makefile not as zip-arhive (#4419)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb} (97%)

diff --git a/meta/recipes-extended/mc/mc_4.8.30.bb b/meta/recipes-extended/mc/mc_4.8.31.bb
similarity index 97%
rename from meta/recipes-extended/mc/mc_4.8.30.bb
rename to meta/recipes-extended/mc/mc_4.8.31.bb
index 258ac38e15..b6e5a1f98c 100644
--- a/meta/recipes-extended/mc/mc_4.8.30.bb
+++ b/meta/recipes-extended/mc/mc_4.8.31.bb
@@ -11,7 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "38171f22f889e3030ec9055463d3ecd7843984ab24e6497d8294d1c441a7ddb4"
+SRC_URI[sha256sum] = "f42f4114ed42f6cf9995f1d896fa6c797ccb36dac57760dda8dd9f78ac462841"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1


