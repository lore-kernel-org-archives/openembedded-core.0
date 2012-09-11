Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TBImj-00087Z-0S
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:13:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8B50iZS022564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2012 22:00:44 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 10 Sep 2012 22:00:45 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 11 Sep 2012 13:00:58 +0800
Message-ID: <824dcd67b7a31144bd46e58837cbd0f311bb7fa9.1347329133.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1347329133.git.kai.kang@windriver.com>
References: <cover.1347329133.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.159]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] packagegroups-core-lsb: add perl-dev/doc
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
X-List-Received-Date: Tue, 11 Sep 2012 05:13:17 -0000
Content-Type: text/plain

File CORE/config.h which is provided by perl-dev and file
unicore/version which is provided by perl-doc are required by LSB perl
test cases.

Add perl-dev and perl-doc to packagegroups-core-lsb.

[Yocto #3052 #3053 #3054 #3055]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 32dc58e..cee97bc 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -168,6 +168,8 @@ DESCRIPTION_packagegroup-core-lsb-perl = "Packages required to support libraries
     specified in the LSB Runtime languages specification (Perl parts)"
 RDEPENDS_packagegroup-core-lsb-perl = "\
     perl \
+    perl-dev \
+    perl-doc \
     perl-modules \
     perl-misc \
     perl-pod \
-- 
1.7.5.4



