Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F52CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:56:48 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.34364.1697187406176222544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="115420135"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="115420135"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:56:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E34EDB3AE
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:56:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B0012D67C2
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:56:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB8696BA6E;
	Fri, 13 Oct 2023 17:56:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dhcpcd: upgrade 10.0.2 -> 10.0.3
Date: Fri, 13 Oct 2023 16:56:31 +0800
Message-Id: <1697187391-4003-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--11.386300-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/ySrLqyE6Ur/jLYdywTHl7nt/iZ1aNsYG7oFa
	KsEtPT2WMI50YU/Mh72UbvAVzcPgyZr9F4bPByvNEzEoOqAAVLMXivwflisSrP4DDXoaCqk7EpM
	Y0o/BrKfcEgb6JKDsz1FBlAi/auAgPHvqi+Z+qrH4Zi3x/9WFO49CLqm+oB0bnDqAOhtt+OPZ3y
	a1EhGxQyTDw/BUeX+fBdRHP6FCEZVaQiLka9EcSr+a7Hw+x9qZP8UQejhp29rAuQ0xDMaXkN9ku
	tSXDwfH6ygZOKfC1+8v/zJQ0aiPJvUe3cF58v23EclbAMYYY6yW0X7Fb7OFSMwZ89GbiUlnfQFs
	NJlwnd0Weucbks6QttwzSNMHSlxQ1HzHuRq/4RVvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1DBbGvtcMofzdMb75H/ngPkn8MNsaCDK3h2SEvKl8h2ccXELruq/CwpNm7V
	CPoKm6
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189033

From: Wang Mingyu <wangmy@fujitsu.com>

0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch
removed since it's included in 10.0.3

Changelog:
===========
Do not crash on dhcpcd test run
Add automated CI builds for Ubuntu, OpenBSD, FreeBSD and NetBSD
dhcpcd: Fix off-by-one overflow when read() writes full BUFSIZ
privsep: fix strlcpy overflow in psp_ifname
ci: execute tests after successful build
compat: update arc4random() to newer chacha20 based version from OpenBSD
Support libcrypto for hmac and sha256
Use a local variable instead of the optind
Send correct amount of used buffer for prefix exclude option
compat: use OpenSSL RAND_priv_bytes() for entropy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{dhcpcd_10.0.2.bb => dhcpcd_10.0.3.bb}    |  3 +-
 ...x-strlcpy-overflow-in-psp_ifname-239.patch | 33 -------------------
 2 files changed, 1 insertion(+), 35 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.2.bb => dhcpcd_10.0.3.bb} (94%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
similarity index 94%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
index 0966edd1b8..cc0fb382df 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
@@ -15,10 +15,9 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
-           file://0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch \
            "
 
-SRCREV = "d2fbde99cf2d0072016af9dfe6a77032a5a9fc30"
+SRCREV = "45fb8fd8dd281d2228c7abaddff7877d27e67146"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch
deleted file mode 100644
index d4fb1737a6..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1bd8fc7d4b34f752a32709d277a897e5ad202d97 Mon Sep 17 00:00:00 2001
-From: Tobias Heider <tobhe@users.noreply.github.com>
-Date: Tue, 15 Aug 2023 18:06:48 +0200
-Subject: [PATCH] privsep: fix strlcpy overflow in psp_ifname (#239)
-
-When running our Ubuntu tests with libc6 and strlcpy overflow checks
-enabled we found that the wrong size is passed to strlcpy resulting
-in a crash because of an overflow.
-
-Upstream-Status: Backport
-[https://github.com/NetworkConfiguration/dhcpcd/commit/1bd8fc7d4b34f752a32709d277a897e5ad202d97]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/privsep.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/privsep.c b/src/privsep.c
-index b11c0351..cfe54742 100644
---- a/src/privsep.c
-+++ b/src/privsep.c
-@@ -1200,7 +1200,7 @@ ps_newprocess(struct dhcpcd_ctx *ctx, struct ps_id *psid)
- #endif
- 
- 	if (!(ctx->options & DHCPCD_MANAGER))
--		strlcpy(psp->psp_ifname, ctx->ifv[0], sizeof(psp->psp_name));
-+		strlcpy(psp->psp_ifname, ctx->ifv[0], sizeof(psp->psp_ifname));
- 	TAILQ_INSERT_TAIL(&ctx->ps_processes, psp, next);
- 	return psp;
- }
--- 
-2.25.1
-
-- 
2.34.1


