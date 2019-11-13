Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id B566B7F7B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:49 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k13so1605715pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LoEUb3vUWCMmigr1IqaKYvMkxWUlPNNCuwa8gUUKmwA=;
	b=KuXSzqB/OfRcpzMqCsuEenW2aciurXzRdcDAbtdE3geTuXd4wrqDUqGLNVrakKKXn/
	dvWDRLOU5D0jRhx6aG+OiIwaWiG76JUUphTtkcNrVWdDXECF4Bdf/HhtUBNoh/9p3BQ3
	0ZL7F2IeQzdzgnlozIeMcTu2alxZEcHpdgtp1J3f+BHtBPfy8gnhpMoqsEHYfgSU3b8e
	NLNojEnc8fBjQobSCWCIbgNGkUiZSGBMCGsgpKAgWBgMyRB1FdHdsA6zPdHo3Z7vrr7I
	mU/86a7UG/+RTJCAO31eAn4itMyraEJXGNpciurfRibU+iOOJWWc99KHZT2srzA6O7Ac
	t0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LoEUb3vUWCMmigr1IqaKYvMkxWUlPNNCuwa8gUUKmwA=;
	b=jrTUFNTogwYt4mvUOWJ8MM44woSNyy0EApTO2kdya+1JYDNWQbQ37YMXmkc4I2NqjL
	fTL7nzLgVghf8bxvgiPqg1zOY2Xdq14eV+3Uw+sFuFpqaXgEfQFTgCuZHS9gJYZXANwH
	2OuFbsLf85O+s+87GaUBhTR9Y8mKYW96sK448BfzRX84rCo7FIiRY98KwBFW9VOd5MQW
	0WY81wQXXJE8wVqXwyiMWkegQPJsEQom4um/QxTfDirvS2ZsU2qGLPJoMZVVRlQrfXc7
	wd6TAOh9zy0tOBj93BjF2XrYZS71wDPg8ZBS7hMZHyDcE4r/rjyJsZTlkR4CGUr1gBIh
	CKiA==
X-Gm-Message-State: APjAAAV6z9Xq34Ye7HZysleM+9ly3GqD6MpMmsYzCzKFn3uChqexrjIm
	Gemfq/F/mVmbiX1vji5zfZrTYJ+p
X-Google-Smtp-Source: APXvYqzqNviUEPUOVViKaLXWD9lVZAN6lzKQYjyecK1zz9LBMW4rmiQXAiELlPK2LmXm2HY33nhE8g==
X-Received: by 2002:a62:ea19:: with SMTP id t25mr1710615pfh.74.1573659170803; 
	Wed, 13 Nov 2019 07:32:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:07 -0800
Message-Id: <90b4b7dd19526e8aba79cf469dcc2c05401f36cc.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 25/31] recipeutils-test: use a small dependency in the dummy recipe
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:49 -0000

From: Ross Burton <ross.burton@intel.com>

recipeutils-test has virtual/libx11 as a DEPENDS, but this will cause errors if
the recipe is built in an environment without x11 in DISTRO_FEATURES.

This dependency isn't actually used for anything so we could remove it, but to
save updating the test cases too just swap virtual/libx11 for zlib.

[ YOCTO #13611 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 7c20d9a..0cd0494 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -4,7 +4,7 @@ require recipeutils-test.inc
 
 LICENSE = "Proprietary"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
-DEPENDS += "virtual/libx11"
+DEPENDS += "zlib"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4


