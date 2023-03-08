Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3BDC6FA99
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 01:40:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.12554.1678239650321050436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 17:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vyd1+BQH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678239648; i=@fujitsu.com;
	bh=T9Gp402IKbBSWDN9kcGeoYxSOcNnnYPQkoVTcljwjj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vyd1+BQHh9UxAkp0vC3Oq/6Redq/mYpRtmGuqDNJsRMelJwoiZbh7Y6dcLMs07hc0
	 MF6uV/q4y8adMu8U3pZ2LNaosJv+nneDLtDGiWv/8+9wqiK22z565k4PFrbhf5p49+
	 MtTjezIT6IXmYDa99ybbpknbnc0mKHtvxs/egP/frOm56fDO1/wwZ8IlH0qdwUJ8oW
	 jq5QtHuYqd175okyQv8AsyK2aEK8wWcTEzGNRlT+USch9zOUlt3UwqJ4jXen4lF8Cl
	 Lf5goVpPM7+mRf8HpkJSBpoJ/di0ZCl6a9XSelstbpG0IfWtTaqg5QvOxbB9GJckyM
	 DWsG9rXKNrrQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWXfBc/Y
  Ug3l72Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyXjc8ZC7ZyVnRu3c7YwHiSo4uRi0NI4D6j
  xPQfW5khnMtMEkdWv2aCcPYwShy+v4q1i5GTg01ASuLG/f9sXYwcHCICehJX/4mChJkFVCRe/
  O5hBwkLC4RLPNoZChJmAQpPPPuRCcTmFXCSmH37LwuILSGgIDHl4XtmEJtTwFli7t7jbCC2EF
  DNu94JLBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm6HmVEq0fvgFZatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhanFpUllqka6GXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yT
  opeXWrKJERi4KcVqj3cwbu37q3eIUZKDSUmUd98R9hQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rw+D4FygkWp6akVaZk5wCiCSUtw8CiJ8G4GaeUtLkjMLc5Mh0idYjTmWNtwYC8zR+f+rgPMQi
  x5+XmpUuK8m58ClQqAlGaU5sENgkX3JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvAr3gab
  wZOaVwO17BXQKE9ApF/azgJxSkoiQkmpg6ri+tsm9YNVNHTblnv8LFhqdYs2+MScuuSno3Vvd
  +rhX158vO1hxfi3nxmP7K10fS84PmVG+xFxyt92+xYYJ6y8zde28Fakbef62pFafSPxT1sPhb
  Kvr6jVU4nl1K3sXHnve9sh24+fnPhPMqgpmlwYUmc1z+/DiprL4E4aQelf9srX3Wrs0eZ+yJ7
  1WV715OfHY+wuKQS3+XQccL/JF/bfbKFEcdMF7xVIpjbZ20ddaBS/+tb1IEFnJaRuUGVlYeMb
  gcgLz2u5ml2dXNyZc/v9lwk0u0eR8+zVP367PySh+x5D4LoHX6kl8duzcmgyntV97re+0Svgu
  qMtisrOV43U9931SdWVCgtxM4XQlluKMREMt5qLiRAC5XDMnaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1678239647!3602!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1009 invoked from network); 8 Mar 2023 01:40:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 01:40:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CD6CE7C
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:47 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C18CE7B
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 01:40:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when enable multilib.
Date: Wed, 8 Mar 2023 09:40:18 +0800
Message-ID: <1678239619-21210-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178150

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/pkgconfig/xcb-proto.pc conflicts between attempted installs of lib32-xcb-proto-dev-1.15.2-r0.armv7ahf_neon and xcb-proto-dev-1.15.2-r0.cortexa57

The differences between the two files are as follows:
@@ -2,7 +2,7 @@
 exec_prefix=/usr
 datarootdir=${prefix}/share
 datadir=/usr/share
-libdir=/usr/lib64
+libdir=/usr/lib
 xcbincludedir=${pc_sysrootdir}${datadir}/xcb
 PYTHON_PREFIX=${prefix}
 pythondir=${pc_sysrootdir}${libdir}/python3.11/site-packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 4e4472a9c1..0fdca732e8 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -28,3 +28,6 @@ DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/pkgconfig/xcb-proto.pc"
+
-- 
2.34.1


