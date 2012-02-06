Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RuPyq-0002Wu-Ml
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 15:55:44 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1RuPr5-0002ud-8z from wade_farnsworth@mentor.com ;
	Mon, 06 Feb 2012 06:47:43 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 6 Feb 2012 06:46:50 -0800
Received: from [172.30.10.43] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 6 Feb 2012 06:47:42 -0800
Message-ID: <4F2FE80D.30600@mentor.com>
Date: Mon, 6 Feb 2012 07:47:41 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
	<4F2C3541.5000409@mentor.com> <4F2FE7E4.9040902@mentor.com>
In-Reply-To: <4F2FE7E4.9040902@mentor.com>
X-OriginalArrivalTime: 06 Feb 2012 14:46:50.0765 (UTC)
	FILETIME=[28F0E3D0:01CCE4DE]
Subject: [PATCH v4 1/3] systemtap: bump SRCREV to grab version 1.7
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
X-List-Received-Date: Mon, 06 Feb 2012 14:55:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Bump SRCREV to the latest stable version of systemtap.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index ebacc43..dff08ee 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "elfutils sqlite3"
 
-SRCREV = "820f2d22fc47fad6e09ba886efb9b91e1247cb39"
-PR = "r2"
-PV = "1.6+git${SRCPV}"
+SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
+PR = "r0"
+PV = "1.7+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
 
-- 
1.7.0.4



