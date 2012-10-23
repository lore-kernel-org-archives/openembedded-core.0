Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TQYSV-0006Cf-IR
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 08:59:27 +0200
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob107.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUIY9K/7dWA5QgyNsn8DKEByzLBSH2bTu@postini.com;
	Tue, 23 Oct 2012 06:46:04 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72F98E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 06:46:02 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4D0A20F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 06:46:02 +0000 (GMT)
Received: from localhost (lxmcdt5.ctn.st.com [164.130.129.175])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id APW35399 (AUTH condorg);
	Tue, 23 Oct 2012 08:46:02 +0200
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2012 08:45:53 +0200
Message-Id: <1350974753-519-1-git-send-email-giuseppe.condorelli@st.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH] base-files: do_install_basefilesissue error
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
X-List-Received-Date: Tue, 23 Oct 2012 06:59:27 -0000

Fixed error in do_install_basefilesissue, printf is now replaced by echo.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index ba355ee..766b0e5 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -117,11 +117,11 @@ do_install_basefilesissue () {
 
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
         if [ -n "${DISTRO_NAME}" ]; then
-		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
-		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
+		echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
+		echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
 		if [ -n "${DISTRO_VERSION}" ]; then
-			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
-			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
+			echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
+			echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
 		fi
 		echo "\n \l" >> ${D}${sysconfdir}/issue
 		echo >> ${D}${sysconfdir}/issue
-- 
1.7.4.4



