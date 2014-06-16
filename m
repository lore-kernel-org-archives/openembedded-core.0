Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 28A8D65FE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:49:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GDnLpb014520
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:49:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 16 Jun 2014 06:49:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 06:49:19 -0700
Message-ID: <f304fb8b27c04e7099b22978c44e30346fb25dea.1402926503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402926503.git.liezhi.yang@windriver.com>
References: <cover.1402926503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libpcap: Avoid libpcap build error when libnl1 is involved
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jun 2014 13:49:20 -0000
Content-Type: text/plain

From: Hu Yadi <Yadi.hu@windriver.com>

Add --with-libnl autoconfig parameter and dependency between libpcap and libnl1

Signed-off-by: Hu Yadi <Yadi.hu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 177b70f..6f76cb5 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -23,6 +23,9 @@ inherit autotools binconfig
 
 EXTRA_OECONF = "--with-pcap=linux"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libnl1] = "--with-libnl,--without-libnl,libnl1,libnl1"
+
 CPPFLAGS_prepend = "-I${S} "
 CFLAGS_prepend = "-I${S} "
 CXXFLAGS_prepend = "-I${S} "
-- 
1.7.9.5


