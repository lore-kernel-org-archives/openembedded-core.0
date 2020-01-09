Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id C9A167FE9A
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:15 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q10so2740344pfs.6
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ueoAB/paKcs58RcwjsHu3YO3LLAazDrlmC1WJxcuo8s=;
	b=DmpJJIV+ctUTTrz4GqNK6oFMcep2Ae1oxN0C5mZ2uSdLrzIus5A2Fc+1fArKWuOvMy
	26BdmdF3Y0svfAVaCV9tMOr6NloUvWKK0OB3cDmABt4ZAMD4TU4vblJD/bQVlpkdKnsW
	oerOeOypcKRnbARjkG0PZpW7gqPppLJoV3F+HZxRF65fJ3A8HHP8+/cbGhWI4s8YiIM2
	l680tL4GxoN2JW4CsxhpH844I10d3q8S5FUinDcTO544nyeokxIw/Gjv9iHPw3xGhLRM
	9C7IbGM1E+ut4KU4fHZBZ6bjeNIdfJWV666sBXWfrSJduIj4+rTG1C1c2quSi6ldgE6B
	j34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ueoAB/paKcs58RcwjsHu3YO3LLAazDrlmC1WJxcuo8s=;
	b=Zjp9RAPeYF6+QIi0HT+/7T9rcV3bM4QZLLgdsp3Gd4op9/K/QV0PwwF7vMOe3Itak5
	WSljJxfQ/hX9VxwOuyxNAr7B9bPdO1Sog/cBt6EomG2JalkchiXqsZHGn/+Cj7N43B9D
	O0DfPliKyl536Ebbzi8q7ltY/ukZVUtMgWtNGOJAbRiyPWTqFxJRf762AnCXRSL+X22/
	KCxJ6FdgbsQbG2EzcrhLvSo718C924J5f8FU163p/KO7A34CPzrSAxIrdEUCdDowC/Ur
	m86HmyE/UVxUdmpRDvWxy4fxwv3Tq4d8AblwbXoNgifsnT4bmXeBsVIibQiONUSpv/Ip
	mJ3w==
X-Gm-Message-State: APjAAAXydf/PLDMjM++H1n1J9HYNsnkoFkgCLNWmMJAL/VrMqIDgJYEr
	vh5fVMXbSHpwW3uHcZAkwbM19c/C
X-Google-Smtp-Source: APXvYqz52UbpmXNvCN1Pvans9P8zxnlLZc6QjQyYd+l1tfKScdrLf5R74wMUce1pXlg/OVtailRYNQ==
X-Received: by 2002:a62:3086:: with SMTP id w128mr8926199pfw.58.1578545416883; 
	Wed, 08 Jan 2020 20:50:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.16
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:42 -0800
Message-Id: <b8926f3898fbf6828b908d741ab3b450adb85643.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 23/28] python3: Upgrade 3.7.5 -> 3.7.6
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:16 -0000

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


