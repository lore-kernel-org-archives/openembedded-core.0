Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24043C6FA8B
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:03:52 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.22589.1662368626563994158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PvQdRPtg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368624; i=@fujitsu.com;
	bh=IzLK6CLsOvvucTmPFYj8c1lrEKZp0ZVgdwnx3+SpTgQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PvQdRPtgxOd34tzf8S7qWc8wu5rheDsmlimDtw1s2q3809eQCSp1GDQ+YlPLAu2Oe
	 S0XgZaJ8YZn2dSLZ1wXgs9O57XfkfXhtopOg+YCL2lFrwIZ27/JHChdEvKwZNSSKbw
	 5ysd8HslyG0+tJmUTOMhIGJQ81RylquZSrCjOmlC5NHAtpKbe+JxGrRcF5N5Ck7jaB
	 nuircwQN7gn6N/pvUyN38xQkQWMfpBqltQPZ3aFlYWjNllpBljT2rMKK4Fc5WWyWRT
	 DeVySX+9ciVSrpoJtxUyh7rLveePaw+F5uikIxkXpUuJRhcIszG+qCNcZ+EhOgAix5
	 HHrkKfbBBScpg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8ORpFuwWzT
  Z4PhbXos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP2jW7mgrU8FbN35TYw/uLqYuTiEBJ4wCgx
  9fYlFgjnMpPE8gmPGCGc3YwSi/unATmcHGwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAp0fNtGSuIzQIUv/r2CSNIOa+Ak8TlWS4gYQkBBYkpD98zg4Q5BZwlTp70AwkLAVUs3f
  uaCcTmFRCUODnzCQvEdAmJgy9eMEO0KkrMvtzMAmFXSDROP8QEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa6JrZGypl1ilm6iXWqpbnlpcomuol1herJdaXKxX
  XJmbnJOil5dasokRGL4pxSzvdzA29f3UO8QoycGkJMr7fo5oshBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3pU7gHKCRanpqRVpmTnAWIJJS3DwKInw+q8DSvMWFyTmFmemQ6ROMdpzfDh0ZS8zx9
  TZ//YzcywHkzO/th1gFmLJy89LlRLn3QQyVQCkLaM0D24oLPYvMcpKCfMyMjAwCPEUpBblZpa
  gyr9iFOdgVBLm5QKZwpOZVwK3+xXQWUxAZ9n1CYOcVZKIkJJqYIo4aW+se+LIzQXGq5QfnL7E
  vCp7u86cO2fE2v2j1rn2c4b0bU7uWFfEubKZ2cnTJG2uW9rBZQ4f4nqnzYvf4NHPc2VpJkuPS
  K38az7p47lGn8+qvhXOnfB/1l2T+xwe2+Xndt49KMvJErulLts8yvCN/ysJqxv+TMdqljWt0f
  WYvvjqpBeb51nfT0pPK816Gr6l6azGDolNJTpb+49Flq5Y8emTuAHTRU3dH1azOF4ItW0pir8
  260DS7jnfIt55G87lYDNd8Ehq8rw5py8t//2suPhM6m1OtU0zExc/fxhd55e/l2vu0W97RQzb
  o/l83SPclnSeCEvrCbjv0rXUbI3d9bdXzZoVlhvvjPTyTlZiKc5INNRiLipOBABPDJ8feAMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1662368624!513051!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25361 invoked from network); 5 Sep 2022 09:03:44 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:03:44 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D043F1B6
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:43 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C53D51B5
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:03:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 22.1.6 -> 22.1.7
Date: Mon, 5 Sep 2022 17:03:19 +0800
Message-ID: <1662368601-32265-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
References: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170302

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_22.1.6.bb => mesa-gl_22.1.7.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.1.6.bb => mesa_22.1.7.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.1.6.bb => mesa-gl_22.1.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.1.6.bb => mesa_22.1.7.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_22.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.1.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ea7ed4fd27..729c466554 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
            "
 
-SRC_URI[sha256sum] = "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
+SRC_URI[sha256sum] = "da838eb2cf11d0e08d0e9944f6bd4d96987fdc59ea2856f8c70a31a82b355d89"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.1.6.bb b/meta/recipes-graphics/mesa/mesa_22.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_22.1.7.bb
-- 
2.25.1


