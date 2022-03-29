Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E01C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 01:47:23 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.1754.1648518441747873216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 18:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uvSnQWtb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648518439; i=@fujitsu.com;
	bh=WVbI6ViJ51q+qqYzZh7B+/x0JD8xmZ4xSng4VSuyvwQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uvSnQWtb/Qfonv6rFSAmjosG38E2gPE8fWZeXyE4QPnzkI4rM58gfKgyBkI+NRZuy
	 7AsiWVbqk4p2V1ACKs5HJdN61/nPbAmsFN/3GakWW4dJtaI9oxwo1IAPd5Sad36pMh
	 +IojzWEk+2JIxZwFylhSs4VX7RrGqr0Du1EaqEy58+a0f1N1gpZXjul4q4e6TciKnf
	 6lncMWCsxMZCKjhaaVtf6fRqCFeT178GtA0Fhdw6J0xX1iFnZWSlmC3NlXiQWILM+8
	 U3jQzoa7orIx4PL2hryYQVbmxFu1IiwstrDfh8Qy8Z7SSSCfnwu80doD4gmxdY0z4W
	 sNNjwyI9I2zsA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqKuW6pR
  k8PWOgcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtF2diFrwV6eihMbN7I0MM7i7mLk4hASeMwo
  0fJ9LhuEc55J4unLX1DOHkaJCxcmMHcxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAi8Tv2dtYQGwWAVWJrRceMoLYvAJOEk0bXoLZEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRMKspMzyjJTczM0TU
  0MNA1NDTVNdQ1tdRLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMyZRiRusd
  jB19P/UOMUpyMCmJ8l7QdEoS4kvKT6nMSCzOiC8qzUktPsQow8GhJME7PQkoJ1iUmp5akZaZA
  4wPmLQEB4+SCK9WMlCat7ggMbc4Mx0idYpRUUqcVxskIQCSyCjNg2uDxeQlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8LCBTeDLzSuCmvwJazAS0uO6xI8jikkSElFQDUwyzWONGhS9HPUv
  8VDM6ticl3/52L+DojxwZnzPc0QtKav0NCte+W/RjgrBISaUOw1Lmrcs3XHqSvnZ9rqzALdUJ
  vyu/zDscz5Va2Ntke6t8lpxN4BGRN6v5ZF7tjv500oxV1enFJ9OcS+89lGV5jrxb3OTPleGoE
  WFQohp4KvWA12lWz8+Bj2pbp29i48+9ILvRXzKwsKJhDk+m2LLbnP//L9ZuWp27ufGzIuMywT
  +bjmffMJnhmr+zg+XdXJnvcTpq8q80rvtG7PHUlfp8sT7bZ+8L0dNmPl+Ek54qPnIIyOMsYnv
  3r/JJoFrxktjj21sCrwtPTf2yac6BDU53tsy5xlErVzj9SkfH8h+HlFiKMxINtZiLihMBj/K2
  +kQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1648518438!11687!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15208 invoked from network); 29 Mar 2022 01:47:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 01:47:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 597D810018E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:47:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4D83B10018B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:47:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 02:46:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-urllib3: upgrade 1.26.8 -> 1.26.9
Date: Tue, 29 Mar 2022 09:46:27 +0800
Message-ID: <1648518387-21489-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 01:47:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163731

Changelog:
==========
- Changed urllib3[brotli] extra to favor installing Brotli libraries that are
  still receiving updates like brotli and brotlicffi instead of brotlipy.
  This change does not impact behavior of urllib3, only which dependencies are
  installed.
- Fixed a socket leaking when HTTPSConnection.connect() raises an exception.
- Fixed server_hostname being forwarded from PoolManager to HTTPConnectionPool
  when requesting an HTTP URL. Should only be forwarded when requesting an HTTPS URL.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_1.26.8.bb => python3-urllib3_1.26.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.8.bb => python3-urllib3_1.26.9.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.8.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.8.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
index c2a51b9148..95ae4a54a4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.8.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c"
+SRC_URI[sha256sum] = "aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


