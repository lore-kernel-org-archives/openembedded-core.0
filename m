Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1UKXJ9-0006rz-R8
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:05:14 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob117.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUVHRSuVMx93xCtFdN+t12Pdhe2I3oQ/u@postini.com;
	Tue, 26 Mar 2013 16:48:14 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9906C6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 16:14:45 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 762DB53D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 16:14:45 +0000 (GMT)
Received: from localhost ([164.130.129.16]) by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id BAJ55307 (AUTH condorg);
	Tue, 26 Mar 2013 17:14:45 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 17:17:32 +0100
Message-Id: <1364314652-17317-1-git-send-email-giuseppe.condorelli@st.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] iproute2: add bash runtime dependence
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:05:14 -0000

Add bash runtime dependence, required at package install time.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc    |    1 +
 .../iproute2/iproute2_3.8.0.bb                     |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index fb233eb..e840605 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
 DEPENDS = "flex-native bison-native iptables"
+RDEPENDS_${PN} += "bash"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
index 65164cb..99c7ede 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
@@ -1,6 +1,6 @@
 require iproute2.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch \
-- 
1.7.7.6



