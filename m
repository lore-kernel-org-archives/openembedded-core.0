Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61252C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 11:03:32 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.6043.1645614211210184048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 03:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gsW9S+ZC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645614209; i=@fujitsu.com;
	bh=nPkV2D7lwy5XZ5mTCDip0BfdxWYwrxj1dDL73+rRX/Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gsW9S+ZCkhXH1CB96XmeyEFZXD5ugQKXnxOQGQP1WJFuz+DyZo3HVi9zMjt91wzRX
	 wA148AmePvJdT8du4Uy6VLtIGBYpHtecoxAk58vucw/MtzagmnxUQfee8PZ7YS8ESo
	 8L/BZT+M0458KzY2gILAqnZtFOs70laTQQ47qkiGlf2HjFNxpASPh5XLLaYHSWSggK
	 xaEH35EeondqDFr0+qsVSuOQVBTtQ/O11pT6X2aRk+5nU7IqQ1bN6L8ri86QOCmlwv
	 FXWs78TaRXF6WsnrHdJ87o/VZ8EyJuImYWqKZj+cGT8CRKmYxyeT47gO0Q3pcQm6L2
	 4XrPJRAWPrhng==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 7E/18-00700-18416126;
 Wed, 23 Feb 2022 11:03:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxRbdRRCz
  J4Nt/Ros7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaN//l+2gufsFdOnqjQwTmLvYuTiEBKYwSSx
  7Md+JgjnBKPEmeOzmbsYOTnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnYQW1jAXOL9t
  XPsICUsAqoSX9eIgpi8Ak4S9656g1RICChITHn4Hmwgp4CzxL2nXawgthBQyf/m12BxXgFBiZ
  Mzn7BATJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGq6SizPSMktzEzBx
  dQwMDXUNDU10DXSNDU73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBgTClm
  uL6DcWLfT71DjJIcTEqivNd4xJKE+JLyUyozEosz4otKc1KLDzHKcHAoSfA6CwDlBItS01Mr0
  jJzgJEBk5bg4FES4U3gA0rzFhck5hZnpkOkTjHqcqxtOLCXWYglLz8vVUqcl0MIqEgApCijNA
  9uBCxKLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5rUFmcKTmVcCt+kV0BFMQEdMyRICOaI
  kESEl1cCUrvGiW1o8S0LtyPGZk3ZNs0rRMVebZzs/3VypwOnv4SpJQcb9hY0Jun+1n6ews6jl
  /l+Ya2jP2v5rz/HtvUuvVa30WbnEKORVQorvARapvk+L3wr+sGbctUh1ucCNaKkJ023zzz+ab
  7766bOOpZ5BkzXzZoV4eoTlBQe43TnLK8vg/o//gYV3UaYlX3G72wW7tM6c/tYlH1XdKjYfPn
  6txiyD96kOr77AjoxNqUdKj2ftk/nCHLMvI6RE7scZ3/3fDvk9M9j8dtZVqx8SG25MP2pZX3L
  PMiNMSXfDQZ0T5TcmHmzhPNHJ+HX9ER+m1LXCky/tE36yuqLt4Rtnrc75dw6/2vzoo0Tr0e8L
  bpUpsRRnJBpqMRcVJwIAxUS+700DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1645614208!4293!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23566 invoked from network); 23 Feb 2022 11:03:29 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 11:03:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21NB3Mpt014052
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:03:28 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 11:03:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] flac: upgrade 1.3.3 -> 1.3.4
Date: Wed, 23 Feb 2022 19:03:10 +0800
Message-ID: <1645614192-28889-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645614192-28889-1-git-send-email-wangmy@fujitsu.com>
References: <1645614192-28889-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:03:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162250

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-multimedia/flac/{flac_1.3.3.bb => flac_1.3.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.3.3.bb => flac_1.3.4.bb} (93%)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.4.bb
similarity index 93%
rename from meta/recipes-multimedia/flac/flac_1.3.3.bb
rename to meta/recipes-multimedia/flac/flac_1.3.4.bb
index 7c943b752f..012da0a0a0 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.4.bb
@@ -17,8 +17,7 @@ DEPENDS = "libogg"
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
 "
 
-SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
-SRC_URI[sha256sum] = "213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748"
+SRC_URI[sha256sum] = "8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737"
 
 CVE_PRODUCT = "libflac flac"
 
-- 
2.25.1


