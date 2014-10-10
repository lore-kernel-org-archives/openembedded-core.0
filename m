Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6E471758
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 05:55:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9A5t8Z0002765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Oct 2014 22:55:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 22:55:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 22:55:06 -0700
Message-ID: <d0a1b157499854722a6a6dbcea6ba136c627427c.1412920464.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412920464.git.liezhi.yang@windriver.com>
References: <cover.1412920464.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libassuan: fix for rebuild
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
X-List-Received-Date: Fri, 10 Oct 2014 05:55:10 -0000
Content-Type: text/plain

Fixed when rebuild:
rm: cannot remove `/path/to/2.1.2-r0/libassuan-2.1.2/m4/*.m4': No such file or directory

The files may not exist when rebuild.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libassuan/libassuan_2.1.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libassuan/libassuan_2.1.2.bb b/meta/recipes-support/libassuan/libassuan_2.1.2.bb
index 6d89107..97dec6a 100644
--- a/meta/recipes-support/libassuan/libassuan_2.1.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.1.2.bb
@@ -22,5 +22,5 @@ inherit autotools texinfo binconfig-disabled pkgconfig
 
 do_configure_prepend () {
 	# Else these could be used in prefernce to those in aclocal-copy
-	rm ${S}/m4/*.m4
+	rm -f ${S}/m4/*.m4
 }
-- 
1.7.9.5


