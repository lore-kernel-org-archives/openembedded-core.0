Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C76C678D5
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:45:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.8980.1677206716596573622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XrycsY58;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677206714; i=@fujitsu.com;
	bh=X9JqKAlRPVlHItBOCo++GqPXygEWxf+FIbngKxIm60Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XrycsY58GwFQBmlSCg2xr1vIsymj5BBnxG+ov8ImNG4e5L+ivmMkPqTGQLPEzF/vC
	 FIhOyaW9TizhW6IzQ7Bpvkwr5GE74l/21vZwevyKo82ALCfKPq6YYMh0jenN7c0GDl
	 vZ0LbANXSKiF2l7r8csjq56r6SYdPgKgbaLkEpxxmyHFkl/xxU1vvbkrQGIdxiaEtb
	 hrUaH0KRGsxfOK9gcl0KeBC1tjay+gbboPEtBhhEGG81zCZxVI1ewJueXUl3rew0iY
	 cs7g8Sc1+rRjWHpvweaeuSJiASUxlciC9OqhRG1MlPh6yWg7DUcZwN0W2+ZAtV8YNt
	 4Jy5nhliemxew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqLtT5Ue
  ywarNphZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b+X6dZC/6zV1x5u5KxgXERexcjF4eQwGNG
  iW3T1kA515kkur8eZYFw9jJK7Hz/n7WLkZODTUBK4sb9/2xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUF/CVabn8Gs1kEVCXm7JnMBGLzCjhJPH8+jRHElhBQkJjy8D0ziM0p4Cyxfu52sPFCQD
  VTv85ghKgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhWnFpUllqka2igl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvCnFjMk7GK/2/dU7xCjJwaQkyqsr8yNZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvK0WgnGBRanpqRVpmDjCSYNISHDxKIrxsIK28xQWJucWZ6RCpU4yKUuK8WspACQGQREZpHl
  wbLHovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmfagENIUnM68EbvoroMVMQIu/v/kCsrg
  kESEl1cDEcE+gJ0H61qoEVqagnbk91fyTd/53fls9a97+1OaYtfxfSg9lfcl5L8V2Ldjz4b7s
  Csd8wdiV9z77/NvgLnR9pZnudl7NR4sc+21WMr4OzsxmDOBQFsrM2ZSQbPTSgbMkwNLulDn3X
  fMtpps5lJnr5k6RXB9X+Ol4T1yj1xwRDTPeaSYsnZy2G+Ienr2vqe9Q9khIrW3v1QlJaotPOU
  bZse2PSGQ9fspR5l1T5oeC33lrlXYZPFofmxzmJsq3U6Pa4/G90ltL766SOdd99cun+TMaP3w
  umP/J5r5L1Nfftq4Ja06HBk1eMOlm1YVrfHNiZlcaBgUp7oufmKnzjNM++GGL+jebppcyP0yu
  zVJiKc5INNRiLipOBAAng8PVWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1677206713!21274!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27886 invoked from network); 24 Feb 2023 02:45:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 02:45:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7CB8010019A
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:13 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6E051100198
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 02:45:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 10:44:53 +0800
Message-ID: <1677206695-16822-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
References: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177650

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted installs of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
  file /usr/bin/vapigen-wrapper conflicts between attempted installs of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/vala.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index d3daee37dc..90689662cb 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -66,3 +66,6 @@ PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 vala_package_preprocess () {
 	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
 }
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/crossscripts/vapigen-wrapper ${PN}:${bindir}/vala-gen-introspect-0.56"
-- 
2.34.1


