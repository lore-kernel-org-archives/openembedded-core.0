Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ED5C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 07:58:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.4698.1665475117040207653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 00:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pVvfqum2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475115; i=@fujitsu.com;
	bh=ZvKJloBgz0hRBozs9DOEdvd0cn9kmCqKmBTvaSzDTv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pVvfqum27cVrsNTY/B3G82DMTbMALQsi6GCO3tg+G441h/MWI8AB3d2Qu7kU4Ajud
	 y0Cpsc4EA8+wdgzEGWgZjYFr5FaY9bd85u0ibgOfpB1RmlhnTdMscSu/QZqrSOU+s2
	 gkbhMS78WyxRhFDjQxLLJRwL0rnuz+k9OoaT6mqwSpN8tqSQZfBDdsQUdYYVr70kTj
	 K55d3x3MVatl6/0HUWQ8Kgq1GtpCBJL3RSWhnArL9FnwdYKq16uLxMBrxUqlt0ojMA
	 lzbA1mm9zE7ocuBoWkx7ZdAIgm8U8DuUpmEyKSs3GrrY5WZEMgOabspyjKb/4hPEvB
	 h/S0l541OKonQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpKul5Jp
  s0PFL0+LOz3fsDowe5zauYAxgjGLNzEvKr0hgzejfOpu5YBF3xZy379gbGLdydTFycQgJPGCU
  OPnzPBuEc5lJ4vTV/1DOHkaJv/POATmcHGwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLOAlserWAlYQm0VAVaJnWy+YzSvgJLHk324mEFtCQEFiysP3zCA2p4CzxOk37WC9QkA1Hf
  uuMUPUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qg5qpJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6BrpGhqV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmAQpxQzXN/BOLHvp94hRkkOJiVR3qvPXZKF+JLyUyozEosz4otKc1KLDzHKc
  HAoSfAel3dNFhIsSk1PrUjLzAFGFExagoNHSYS3RwoozVtckJhbnJkOkTrFqMsx82vbAWYhlr
  z8vFQpcV5ZRaAiAZCijNI8uBGw6L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3Tw5oCk9
  mXgncpldARzABHXHyqhPIESWJCCmpBqYdHV8urBDc92l6MIdS8/nuyI2fp6beEzbeFVBufO9Z
  R32Z+6f/129UrC2v/24gcz9tokpMRuHNsIU3QtcYer+cEviO1a1nJ/ekyZ66GxafCRVUK8gQc
  e6Pm5WgY9pz+GW0vURz0qm3+qwiJ7i9d159Npvr176U72Esk1KCWiN3nX8827Pv0j0/u+1TRC
  euOWb/pEP+lA3zeQ4hfZUP8/il9IMnz/7lfYtb4fI8t7oFgXrNUkfW7m6xeO+YXpvmp53cWDT
  Pp2hxr3Wo3qaHhktuXbLascvi0bsAHqePpz4+u/FUNfj/ZpNb72x+HfmdfXHZvBu/WGoDl307
  FOHoIZ/TosPjET+Vc4eS8swQ/YNKLMUZiYZazEXFiQCU/mqaaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1665475114!288115!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27994 invoked from network); 11 Oct 2022 07:58:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 07:58:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4F9621AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 434731AB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 08:58:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gsettings-desktop-schemas: upgrade 42.0 -> 43.0
Date: Tue, 11 Oct 2022 15:58:11 +0800
Message-ID: <1665475094-16329-2-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 07:58:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171596

Changelog:
=========
- Update default background file extension to webp
- Translation updates
- Add setting for touchpad acceleration profiles
- Add specific schema for trackpoint pointer devices
- Fix description of use-same-proxy setting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esktop-schemas_42.0.bb => gsettings-desktop-schemas_43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_42.0.bb => gsettings-desktop-schemas_43.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb
index b8ae15c229..966a67fead 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "6686335a9ed623f7ae2276fefa50a410d4e71d4231880824714070cb317323d2"
+SRC_URI[archive.sha256sum] = "5d5568282ab38b95759d425401f7476e56f8cbf2629885587439f43bd0b84bbe"
-- 
2.25.1


