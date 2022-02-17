Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EDCC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 10:38:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.5809.1645094311928658955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 02:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y8EcN4xg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645094310; i=@fujitsu.com;
	bh=Lx2IbMwxkbu2w2GJ+912Ee+o28+zc3BOXCB7nDaNzME=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y8EcN4xgr8m2ris8ntEBTsbZLoTQKIwGXKHy6z1FcF9j8kwwRWiwT7Ci0fM764tZo
	 j0vXZ/DE2NymSM/eiWDjH1EcWJpSUnBQ52efJLSMusf+ezg43EczJ34Y4TeQj/bp4c
	 JQADR+n0pLW6/+59FQJt53zcsoGIcSqDz+9Iql6Df3Con37VPoVRcmkkm3EXUHqWCb
	 PoYFiQhKdfjVxTseQ9cW2CyiisQ4FIqeI/WlQMKeExhEovOUNfW8zEu7EW41rm3nQ7
	 Hpkkd2wkbScteG0XME3zXkngmgP6H0odcx57leebq2gujmoah5KWA20SPyAHc0ggr+
	 YTIeIRnZyLLFw==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id D8/06-12986-5A52E026;
 Thu, 17 Feb 2022 10:38:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MRortUlS/
  J4OYiOYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPKo7lsBa9YK672nmJrYFzF2sXIxSEkMINJ
  4sf+m1DOCUaJG5/usnQxcnKwCahJTL91AyjBwSEioCdx9Z8oSJhZQEXixe8edhBbWCBEYtKGK
  UwgNouAqsTy9yvBWnkFnCTW7v3NBmJLCChITHn4nhkiLihxcuYTFog5EhIHX7xghqhRlJh9uZ
  kFwq6QmDWrjWkCI+8sJC2zkLQsYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa6prZGqql1ilm6i
  XWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGGIpxaz/dzB29/3UO8QoycGkJMob/ZE3
  SYgvKT+lMiOxOCO+qDQntfgQowwHh5IELyswaIUEi1LTUyvSMnOA4Q6TluDgURLh7RMASvMWF
  yTmFmemQ6ROMSpKifO2qQAlBEASGaV5cG2wGLvEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZ
  j3JMgUnsy8Erjpr4AWMwEtVmzkAllckoiQkmpgEmszuij15MZXBz/+/WsaLpeLXGxbuV2Gedt
  MjrwH29fy28mttPi4U8da/Nykjzpfr+7batzEOl2drU2dK9j/s8Whn87JAt7y7I0dm4wD1gtE
  hs4TqOVdtD2RZXfT1Cm8/If9nrjWJq2QMObtt2Z94zjNdfPxmTK/dIrUNL5lbFV9GaWvyC3bU
  mX3bPnzwt333+k9k898VRy+c59eubvQ1YxjStcVxVq33i44ez9NySfkusA1pqXBxkW3Vy5uL5
  /uNeVRjl+saqDn/YeNlUx7Epbb9/7guNq9YlfHzNDnBjemxmffvCtRmzW3g+3zqs/W6R4XLaf
  fXz3Z4ZY8x3m3/Hhz39SbkTWxF0OjIpiUWIozEg21mIuKEwGseisCLAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1645094309!10100!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 765 invoked from network); 17 Feb 2022 10:38:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Feb 2022 10:38:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21HAcMWT028385
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 10:38:29 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 17 Feb 2022 10:38:20 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libhandy: Use upstream regex to check version of
 upgrade.
Date: Thu, 17 Feb 2022 18:38:09 +0800
Message-ID: <1645094289-11772-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 10:38:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161796

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/libhandy/libhandy_1.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
index 605ef2b5fa..51fc998971 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=maste
 SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 GTKDOC_MESON_OPTION = 'gtk_doc'
-- 
2.25.1


