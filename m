Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TbNdH-0005UT-10
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 04:39:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAM3PBFr027384
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 19:25:11 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 19:25:11 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Nov 2012 11:25:46 +0800
Message-ID: <d6c10ffd234888a17125737771a32bd4203a30e0.1353553774.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1353553772.git.kai.kang@windriver.com>
References: <cover.1353553772.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] packagegroup-core-lsb: remove lsbsetup
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
X-List-Received-Date: Thu, 22 Nov 2012 03:39:19 -0000
Content-Type: text/plain

package lsbsetup has been dropped, so remove it from packagegroup
core-lsb.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 32dc58e..51517dc 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "Linux Standard Base (LSB)"
 DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specification"
-PR = "r9"
+PR = "r10"
 LICENSE = "MIT"
 
 inherit packagegroup
@@ -101,7 +101,6 @@ RDEPENDS_packagegroup-core-lsb-misc = "\
     gettext-runtime \
     groff \
     lsbinitscripts \
-    lsbsetup \
     lsbtest \
     lsof \
     strace \
-- 
1.7.5.4



