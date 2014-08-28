Return-Path: <fahad.usman@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 666906FA94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:36:42 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so1446183pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 00:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qX9KFraFEwEP8jCluNKekNJJ5jXL8WlSBPtWNL41VZM=;
	b=s2979pSRMe9XRfjZWqVALvELTLWxQb7rZlN1yj7mZxcF8MAnofJ7cIkOvYfsk4kPZ2
	eiVsK4f1LqLou+9eylOCtBKDVOlJxdaQlsXIKC6MC//46ea4nMseF8ijsXKgqGIY/GbW
	k6U166mQKIvwNaEJxo9hcPTivNU30eNl2S6IivqFSZtwec5VIOZmmSlbGyXTz0mP8cma
	5tR/gsIVch9ejcg5Cf+LW78tHBIxyjMQnOEIK9Op/wefNx/nVdSK8KTA0lWuyGO0y9DP
	qBwQnxqdk6a4MoSDVJkzgA4vEm9rpF4U3aABOMro7I5+4zLshsAOqf8BStS+kGTVlDQN
	grnA==
X-Received: by 10.68.248.9 with SMTP id yi9mr3131722pbc.118.1409211403040;
	Thu, 28 Aug 2014 00:36:43 -0700 (PDT)
Received: from fahad-M4700.pkl.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id aj3sm2568522pbc.92.2014.08.28.00.36.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Aug 2014 00:36:42 -0700 (PDT)
From: Fahad Usman <fahad.usman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 12:36:16 +0500
Message-Id: <1409211377-6437-1-git-send-email-fahad.usman@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] buildtools-tarball: include nativesdk-ca-certificates
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
X-List-Received-Date: Thu, 28 Aug 2014 07:36:44 -0000

nativesdk-ca-certificates is needed in order to support oe/yocto builds with
buildtools-tarball on old hosts, as we provide libcurl, and that needs to be
able to find the certs, and there's no standard path or bundle path, so we
can't rely on the host.

Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index c54d9e8..07e8e37 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -42,6 +42,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-pigz \
     nativesdk-make \
     nativesdk-wget \
+    nativesdk-ca-certificates \
     "
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
-- 
1.9.1


