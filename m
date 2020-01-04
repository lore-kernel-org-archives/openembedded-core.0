Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 81B237F8A9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q8so24910634pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ueoAB/paKcs58RcwjsHu3YO3LLAazDrlmC1WJxcuo8s=;
	b=ZpewffaooOlOgYhWct80IOB41ciJPDs7D5AuzEfUCt5wwCrJNxQNAY0fjE5BlUmwxn
	F1gi4Z38rXIADJYzTnJifvcXECT9fZBtXY5EWO9lm8HX1WhSyCNdlmt1KO54XLu4c69p
	+6nG6SXb+tToMXZ/ZxstQTIJPpr8JEjuw6I/BmRQlN6vsTistzjR+ETRXr5TVLmB3/K0
	1Bc5F4Y5OQ5t0xM3sOJc4DQ7ODebtousZMxNn+kviwbYBiWXOjCMecvzcQU57K2DBWgU
	brNfl83BBZqjY1caWqSkWzqwW1LUfiMdLhyaxAOQUFID7d/KxQSegxPtYWKX8wkjgwtH
	jDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ueoAB/paKcs58RcwjsHu3YO3LLAazDrlmC1WJxcuo8s=;
	b=ug3TZzSLR8s7Jajh0SsuNK/K7IhfwQXmAgRfuQGvsqkBpiGjvenTd1A3P7Ds15YEAa
	PAZPCY3iv26iaSlElKcU7zkK+ApbaCr/vgEqFZt12kVJZfKYh/+aslCoSW/d0UmUkkWv
	TO2BLhu6bwnALo7EssDUWNTgWhv/WPttWbU4IZWWD/zkhidfs4gv5v2hr7NHxLLE1imn
	mZC4MAFK3MlOAiVQC4LRFJSt5dTrNcXTDKsj0WV+j2aP3F+ZF+vL+ISfDJzVZ9cUaB3I
	hmn7378B80POxPM4e24I2Q70G5JeASxrhRjX+laS2HrKEt3T6+EhV1J/beIgoOlByn2t
	pymA==
X-Gm-Message-State: APjAAAUAWAfATFmxmxEE+dtiqVgVm4GCN0s8A4CvVWUQofCYLZ0d2TYg
	p+j/PlQ2Y/zz/RdJPfNeptQ6rgIi/sk=
X-Google-Smtp-Source: APXvYqy63jJrC2BF0if+4amjAcNC0jvSMdKGOsZLeZIZlgAre+uY6M9J5kqh+iSNbhOZ+uInPdxkSA==
X-Received: by 2002:a62:7fcd:: with SMTP id
	a196mr96501981pfd.208.1578155194528; 
	Sat, 04 Jan 2020 08:26:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:04 -0800
Message-Id: <a8eba8a57045c2a2d69e3399e9a86ed15aaab3fd.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 23/29] python3: Upgrade 3.7.5 -> 3.7.6
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:33 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aee9beb12226abf7a195b8ee801ea488920b2fdb)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3_3.7.5.bb => python3_3.7.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.5.bb
rename to meta/recipes-devtools/python/python3_3.7.6.bb
index f6a1fc76e3..d3706cdf64 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -38,8 +38,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
-SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
+SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
+SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


