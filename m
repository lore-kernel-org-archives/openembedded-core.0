Return-Path: <adi@adirat.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE6B78A82
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:41:32 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id m12so15270844wrm.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=adirat-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tBWylE/jSVqbq7SwLU96Rg7cqPvY3I/s06IoCeqsJ+4=;
	b=i6IP8RLEnoujkKu8imT/dtdfQO9zl18R/rVEHsFKMdZ081j1iQuEYiKGdJO1jqiIju
	iomZN+ludOX325OuwD3eCuLg38ctJgQnGj4USqB6/0rKQvMm7qjgyjP1hlrXZejW2+Fl
	LtnwHmldYTpnqE3047n9hj8YBPMviL58w5g1iTZa6cWji8hJPKjFMhig5DXgL/fbOpgt
	ct6OOaOmxQQ53/l0Q/rPeoBGl+ZyztRhr1FhYhtWiHzXqM7SMRZHDjESibYpvgdXNGmE
	hhQQLPIcR60jxuK3CcFxRSL4Til73HowmzO3qiOfJdG5LvtsZPPVVrhg5+eAyeYzoFXI
	1Hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tBWylE/jSVqbq7SwLU96Rg7cqPvY3I/s06IoCeqsJ+4=;
	b=VXt1Z3B7kkb7TY326pZ85bUR9axtaWfc7vFM6ZXKGmjG3GA/NE2uxBDJB/yKV0ha4y
	sEJGfVQXqbAUR5UJSEtuuCavnY2ehfMO9TVHjQinBV5b/kIUyPiSjHSfUgCV1CuDUpvi
	Kx+/Pv3CusdLizAdZUloXUytCK05W9Ijq3aFMa/rjwXR9b2ufxOQMRioqsLZNdx5Rbxo
	nwdrDLWRumhgVii1/eKDmG7LEuLV00rVleP+pJ0rotIaiJCukMQaLrCj/HCAARz0rbyb
	LXuAKvrY1xwrbQKvVzD5eVug4Tjz0NsKpIza4qZuvDTDKT2b4VUyS5pnuNMa+RSqSMtX
	paGQ==
X-Gm-Message-State: APf1xPDREjjaloplV5WghQruMQ5w/DjNMpy30QT8vWhdO9vVakf/ntLx
	kVbp1zYTdsrh1s2zMLPUtICf3Xur
X-Google-Smtp-Source: AG47ELs8AJ+q3FPyV5UBEZhJV0hnuMVEghorXLGLRy0bWJ5FAwTEjXnrUvQZu3qbWlFqqfQED48q+A==
X-Received: by 10.223.154.173 with SMTP id a42mr11532969wrc.240.1520199693579; 
	Sun, 04 Mar 2018 13:41:33 -0800 (PST)
Received: from adiPC.lan ([2a02:2f0e:190:12a9:eaa7:71e2:972d:878b])
	by smtp.gmail.com with ESMTPSA id
	d27sm14004355wrd.60.2018.03.04.13.41.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:41:32 -0800 (PST)
From: Ioan-Adrian Ratiu <adi@adirat.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 01:41:08 +0200
Message-Id: <20180304234108.12711-2-adi@adirat.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180304234108.12711-1-adi@adirat.com>
References: <20180304234108.12711-1-adi@adirat.com>
Subject: [PATCH v2 2/2] diffutils: allow native & nativesdk builds
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
X-List-Received-Date: Sun, 04 Mar 2018 21:41:33 -0000

Required by the new dtc rdepends to avoid errors like this:

ERROR: Required build target 'ionel-rpi-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['ionel-rpi-image', 'nativesdk-packagegroup-sdk-host', 'nativesdk-qemu', 'nativesdk-dtc', 'nativesdk-diffutils']

Signed-off-by: Ioan-Adrian Ratiu <adi@adirat.com>
---
 meta/recipes-extended/diffutils/diffutils.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
index 7c5be50fb7..c9e3130587 100644
--- a/meta/recipes-extended/diffutils/diffutils.inc
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -10,3 +10,4 @@ inherit autotools texinfo update-alternatives gettext
 ALTERNATIVE_${PN} = "diff cmp"
 ALTERNATIVE_PRIORITY = "100"
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


