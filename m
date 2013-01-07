Received: from eu1sys200aog110.obsmtp.com ([207.126.144.129])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TsFwe-0007J2-Td
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:53:08 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob110.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUOr55b2vfUW34RxGRr62dXxEWhGb3+W6@postini.com;
	Mon, 07 Jan 2013 16:37:57 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FD2F75
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 16:37:51 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 204294CE3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 16:37:51 +0000 (GMT)
Received: from localhost ([164.130.129.16]) by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AUT42607 (AUTH condorg); Mon, 7 Jan 2013 17:37:50 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 17:35:33 +0100
Message-Id: <1357576533-7212-1-git-send-email-giuseppe.condorelli@st.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH V2] libpcre: change BUILD_CPPFLAGS and BUILD_CFLAGS values
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
X-List-Received-Date: Mon, 07 Jan 2013 16:53:09 -0000

Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to set
CFLAGS_FOR_BUILD, required for the libpcre build.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
---
 meta/recipes-support/libpcre/libpcre_8.32.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-support/libpcre/libpcre_8.32.bb
index e434d55..361e9f0 100644
--- a/meta/recipes-support/libpcre/libpcre_8.32.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
@@ -34,8 +34,9 @@ EXTRA_OECONF = "\
     --with-match-limit=10000000 \
 "
 
-BUILD_CPPFLAGS += "-DLINK_SIZE=2"
-BUILD_CFLAGS =+ "-I${S}/include"
+# Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to
+# set CFLAGS_FOR_BUILD, required for the libpcre build.
+BUILD_CFLAGS =+ "-DLINK_SIZE=2 -I${S}/include"
 CFLAGS += "-D_REENTRANT"
 CXXFLAGS_append_powerpc = " -lstdc++"
 
-- 
1.7.7.6



