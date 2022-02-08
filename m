Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BC6C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:26:00 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.8724.1644308758252857066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=axP+n2Vx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308756; i=@fujitsu.com;
	bh=5uvPzIA+UhB3Wz5DhYg7wGhDj9X40Q7t/Eqo7hAdGqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=axP+n2VxgnsVaAPLQYnCGEk6ugTHIj8rdNShKhjIH9xAhgcRbdVyk8s+5raIZA9/e
	 wkG53YhBwK4Ahxu6dAWnubY1o3sTyusQWycfbZgZZN3IFCPswyM9mVgMEiWSJzxE+R
	 Xa18JkeFZ82sIVUXRXllzBWSuRUJuugf+UizRgTiTzTIuVfiDskKyu55kDvNf8+bNz
	 n9Y+hgcyOcUdUf7yj0+tEFkTU9sa8tRr5O8TZ0FI5CUBxoBh9FjwavcRHR4tY8YcKV
	 icDwZh4WGMdxWc+mS/31zX52Y3bINSSkB0hUQa9egkLiAY2oQRnRKBPnj+SJRjyr3P
	 oQ+22qrZk2VAw==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id F7/80-00700-31922026;
 Tue, 08 Feb 2022 08:25:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqCusyZR
  kcPSyisWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH42z32guMcFeePf2dpYHzP3sXIxSEk8JhR
  4sCytWwQznkmiW3nX7JCOMcZJY6v28TcxcjJwSagJjH91g2gBAeHiICexNV/oiBhZgEViRe/e
  9hBbGEBG4nHp66ClbMAxaf/WcQKYvMKOEp8WtsGViMhoCAx5eF7sBpOASeJQ/+usoDYQkA1XZ
  f2MELUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itEoqykzPKMlNzMzRNTQw0DU0NNU11TUyMtVLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM4pRi1oc7GBf3/dQ7xCjJwaQkypukypQkxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYL3jDhQTrAoNT21Ii0zBxhRMGkJDh4lEd7j6kBp3uKCxNzizHSI1ClGRSlx3mSQhABIIq
  M0D64NFsWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz3gSZwpOZVwI3/RXQYiagxV8X/Us
  EWlySiJCSamCa8tL/zKp+jiV6ucuCgpRttKLLOzfKdZvfamI6+VD177Kj9cmBAbM9Xp08Unlz
  ZfGubsc16zQygm27pZU2vpLrt1uwp+X4VE7HF5ua7Wa8UjC9rXfjvV4V71Fl19aV/nunNzvZv
  2OzUp20mPWmwMWNT6LFOXZKPnvjO0Oloqbh6PJLlufnCSrL3zyxWD5Gq7joy5w9chs3ZffwyB
  jlr+rp4wxY0jqpwstmvcR3Boa+vHnFR41bZ4vIzbi4qOlVRZX49uuhLDc3Tiu4sN/6zfquQyG
  Sbd4vJK5fe39auqw9WORxw8KwoOzZvyrjNgYsDlkvtlYzR2uP8Fr9NGleC6cD19cvDZKRF807
  4Gb4bIUSS3FGoqEWc1FxIgCVjuEYXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-591.messagelabs.com!1644308755!55367!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15261 invoked from network); 8 Feb 2022 08:25:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:25:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 161001001A7
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0628B10018E
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:25:37 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] findutils: upgrade 4.8.0 -> 4.9.0
Date: Tue, 8 Feb 2022 16:25:23 +0800
Message-ID: <1644308725-5262-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
References: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161478

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../findutils/{findutils_4.8.0.bb => findutils_4.9.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/findutils/{findutils_4.8.0.bb => findutils_4.9.0.bb} (88%)

diff --git a/meta/recipes-extended/findutils/findutils_4.8.0.bb b/meta/recipes-extended/findutils/findutils_4.9.0.bb
similarity index 88%
rename from meta/recipes-extended/findutils/findutils_4.8.0.bb
rename to meta/recipes-extended/findutils/findutils_4.9.0.bb
index b0e56da159..cd9a1691e3 100644
--- a/meta/recipes-extended/findutils/findutils_4.8.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.9.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "bison-native"
 
-SRC_URI[sha256sum] = "57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164"
+SRC_URI[sha256sum] = "a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe"
 
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 # http://savannah.gnu.org/bugs/?27299
-- 
2.25.1


