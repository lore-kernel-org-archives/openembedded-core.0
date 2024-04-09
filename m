Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21131CD129A
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.130851.1712646644598713517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qffVwnJG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646645; x=1744182645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vhRPAMtcLNNfH7hmjAeALcEQCfSkrw8lBDzWy7Fx/qQ=;
  b=qffVwnJGCkdbkSn/7vv3TCP2+2bsufrmMLybYxveCXG2nvWaHf390ZYf
   R7vZtZuv60dAQEqZkv2SUMVbPHu8EHPAVHeDawaKCGeAy3g33gsGHeqZx
   w4jLA6Rnk9R0AzB3SR3/rtbJbZrM+rMNmN9/pVZAfuzsKKH9r8OLqtNes
   1eCC1mBFDHLK2pDqmRqNYx2tdUX5PBVToTs9aSe4/QynMnAUaK23iTqyD
   1c0LU6UU7htgEr1fp8J4jU1YIlzxsd8Ni7XFXRtS1JtSYY2FEtMXPueh6
   rpZlaq+WNDumWZoTV7vTEDYSlugpJgfIsQMcBlj7bTRq/nMt0Aq75yeSa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="154905332"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="154905332"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:44 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA98323226
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 060B73742F
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 815F020093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 303941A0002;
	Tue,  9 Apr 2024 15:10:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/33] liburi-perl: upgrade 5.27 -> 5.28
Date: Tue,  9 Apr 2024 15:10:01 +0800
Message-Id: <1712646620-16608-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10-0.408300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVcSYmv+w7giU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNK1L6TVkdgztr2qJoNIuCje63p3Evo7CYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHLyYA8Y6u18C8u7RL/fNB8Vy/
	vbvRfaKJuNkpljFAnZRrXtoIsK5EpteEhdWPKzea2hZ/S7Y+AAt5dnHjCuVCKy191JygZi7ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198031

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Using Scalar::Util::reftype instead of just ref(), but mindful this time
  about definedness to avoid warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{liburi-perl_5.27.bb => liburi-perl_5.28.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.27.bb => liburi-perl_5.28.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_5.27.bb b/meta/recipes-devtools/perl/liburi-perl_5.28.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.27.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.28.bb
index e5db7b3cfe..1fc0efd3e5 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.27.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.28.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "11962d8a8a8496906e5d34774affc235a1c95c112d390c0b4171f3e91e9e2a97"
+SRC_URI[sha256sum] = "e7985da359b15efd00917fa720292b711c396f2f9f9a7349e4e7dec74aa79765"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.34.1


