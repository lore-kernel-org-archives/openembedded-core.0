Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 79C89770B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:20:02 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id e32so258877045qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KcQ4Wido5GQy/QIJ6hJz1coO+NF1526d74+6nM48DQU=;
	b=dve7BlA9ii36+x+TCXEnpH2j1o9kvxeP8z1rdmo+hzn30zJV/azgJeVWWeN2JW7kRp
	5yfOkgUh/ZJxwIMlRWL6haBwOJdskWbPWs3WXP3X4U2WSQOpGzIiyzD3FTStmiuOxZBH
	fRjLn+OreR5hAAIg25I6AZGdX6YBgxc++yigueov/iEoI6tSuA6HyI3ix+PzIM5esg/+
	tOgeWyistMT7jpMSFBiZQaoz3WY5arjhRGYW0rYT/3DD57ZhVCaTFVYNsk/RiiYHPTgu
	zVxFWdF+jC6u3cmIc/X1AjLTQuvmNr8lx/zp6IdzwhDwTd7UhF5jC1l2JCTh2vOzSqxf
	/IVg==
X-Received: by 10.140.131.17 with SMTP id 17mr116775554qhd.12.1452248403368;
	Fri, 08 Jan 2016 02:20:03 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:20:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:21 +0000
Message-Id: <57d7816e14cc27bfe2ffb567a54df5c517200d57.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 53/53] elfutils: Add ALLOW_EMPTY for musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:20:03 -0000

core-image-cmdline-full asks for elfutils package to be added to package
it has all eu-* tools but we dont build them on musl. nevertheless lets
satisfy the dependency so image can build for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.163.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.163.bb b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
index 0a7dd88..23e2d7a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.163.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
@@ -65,6 +65,8 @@ EXTRA_OEMAKE_libc-musl = "-C libelf"
 EXTRA_OEMAKE_class-native = ""
 EXTRA_OEMAKE_class-nativesdk = ""
 
+ALLOW_EMPTY_${PN}_libc-musl = "1"
+
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-- 
2.7.0


