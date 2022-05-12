Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD54BC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:38:11 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.1810.1652344685481652112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 01:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38812 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1np4Kj-0001Ym-3u
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2022 04:38:04 -0400
Date: Thu, 12 May 2022 04:38:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] local.conf.sample: mention other QEMU targets in OE
Message-ID: <a22fea43-b04b-6b2a-91a3-225718da358@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 08:38:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165537


Mention that there are other QEMU targets available in the OE layer,
and leave it for the reader to check them out.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i think this is the happy medium between not saying anything about
the additional QEMU machines, and promoting them to full equality with
the other layers -- just let the reader know where they can examine
them.

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index c05691de58..c28ff62468 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -29,7 +29,11 @@
 # This sets the default machine to be qemux86-64 if no other machine is selected:
 MACHINE ??= "qemux86-64"

-#
+# Note that the openembedded-core layer defines a few more QEMU targets that
+# are not listed here as they are not tested as robustly as the above, but they
+# are still available for the adventurous; see the full list at:
+# https://git.openembedded.org/openembedded-core/tree/meta/conf/machine
+
 # Where to place downloads
 #
 # During a first build the system will download many different source code tarballs

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

