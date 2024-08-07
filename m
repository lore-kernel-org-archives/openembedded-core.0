Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1BCC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 21:53:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.46239.1723067619557259244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 14:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GXmEh++Z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024080721533694d734d8bf069cdfb8-ktqbpg@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024080721533694d734d8bf069cdfb8
        for <openembedded-core@lists.openembedded.org>;
        Wed, 07 Aug 2024 23:53:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fmY7/QdnzkZmxgHnRI6mwQBRqV1SKK+WuViu0gJD7Kk=;
 b=GXmEh++Zc4KPNhGdNbMcfvuFj/nCOYt6x+KctN489019n3MaKZLjQGoYMatPSwnsXi63II
 guXzRTFr5K66Ectog+/rrScoKqdMtLTNOSG7AhNmVmHLb3rJ5+9a2H+8/Kxk4pn3SZs3jsc2
 dV0lDtFj6HQWfCVz1vPNtyG4ohiqhf9CpCe/x2YjIKQAvZ9yA09aUjsml/tM1ZEjwrYX021c
 J/rhNCbjOhR1aXVuNBZf8cWZPGAsckPqqeLwPPghNmasefd8X3Qy7Gfz7pMpXWCyo1FLF5Wl
 zrCued9MEt0BtqYpPqVH19FwsZQ+4FqUM1ihq9bYGHQfQYEn2xcJ1PDw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libyaml: ignore CVE-2024-35326
Date: Wed,  7 Aug 2024 23:54:41 +0200
Message-Id: <20240807215441.11715-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 21:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203098

From: Peter Marko <peter.marko@siemens.com>

This is the same problem as already ignored CVE-2024-35328.
See laso this comment in addition:
https://github.com/yaml/libyaml/issues/298#issuecomment-2167684233

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index f7c29e7e0f..e30dc5a43f 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -19,6 +19,6 @@ DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
 # upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
-CVE_CHECK_IGNORE += "CVE-2024-35328"
+CVE_CHECK_IGNORE += "CVE-2024-35326 CVE-2024-35328"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


