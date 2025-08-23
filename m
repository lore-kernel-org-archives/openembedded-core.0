Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F533CA0EFF
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 20:48:16 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.4876.1755982093424577887
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 13:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JgPopk3S;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025082320481565f94f7e8f03cbf74b-5_ic3l@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025082320481565f94f7e8f03cbf74b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 23 Aug 2025 22:48:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xMiGIMEu56Sowqz0Q8F4XCPQ1ugKKqdxSTXVFVTj3kk=;
 b=JgPopk3SfZmj+B8dCaSff+av3vW/ouDUKoHvf3dq3NkjXV6NHlYRhEI08colnSo7KO2Q/r
 KxMVIproE1ZLNa0pgBZ/gLqCAM/GZs0VXLxhPBc8q3rrMJKdOwnoFdnTzccf/7tkfmQcqJZG
 cH7uKZuRWzlnfYKTXAP0yyXFAzZMoAswCxWND0J5XtkWa8ve8ayhACqQDiTimdrfx2SlwAme
 pxcxA3mKM/VZBW2Xj11MkJRkT2N5l3Vjmdv/GY15H0gTKmhjyteomHwedSExlhkwJVLygkrh
 GXRoWqORpafvpEm+1S8PFOFSnwu0WN75gPr7H4l1reUgGZYRgTg5uveQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/3] gnutls: mark CVE-2025-32989 and  CVE-2025-32990 as fixed
Date: Sat, 23 Aug 2025 22:47:05 +0200
Message-Id: <20250823204707.35257-2-peter.marko@siemens.com>
In-Reply-To: <20250823204707.35257-1-peter.marko@siemens.com>
References: <20250823204707.35257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 20:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222353

From: Peter Marko <peter.marko@siemens.com>

This is mentioned in [1].
NVD tracks this as version-less CVE.

[1] https://gitlab.com/gnutls/gnutls/-/blob/3.8.10/NEWS?ref_type=tags#L8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index 600f23683e..2ef71a1213 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -98,3 +98,6 @@ pkg_postinst_ontarget:${PN}-fips () {
         ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libhogweed.so.6.hmac
     fi
 }
+
+CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
+CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"

