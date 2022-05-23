Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332AFC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 07:04:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.24697.1653289483527033615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 00:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jA6oTT+m;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653289481; i=@fujitsu.com;
	bh=9brvb7HGrYibwduENVT53/j/2Do5N6/P9cE5eTTPna8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jA6oTT+mrjuhpLA65BJozC3Mgn/XjvLOwBafptxCv60ycbAnilE/19sjcxtn8J8v4
	 v1dw4z9dW9TUlFBUOmhiITMLx3hEd8b0LoeKKSeKpnCrmzUmDygCh+yiPyW027BRyp
	 gougQxFjMATJKwSkG4sP8Gm3bbYidjd/7p2zHB3vQ9iWq1WaqsTMaKAgYwuWH1YpZC
	 PCWnUgUyH6/2ZDm1wL5umvCsBLdNSTXO/wWzOzOG5DWy4ZSWYLEbqpl0CFejbO1D+l
	 4Nh+piE4PegpqY2V3OlKJtxmOaM35sfLc7wscvXvyooYLVidwIBRIocrr5ahjDfLyO
	 fLqrYJ0Ct2Y+g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSZfDqDv
  JYFGbicWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHtyU+WgiNsFbtbLjA1MD5h7WLk4hASeMwo
  cXRRLxOEc55JomnzP6jMXkaJF9MmMHcxcnKwCWhI7J56Gcjm4BAR0JO4+k8UJMwsoCZx9OVPs
  BJhAXeJf+83MoHYLAKqEh++LGUBsXkFXCT2LbkDViMhoCAx5eF7Zoi4oMTJmU9YIOZISBx88Q
  KqRkni7aU9jBB2hcTrw5eg4moSV89tYp7AyD8LSfssJO0LGJlWMdokFWWmZ5TkJmbm6BoaGOg
  aGprqWprpGhob6SVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGZkpxQssO
  xtv7fukdYpTkYFIS5U2U6E4S4kvKT6nMSCzOiC8qzUktPsQow8GhJMHrpQuUEyxKTU+tSMvMA
  UYJTFqCg0dJhFdNDyjNW1yQmFucmQ6ROsWoKCXOu9EAKCEAksgozYNrg0XmJUZZKWFeRgYGBi
  GegtSi3MwSVPlXjOIcjErCvJ0gU3gy80rgpr8CWswEtLhXohNkcUkiQkqqgUlmf5rOqcKnBXb
  ZG3z4LibWsN+otf6pk24fULPPRWGL0e89DO8XuF84b6/c2JSd/fdqv/bbN1qedadnRV1uPBr4
  SfaES/2ZUzMyr3VtaMhVbWg2L7j3Z65pxJx5D/M45Y+dX2K7s2qJ+BSRZMMD3a/fdwdOUI60L
  FjcN39O/EMRr6W/+t6t0WnvOBj8fputyruImQaOXOe2vKt3nMfxxt78dJuo4Aqh9mfvrzdGBT
  1Sq02yspFIeyluPfXUk7OyAX8fBLHaXrhfXcqr8rB8Ree0By+an+v/eL55QfuxhQpFtmdL3nX
  wXtwfbduUpbZN7p9nmXTkRO4dfz6+FHy5cFt8UB7X9lmvRZwcDJ5e71FiKc5INNRiLipOBADO
  A7aDRwMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1653289480!2618!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19318 invoked from network); 23 May 2022 07:04:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 07:04:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4415A1000FD
	for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 08:04:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 37C381000FB
	for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 08:04:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 08:04:35 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [PATCH] cve-check.bbclass: Added do_populate_sdk[recrdeptask].
Date: Mon, 23 May 2022 15:04:25 +0800
Message-ID: <1653289465-4176-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 07:04:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165997

As product, sdk should do cve check as well as rootfs.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 7cd98ae..3729d9c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -218,6 +218,7 @@ python cve_check_write_rootfs_manifest () {
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
+do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
 def check_cves(d, patched_cves):
     """
-- 
1.8.3.1


