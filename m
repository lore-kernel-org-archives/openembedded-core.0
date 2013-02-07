Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bCe-00052l-CB
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:48:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NWaTb006303
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:32:36 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:32:34 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:59:22 -0600
Message-ID: <3ea51737c3d489c38e5e4dbe4499cafe128ca9d5.1360270255.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270255.git.mark.hatle@windriver.com>
References: <cover.1360270255.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 01/11] populate_sdk_base.bbclass: add execution permission for self-extracting archive
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
X-List-Received-Date: Thu, 07 Feb 2013 23:48:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

[ CQID: WIND00392947 ]

It is not good user experience that the self-extracting archive (.sh file)
has no execution permission by default.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c587af8..c025d40 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -257,6 +257,9 @@ exit 0
 
 MARKER:
 EOF
+	# add execution permission
+	chmod +x ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+
 	# append the SDK tarball
 	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
-- 
1.8.1.2.545.g2f19ada



