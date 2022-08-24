Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67157C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:47:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.8710.1661330811955241244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kU9+Edwi;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661330810; i=@fujitsu.com;
	bh=HCJP1WX7lylxMP0zJJyrjl2CNN+Fm98BtK4g0PLeWus=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kU9+Edwipc0g7GnwTbTnqVjbN8M9UkKI9FgTLDIlCeakOBIg+1QXhTnWJqJEPKXnu
	 EwXmQHdj6k6AJoLGN3JS1prpEejZ1MUEw3VU4Jk1ChnbIUD8P9yGt5Gwo8leJJ5o95
	 zdss3JoGCzb7nxf0EyI9Z5Dy/XpJppaPIioJQpXuQ4KuBxP0XYS+maRWw0tkQlbW3o
	 +R5gJ8bMS+S1E1UWBNDzJc3z3m2LQq89E04Fdafrqnv5hIbGrWZ2vOZHE2PFEYonYP
	 yrbierTK+okL94b3cYNId3BfYumqm25GhO7GC5zSYPzbVLGMBGlGn/snlNOH0FpLN5
	 XDbmNkE+Tt1cQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSbfqKWu
  ywa5TLBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aU3gXsBbc4Kz7fmcXewHiOo4uRi0NI4DGj
  xIoHX9ghnOtMEpNvLYZy9jJKnP3ymbWLkZODTUBNYvqtG0A2B4eIgJ7E1X+iIGFmARWJF7972
  EFsYQEriaeTu9hAbBYBVYnlfc1grbwCThJbZ68HsyUEFCSmPHzPDGJzCjhLbDt0BKxXCKimo6
  2HBaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSmxZ1Y/E4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xBZBpqZdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjGKcVquTsYp6z8qXeIUZKDSUmU9+YZ1mQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErwCT4BygkWp6akVaZk5wJiCSUtw8CiJ8EqAtPIWFyTmFmemQ6ROMSpKifOmPgJKCIAkMk
  rz4NpgcXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvlgdAU3gy80rgpr8CWswEtDhoNzP
  I4pJEhJRUA5N9btuSLq6rhgUcjY0JmjuCDgabTJ8oK8Ulf3l77+01WsYbt+pI79rgLR9a93Wb
  gb/klkPfBCYGlu3ZffRGuN2bXRMDj/NZLvWZ+nVZxooqxdb6pecudCYUXTaQrhQUPNVkdqik6
  uC97wctJovxrorQyfq2aM17DiHrFQcPXZKMMM5MY8v8WDKpapfBitO/qrxu7/y0UiTd0SUmYX
  Vkt4ft5CcF2esXmB64l8sY1/DasE3rYfPDowvv6EyUtr5qvOfCC9Pjn/94SnnNazso8tQ3sbL
  3y/2+t5KNX+Zc2KHSsfmUe95PY7ZU44Sevq4o77bFyv+ERB4ffC25re66fOV+2SaLjeETnHkc
  JGZMrFZiKc5INNRiLipOBADBiXtDXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1661330809!17846!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29576 invoked from network); 24 Aug 2022 08:46:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 08:46:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BDBB41000DC
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:49 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AE88C1000CC
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 09:46:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pkgconf: upgrade 1.9.2 -> 1.9.3
Date: Wed, 24 Aug 2022 16:46:17 +0800
Message-ID: <1661330777-13307-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
References: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169793

Changes from 1.9.2 to 1.9.3:
----------------------------
* Fix a bunch of minor code issues pointed out using Clang static analyzer.
* New API: pkgconf_solution_free(), which frees a compiled solution graph.
* Fix behavior when overriding global variables with '--define-variable'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_1.9.2.bb => pkgconf_1.9.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.2.bb => pkgconf_1.9.3.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.2.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.2.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb
index 576710b8fc..453da89c3d 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.2.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "db6bf5426e0e9fc107042cc85fc62b1f391f1d7af46c4a3c39b7f5b5231dfa09"
+SRC_URI[sha256sum] = "5fb355b487d54fb6d341e4f18d4e2f7e813a6622cf03a9e87affa6a40565699d"
 
 inherit autotools
 
-- 
2.25.1


