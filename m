Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web10.9055.1619076611904069608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ecxDxOgQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619076609; i=@fujitsu.com;
	bh=819OaLlGh1z0w464ab6NguWvLnws4PqjFm94x7NaVPo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ecxDxOgQ8GK5h/HLMm95f1QD2k46u+MBMjMSer8y2EpxQIiEr/9DjCyzf9Riy1Eh/
	 K8yBzS80H3Q8VBNL+f2bN0mRL+3Z3Yv2+FgGx02XFfcLkgfw/k068zT2cXzIwxmLI+
	 vssvrVulIzDYSiqNKNPZPs/bgzb3cctfWQ7bAMt7V4ssWYfJs1oFU097Ur1/Pb2jk/
	 /0+5zXsS8qrxjoAy2VrjTju6YNC8dCV//ATg3XzQI83Mlg83sku3ua6+tfInhRV7qq
	 UUKGSWC2ROhSNjFyUcwoSBR1gMD4mariP+jXsakDMPeA5Tm4HUoUffDVAY2I+J5ebM
	 lEMnjFHWOSr0A==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id E1/EF-33844-10621806; Thu, 22 Apr 2021 07:30:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxVZdRrTH
  BYH2TgMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFuX0rBEvaK3RM7WBoYj7N1MXJxCAnMYpLY
  MWERlLObUWJP81HWLkZODjYBXYlzj9eydzFycIgI6Elc/ScKEhYWsJHo2trPAmKzCKhKHLm7j
  BHE5hXwkDh88CCYLSGgIDHl4XtmiLigxMmZT8DqmQUkJA6+eMEMMlJCQFFi9nR5iPJKie3Tzj
  JOYOSZhaRjFpKOBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdU11jUwM9RKrdJP0Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIFBlFLI+nEH46HXH/QOMUpyMCmJ8i7ka0wQ4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMGbrAqUEyxKTU+tSMvMAQY0TFqCg0dJhJcFJM1bXJCYW5yZDpE6xRjLc
  WXVkkXMHG/Wgsi3YLLt3l0g2Q4mZy44uJqZYxaYvN9+CEg+AJFCLHn5ealS4rwRKkBDBUCGZp
  Tmwa2ERe8lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8q0Cm8GTmlcBd9groaCago7Wn1II
  cXZKIkJJqYFp/f+LTJVKbIg71XQxyZzVQ93Pesu3jOzWOmh+3NhybwbLqz7emqC8l7euluKb/
  6SnjfWPK/OPKhfqjTP9XhLnPbaldWZ3pWuihm93qmyb61NOXh6mtP6BA/U3ClqJLK7Zu25lyI
  YNt+7vE0PrLbfsSee/pqM2QK66uNlSe587uHFLft6y3SPzchDsqU5OTZyyPeZL+bWGC2J1U4W
  1GHusvyz7RLg1pmhtkxzE7VnflW6PJ6w5f9bAoSElfcID907/Hxxt7zgY8nZB7o+3O/QVumnz
  BJYu4evwUXi1kTDzypjPO5DhzydRnmgzzb1UYnVvgd/mZzc3jfa88HrcZCT81j2Bu6P6VEbbg
  Su38ZiWW4oxEQy3mouJEAPc8pH1ZAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-248.messagelabs.com!1619076608!573369!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2152 invoked from network); 22 Apr 2021 07:30:09 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:30:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7U8vG028302
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:30:08 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:30:06 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.18 -> 0.7.19
Date: Fri, 23 Apr 2021 00:01:45 +0800
Message-ID: <1619107305-54472-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.18.bb => libsolv_0.7.19.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.18.bb => libsolv_0.7.19.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.18.bb b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.18.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.19.bb
index cce20655dd..98e106f6f8 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.18.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
@@ -11,7 +11,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "35e172e9fb99594b49c630cb188dab9d2b2c4dc7"
+SRCREV = "c773294be6b0a2425f344a8999f173fb00cfd16f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1

