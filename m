Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3177CC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:45:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.8984.1677206727250378475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=maeOuu6T;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677206725; i=@fujitsu.com;
	bh=vDNU9XwZgzzflI8rsNlVj+rZ9/RcCSYGIH55EM4Ikpg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=maeOuu6T3AgqHJnWd2/OMY2ADDCSiotPc2AzDw/No+W1d77UotBuCg/FtzOMjhwTD
	 YWOubnqibfJ7vnYFQmanCQ7YwdZbMfMtkBUKUiUEVvJpsBrt3VYH0sYCaxR6I+mIh1
	 au5KBta0xXrzHxraWd2xEDknJSpVPTW5gjg0Gfu6u2bQdYwCgTJ5bbUmcDalEzjKoG
	 biaRB32EGx2PVm2FsXNMTaQdJhZ8oDrLxd3MdNQZxn0vRWFICpTr6/bfSgqWphjPA1
	 7aP1sb856VL3EwoJ12fMuvMPY1f3fC2+yoanohtydcadipk9l5leel8TDvCKKK4zqf
	 D3HpzCBJxLa6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpHtE5Ue
  ywd+d5hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b6fdcZC56yV/zoPMLcwNjD3sXIxSEk8IBR
  4uCBTYwQzhUmib67h6Eyexklbtw+ydLFyMnBJiAlceP+f7YuRg4OEQE9iav/REHCzAIqEi9+g
  0zi4BAW8Jc41K4PEmYRUJU43fuEGcTmFXCSeHdsDyuILSGgIDHl4XuwOKeAs8T6udvB4kJANV
  O/zmCEqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrppdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOi
  l5dasokRGLgpxeq/djDO7Purd4hRkoNJSZRXV+ZHshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  leKQDnBotT01Iq0zBxgFMGkJTh4lER42UBaeYsLEnOLM9MhUqcYFaXEebWUgRICIImM0jy4Nl
  jkXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPtQCWgKT2ZeCdz0V0CLmYAWf3/zBWRxSSJ
  CSqqBKWf5KaYGB3VNIa1XzfL1+3jOVVqYPFT7sGKG+EUxWbcnSw4Z7nKr+i+Y25LyInTHZ8b1
  9eVLdjKsfTPJ9M2MjCO2Ykkfk7/OkJm9SY/p8Ox5mxO/BB1IFcyX3HP488kPLn+fqejlecZOc
  bvZJRIk9c9OtzRnwQ4zF5+r6ZfsvN5F7FrYUDlv+l+fYw33zhwq6E9+5N5yoNSuJSoraPvisk
  OaZW/Ydy0LOp/Nb289lfVDsZvshuUebufObTCZWX1AIPDtY/kDvN2S0tarZDw+zt4T4yXTxJj
  O7njKLsKeNf343RWrfy1ZPf+EQphan3xu1bFXlxI5pj4LOBm/4nyQAHeI267jUwX+J95pMvz/
  VImlOCPRUIu5qDgRAHd2pPhXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1677206724!206535!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10266 invoked from network); 24 Feb 2023 02:45:24 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 02:45:24 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9A6161AE
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:24 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8EE561AC
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 02:45:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 4/4] vala: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 10:44:55 +0800
Message-ID: <1677206695-16822-4-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177652

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/padsp conflicts between attempted installs of lib32-pulseaudio-misc-16.1-r0.armv7ahf_neon and pulseaudio-misc-16.1-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
index 64002cd1cc..686ffe9203 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
@@ -8,3 +8,6 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-misc:${bindir}/padsp"
-- 
2.34.1


