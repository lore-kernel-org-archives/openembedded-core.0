Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED20AC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:40:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.41127.1681119627434820094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YIb5V/6I;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119625; i=@fujitsu.com;
	bh=AQrmQeMN0RiVR0J5LfhNtkAWdqjDU0XVJ/zLChXMryU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YIb5V/6Im/pf0f/sYTsdBcKvL+UIofbFjLRTctRvAuOxk7qq62KAimIHFNxjmOPww
	 yfaXvecgSLgQyMi3BmKEa7GX3fQc6m43WVGwhMwlTMb92XwIRaYeMgJLelxVdH9s3y
	 s3PZhf+cHHozckNsD3hBjEeQTyb8EEVb/AuW0Mz2EONtgjJ0tI0CpM0A3Ob41kRDRf
	 2HTQyFzmEr7efruMecQ3atn9l960ULDtQwsx5+QrhC3axPGegGRMkev5Sp2xFuSOSq
	 N90tafdkBzId7vh7xid7YDWfeSCTQ48Z+/A1Uhr0pVH/eBP357STS4OPNzGIkFru1k
	 cadQvT6BZO3Mg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWbfzpnG
  KwYU2IYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPq9wmMBS38FUunHGBuYJzC28XIxSEk8IBR
  orPnBSOEc5lJ4urfk2wQzh5GiclTzgE5nBxsAlISN+7/B7I5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC7hJHHzewAxiswioSpx6t4ARpJxXwEmi8Zo6SFhCQEFiysP3YCWcAs4STbtnM4HYQkAlXS
  8/s4LYvAKCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhNi1OLylKLdC31kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5Nz
  UvTyUks2MQIDN6VYTX4H4+G+v3qHGCU5mJREebu4jFOE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fAyXAbKCRalpqdWpGXmAKMIJi3BwaMkwitxDSjNW1yQmFucmQ6ROsWoKCXOy3EeKCEAksgozY
  Nrg0XuJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGcuAk3hycwrgZv+CmgxE9BiLhcDkMU
  liQgpqQYmbud5mouX3r185/RDu4XsL6Wsd6n7c3SIGsves5wXpvVtQUElsxnj92qBG28vKDza
  61R2Va2hXtnozIrAjOllj93qT81+vLjc9f3p5+LaTjVhK1v7b2zIXXbI3O9UT6aV2uH1IhE2u
  39d3HTp+snO6E8vy0KSj3y2ubf2tlqVBq9zyJzHESuf6E9+sjWV22tnsqfGqoffbReypJ+byR
  fmzrMpuT/GNrDXvcXgW6bfJpEZYUWzGpZwfHt2bEfTxg/CSZcfW4VvXb/2crN6tPMU9dKtuez
  FP1yu6eywCjr3vZDD1elTauiVtKdKM3v3seZ/mLdRgG+u+COls3kbhfnmZUR1xMXObuj0OH/Z
  d5GSEktxRqKhFnNRcSIA8+91tVcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1681119625!293501!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5814 invoked from network); 10 Apr 2023 09:40:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:40:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 04E7A159
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EC97E155
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:40:23 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pygobject: upgrade 3.42.2 -> 3.44.1
Date: Mon, 10 Apr 2023 17:39:54 +0800
Message-ID: <1681119595-25279-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
References: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179881

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Fix tests with glib 2.76 !240
    Note: PyGObject is in need of more maintainers, please read https://www.bassi.io/articles/2022/12/02/on-pygobject/
    Note: This is an unstable release.
    Drop support for Python 3.6 !184
    meson: bump minimum version to 0.53.0 and update subprojects !227
    gimodule: fix floating state of python objects created with g_object_new !129
    Gtk.Template: Accept PathLike objects as a filename !195
    info: Show which type/object callables are bound to !194
    IntrospectionModule: handle two threads loading type at same time !149
    Port to Py_TRASHCAN_BEGIN !226
    Other cleanups/improvements: !181 !173
    This release also includes all changes from 3.42.1 and 3.42.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pygobject_3.42.2.bb => python3-pygobject_3.44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.42.2.bb => python3-pygobject_3.44.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
index f54f4ce784..8bfff43560 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
@@ -18,7 +18,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[sha256sum] = "ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957"
+SRC_URI[sha256sum] = "3c6805d1321be90cc32e648215a562430e0d3d6edcda8f4c5e7a9daffcad5710"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.34.1


