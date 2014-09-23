Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66D586B7CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:20:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEK9cF024953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:20:09 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:20:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 22:19:58 +0800
Message-ID: <da07786341d138e63c842a0cfd13fe7452262786.1411473883.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411473883.git.hongxu.jia@windriver.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] man: fix not support xz/bz2 compression
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
X-List-Received-Date: Tue, 23 Sep 2014 14:20:08 -0000
Content-Type: text/plain

In oe-core, bunzip and unzx located in /usr/bin/
rather than /usr, so tweak man's config.

[YOCTO #6750]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/man/man/man.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man/man/man.conf b/meta/recipes-extended/man/man/man.conf
index bb3c697..fc10be2 100644
--- a/meta/recipes-extended/man/man/man.conf
+++ b/meta/recipes-extended/man/man/man.conf
@@ -133,7 +133,8 @@ MANSECT		1:1p:8:2:3:3p:4:5:6:7:9:0p:tcl:n:l:p:o
 # The command given must act as a filter.
 #
 .gz		/bin/gunzip -c
-.bz2		/bin/bzip2 -c -d
+.bz2		/usr/bin/bunzip2 -c
+.xz		/usr/bin/unxz -c
 .z		
 .Z		/bin/zcat
 .F		
-- 
1.9.1


