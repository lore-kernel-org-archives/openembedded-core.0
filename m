Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC6EC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 00:12:19 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.622.1643069531154519257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 16:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k3wQ+IWw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643069528; i=@fujitsu.com;
	bh=jW2Xj8XmnFO07cWJC2DjNADgtfTbLAssVN0Ns+hvIaM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=k3wQ+IWwZsUgmIyduW0wd/12zsWzo/Il+9zYj1R2mw2njXZobb1iCo1hSF2V50X5n
	 JxQNqywRmtz1dlK8xENElp5OTV5guGFpTdP0g5OBdqyDLd9GDRZasBMUWASLmf8XAK
	 7lCMk6jeu1y4pNf46N3TK9UsP7xRpLRmY+c2xBFxe8LSJRaELyuYuYKqp7T8KEffsR
	 B6gzxo55c1WImx/1C+vjeiqJf20oZ+HOBDm+V8wkw5vXaw0WdrvrZqk84WKMy2CVhF
	 EeOkiCLTiNDfU6iATTwTe+suyqdZm/NpKYy8Z4cbAm67TKnivNrfvWI3+aUUSrulxT
	 hXtnUlSWQ6fcA==
Received: from [100.115.70.120] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 BA/F3-30582-8504FE16; Tue, 25 Jan 2022 00:12:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSTfC4X2
  iwdr7AhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bUmROYCj5wVrRPXsrUwPiEo4uRi0NI4DGj
  xJUf19ghnPNMEjd7tzBBOCcYJSbPn8fWxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAjYSx7smMYHYLAKqEm/W7QBr5RVwlGh68pUVxJYQUJCY8vA9M4jNKeAkcXRCO1hcCK
  hmy4ypUPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxjtkooy0zNKchMzc3QNDQx0DQ1Ndc3MdA0tzPQSq3QT9VJLdZNT80qKEoHSeonlxXqp
  xcV6xZW5yTkpenmpJZsYgcGcUuy0awfjwb6feocYJTmYlER5ja3eJwrxJeWnVGYkFmfEF5Xmp
  BYfYpTh4FCS4D1uA5QTLEpNT61Iy8wBRhZMWoKDR0mE96QdUJq3uCAxtzgzHSJ1ilFRSpy3yx
  AoIQCSyCjNg2uDRfMlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8HCDjeTLzSuCmvwJazAS
  0+Pf5dyCLSxIRUlINTFnZH34GTvCoXM6+Ppb3YqFI5qIvt27xf7UOnC0y6U1r1dVCo4SoLhU/
  tSrW9f3cT9hnyi9bPUGC98GKrfpT7H9ELrGzO6/4iKHkgs+3xjoNiWcW74Ou2/zf27R+6Qk58
  1ubipXqt058/bi74lsx08nP+zsPvzJeY/ZHyPvU5ojGXdZe0fYbNSQLbMovPpDb5x1SaTjl37
  KVpuude/oYnvUrPK75YJS+eFetlsKBupBpq3imW2Qus/rnEfOI9+b2WX4nK+avS2suXN/Qyv/
  U3Ni43DxN7qXy+TlP01bV2TEdKNwSPenuUqVX2w8dX/zmSY36jpstDHtiTodX3jwtdiDo+srj
  zSoBjifW2a9bWKHEUpyRaKjFXFScCACwZthxYQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-528.messagelabs.com!1643069527!11021!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24471 invoked from network); 25 Jan 2022 00:12:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 00:12:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C8711100359
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A48C5100344
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 00:11:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nfs-utils: upgrade 2.5.4 -> 2.6.1
Date: Tue, 25 Jan 2022 08:11:35 +0800
Message-ID: <1643069496-5684-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643069496-5684-1-git-send-email-wangmy@fujitsu.com>
References: <1643069496-5684-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 00:12:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160907

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nfs-utils/{nfs-utils_2.5.4.bb => nfs-utils_2.6.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.5.4.bb => nfs-utils_2.6.1.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
index 459f68f05e..4ad8a01844 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
@@ -31,7 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            "
-SRC_URI[sha256sum] = "51997d94e4c8bcef5456dd36a9ccc38e231207c4e9b6a9a2c108841e6aebe3dd"
+SRC_URI[sha256sum] = "60dfcd94a9f3d72a12bc7058d811787ec87a6d593d70da2123faf9aad3d7a1df"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.25.1


