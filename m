Received: from outbound-relay8.guardedhost.com (outbound-relay8.guardedhost.com [216.239.133.208])
 by mx.groups.io with SMTP id smtpd.web12.1474.1607156608909325488
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 00:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.208, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (tev-mx4.omnis.com [216.239.133.144])
	by outbound-relay5.guardedhost.com (Postfix) with ESMTP id 4Cp2dr4v5bz8Ts;
	Sat,  5 Dec 2020 08:23:28 +0000 (GMT)
Received: from alaperry-ubuntu-build.43vr1hlvonre5le4v1ueig2kyb.xx.internal.cloudapp.net (unknown [52.151.43.11])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4Cp2dq70JMz30Lq;
	Sat,  5 Dec 2020 08:23:27 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
To: openembedded-core@lists.openembedded.org
Cc: Alan Perry <alanp@snowmoose.com>
Subject: [PATCH v2 2/2] iproute2: rearrange FILES to improve readability
Date: Sat,  5 Dec 2020 08:22:46 +0000
Message-Id: <20201205082246.14954-2-alanp@snowmoose.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201205082246.14954-1-alanp@snowmoose.com>
References: <20201205082246.14954-1-alanp@snowmoose.com>
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 2705ACC6-36D3-11EB-A7FF-961406491BCE
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx4.omnis.com
X-Virus-Status: Clean

Rearranged the PACKAGES list FILES to match the order in PACKAGES
to make the recipe more readable and easier to find the FILES for
a given package.

Signed-off-by: Alan Perry <alanp@snowmoose.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index de5c63a6e3..30521eba31 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -75,20 +75,20 @@ PACKAGES =+ "\
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

