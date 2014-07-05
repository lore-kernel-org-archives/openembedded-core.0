Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 231276084E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 06:05:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6565bnV018511
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 23:05:37 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 4 Jul 2014 23:05:37 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Jul 2014 14:05:34 +0800
Message-ID: <1404540334-13377-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH V2] libcroco: disable /usr/bin/croco-6.0-config
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
X-List-Received-Date: Sat, 05 Jul 2014 06:05:46 -0000
Content-Type: text/plain

librsvg is the only recipe depending on libcroco, which doesn't refer to
croco-6.0-config any more, so we inherit binconfig-disabled here to
disable it.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 7d04265..278934e 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -13,7 +13,9 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--enable-Bsymbolic=auto"
 PR = "r1"
 
-inherit autotools-brokensep pkgconfig gnomebase gtk-doc
+BINCONFIG = "${bindir}/croco-0.6-config"
+
+inherit autotools-brokensep pkgconfig gnomebase gtk-doc binconfig-disabled
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.8.4.1


