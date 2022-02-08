Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3677FC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:27:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.8823.1644308825598919650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=n6sGPCPy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308823; i=@fujitsu.com;
	bh=UbNR58/cIZjKPLotrq5ILLHi7YeltttSZDrrHE4Ii68=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=n6sGPCPyt3+mkMS4AH+Qz+ljJV/ButpOTdGsWzK2txWa1myU9FO2bTZrE/yjpfwX+
	 rpt63mDVUXYZ/JD+xIHN+WOHjuyKYcF3QaY9mycWlS3JSlHqDqDMrHYx5JvvhTxi+0
	 Sk2m5DKGJtk5nJu/mTFPBuGePiQg1QlwRyiuMMNYLwZmXovVIaFsWP2tw1znwqBMG4
	 OJgDJoAxmd/vH4YMGdiB7jG/115PEf39cZBaJcTQcXtc0bvU7QDERYMdXXZ6MPi9Dk
	 vdZCnujkA7H3HPnLE+6hpsyWTiAohrEysiISsfdxpshwc05ykOdJy6GJhuvG3Yshpj
	 8IzBFw8Ef8U5A==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 81/C4-23802-75922026; Tue, 08 Feb 2022 08:27:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqBuuyZR
  kMPUBj8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHr6z3WgjvcFTt7nrI2MO7j6mLk4hASeMwo
  cfLMEyYI5zyTxP6lmxi7GDmBnOOMEm3HFUFsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJeYu+E9I0gJC1D8w4FqkDCvgKPE7OmfmEFsCQEFiSkP34PZnAJOEicOTYLa5CjR/O
  A0G0S9oMTJmU9YIMZLSBx88QKqV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbbpKLM9IyS3MTMHF1DAwNdQ0NTXTMLXSMTvcQq3US91FLd5NS8kqJEoKxeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgGKcUu0jsYLzZ91PvEKMkB5OSKG+SKlOSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQneM+JAOcGi1PTUirTMHGBMwaQlOHiURHi/aQCleYsLEnOLM9MhUqcYdTkuX5+3iFmIJS
  8/L1VKnFcYpEgApCijNA9uBCy+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQShpjCk5lXArf
  pFdARTEBHfF30LxHoiJJEhJRUA5O3ZajcOdE8ieSHU5/16DGeOeRntVzjOOu06/9/8PbFvamb
  qbummk1Mcg7v7BCFfdYa2x8p5503EXG/ubzueY38xL5zkWe7vHdN2jbrjOCr09fj+/8p1i2pq
  V83gfFeodZWuyfmRx8ve2j/zGO/8KqSLU+jN2Wt2er7Ri9ywZJqPfeeFcV702LtJu3j65+t11
  2VvFNWNMybQW5O6bsd8RMD5nmfrdtgoLeWN3r7x8xlz2ZdnVz666FwMd+Sa4u1Yu8Xx6xoNWH
  dfqM+PfeSTPXk9wIet9fn1AaYxs/Y3n11UkD9G0U9+zMufvUeVmdVpgp7J9ydKtn8Mne6Sm3V
  40e9un97H13QEeOx0ltkoKPEUpyRaKjFXFScCAAFLwbeagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-545.messagelabs.com!1644308822!68396!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26037 invoked from network); 8 Feb 2022 08:27:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:27:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B2B82100197
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:27:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A68E1100185
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:27:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:26:43 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxkbcommon: upgrade 1.3.1 -> 1.4.0
Date: Tue, 8 Feb 2022 16:26:33 +0800
Message-ID: <1644308794-5337-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644308794-5337-1-git-send-email-wangmy@fujitsu.com>
References: <1644308794-5337-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:27:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161482

Changelog:
=========
- Add `enable-tools` option to Meson build (on by default) to allow disabling
  the `xkbcli` tools.
- In `xkbcli list`, fix "YAML Norway problem" in output.
- In libxkbregistry, variants now inherit iso639, iso3166 and brief from parent
  layout if omitted.
- In libxkbregistry, don't call `xmlCleanupParser()` - it's not supposed to
  be called by libraries.
- In libxkbregistry, skip over invalid ISO-639 or ISO-3166 entries.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.3.1.bb => libxkbcommon_1.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.3.1.bb => libxkbcommon_1.4.0.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
index 7c5079c452..c7e12eb0b8 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b3c710d27a2630054e1e1399c85b7f330ef03359b460f0c1b3b587fd01fe9234"
+SRC_URI[sha256sum] = "106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.25.1


