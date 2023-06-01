Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEAEC7EE37
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.26241.1685610238393525359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119084638"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119084638"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EEE1DAE16
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A2448CF7F1
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B08EA88857;
	Thu,  1 Jun 2023 18:04:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-requests: upgrade 2.30.0 -> 2.31.0
Date: Thu,  1 Jun 2023 17:03:34 +0800
Message-Id: <1685610221-29015-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-1.461300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mraEANKbBJN12KlGc9JzXmokZF
	Sw+CHkHwzIVGiRcEkmlQ6MNXeEjuOB2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsKETMxnlSUoO3PhwfmFb3pg7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7BLPx9cDMrKbdB/CxWTRRu+rAZ8KTspSzwv6pYV4uGnuZ0YMiZlWdoeA0Z
	NpRQVCJLMktmY3d+0vj+GNCHq3nmJ7AsmhCHmV6n+ZvQDhrdq3VEjo7Vos7FGL6+F6qjCt0iB6m
	lDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182082

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Versions of Requests between v2.3.0 and v2.30.0 are vulnerable to potential
forwarding of Proxy-Authorization headers to destination servers when
following HTTPS redirects.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-requests_2.30.0.bb => python3-requests_2.31.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.30.0.bb => python3-requests_2.31.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.30.0.bb b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-requests_2.30.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.31.0.bb
index 1286eba786..7ac43f2eb9 100644
--- a/meta/recipes-devtools/python/python3-requests_2.30.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "239d7d4458afcb28a692cdd298d87542235f4ca8d36d03a15bfc128a6559a2f4"
+SRC_URI[sha256sum] = "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
 
 inherit pypi setuptools3
 
-- 
2.34.1


