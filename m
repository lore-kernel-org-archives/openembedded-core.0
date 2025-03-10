Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096D5C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:51:07 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.36725.1741611056063835445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UkELz3bm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202503101250529a8e22cda3fa819384-r_97ok@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202503101250529a8e22cda3fa819384
        for <openembedded-core@lists.openembedded.org>;
        Mon, 10 Mar 2025 13:50:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=p9AoELfhUiXIOfwQAtbKhx+BBRxLY7A5u82fVj6Zyos=;
 b=UkELz3bm+NEgqO5v8ue5gYsFKx1duglLoj2glXQDBM6pMGZpHXFF/smxC8Zyy7O2fLdJW2
 uZbddVJPWBgDerEbN+u+4mX2nglzCkE53t25VJeXuvMDReiL7LlZZsdg2pT8VFE3ED879yjk
 WogU6LD4mOKcYMhPtHzRH3a8lUJcrHO7W62wkv2deaKBfcYXymD9CTFZo5lRmk+uzab29zhh
 GU0JS8rqlSi9DXMbemdYkbPpztUXIdMC9wh8hS4Ib2idkv1QwIyo0CtJssZqJSkzRpl2m3ks
 8YqN+4PD5ZXB8cRK07g7obcYPJ53PTWCTzYV4mwFUzNqTgsFuYMH3L5A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Date: Mon, 10 Mar 2025 13:49:49 +0100
Message-Id: <20250310124949.2414614-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212514

From: Peter Marko <peter.marko@siemens.com>

These are tracked as versionless redhat CVEs in NVD DB.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xwayland/xwayland_24.1.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 350b8e93cc..0774c1bbf5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -48,3 +48,7 @@ do_install:append() {
 FILES:${PN} += "${libdir}/xorg/protocol.txt"
 
 RDEPENDS:${PN} += "xkbcomp"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_REDHAT"
+CVE_STATUS_REDHAT = "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
+CVE_STATUS_REDHAT[status] = "fixed-version: these are tracked as versionless redhat CVEs in NVD DB, fixed in 24.1.6"

