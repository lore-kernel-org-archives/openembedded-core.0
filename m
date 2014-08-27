Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5F12370EE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 19:19:40 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id a41so691950yho.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=u8jI92mPN9IwZ7OaQx242St8Hy/0xKmoaf+cqoz0v1A=;
	b=lsQeBbzpZu/9OAI5NItbXjhKxoVJC5G0PkdJqsCmHtRzskEbMRe/ftXCZo+39K03rR
	50AbLUmT3andTDRhozeZOwjIrnmf2p2Uvtlcj72XScqWo8WifcU1Gbs0wvCxpqZZjCLj
	qPZcn7+AayLG7+MMESocqNspLHcb7iTXq+3O2M9eyBTvyGQ1S6j7dUD17/uplLZ2spRQ
	EhThY8rxcpMgt09pCST8nzNFvviOhQF64NbsploR7Z/JZ+dHK0aYck0U+XRvgSXyBsGj
	vWnpMG9DDAqX3DMSIWzuek85nt1nCD5UoGgH+1JiQlYm+gebzKdPV0ICntW9PX3WWM3g
	lyVQ==
X-Received: by 10.236.88.226 with SMTP id a62mr57574507yhf.64.1409167182112;
	Wed, 27 Aug 2014 12:19:42 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id 6sm644785yhw.38.2014.08.27.12.19.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Aug 2014 12:19:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 07E541C4368F1; Wed, 27 Aug 2014 16:19:38 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 16:19:33 -0300
Message-Id: <1409167173-18513-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.0.rc1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] packagegroup-core-directfb: Set PACKAGE_ARCH to MACHINE_ARCH
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
X-List-Received-Date: Wed, 27 Aug 2014 19:19:51 -0000

The contents change depends on the MACHINE_FEATURES so this is clearly
a machine specific package. Set it accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index 7786133..53dc0ae 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -1,6 +1,8 @@
 SUMMARY = "DirectFB without X11"
 LICENSE = "MIT"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
 TOUCH = ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
-- 
2.1.0.rc1


