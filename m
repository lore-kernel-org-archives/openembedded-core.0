Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6F7960144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 00:45:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8N0jhT7015054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 17:45:44 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Sep 2014 17:45:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 08:45:42 +0800
Message-ID: <1411433142-9309-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2] gnupg: add pinentry into RRECOMMENDS
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
X-List-Received-Date: Tue, 23 Sep 2014 00:45:45 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Pinentry is needed for most function of GnuPG, so add it into RRECOMMENDS

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.26.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.26.bb b/meta/recipes-support/gnupg/gnupg_2.0.26.bb
index c460b7e..92dd3bd 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.26.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.26.bb
@@ -23,6 +23,7 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
                 --with-readline=${STAGING_LIBDIR}/.. \
                "
+RRECOMMENDS_${PN} = "pinentry"
 
 do_configure_prepend () {
 	# Else these could be used in prefernce to those in aclocal-copy
-- 
1.7.10.4


