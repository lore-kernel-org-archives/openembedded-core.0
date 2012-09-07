Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9u3Q-0004jv-PN
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 10:36:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q878OF7p015258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Sep 2012 01:24:18 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 7 Sep 2012 01:24:15 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Fri, 7 Sep 2012 16:24:23 +0800
Message-ID: <c632d76a06e23f97d934041a508643abdc2c5cef.1346911593.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346911593.git.kai.kang@windriver.com>
References: <cover.1346911593.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] packagegroups-core-lsb.bbappend: add perl-dev/doc
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
X-List-Received-Date: Fri, 07 Sep 2012 08:36:45 -0000
Content-Type: text/plain

File CORE/config.h which is provided by perl-dev and file
unicore/version which is provided by perl-doc are required by LSB perl
test cases.

Add perl-dev and perl-doc to packagegroups-core-lsb.

[Yocto #3052 #3053 #3054 #3055]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-lsb.bbappend   |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend b/meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend
index 9fba0b0..60a5768 100644
--- a/meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend
+++ b/meta-lsb/recipes-core/packagegroups/packagegroup-core-lsb.bbappend
@@ -5,6 +5,8 @@
 RDEPENDS_packagegroup-core-lsb-core_append += "wget"
 
 RDEPENDS_packagegroup-core-lsb-perl_append += "\
+    perl-dev \
+    perl-doc \
     libclass-isa-perl \
     libenv-perl \
     libdumpvalue-perl \
-- 
1.7.5.4



