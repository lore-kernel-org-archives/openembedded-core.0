Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id A90BE7FDC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 20so5478846wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a1poiNoW6dltaGL6V2Hcq7S5L1gH5Tc1WxvTeQNWdRQ=;
	b=E6PJLvIL9CNznRK7F1P6mptE3qYDUXWHYh+qyxNFpjTFvb0AeGJurWVmxv0XFh3wxh
	p2iJH9FItQvtxYWDE34wrk3hK8tkJgexLs5J9BMRbkgbcBIDkqpSlyrhI6Bf0AhZNf8g
	+KaD5HtH7fHvTMrEQcB7E/QWj5YJINWPGLIpc59Q0zG79kX6/t0EIpLRt0+r23aRRNKK
	7a2DFtU/kBLbpHz9PqCvPL4yWRaTdO3WciCGJ3v8lk2SUsb7E3xLaITBEsmDWZofuNSZ
	+boC7uMy9LHVdJ0ICNx4J+zEjKlfpPZ43ULvOwv9+FNAftzvr4292Jb91HhqHUeLzs4r
	9ZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a1poiNoW6dltaGL6V2Hcq7S5L1gH5Tc1WxvTeQNWdRQ=;
	b=O+gXWBn4kFfmSQDmhI2jnK1gnG59vOb3gTDHayhMDv23AMXrnfK6sZ+KG3R1EPIjF0
	gnGMYLjExihlcQHcHd4bCfO+FlLNW/yagsmoIN3c5EacB339OadKUdb1WG6SjRmcaU8K
	IAxNv4Z/U/F/aL82kHZfBe++MAwOWKYsbJkAkJecUyHMo27BYlR8b12ACJ3EXwIKM9tG
	DMgfmTqQzUzpU6i9durtfEOyiZ931t5wlMYDk045RDVRRoEMYGp6ty3MnG1zGxaYNJfA
	tAITLo8juW9TNP84zwtKTIOeWk6kbLsLdRx2Z5J+lDQAUpDJridUpmpBqs/AFD2k011i
	3o/Q==
X-Gm-Message-State: APjAAAWmpPGBpWzJsrhfDePABAvI34T1XGWIU0arheNdLTp1Z1SfdxAZ
	R2AcEVp5YqEmvz0zfzh/QDtsNW8/JMM=
X-Google-Smtp-Source: APXvYqzwstyzE6FEZLTnDKqZgMAnBrpYG6WBv9000OXgZz+y5F4GmXaxpETASwai716XgoPmYZj7OA==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr9381609wmk.166.1576761796009; 
	Thu, 19 Dec 2019 05:23:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:50 +0100
Message-Id: <20191219132301.80034-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/16] vala: upgrade 0.46.4 -> 0.46.5
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:15 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.46.4.bb => vala_0.46.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.46.4.bb => vala_0.46.5.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.46.4.bb b/meta/recipes-devtools/vala/vala_0.46.5.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.46.4.bb
rename to meta/recipes-devtools/vala/vala_0.46.5.bb
index c4cd6dd4109..9233d109dd9 100644
--- a/meta/recipes-devtools/vala/vala_0.46.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.46.5.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "b79bbaf8929ec8ed35911b3571f5a248"
-SRC_URI[sha256sum] = "4bb9b60fc0230b0db2c8a0e2a80ec29f1c10b43dc78355abba78adedbc2e03a1"
+SRC_URI[md5sum] = "a0a2eb8babb72c1b4e81c4f1b98429df"
+SRC_URI[sha256sum] = "1a7847d2599d902c805a58b95b72b69e64c0223c2f6220163998a7ab4b42db1d"
-- 
2.17.1


