Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8C971B15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:34 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 20so6874151uak.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=64Ucm4o0n3IASQCXLYPwpNtMTBy9PjCXMKzs94Tdv38=;
	b=WPUxX86GZQe/WCGSrd1sDvIfe/13UTa9EPwpYWTGNvmStXRrmaI1acVWjKhOLf6P10
	Kny7Uj8Kisa8+eaWxQqF2T5KqC9lmxcUm1ZGRxqmj3v6bBBw+jI7y4aCFx824Sp7Sooa
	fSKXErIHipcxYo0fwBE4m2Ca31R9daZJQCStGqpNFJ2NGjUvJTs3PXrEZk4iXWxo1h+x
	kvdB3R4k4HSBNSmu13RlOp005Suw+NCegcu2b2HuCRi4WQWyWGf2qDZy1WRUFkdlu2lm
	GWtjTQxogi2OzRqXk3ywS76XCcEn/zDyLbiwJqcGwK46eYaXn/qu24kQEEMiE0Ze6+zF
	SmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=64Ucm4o0n3IASQCXLYPwpNtMTBy9PjCXMKzs94Tdv38=;
	b=SQ06TBf2JgtpQmUtkn8PM5LpxPnleqwbYNypniM+onykFv1e23Fz4WX9tDCvdSgSq8
	ghIlz0jtepWpKV5gl3WniZLw4HnZ/VbJZQRxMrJAoLBR1NuP6Q1vWdtS3IVHVGte/Rvg
	jsf5iHOUJcLaPDlG8SK+069bIa6HzVPANdfi6BsFFqzLnya26E8jPZ3Rkc91393vNId3
	LVWmXsUqX6aJf+qZmazGVlpGx6LOYi6rTq3re3Amzl6X4ngwYD26bfuYC1X+kFUR1W9f
	O1GNBxyQelNUPw91ggBSmiSnFStE5GGkclH845TJzwNVcuLfjyUDl60N7fAtSHdtakr1
	DpQw==
X-Gm-Message-State: ABUngvcdMwHTq5CHwXV3M/n3HiXvu1ee9EGiqkfomBxb/xsT2k7/JLIeHey2AEB+CS7s7g==
X-Received: by 10.176.64.234 with SMTP id i97mr9618860uad.7.1478030076101;
	Tue, 01 Nov 2016 12:54:36 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:34 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:53:53 -0200
Message-Id: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 1/8] autogen-native: Update to version 5.18.12
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:35 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../autogen/{autogen-native_5.18.10.bb => autogen-native_5.18.12.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.10.bb => autogen-native_5.18.12.bb} (90%)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
similarity index 90%
rename from meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
index 274427c..cf1744c 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://fix-script-err-when-processing-libguile.patch \
 "
 
-SRC_URI[md5sum] = "2d1b5226e1929d0680011df631289571"
-SRC_URI[sha256sum] = "0b8681d9724c481d3b726b5a9e81d3d09dc7f307d1a801c76d0a30d8f843d20a"
+SRC_URI[md5sum] = "551d15ccbf5b5fc5658da375d5003389"
+SRC_URI[sha256sum] = "805c20182f3cb0ebf1571d3b01972851c56fb34348dfdc38799fd0ec3b2badbe"
 
 UPSTREAM_CHECK_URI = "http://ftp.gnu.org/gnu/autogen/"
 UPSTREAM_CHECK_REGEX = "rel(?P<pver>\d+(\.\d+)+)/"
-- 
2.1.4


