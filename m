Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBD0C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:47:00 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.47710.1681714013209740432
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wlK/FlGS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714011; i=@fujitsu.com;
	bh=Xalfya0w9l7rcfIVd3CdOn4Vwtjab+ZdF6JjpgvMFlc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wlK/FlGS9BWG97wCP760ekuIFuW+nmnZq4GWwnRbO9+BmB3TcWx5I7Gjurq40iQNx
	 B8E2J5XgbJh6m3jlQbI/ioX70yZvEOsxEpEPnYM495tlWKF7qXwifScLE6o/rFcxX2
	 AYhbUAe38FKegp9PSwSLMQAoK8TLV8YeTlfvlHfeiUtUfsFn+oK6xugjSQ9v7X1hzG
	 JnBuknZOwqRMPOc75WbiCKYL4guHHobtO3Me7IgqZZJDk/V0TGSRJtliPBI3oTM7PI
	 dzhY8Oji7/pWo1vXk65TMBvwxmRHQvwQWylqMkHQF0hBwj11b8uNCvsaZLqlCCvjmQ
	 ldguSapXdbNiQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWTfqtU2
  Kwf9pphZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bChhMsBcu5Km6d3svWwLiQs4uRi0NI4AGj
  xJkdt1kgnCtMEv8mHGWDcPYySjz7NgXI4eRgE5CSuHH/P5DNwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBXYv/aI6wgNouAqsTKp6uZQGxeASeJlT9mg9kSAgoSUx6+ZwaxOQWcJfaf/AEWFwKquX
  v7E1S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkaz4tSistQiXUMTvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pZmTYwfi876/eIUZJDiYlUd4XqdYpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4A
  57bpAgJFqWmp1akZeYAIwkmLcHBoyTCa/wMKM1bXJCYW5yZDpE6xagoJc4r8QooIQCSyCjNg2
  uDRe8lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8114ATeHJzCuBm/4KaDET0GI5JbDFJYk
  IKakGJlHLxJjJl2a72qn93/bdPS6+Kukli9W3TQzyz9YZLWhvsNPnX2P1Y9o7pXXPVhqb7nQ6
  1rohb8mPymNfPTet+HfMSTPZ5dz68lV7O3LqL4fEyZz533Yozn7C9U6p+JdpNpW7Dn3UPrpXZ
  NLzlzm/3s/xadgt8idt9eHDKyev1+jYq3Ms6uDvCRlmYvmrxS4v+7zYykL8mMLtoLt8LxRdci
  ca2Io/E7W+ctx7kRpjeXiNxwyJCQeez7sqYbLu1baXVx/Z9JzfX1XyQuze22snZ7Yqlbq2tEd
  kWl/KSD0o1Zmub8//65P/PiZVlhvX9C5cveuYJnx/q9jnjc+u8YXHxr7cek26Wx5olqPh6z8H
  pyixFGckGmoxFxUnAgARDOXfWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1681714010!733696!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18448 invoked from network); 17 Apr 2023 06:46:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:46:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8073D151
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:46:50 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 743F6142
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:46:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:46:49 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-croniter: upgrade 1.3.8 -> 1.3.14
Date: Mon, 17 Apr 2023 14:46:30 +0800
Message-ID: <1681713993-18603-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
References: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180127

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Add check for range begin/end
    restore py2 compat
    Do not expose i into global namespace
    Fix DOW hash parsing
    better error handling on py3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_1.3.8.bb => python3-croniter_1.3.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.8.bb => python3-croniter_1.3.14.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
index 691c25017..af8892eb7 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "32a5ec04e97ec0837bcdf013767abd2e71cceeefd3c2e14c804098ce51ad6cd9"
+SRC_URI[sha256sum] = "d067b1f95b553c6e82d95a983c465695913dcd12f47a8b9aa938a0450d94dd5e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


