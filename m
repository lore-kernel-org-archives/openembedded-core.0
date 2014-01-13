Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7086C80A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 09:37:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0D9bu28023533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 01:37:56 -0800 (PST)
Received: from pek-xzhang1-d1.corp.ad.wrs.com (128.224.162.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Mon, 13 Jan 2014 01:37:55 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 17:38:26 +0800
Message-ID: <1389605906-16202-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [PATCH] libidn: disable C# directly
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
X-List-Received-Date: Mon, 13 Jan 2014 09:37:57 -0000
Content-Type: text/plain

Disable C# building with --disable-csharp instead of remove
useless binary files.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-extended/libidn/libidn_1.28.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libidn/libidn_1.28.bb b/meta/recipes-extended/libidn/libidn_1.28.bb
index 5daff43..effd5ea 100644
--- a/meta/recipes-extended/libidn/libidn_1.28.bb
+++ b/meta/recipes-extended/libidn/libidn_1.28.bb
@@ -27,7 +27,8 @@ SRC_URI[sha256sum] = "dd357a968449abc97c7e5fa088a4a384de57cb36564f9d4e0d898ecc63
 PACKAGES =+ "idn"
 FILES_idn = "${bindir}/*"
 
+EXTRA_OECONF = "--disable-csharp"
+
 do_install_append() {
-	rm -rf ${D}${libdir}/Libidn.dll
 	rm -rf ${D}${datadir}/emacs
 }
-- 
1.8.1.2


