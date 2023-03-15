Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2193C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:13:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.5133.1678878833341530450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lq2TrOrI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878831; i=@fujitsu.com;
	bh=khmgBqZvffXWy6re2A+O8b411qLHzFlX8aUL/XTKQjI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Lq2TrOrI9/GasnGqDxMjjBmCzMiV0816x0ciY4ZG9zOQjiLoIWDM/Ut731cTyrNYs
	 6FwclUKyMtrSb411+IDKCnIpluV1CVXWAXXmifS7+UZcljIejiLls7I1O3EvCCxOqh
	 DqTZ/gokC9zQ9hCfKuCVlDXcJrvrxct6Zh2AnfARpb7HRJrfXSqGyIYDVhgJWufy5a
	 blwEhF/sh4n70PcvSU0JC1wa3DDqcuYmRx08/xasKL6kbGKkzor5TNDEvp2gbsoNE3
	 AXVy0RpP4SVNil12ujV0yrm/Kj+SqMmYJnz6VTsAQQmbVpjK/In0mmCzr1Vo7v3K3s
	 n5iXGsZXgAtZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORpJu3QjD
  F4PIRC4s7P9+xW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBmnF21h63gOXfF5TkODYzP
  uboYuTiEBDYySiz/PY29i5ETyFnCJLF4VyVEYg+jxJ3md2AJNgEpiRv3/7N1MXJwiAjoSVz9J
  woSZhZwlGief58NxBYWcJNYPG0vI4jNIqAq8fTFObA4r4CTxMk7T5hBbAkBBYkpD9+D2ZwCzh
  JfFj1kg9jrJPHy3gx2iHpBiZMzn7BAzJeQOPjiBVSvosTsy80sEHaFROP0Q0wQtprE1XObmCc
  wCs5C0j4LSfsCRqZVjObFqUVlqUW6hhZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXF
  eqnFxXrFlbnJOSl6eaklmxiB4ZxSnFi3g3FF31+9Q4ySHExKorx/1gikCPEl5adUZiQWZ8QXl
  eakFh9ilOHgUJLg5VsimCIkWJSanlqRlpkDjC2YtAQHj5IIb0Q9UJq3uCAxtzgzHSJ1ilGXY9
  O+rgPMQix5+XmpUuK8psuBigRAijJK8+BGwOL8EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiV
  h3kvLgKbwZOaVwG16BXQEE9ARvPMEQI4oSURISTUw7Xg21Uf2974Z947t0mP/wBj8wGbGCceo
  Mp2zoop/5jG2HG8RW/jxzMuWrOPsfBGHi5my2RvZ7vQLhAYotD44E7jtbGiiyDyl4BNcsf3Fy
  1ZPdnxVlKkykcusyoalTHPunYJfeneUFzoX5XMeu/6oOfDyoW3rXJicu/QZ4zfdSH1lyHJ8tY
  xcaKeZicH3Kc8mrlI7r2SyM1fI1FuD594kw41Vj/5KKbfNE7a4WOxxzXAZ46nTqXqJhl92duo
  zalw9qCpc4Oi9WcaF+4Llmp7176/z3G/Lr7U+95qlTka2e6nq8Tn7hTYxdCy6dmxmxsPX6nOz
  Hri12Bv+3LjK/xDDpN2J1r7NMQvTPHiOlDYpsRRnJBpqMRcVJwIA+5UYg24DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1678878830!35054!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13103 invoked from network); 15 Mar 2023 11:13:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:13:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4F2151AD;
	Wed, 15 Mar 2023 11:13:50 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 436661AC;
	Wed, 15 Mar 2023 11:13:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:13:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-urllib3: upgrade 1.26.14 -> 1.26.15
Date: Wed, 15 Mar 2023 19:13:34 +0800
Message-ID: <1678878814-19528-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878814-19528-1-git-send-email-wangmy@fujitsu.com>
References: <1678878814-19528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178546

From: Upgrade Helper <uh@not.set>

Changelog:
==========
* Fix socket timeout value when "HTTPConnection" is reused ('#2645 <https://github.com/urllib3/urllib3/issues/2645>'__)
* Remove "!" character from the unreserved characters in IPv6 Zone ID parsing
  ('#2899 <https://github.com/urllib3/urllib3/issues/2899>'__)
* Fix IDNA handling of '\x80' byte ('#2901 <https://github.com/urllib3/urllib3/issues/2901>'__)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
index f35a141df2..d2de7c4c02 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
+SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
 
 inherit pypi setuptools3
 
-- 
2.34.1


