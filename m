Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2F79377055
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:59:52 +0000 (UTC)
Received: by igdg1 with SMTP id g1so46986853igd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=spkChthvz51ux2cEAGAOO+WU+GLnJKzcE4S0nni/LfQ=;
	b=kHB1vi1GsKltrMGY3xrKZWqeyaqEkW2UA1bqLiBAM9hv589YCPysDREfKs4p1Slumd
	KplLrhad8jhRTFmQiVtvf9GK1nMxaNsWDiDXjblA4TG6wwzO/XBfL5hnD9rsDOfUvGJJ
	6msGlrOPPsr/SLHBfkkimF97Hzj9G580+SqhW7pz3fkGaUGE4iVjWSSsCXdYTBKdqd79
	p3E7BiuhfIC/f+ydrE/UmYWWTZWfXAXnSSzfRDdj+ztomHSpfFGga78TGbE0soOIk4Ny
	AunrbHfgokpxwXI63/IVcCyWY5czsMYKMlGIloSDIEsX1lAuonZU2f8xu/kCDQkh344W
	L2gw==
X-Received: by 10.50.18.109 with SMTP id v13mr1664315igd.14.1445281192789;
	Mon, 19 Oct 2015 11:59:52 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ot2sm8240489igb.17.2015.10.19.11.59.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 11:59:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:59:33 -0700
Message-Id: <1445281177-3309-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/5] tune-corei7.inc: fix PACKAGE_EXTRA_ARCHS_tune-corei7-32 typo
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
X-List-Received-Date: Mon, 19 Oct 2015 18:59:53 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-corei7.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index 42cf932..bea652f 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -20,7 +20,7 @@ AVAILTUNES += "corei7-32"
 TUNE_FEATURES_tune-corei7-32 = "${TUNE_FEATURES_tune-x86} corei7"
 BASE_LIB_tune-corei7-32 = "lib"
 TUNE_PKGARCH_tune-corei7-32 = "corei7-32"
-PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2} corei7-32"
+PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-32} corei7-32"
 
 AVAILTUNES += "corei7-64"
 TUNE_FEATURES_tune-corei7-64 = "${TUNE_FEATURES_tune-x86-64} corei7"
-- 
1.9.1


