Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TNj71-00070C-1v
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 13:45:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9FBWJgj013756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2012 04:32:19 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 15 Oct 2012 04:32:17 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2012 19:32:40 +0800
Message-ID: <decff650be8ca9f3938423a38e869fb1d13baaec.1350300631.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1350300631.git.kai.kang@windriver.com>
References: <cover.1350300631.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 2/2] nativesdk-packagegroup-sdk-host: add perl modules
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
X-List-Received-Date: Mon, 15 Oct 2012 11:45:35 -0000
Content-Type: text/plain

nativesdk-perl is required to cross compile iptables when use
meta-toolchain-gmae, and perl modules are needed too.
Package nativesdk-perl-modules depends on nativesdk-perl, so just add
nativesdk-perl-modules only.

[Yocto 3100]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../nativesdk-packagegroup-sdk-host.bb             |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 63fea28..383820a 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -3,7 +3,7 @@
 #
 
 SUMMARY = "Host packages for the standalone SDK or external toolchain"
-PR = "r11"
+PR = "r12"
 LICENSE = "MIT"
 
 inherit nativesdk packagegroup
@@ -20,6 +20,7 @@ RDEPENDS_${PN} = "\
     nativesdk-libtool \
     nativesdk-autoconf \
     nativesdk-automake \
+    nativesdk-perl-modules \
     "
 
 RDEPENDS_${PN}_darwin8 = "\
-- 
1.7.5.4



