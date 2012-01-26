Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RqV9p-0002Vw-GY
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 20:38:53 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1RqV2H-0006a9-1y from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 11:31:05 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 26 Jan 2012 11:30:07 -0800
Received: from [172.30.9.43] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 26 Jan 2012 11:31:04 -0800
Message-ID: <4F21A9F7.2000508@mentor.com>
Date: Thu, 26 Jan 2012 12:31:03 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
In-Reply-To: <4F21A9CF.3020103@mentor.com>
X-OriginalArrivalTime: 26 Jan 2012 19:30:07.0272 (UTC)
	FILETIME=[E91ACA80:01CCDC60]
Subject: [PATCH v2 1/3] Bump systemtap SRCREV
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
X-List-Received-Date: Thu, 26 Jan 2012 19:38:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Bump systemtap SRCREV to pick up several changes including additional
ARM enhancements.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index ebacc43..7172386 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "elfutils sqlite3"
 
-SRCREV = "820f2d22fc47fad6e09ba886efb9b91e1247cb39"
-PR = "r2"
+SRCREV = "a56e4b7800e3fa8f9df6f4434cb02f86f6e995bc"
+PR = "r3"
 PV = "1.6+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
-- 
1.7.0.4



