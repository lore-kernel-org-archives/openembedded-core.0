Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web11.9244.1619078066692235790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dKOih+Du;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078065; i=@fujitsu.com;
	bh=MPxToe2psZ+YdXWrSEHTGYK6e379fnu8lIR5DJ0RxDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dKOih+Duscb0A2v9VYCFcyszmlE9QgQR5F/1Id0zGm2f+oAkXsny2jYbZqB3Hb0XI
	 f1Dw57X0kVJk8LLYoiJZVhNOB/7stv9n1VkxQGWZ9zm49ji7r4mN5spFq3f9NzNBZZ
	 L8H29dyVY/hMibxJxAVkn7iUiSLIpYlOZFEzbfbyNlgodKIoDWEs9XfMDM45QxshMk
	 ObndE6a7TodpYli0MN1vBTf3If85oW1dwkskf3yKbYhPzgFepdHr1pOkw90BdtDXIv
	 N479wGw8nAyZLgKR8u68ne3RKPIAVkszIBVbZIseie55onpBc6lHNO4IQrpiUheJOn
	 HYRpXtEX1DbiQ==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 80/58-23163-0BB21806; Thu, 22 Apr 2021 07:54:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRortBuzH
  BoPmEmsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH6kXTBY86KrWvOMjUwHufoYuTiEBKYxSTx
  unk7C4RznFFi5dkpjF2MnBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSxgJfF/W
  SMbiM0ioCqx+34XWCuvgKNEz48PYLaEgILElIfvmUFsTgEniXWnrzCBjBQCqll4OBSiXFDi5M
  wnLBDjJSQOvnjBDNGqKDH7cjMLhF0p0bl+AeMERv5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9f
  QwEDX0NBY1xzIMtVLrNJN0kst1U1OzSspSgTK6iWWF+sVV+Ym56To5aWWbGIEBmNKIXvmDsbJ
  bz7oHWKU5GBSEuVdyNeYIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC94UWUE6wKDU9tSItMwcYG
  TBpCQ4eJRFee5A0b3FBYm5xZjpE6hSjLseqA9NXMQux5OXnpUqJ864GKRIAKcoozYMbAYvSS4
  yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeS9rAk3hycwrgdv0CugIJqAjtKfUghxRkoiQkmp
  gslu2MUXzenyypcPBpzWGkzsN+9Kbm/ZoFWz31up8c/JyUtBlnm/rrhRZvtg3Z8o6puMP+pjf
  ytrZ5jgtmP5jkfy5/MspO13iKnfqTg96nxz1QXjfgy7JdS/rj3qsYwrtW7uSp6RF69U05h8Zb
  sJ3e9qvzT0UdGDJl4kOX3p773T9Dzt9wJJtiVTPhGxN1fOLv3ROzg4I/NDp0BLr0rdtj9ePoq
  u6rq8eKNW3n3viWyhRxPjnrkbY0tlTL8yf8fNX+VKrTH/xPn2NpU8X5Kw0dNp/ePL2f9cevYl
  Ynul4vFvI1i7SM/3Mzwt7X0ovEv5fnb+58r3YOdlfQfwBYv/mTLM60Bx95QbDp9rcoANCIkos
  xRmJhlrMRcWJACB+hBBNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-245.messagelabs.com!1619078064!1944265!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18044 invoked from network); 22 Apr 2021 07:54:24 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:54:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7sN8L014554
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:54:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:54:22 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] openssh: upgrade 8.5p1 -> 8.6p1
Date: Thu, 22 Apr 2021 15:54:04 +0800
Message-ID: <1619078047-5587-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
References: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssh/{openssh_8.5p1.bb => openssh_8.6p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.5p1.bb => openssh_8.6p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb b/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.6p1.bb
index 6a49cf71cc..be56fe43b9 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25"
+SRC_URI[sha256sum] = "c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae"
 
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
-- 
2.25.1

