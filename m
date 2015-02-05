Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2D25772E5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:18 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so8545822pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZacvVr+0k/X51vlCN1onkgzvmSWeOEv+/GheztE3ao0=;
	b=qxjCmN880APy/5Rq48XpLvsMdm4+rtRDsxLBzKxhCQNy9GqZ1/MNKyOgdlJ9hvERUB
	hNtw1gVGBpLgovlKk2EQw8rQ4kLvTyx9eBR3WFcnka/Zkg6VtWb17T3TorG4ag8YR9vF
	T/2dWcNn3K+a3CHaWaJYh1krejXa2iWWIEcSYKifFAizIgBFt7nMziBKwXQxOp/FI8rX
	arl7bG3dH4WpgC4eVlk7UrNM1a/T1E1kqrArrXeXKzTG+sU6MUSofwdkBpSUQtCouaTa
	AGs7IQb06raE06sYs3a5hgo5Cn+cYwpl9r9lftZVeRwVkpBIGKA8I1CS67/MYkfzibNk
	vycg==
X-Received: by 10.68.130.101 with SMTP id od5mr6899628pbb.108.1423152319784;
	Thu, 05 Feb 2015 08:05:19 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:41 -0800
Message-Id: <7b3bc2aad5d23dc6d362182725b09f03a7669e8c.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 33/61] boost: Avoid to use local host configuration
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:18 -0000

From: Fabien Proriol <fabien.proriol@jdsu.com>

(From OE-Core rev: 6586aeb3e26d58322c169dfef0228a425fe5d3fa)

Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index d34ca7c..069b1c8 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -90,7 +90,8 @@ EQD = '\"'
 #boost.bb:   "...  '-sGCC=... '${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}config${EQD}'${SQD} ..."
 BJAM_CONF = "${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}boost/config/platform/${TARGET_OS}.hpp${EQD}'${SQD}"
 
-BJAM_TOOLS   = "-sTOOLS=gcc \
+BJAM_TOOLS   = "--ignore-site-config \
+		'-sTOOLS=gcc' \
 		'-sGCC=${CC} '${BJAM_CONF} \
 		'-sGXX=${CXX} '${BJAM_CONF} \
 		'-sGCC_INCLUDE_DIRECTORY=${STAGING_INCDIR}' \
-- 
1.9.1


