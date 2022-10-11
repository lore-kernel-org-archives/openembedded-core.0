Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72BBC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 07:59:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.4804.1665475142189269795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 00:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ixrDyig8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475140; i=@fujitsu.com;
	bh=cVi444RD7Pm/lTcdluFZvfZkWvBUZEpmJwAMLkcmQ/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ixrDyig8TvzdUSUKSg/bzpgK8ZTuQEhJ+QMlL2HpIAd/pcqYanRfXiDFJPT0OSlur
	 ufnXmPANI7sA5ZQ8gE4WPwf9V7kHqzBi6UPxss7p2iiBa+1fal8hZ4vJfANWjFZ1O5
	 UT7XxnKibx9iPLTLeYYNVBWqw2rNSS4ISIca0YkgAGsL4OMHIS1IryHve2zXLe23y/
	 Ff1fIqGCcUGWB/iekOtlFbBSc6tNb4467ZWH8LHo8FDf3oApTfPmu/e1aHCL993oDQ
	 7PMvsmoUXhQ6r+0Yr9OR3QdLRnTOhNAM5gJ+6eWHeL7MOMgm100e39KT3NYGzcx/nI
	 5B78Gxl2R+csw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpOui5Jp
  scO8Sk8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnF381Smgis8FcdbUxsYe7i7GLk4hAQeMEq0
  TH7PAuFcZpJ4Me0DO4Szh1Hi5q5WoAwnB5uAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC9hILOpYzwxiswioSvTd28MGUs4r4CSx5i8rSFhCQEFiysP3YCWcAs4Sp9+0g7UKAZV07L
  sGFucVEJQ4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKprqmtkbKyXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYwCnFrC93ME7v+6l3iFGSg0lJlPfqc5dkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8x+Vdk4UEi1LTUyvSMnOA0QSTluDgURLh7ZECSvMWFyTmFmemQ6ROMepyzPzadoBZiC
  UvPy9VSpxXVhGoSACkKKM0D24ELLIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmzZMDmsK
  TmVcCt+kV0BFMQEecvOoEckRJIkJKqoGp7kbU1K9zMz33rtvwsK2RVeda3pTZCT8aFJmjNj1m
  WO6zqo7x5S5bRvtnPlMPfFx+fUH6dUmn8J/2ryZ84zScWPhGNWzp7/zXvV/jDKbfs5LJD1s1d
  e+ZDOltTAc9Iz40n+bb4n9dckHJrKDtm4OD3sU4Ca4LqmWR4Dc0dg5hPxX067aUYeRkptieVL
  3l7Rp233OSJmeduvGprXKbWbT+/NWfDn6RvlB5VjdoU4rPigve/FuefzSYvkX+0cIzLCdWHt1
  2bqmPV+3U+MV+Xxs9qs7HNh27MsXk7bxSzep5t+NmLMpzvMYpejGukSP+X+U/t/C5CQmHZU48
  s+y/3DR55eRq3RY+WYO3OqmKPueylViKMxINtZiLihMBs6GhgGcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1665475139!411705!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10138 invoked from network); 11 Oct 2022 07:59:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 07:59:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AAD7C1B0
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9FF441AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 08:58:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libical: upgrade 3.0.14 -> 3.0.15
Date: Tue, 11 Oct 2022 15:58:14 +0800
Message-ID: <1665475094-16329-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665475094-16329-1-git-send-email-wangmy@fujitsu.com>
References: <1665475094-16329-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 07:59:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171599

Changelog:
=========
 Add missing property parameters into libical-glib
 Fix CMake option USE_32BIT_TIME_T actually uses a 32-bit time_t value
 Fix icaltime_as_timet, which returned incorrect results for years >= 2100, to work properly between years 1902 and 10k.
 Fix x-property comma handling and escaping
 Built-in timezones updated to tzdata2022d (now with a VTIMEZONE for each time zone alias)
 Fix fuzzer issues
 Handle unreachable-code compile warnings with clang
 Ensure all vanew_foo() calls finish with (void*)0 (not 0)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libical/{libical_3.0.14.bb => libical_3.0.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.14.bb => libical_3.0.15.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.15.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.14.bb
rename to meta/recipes-support/libical/libical_3.0.15.bb
index 44030fdc9f..1ceb0005cd 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.15.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "4284b780356f1dc6a01f16083e7b836e63d3815e27ed0eaaad684712357ccc8f"
+SRC_URI[sha256sum] = "019085ba99936f25546d86cb3e34852e5fe2b5a7d5f1cb4423a0cc42e399f629"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.25.1


