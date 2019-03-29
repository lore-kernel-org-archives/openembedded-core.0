Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7EC7D221
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2T7MiF2014673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 00:23:10 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 29 Mar 2019 00:23:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Mar 2019 15:33:02 +0800
Message-ID: <49c48acdb5f373db42ce422ef286de0abe72ce63.1553844755.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1553844755.git.Qi.Chen@windriver.com>
References: <cover.1553844755.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nasm: add CVE_PRODUCT
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
X-List-Received-Date: Fri, 29 Mar 2019 07:23:19 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/nasm/nasm_2.14.02.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index 96536cc..ecec78d 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -16,3 +16,5 @@ EXTRA_AUTORECONF += "--exclude=aclocal"
 BBCLASSEXTEND = "native"
 
 DEPENDS = "groff-native"
+
+CVE_PRODUCT = "netwide_assembler"
-- 
1.9.1


