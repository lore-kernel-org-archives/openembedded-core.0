Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 923FA7843C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 08:35:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H8ZGEX028575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Aug 2017 01:35:16 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 01:35:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 17 Aug 2017 04:35:14 -0400
Message-ID: <1502958914-22960-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1502955267.13978.181.camel@linuxfoundation.org>
References: <1502955267.13978.181.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH] gpgme: remove local m4/python.m4
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
X-List-Received-Date: Thu, 17 Aug 2017 08:35:16 -0000
Content-Type: text/plain

While multilib, the local m4/python.m4 incorrectly assigned
am_cv_python_pyexecdir and am_cv_python_pythondir which caused
the following error enabled:
...
ERROR: gpgme-1.9.0-r0 do_package: QA Issue: gpgme: Files/directories
were installed but not shipped in any package:
  /usr/lib/python3.5/site-packages/gpg-1.9.0-py3.5.egg-info
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gpgme/gpgme_1.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gpgme/gpgme_1.9.0.bb b/meta/recipes-support/gpgme/gpgme_1.9.0.bb
index 2518147..065c346 100644
--- a/meta/recipes-support/gpgme/gpgme_1.9.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.9.0.bb
@@ -73,4 +73,5 @@ do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/gpg-error.m4
 	rm -f ${S}/m4/libassuan.m4
+	rm -f ${S}/m4/python.m4
 }
-- 
2.8.1


