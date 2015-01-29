Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D4250718E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 02:32:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56793331"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jan 2015 10:28:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0T2VW0n027204
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:31:32 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 29 Jan 2015 10:32:16 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jan 2015 10:31:00 +0800
Message-ID: <1422498660-48338-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [PATCH] libidn_0.6.14: fix the QA Issue
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
X-List-Received-Date: Thu, 29 Jan 2015 02:32:19 -0000
Content-Type: text/plain

To fix the QA Issue as following:
ERROR: QA Issue: libidn: Files/directories were installed but not shipped
  /usr/share/emacs
  /usr/share/emacs/site-lisp
  /usr/share/emacs/site-lisp/punycode.el
  /usr/share/emacs/site-lisp/idna.el [installed-vs-shipped]

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-extended/libidn/libidn_0.6.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libidn/libidn_0.6.14.bb b/meta/recipes-extended/libidn/libidn_0.6.14.bb
index ff8d345..4df1d08 100644
--- a/meta/recipes-extended/libidn/libidn_0.6.14.bb
+++ b/meta/recipes-extended/libidn/libidn_0.6.14.bb
@@ -29,4 +29,5 @@ do_configure_prepend() {
 
 do_install_append() {
 	rm -rf ${D}${libdir}/Libidn.dll
+	rm -rf ${D}${datadir}/emacs
 }
-- 
1.8.4.2


