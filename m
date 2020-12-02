Received: from outbound-relay9.guardedhost.com (outbound-relay9.guardedhost.com [216.239.133.221])
 by mx.groups.io with SMTP id smtpd.web10.312.1606936304464685362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 11:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.221, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx04.guardedhost.com [IPv6:2607:fe90:1:1::55:1])
	by outbound-relay1.guardedhost.com (Postfix) with ESMTP id 4CmT9D1flMz4xM3F;
	Wed,  2 Dec 2020 19:11:44 +0000 (GMT)
Received: from alaperry-ubuntu-build.43vr1hlvonre5le4v1ueig2kyb.xx.internal.cloudapp.net (unknown [52.151.43.11])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4CmT9C3jh5z30cR;
	Wed,  2 Dec 2020 19:11:43 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
To: openembedded-core@lists.openembedded.org
Cc: Alan Perry <alanp@snowmoose.com>
Subject: [PATCH 2/2] iproute2: rearrange FILES to improve readability
Date: Wed,  2 Dec 2020 19:11:24 +0000
Message-Id: <20201202191124.15903-2-alanp@snowmoose.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202191124.15903-1-alanp@snowmoose.com>
References: <20201202191124.15903-1-alanp@snowmoose.com>
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 3756052E-34D2-11EB-9213-961406491BCE
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx4.omnis.com
X-Virus-Status: Clean

Rearranged the PACKAGES' FILES to match PACKAGES to make the
recipe more readable and easier to find the FILES.

Signed-off-by: Alan Perry <alanp@snowmoose.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 21f52f80bc..018c228c97 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -73,20 +73,20 @@ PACKAGES =+ "\
     ${PN}-tipc \
 "
 
-FILES_${PN}-tc = "${base_sbindir}/tc* \
-                  ${libdir}/tc/*.so \
-                  ${datadir}/bash-completion/completions/tc"
+FILES_${PN}-devlink = "${base_sbindir}/devlink \
+                       ${datadir}/bash-completion/completions/devlink"
+FILES_${PN}-genl = "${base_sbindir}/genl"
+FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
                       ${base_sbindir}/ctstat \
                       ${base_sbindir}/rtstat"
-FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
-FILES_${PN}-genl = "${base_sbindir}/genl"
-FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-nstat = "${base_sbindir}/nstat"
+FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-ss = "${base_sbindir}/ss"
+FILES_${PN}-tc = "${base_sbindir}/tc* \
+                  ${libdir}/tc/*.so \
+                  ${datadir}/bash-completion/completions/tc"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
-FILES_${PN}-devlink = "${base_sbindir}/devlink \
-                       ${datadir}/bash-completion/completions/devlink"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1

