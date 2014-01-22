Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7C808615AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:36:18 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so3698344eek.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=JyYdUJXTbvyE++wWLXQeHf4c2s5bl/B0R/L+sQfmJzs=;
	b=GfS3AM0Ql1lWW5oFzKEqdobhCTNWclLrS4OgTRMu4vGWgoBWLdiOkLO5bCsEBaVdbB
	SWdagyZseY8qapp5W/GfZo8VSW7rbFAfFq/0NCG3S276apuS5PS5mludw+m6QzzsRmWz
	l2w29rmUcf3VkMCh4NSsN+RPANJ8RxvPBCN7zKacE9miV1l/KrC9rnSHBQbEqm0u2geJ
	zTvSKJ72sUTRb3e5XvFQtOrlj0FpanpiW7AXF+snY0w+RX7QgtmJvznfAtP0jeXoEN2M
	+4Oi7kqz9u+0UR0rNRkxnb36HPMlDM36OhdataqfJmfZcfEyPluxZ7OH2QhHlnm/oY+e
	7e5A==
X-Received: by 10.14.100.204 with SMTP id z52mr80399eef.68.1390350979257;
	Tue, 21 Jan 2014 16:36:19 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u7sm20616693eep.11.2014.01.21.16.36.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:36:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:36:10 +0100
Message-Id: <bd679ca92db871e6656b5ecfd3505d5bb99ce94d.1390350823.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RFC][WIP 5/6] tune-cortexr4.inc: Add thumb and arm to TUNE_FEATURES
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
X-List-Received-Date: Wed, 22 Jan 2014 00:36:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexr4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index 57b6717..bde649f 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -10,5 +10,5 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7r", " -march=armv7-r
 
 AVAILTUNES += "cortexr4"
 ARMPKGARCH_tune-cortexr4 = "armv7r"
-TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4"
+TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4 arm thumb"
 PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp"
-- 
1.8.5.3


