Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f171.google.com (mail-gg0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1FB610F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:27 +0000 (UTC)
Received: by mail-gg0-f171.google.com with SMTP id q4so754148ggn.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=PP7QcUA5IAFdv/HJxxgniQS6a8LcUqaJEWrpphx5koc=;
	b=Ru3/GngpVt8AGQy36dNIG/OcuYo9R0EI3qIAOAwpW+Se2YviCDKWj+wo8lYNWViX4g
	t5QFtng4EPtf8RmOjCuyZNWtGF4QQFrMP2dHEH4adC8pvU6rHMyRpch/XCdMkNwRf8aE
	lpDjuHEmH7mP/bUieUoV2SXfc/qJtyRjtVT2tu4GIcry7lFPH5lbiVcgiXrHAR5Heqpv
	j5PBkTdHGwlCPKQyNSblCIBDcucYvpI5O3vqr8MsWFWx7p0j5B86s8t+RQtBt+wvr3n1
	L4GcXHo9x1mkRFTxK03TeiScZMISKZFEa/A5KNZv/jfmMvSoUO/yN0Mr3Zak+K88X3v4
	9umQ==
X-Received: by 10.236.190.100 with SMTP id d64mr397942yhn.76.1390526788226;
	Thu, 23 Jan 2014 17:26:28 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	m68sm42510019yhj.22.2014.01.23.17.26.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 11A0417BF8CF5; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:09 -0200
Message-Id: <1390526775-26036-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-fsl-arm][PATCH v3 05/11] libfslparser: Upgrade to 3.0.10 version
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:27 -0000

From: Lauren Post <lauren.post@freescale.com>

Package is from 3.10.17-1.0.0_beta release

Change-Id: I74b7f818e51cc570b0bb5be3d2892eb4ca8cdb2f
Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 recipes-multimedia/libfslparser/libfslparser_3.0.10.bb | 10 ++++++++++
 recipes-multimedia/libfslparser/libfslparser_3.0.9.bb  | 13 -------------
 2 files changed, 10 insertions(+), 13 deletions(-)
 create mode 100644 recipes-multimedia/libfslparser/libfslparser_3.0.10.bb
 delete mode 100644 recipes-multimedia/libfslparser/libfslparser_3.0.9.bb

diff --git a/recipes-multimedia/libfslparser/libfslparser_3.0.10.bb b/recipes-multimedia/libfslparser/libfslparser_3.0.10.bb
new file mode 100644
index 0000000..6c72259
--- /dev/null
+++ b/recipes-multimedia/libfslparser/libfslparser_3.0.10.bb
@@ -0,0 +1,10 @@
+# Copyright (C) 2013, 2014 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require libfslparser.inc
+
+SRC_URI = "${FSL_MIRROR}/${PN}-${PV}.bin;fsl-eula=true"
+SRC_URI[md5sum] = "8c80f20532ae178077f59d38f4e8f9b7"
+SRC_URI[sha256sum] = "ae3fcdc42f59ddb6c451e42f1f81860eaa540cbfba260ecf55fc457b49f1a65d"
+
+COMPATIBLE_MACHINE = "(mx28|mx5|mx6)"
diff --git a/recipes-multimedia/libfslparser/libfslparser_3.0.9.bb b/recipes-multimedia/libfslparser/libfslparser_3.0.9.bb
deleted file mode 100644
index b497ae6..0000000
--- a/recipes-multimedia/libfslparser/libfslparser_3.0.9.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-# Copyright (C) 2013 Freescale Semiconductor
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require libfslparser.inc
-
-# FIXME: Inspecting the source code the content is in fact 3.0.9
-SRC_URI = "${FSL_MIRROR}/${PN}-3.10.9-1.0.0.bin;fsl-eula=true"
-S = "${WORKDIR}/${PN}-3.10.9-1.0.0"
-
-SRC_URI[md5sum] = "655970eb7389860a58cfd3c1e7d3efcf"
-SRC_URI[sha256sum] = "bcef8a03d935ac52d2cba8b9aec664906d63cea31d37c05b0bad11dd38fbefca"
-
-COMPATIBLE_MACHINE = "(mx28|mx5|mx6)"
-- 
1.8.5.3


