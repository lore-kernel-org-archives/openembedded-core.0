Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RdtWd-0008EI-Jt
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 02:02:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBN0tC18004375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 16:55:12 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Dec 2011 16:55:12 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 19:01:39 -0600
Message-ID: <94ba972214f14a4c0e3e8004755a8d586570d109.1324601996.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1324601996.git.mark.hatle@windriver.com>
References: <cover.1324601996.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/7] gperf: Add missing SRC checksum
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
X-List-Received-Date: Fri, 23 Dec 2011 01:02:20 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/gperf/gperf_3.0.3.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/gperf/gperf_3.0.3.bb b/meta/recipes-extended/gperf/gperf_3.0.3.bb
index 5cccdf1..e7acc1f 100644
--- a/meta/recipes-extended/gperf/gperf_3.0.3.bb
+++ b/meta/recipes-extended/gperf/gperf_3.0.3.bb
@@ -5,3 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a5f84abb0070adf8a0925d7d534b6e0a \
                     file://src/main.cc;firstline=8;endline=19;md5=3eab12ba436c4da725b19b131def6de9"
 
 PR = "r1"
+
+SRC_URI[md5sum] = "cc20e58975a38075440423c8fb85fd00"
+SRC_URI[sha256sum] = "63287527c8d9e27e801cf0804436f3494bd569db05d49dcdd2a942ae72fa9055"
-- 
1.7.3.4



