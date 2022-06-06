Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97362C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:28:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.31229.1654518476768899880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RNbQOcoB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518475; i=@fujitsu.com;
	bh=e2lxGJWEWdBPFls2yNrfoYjS9E3v9LQFDbDuV6LgCDo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RNbQOcoB54h5DkRQ599gG6UlT+NdTGoHvX2C4UHG0nX0FCbrNLP43Ib14OTlIzGtz
	 SKVGWOvr6xyMEZEvj6hitQjDgL+jkk3UmfOWSIJ/L9I+XRiHg0WNeL5VAGc0txJVWf
	 CochJnmy2S7FXB89QjE/1nRtAtT3rS82xQ9nu9RMXo9/D53tdVR1tAe9GM/HGGBTSS
	 g5sbzEH/NhPzUu7HEh2WWV1C2yrS+FJ+f3aOVPynUKK2ibbJFWmNFU3AA79WkPJg/F
	 jArIAFesOOF4ff+vgPgDAAqtp8x2I9RziH7POjzrP1clFmFA4nfgb1v5zlcar90vlh
	 sguvZQeVoEWpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqHvq09w
  kg68HdSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owT6+ewFizirFixJ6KBcQdHFyMXh5DAY0aJ
  99dPsEM455kkru49zAjh7GaUmH7pP1CGk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuA
  SsRFvCQuLKjmRXEZgGK73h/iQ3E5hVwlGh+vw3MlhBQkJjy8D0ziM0p4CTxed1VsHohoJqmSV
  eZIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRIzZsDMVJO4em4T8wRGwVlI2mchaV/AyLS
  K0SqpKDM9oyQ3MTNH19DAQNfQ0FTXVNfI1FQvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwhFOKWf/vYOzu+6l3iFGSg0lJlNf+2twkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8dR+AcoJFqempFWmZOcB4gklLcPAoifBavwNK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1
  VKnPc4yAwBkKKM0jy4EbDYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcByBSezLwSuE2
  vgI5gAjrC58EckCNKEhFSUg1MG6yDNAx7Iudk/37zrPqprFZi0vsDXsxK56bZ5NjUeN15petT
  W7P96pXyXpdTm9gF3HWfVOyJ+fLkflifdqbZPL3jb/M6kxM+zlQW7hOTmJDnKmH3dePJHb4Ps
  j3m8IdzWBY/zLe8Gfr+33NGLlv9VgWGJx9KFx/Sm117p/xOTL/s4UUyktWLfbL4fyWdSSv4xs
  1hdoL7+9NZe9jkjaPWd38NmWupfuNu2p9JYmvzp1389NX/Vozh2uNrz31rYpps41defOiJgde
  vuS0K+85+EIjxfXDNVCWP1d/+Qtw+qQknNI/NOpF/Tqe/5Xf51q+zKubYzTjbo7lWdLEy02fd
  7dNVJl9Td7/atTK36g+7EktxRqKhFnNRcSIAjEoHMGgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1654518474!415998!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23482 invoked from network); 6 Jun 2022 12:27:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:27:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 43DC81001B0
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 376C8100184
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:27:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.46.9 -> 6.46.11
Date: Mon, 6 Jun 2022 20:27:13 +0800
Message-ID: <1654518434-9263-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
References: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166623

Changelog:
===========
Mention "hypothesis.strategies.timezones()" in the documentation of
"hypothesis.strategies.datetimes()" for completeness.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-hypothesis_6.46.9.bb => python3-hypothesis_6.46.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.9.bb => python3-hypothesis_6.46.11.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.9.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.9.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
index 1a1defc583..1d9772d4ff 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.9.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "8b1349dab58cf9bc85687e2721c008e99f23a32fb70e688779c81b0298904160"
+SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


