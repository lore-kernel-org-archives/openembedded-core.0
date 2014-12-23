Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B85B372736
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 05:10:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN5AAIM021604
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:10:10 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Dec 2014 21:10:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Dec 2014 13:09:58 +0800
Message-ID: <2b677d7b51cae5edf3811aaecd3cf33cc40f853f.1419309149.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419309149.git.hongxu.jia@windriver.com>
References: <cover.1419309149.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] ppp: upgrade 2.4.7
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
X-List-Received-Date: Tue, 23 Dec 2014 05:10:14 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/ppp/{ppp_2.4.6.bb => ppp_2.4.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.4.6.bb => ppp_2.4.7.bb} (96%)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.6.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
similarity index 96%
rename from meta/recipes-connectivity/ppp/ppp_2.4.6.bb
rename to meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 8bc3672..92ca0c9 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -31,8 +31,8 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://ppp@.service \
 "
 
-SRC_URI[md5sum] = "3434d2cc9327167a0723aaaa8670083b"
-SRC_URI[sha256sum] = "1b33181a03962c8a092c055fb9980e9722728a8d98a4bb7ec7acda17c1b1b49d"
+SRC_URI[md5sum] = "78818f40e6d33a1d1de68a1551f6595a"
+SRC_URI[sha256sum] = "02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30"
 
 inherit autotools-brokensep systemd
 
-- 
1.9.1


