Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62E7277E4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 09:38:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4O9crS2029811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 02:38:57 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 24 May 2017 02:38:52 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2017 17:33:58 +0800
Message-ID: <ea7b4a713a48b0b2533bbec7680355b852200ecc.1495618375.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1495618375.git.kai.kang@windriver.com>
References: <cover.1495618375.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpcap: add native package
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
X-List-Received-Date: Wed, 24 May 2017 09:38:57 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add package libcap-native required by recipe daq-native in layer
meta-networking. And daq-native is added to fix snort start error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 6635779..e57ea87 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -38,3 +38,5 @@ CXXFLAGS_prepend = "-I${S} "
 do_configure_prepend () {
     sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
 }
+
+BBCLASSEXTEND = "native"
-- 
2.10.1


