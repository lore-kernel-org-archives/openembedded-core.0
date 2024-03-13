Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB9EC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10782.1710313731917169048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mW4Fb3SK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313739; x=1741849739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/1riVVW79P/U7seRzxxWO13lK6zoXUSDV7TgsP4yHew=;
  b=mW4Fb3SK7jOVPR+hSyrs86r5BJ4ADekI3xUGI2k4qde+ZSy3Caim/rhl
   hD6b4hAzuL9A9eVqeKNUP50UMPADgUBj4P+GoF5BQcGXK65q+H3fa4nV6
   2Ycb0WFYUXnHLUu1dbjeqVlnwug54+8t/kNHgJFSw4fRzHqHz1rpPVUnu
   8EeogBT23JmC9+x0THz+4GYUcJddxlWlQxVkwIOXACD3+QiUSTxhOFhSZ
   vXE23/kdsXszqzHotx62ytzTfYkEFZtuAvwJcXEZT6lOalg7QL4ILiA9e
   4+gJgYXAq1MrH1VhpkHLmaATyQuPP7N8FT42LLNKbJfvYnKZ4KN07urbb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="151987815"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="151987815"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:08:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0CD0C21A4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EC3ABBDC83
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C0FA20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 39E3C1A006B;
	Wed, 13 Mar 2024 15:08:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/36] gcr: upgrade 4.2.0 -> 4.2.1
Date: Wed, 13 Mar 2024 15:08:02 +0800
Message-Id: <1710313714-12541-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.684700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr9luJE23VaKgeVAKp7ODjmXw6
	H06bMgiv82jJesNrruEamEFDSZd6PVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVUZvo
	+mFW19mAb6Ut7OhhojjqBshiiSFCpKdFN4fct4yzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtPaRNoUjDzH1xCIn/SsGcHWKaQv1wNPmNDKGYQ6ygzT/kiYGGMkP68rOQt
	8Q/kuzI27uW6QwXDOfxfe23rPKz6amWAXfZKMyoHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197006

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- gcr-ssh-agent: set 'SSH_AUTH_SOCK'
- gcr-ssh-agent: port avoid deadlock fix
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gcr/{gcr_4.2.0.bb => gcr_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.2.0.bb => gcr_4.2.1.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.2.0.bb b/meta/recipes-gnome/gcr/gcr_4.2.1.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.2.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.2.1.bb
index c534e22f0a..26dc1d1bc6 100644
--- a/meta/recipes-gnome/gcr/gcr_4.2.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.2.1.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "e15e31329e0171229d552d25563f176c5b6179795bf91fae2b141f69a9b7c480"
+SRC_URI[archive.sha256sum] = "ed783b5c80373cd058c02ea9e3e2a64e558599ca190a5abd598122e479967de5"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.34.1


