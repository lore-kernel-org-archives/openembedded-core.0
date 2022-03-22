Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECB5C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:38:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.8257.1647945507233078832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CCLdl74u;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945505; i=@fujitsu.com;
	bh=4ANlHMgXuvjWViKbpPKNRkC4iVfCz0TRaHmUhac6W9Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CCLdl74ugKmZLH1XqETRi0GjnGN8uOoy//dumy/msl8zMOYKKiF8TDCkdqsdUUzdD
	 LSgaHn9iTy+WSZzzH1QK58F3kZB42V60PAgS2uDmI550c587jvf1tT5O6KM1PlpdLu
	 ME/EZBcxSaD34zF3wviOk054qBLTmFilyh1eeLoYtXrOrqSzWgG65FxbADPy0y/cPr
	 ODL1oJ3BUf8/qLmRgWBVE+eSo3cgRhKTfEFhNu8PJeMUP9fvYYo1lkUvNN1jm2gNHN
	 XbN5wFPNba0jG3zGQnGgCgJs4xIJoN1UFvoWf41u2Mn6RZ44r+vxAvUtuJORhsc/xG
	 1mUzSd40hE4Hg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRoqu43DL
  J4PFabos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePYsRfMBYs4Kpbef8DcwHiCvYuRi0NIYAaT
  xP2lX5khnD2MEgder2HpYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vYQcLCAnYSR
  ++rgoRZBFQl7l/4yQpi8wo4SrxZcpgRxJYQUJCY8vA9M0RcUOLkzCcsEGMkJA6+eMEMUaMoMf
  tyMwuEXSExa1Yb0wRG3llIWmYhaVnAyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FTX2FLX1EgvsUo
  3US+1VLc8tbhEF8gtL9ZLLS7WK67MTc5J0ctLLdnECAywlGJ1kx2M3St/6h1ilORgUhLlfdNq
  mSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfoYqCcYFFqempFWmYOMNhh0hIcPEoivBndQGne4
  oLE3OLMdIjUKUZFKXHep0uBEgIgiYzSPLg2WIRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqC
  TMK7IMaApPZl4J3PRXQIuZgBbrs5qBLC5JREhJNTDZNmqEncg/xaT5KVRmb12bSv9pvSB2MYl
  nPurCZ6p9E3k1IwUexljotEw2MjE4k6zTG+69qFF6gfz/xpjdRTbKsUwb6tfukJyx98b8UyuS
  Cz9pTnaY4SJntDrnn17OxSf+Tc09SyvPa2pf2Wfc3+70bh33wiRO5eaCIwWXb8wta3tl5pxRl
  rGhsOnxsvwjN7ZKBV7VW/Fo1gFH67NH70vM9P5/fcFKNg/WYwmXm+XFJFlKPc49jnFInsOQ8P
  LIrDe7srL+q6eFnpxwYIdr7Fm3rt9CMU339YJOrrYpYZytuZR5gYpvusYz631ysTLcy322p+/
  4VPeujF+plH3+tw8KZQ4rn5ccmZlm7nbJQomlOCPRUIu5qDgRAB3JskUrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1647945504!3202!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14784 invoked from network); 22 Mar 2022 10:38:25 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:38:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22MAcJ2p024007
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:38:24 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:38:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdazzle: upgrade 3.42.0 -> 3.44.0
Date: Tue, 22 Mar 2022 18:38:06 +0800
Message-ID: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163538

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdazzle/{libdazzle_3.42.0.bb => libdazzle_3.44.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.42.0.bb => libdazzle_3.44.0.bb} (88%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
similarity index 88%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
index a10acc6ada..49ebc818b0 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase upstream-version-is-even vala features_check gobject-introspec
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.sha256sum] = "eae67a3b3d9cce408ee9ec0ab6adecb83e52eb53f9bc93713f4df1e84da16925"
+SRC_URI[archive.sha256sum] = "3cd3e45eb6e2680cb05d52e1e80dd8f9d59d4765212f0e28f78e6c1783d18eae"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.25.1


