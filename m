Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1673D41D7C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.82726.1731403510603683725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L3hfWB2c;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403512; x=1762939512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Y1KHACGO7U6PVXIuF+tlW5Vr2lVZ/wyMUzR0jCHjyrQ=;
  b=L3hfWB2cav78SfCdwflLcJY8+P5mNqNQ1hhdODhNFjIxDvMQJnSk79Ab
   fDnuL7b0BYMPHkiLvBzKOL/aHQfZSW+LsbRUBIOLNZbDvOkSWvm1Tkw2C
   jrG67YXWY/9EUTDmkAlqnuNjV6kGVjHOHYa09BicOY/G6eDP+urWV1AGB
   f8w73/IbiUoKO69VXkQMaWHHE78ER1Gh50bSGclNKN/zQYmYhExWwAkcx
   5zcWE32Nihk7PzWj/8rXNI7Z+GJc1hplYjigMyeQxoaUCR0WIFmamjlCr
   D6hVBgkFMxn3rM9q7m2ytqGn9n1BoJnR+Q3w9R6z8NYysWIWFlhQQSl68
   A==;
X-CSE-ConnectionGUID: y4/9MMDjQUCq+fuSsRaghA==
X-CSE-MsgGUID: PO+7qCDPS8OCw+pNCK8bBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="168413870"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="168413870"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:07 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6712AD648E
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1D21BCB82
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 949F76B830
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42B2E1A000A;
	Tue, 12 Nov 2024 17:25:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/47] libinput: upgrade 1.26.1 -> 1.26.2
Date: Tue, 12 Nov 2024 17:24:10 +0800
Message-Id: <1731403483-21399-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--2.031300-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrMVx/3ZYby78S4QCtjasi+wjJ
	lierVE/nfBP9zL95redrlcUn4qTzJKXUs7kD79U2MGAKZueP0mZUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiCGqH67UhpHuVd49c0zgWMxmJMshC7hik1bSmSk9HUNric9
	PyNm/U0eLzNWBegCW24nmFeyfGnuMRCvpGs2saMr6HSs9zZy6jKrauXd3MZDVvdRyyS/j1XZxoX
	BJ0TcBm/t7BwKYzBwpcqG+J+VlXsPB42baD8/52eBxPnhHiADVP/UNw1zM07CFfFj61Y6F2PEhb
	J+OEIygyLmVkJTlglFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207004

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- tablet: Remove unnecessary scale factor on REL_HWHEEL_HI_RES
- quirks: add quirk for Minisforum V3 touchpad dwt
- quirks: add quirk for the Minisforum V3 volume keys
- quirks: add quirk for the LG gram 14 2023 Touchpad
- doc/user: document ModelTouchpadPhantomClicks quirk
- Fix typo in documentation comment

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.26.1.bb => libinput_1.26.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.26.1.bb => libinput_1.26.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.26.1.bb b/meta/recipes-graphics/wayland/libinput_1.26.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.26.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.26.2.bb
index 487270505a..6a96b0e14a 100644
--- a/meta/recipes-graphics/wayland/libinput_1.26.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.26.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "124431a5d3186e1c3c3aa144a0634b84b3089486"
+SRCREV = "3402f380019dc4f882e1d8627029607aca3f4be6"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


