Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18A1C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:09:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.5050.1678878578113539836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Sq3WFcXx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878576; i=@fujitsu.com;
	bh=GdkcwFIdqzcyDObp+GF/9NJ4ntzF4NZjkfwe1Poa2a0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Sq3WFcXxu4Nn83a3Rkvb7FUOE9o/Pn/Sfp5BoG6ENJEnv9RNCE+LcTvy58snL3nHz
	 z3TGO3qpVs3FMIMfNISU5pJKSRt/X2pDtwoGpjIW5WnO57L471QC4IxpeyKBRTZVkx
	 dQm+Z2vXqM6z7ds7Vu1avOWs2QOxtoiBeVaDj4x+xCLqL8+TuZPfb5dHBdBQQMZxay
	 Erqu4JAfPYpBg2BovFLtms5ghjJWAe1C+1aEkjxsCcYunWYQHoLZo7M+jMoPLNDEhI
	 s4LlUqqQQ+pyp9nH7T/C7KkAT/XvDvOH+H/h8g1+VfujOzr6r7OJ2+1HEYbnydal9l
	 3WVIZTLMnfyKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqJu/XDD
  F4PseSYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPNgU2MBbN5Kt5NXcjUwNjK3cXIxSEk8JhR
  ovtoIyOEc41J4uTau6wQzh5GiTUHZrF0MXJysAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sIGFhAXeJLa81QMIsAqoSE89uYgexeQWcJBZd+s0IYksIKEhMefieGcTmFHCWePTrGROILQ
  RU82HFXBaIekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4
  LSfsCRqZVjGbFqUVlqUW6hmZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIGhm1Ks7r6D8UjfX71DjJIcTEqivH/WCKQI8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuDlWyKYIiRYlJqeWpGWmQOMI5i0BAePkghvRD1Qmre4IDG3ODMdInWKUVFKnLd9KVBCAC
  SRUZoH1waL3UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmXgUzhycwrgZv+CmgxE9Bi3nk
  CIItLEhFSUg1MFtsb+phqTTW+H7t3r/D4rH3rFxTOqnc50nU+48oW4bUe1y8IOr3lkeONEu6X
  mVif9b+tPW5KwNXLE5ze6Hh3lFXU2/jd1lt7JaZy1TfT2du1TuroWC3uuJjOeyC1gXFG9HUOw
  YbKb9kikzrub+kKymblXBRqWhESW3ZAT9LGNuD1vD8RPKH9bkt+R4crrHB/zHV4TWgz97n7n7
  U/te/VXPO4PvWkwf2feYH5SjFX61SvGcSsTy5sVFvI16NsVTjjrRXbxZ9CHAcZuFw+9b3yz36
  03f2sldl6ie5D1lsW7Dt+t/WrhAtr+v6k5ZLr2UX5urz3pOyqsVYtCeM9qqO7ON/TJIODOZ91
  dT7TeyWW4oxEQy3mouJEAL8Jw/9YAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1678878575!238252!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15298 invoked from network); 15 Mar 2023 11:09:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:09:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 191A01001A8
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:09:35 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0D1841001A2
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:09:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:09:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 67.4.0 -> 67.6.0
Date: Wed, 15 Mar 2023 19:09:02 +0800
Message-ID: <1678878545-19387-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
References: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178536

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
#3804: Added caching for supported wheel tags.
#3846: Added pruning heuristics to PackageFinder based on exclude.
#3843: Although pkg_resources has been discouraged for use, some projects still
consider pkg_resources viable for usage. This change makes it clear that
pkg_resources should not be used, emitting a DeprecationWarning when imported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_67.4.0.bb => python3-setuptools_67.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.4.0.bb => python3-setuptools_67.6.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_67.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.4.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
index 1a29d37a02..aa1d525c02 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.4.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "e5fd0a713141a4a105412233c63dc4e17ba0090c8e8334594ac790ec97792330"
+SRC_URI[sha256sum] = "2ee892cd5f29f3373097f5a814697e397cf3ce313616df0af11231e2ad118077"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


