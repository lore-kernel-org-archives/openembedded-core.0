Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrew_Gabbasov@mentor.com>) id 1R8t1K-0004Gz-8I
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 14:13:50 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1R8sw5-0001vz-9l from Andrew_Gabbasov@mentor.com ;
	Wed, 28 Sep 2011 05:08:25 -0700
Received: from [172.30.176.48] ([172.30.176.48]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 28 Sep 2011 04:58:46 -0700
Message-ID: <4E830E1E.3030404@mentor.com>
Date: Wed, 28 Sep 2011 16:07:58 +0400
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-OriginalArrivalTime: 28 Sep 2011 11:58:46.0608 (UTC)
	FILETIME=[FA336500:01CC7DD5]
Subject: [PATCH] apmd: use ${HOST_SYS}-libtool
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 12:13:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

libtool-cross uses ${HOST_SYS}- prefix while building and installing.
In some cases that may be different from ${TARGET_PREFIX}, that is currently
used in apmd recipe. It's better to have them consistent.

Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
index e80e108..bf53cc6 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
@@ -34,7 +34,7 @@ INITSCRIPT_PARAMS = "defaults"
 
 do_compile() {
 	# apmd doesn't use whole autotools. Just libtool for installation
-	oe_runmake "LIBTOOL=${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool" apm apmd
+	oe_runmake "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool" apm apmd
 }
 
 do_install() {


