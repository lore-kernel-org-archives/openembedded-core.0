Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3b7g-0004De-Ny
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:43:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NRRJJ026456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:27:27 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:27:26 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:54:23 -0600
Message-ID: <1360281263-23608-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1360281263-23608-1-git-send-email-mark.hatle@windriver.com>
References: <1360281263-23608-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [WR PATCH 2/2] Add directory information to the pkgdata files
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
X-List-Received-Date: Thu, 07 Feb 2013 23:43:21 -0000
Content-Type: text/plain

[ CQID: WIND00401773 ]

Add S(ource) and B(uild) directory information to the recipe pkgdata files.
This allows external tools to find the appropriate information, and be able
to easily access the corresponding sources and build directories.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a1cd0c2..f26da28 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1098,6 +1098,8 @@ python emit_pkgdata() {
 
     data_file = pkgdatadir + d.expand("/${PN}" )
     f = open(data_file, 'w')
+    f.write("S: %s\n" % d.expand("${S}"))
+    f.write("B: %s\n" % d.expand("${B}"))
     f.write("PACKAGES: %s\n" % packages)
     f.close()
 
-- 
1.7.3.4



