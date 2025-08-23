Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DA2CA0EFA
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 20:53:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.4955.1755982406128859587
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 13:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KkaORchG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250823205322c5fd7ce6b91c709a7c-8lxlkd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250823205322c5fd7ce6b91c709a7c
        for <openembedded-core@lists.openembedded.org>;
        Sat, 23 Aug 2025 22:53:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xMiGIMEu56Sowqz0Q8F4XCPQ1ugKKqdxSTXVFVTj3kk=;
 b=KkaORchG3nwvHvpmVfAWWukSvNNmO/Yofk0fppsMFMg+00+mFkirHDQmSO+hGlioVrtVjA
 OX07txDve4A9EbmB/pLcPCiYl5ghm28hCb65/ouQB+TzWnKFSUR2a0rW7qBvpA2W3m0giS66
 DUWjvv5MT+4nUgnbl/9qu59Hg4DON7ACAptzmy+HKtAr5DEfVspGsogNwzzYF+e8o2dE+fJL
 KHfpuH/jd44b6UXwErkl0LGUagpUU5uULVhYnPuQjW35hHodlBta3fmmv2g3tBXJTL1hpPt0
 Xj1Dd4pdZHSa/pYZBWREoKaMhQOQgAcGsJExq8lr2228NXPbXn/HX8AA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] gnutls: mark CVE-2025-32989 and  CVE-2025-32990 as fixed
Date: Sat, 23 Aug 2025 22:52:35 +0200
Message-Id: <20250823205235.35974-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 20:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222356

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

