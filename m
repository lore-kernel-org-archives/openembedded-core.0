Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05B8CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:10:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.34540.1697188241447600374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="136130356"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="136130356"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:10:39 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F0921D5041
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:10:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31DC5E679E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:10:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6954770BC2;
	Fri, 13 Oct 2023 18:10:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-ruamel-yaml: upgrade 0.17.32 -> 0.17.35
Date: Fri, 13 Oct 2023 17:10:17 +0800
Message-Id: <1697188217-4811-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--0.477200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrR2KePCnR51RrRM6wvXgDaXJa
	8XIPzxJqkpzxXBuB6HL1C2tjXbqTqvUWMvmk6jMFs0T0PE+KHuXZsrLj0mXVkpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3dCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07aqzOOiUJy/IKiEB7yIa+wrJVXsAxFCbrxWdb8bbdHJr420M9ZaexCIpaIy6MwY71ENPf
	bA8GDC0iRIB1PpLd+TZeiKU0hq5Ykufp/DOn97y8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189054

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- support for loading dataclasses with 'InitVar' variables (some
  special coding was necessary to get the, unexecpected, default
  value in the corresponding instance attribute
  in [this question](https://stackoverflow.com/q/77228378/1307905))
- Python 3.12 also loads C version when using 'typ='safe''
- added 'flow_seq_start', 'flow_seq_end',
  'flow_seq_separator', 'flow_map_start',
  'flow_map_end', 'flow_map_separator'
  **class** attributes to the 'Emitter' class so flow
  style output can more easily be influenced

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-ruamel-yaml_0.17.32.bb => python3-ruamel-yaml_0.17.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.32.bb => python3-ruamel-yaml_0.17.35.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
index 4b5e77e6e3..1760fec7ee 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ec939063761914e14542972a5cba6d33c23b0859ab6342f61cf070cfc600efc2"
+SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.34.1


