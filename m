Received: from eu1sys200aog108.obsmtp.com ([207.126.144.125])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TsFLR-0005df-Up
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:14:42 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob108.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUOrw4nT8SKXhrYaa9XhifOTQoYE8wyb2@postini.com;
	Mon, 07 Jan 2013 15:59:30 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65EE4206
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 09:19:08 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0EF932879
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 09:19:07 +0000 (GMT)
Received: from localhost ([164.130.129.16]) by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AUS50865 (AUTH condorg); Mon, 7 Jan 2013 10:19:07 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 10:16:47 +0100
Message-Id: <1357550207-19933-1-git-send-email-giuseppe.condorelli@st.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] libpcre: set BUILD_CFLAGS
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
X-List-Received-Date: Mon, 07 Jan 2013 16:15:05 -0000

Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to set
CFLAG_FOR_BUILD, required for the libpcre build.

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
+# set CFLAG_FOR_BUILD, required for the libpcre build.
+BUILD_CFLAGS =+ "-DLINK_SIZE=2 -I${S}/include"
 CFLAGS += "-D_REENTRANT"
 CXXFLAGS_append_powerpc = " -lstdc++"
 
-- 
1.7.7.6



