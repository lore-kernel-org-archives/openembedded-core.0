Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C8BD5A6C7
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.35684.1732584619773401044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F2/UPD6l;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584620; x=1764120620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ezvu/eXbylA8fzVIbU5fYfxJojhRn4N3Hum95u2IqnI=;
  b=F2/UPD6laljyxxd/gFNjrjNlMigjWGNFk3H5suwiP+0JpdC38Tw8b43H
   hs41n9QyPubmLTHDrRNLd3rMwA929rVv3sTgrpLC/ptZRIQGzmkOTdgJf
   es6anfYilRlE7pY2/bPHqxCp/tbqmL0Zq7oCVV8xmv10hFGg+6tqpd7z8
   +Sd+pJpTCbqT5z1KYBI7xyhs4Q0V9SG/CyW1p60smaVp528tD+KFtr2PU
   G9GdcoHx8KNvZuqmoSQ16eq3XDWWogKO6D8uaHdJkGLrzj0z6dZMB1gzl
   N6lJmKd0EvSocKpHlXU5a0V1bVOodGgyICVPbpkEHc204l1SF5YCkELWF
   w==;
X-CSE-ConnectionGUID: 3mJvBp3gSW2/GC/0CMMxhg==
X-CSE-MsgGUID: VRRDcAZUTzSzh0TjF/Tr/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="161094695"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="161094695"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:17 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B860D500C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB1E6D97FF
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5399970BF6
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00ACC1A006C;
	Tue, 26 Nov 2024 09:30:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/16] libinput: upgrade 1.26.2 -> 1.27.0
Date: Tue, 26 Nov 2024 09:29:50 +0800
Message-Id: <1732584602-4785-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10-1.169100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8sja7IBuOPthEEzEoOqAAVLPhKQh1LCmGBlxOQqP2lG9go8W
	MkQWv6iV3LAytsQR4e94znLzmohUM3QfwsVk0UbvqwGfCk7KUs5rM5jFFkQgGavAkKgMUGZDp0O
	WcwKGQHh5yAA1/c2gOFn1xD5vCJKz7enHoPQU3FXENSaKgs/fj62qddXZIXEank7bEw4kiBIgep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207811

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.26.2.bb => libinput_1.27.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.26.2.bb => libinput_1.27.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.26.2.bb b/meta/recipes-graphics/wayland/libinput_1.27.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.26.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.27.0.bb
index 6a96b0e14a..0222e4c9bf 100644
--- a/meta/recipes-graphics/wayland/libinput_1.26.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.27.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "3402f380019dc4f882e1d8627029607aca3f4be6"
+SRCREV = "64d1f198fb2764dfb852a19becaf6f7f097fce2c"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


