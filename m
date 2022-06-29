Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79869C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 03:27:11 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.7216.1656473222271185845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 20:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ofoKJejq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656473220; i=@fujitsu.com;
	bh=kFo2jzsAoKpvV6B4g8zuRduCDhFkFndf0kc8uHZsnWc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ofoKJejqMlmIVNjO7nK4+akrIVUcSSqqRIw1MLoUIIQo6I6Sdvs68v1YeDHV0K3pS
	 2XW1t17SjRvKTVqDPV5WbrXe2qWNK2ZQIaggxbSILC9ax1QJTE8fyF2Co6raZrL9ZQ
	 OF/d7Gpku3VzwUuU7JT8Ywp2NhzzD4hI/nmUIZowkc+VnCDVTFEddntOQnfNToTuKq
	 X9L3EbRiKfOc1Up4p/m8k9Jc9da6/lEaxIKH6i1BpheZO27+4iEj/JUG69UDWCdXbH
	 zBm7P109BqrZM1I+JCoF6mDfiCn0m2mHo19+oR8xf6xnW6ZhdAmtzh43rOpQeHIB97
	 jsV2L2KmYXUcg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSbfl2O4
  kgzOH2Szu/HzH7sDocW7jCsYAxijWzLyk/IoE1oz1Ez4wFXzlqtizezVrA+Nzzi5GLg4hgceM
  Ej+n7GaBcK4xSUx40MYM4exhlPjyaS1TFyMnB5uAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+
  N3DDhIWFvCUWH1XGSTMIqAqse1SL1gnr4CjROPCmYwgtoSAgsSUh++ZQWxOASeJ9QeWs4HYQk
  A1E1a9YYOoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRGwVlI2mc
  haV/AyLSK0TapKDM9oyQ3MTNH19DAQNfQ0BRIG+saGZrpJVbpJuqllurm5ReVZOga6iWWF+ul
  FhfrFVfmJuek6OWllmxiBAZySnH6jR2Mu/b90jvEKMnBpCTK6zhtd5IQX1J+SmVGYnFGfFFpT
  mrxIUYZDg4lCd7II0A5waLU9NSKtMwcYFTBpCU4eJREeItA0rzFBYm5xZnpEKlTjLocM7+2HW
  AWYsnLz0uVEuedAFIkAFKUUZoHNwIW4ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPyHga
  awpOZVwK36RXQEUxAR/hN3AFyREkiQkqqganym+fZaUsOdix64f5rlWXS2Y+1F1b8O7TGRKZ5
  E9PTyZU3X89axKewX6Z+D4e6hXB73bylx3acPTSDY8U9n8BrFaXnFj/Y0nSx/JaFyBfOXc9m1
  0nf+nRj8Ry3EyEnvD9GPdqySb0ln72Ra+q9X+9a1aoupIfqGaVkbDy/WeL3/aA8sTcmzlsSt6
  9b+GWzBsellXMX9nS3npo630vc4OYzCw3f1KRTlTOz5z79vWfaH4cogY7/09mfR3+PP/W1i+1
  Yl4J9Q0cCx7JWj5+GLmmqplmbDXj/SW81E7X7I98Q0fJiV3Kw+f7rdm8ErxVl1gYx1Ti2pMce
  O3IjwE1fke+l9vLFU9a/eyT0PJXZ7vcDJZbijERDLeai4kQAmPIdLGsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1656473219!134786!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4290 invoked from network); 29 Jun 2022 03:27:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2022 03:27:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 882F71000C0
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:26:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7B116100078
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:26:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 29 Jun 2022 04:26:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodome: upgrade 3.14.1 -> 3.15.0
Date: Wed, 29 Jun 2022 11:26:38 +0800
Message-ID: <1656473198-4226-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656473198-4226-1-git-send-email-wangmy@fujitsu.com>
References: <1656473198-4226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 03:27:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167365

Changelog:
=========

New features
------------
    Add support for curves Ed25519 and Ed448, including export and import of keys.
    Add support for EdDSA signatures.
    Add support for Asymmetric Key Packages (RFC5958) to import private keys.

Resolved issues
---------------
    GH#620: for Crypto.Util.number.getPrime , do not sequentially scan numbers searching for a prime.



Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pycryptodome_3.14.1.bb => python3-pycryptodome_3.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.14.1.bb => python3-pycryptodome_3.15.0.bb} (38%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb
similarity index 38%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb
index c0324590c2..cabe9189f2 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "e04e40a7f8c1669195536a37979dd87da2c32dbdc73d6fe35f0077b0c17c803b"
+SRC_URI[sha256sum] = "9135dddad504592bcc18b0d2d95ce86c3a5ea87ec6447ef25cfedea12d6018b8"
 
-- 
2.25.1


