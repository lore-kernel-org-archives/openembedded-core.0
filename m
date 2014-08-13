Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7600465E0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 08:18:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7D8IEDI019268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 01:18:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 01:18:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Aug 2014 01:18:12 -0700
Message-ID: <ff7f0170a718b54c8b20e308edf36b3052538fc8.1407917762.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407917762.git.liezhi.yang@windriver.com>
References: <cover.1407917762.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] xz: set CONFIG_SHELL to /bin/sh
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
X-List-Received-Date: Wed, 13 Aug 2014 08:18:19 -0000
Content-Type: text/plain

It would be bash, sh, ksh or sh5 according to the host if we don't set
this, and its scripts don't have bashism as the checkbashisms shows.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/xz/xz_5.1.3alpha.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.1.3alpha.bb b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
index b8501a5..168e383 100644
--- a/meta/recipes-extended/xz/xz_5.1.3alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
@@ -38,3 +38,5 @@ FILES_liblzma-staticdev = "${libdir}/liblzma.a"
 FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
 
 BBCLASSEXTEND = "native nativesdk"
+
+export CONFIG_SHELL="/bin/sh"
-- 
1.7.9.5


