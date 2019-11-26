Return-Path: <kergoth@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 26B6F7F7B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:06:54 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id cq11so8658903pjb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pFI9lwMSE/HC2RwKVYqxddx56N9zxfg9m+Rc7Iuzh1M=;
	b=lQlMEX2HLhGGU2x/F6piHrctutHP6Ydw0Qx6GbEvzQXhwUl/bQIXtzaulvzBvp2mEu
	JpcdqsLBpv7IWsKL+wG7wnIiYrEh4WKMXopbIb+8Ve5vXyEq65NiF1UFd+rogs06Sbhg
	1Z+1H0hBvwdNI6801jI3wfj0eAxXAZjuaeMJHx9bdTGjGH+amZKfWYdw1S33peiSenVl
	gwBj7+zW2aZkTHvrSRlTSOfT7pQHhZz31cD94AolJAW5zt6iYU7JJipm8mrYXzB/SSCR
	uMME/kGxSdri8WNGTQjTqdm23atcgJ+iYeHPXaXxQftr6kxhJQVuBnWT30/wJE93c8wl
	wqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pFI9lwMSE/HC2RwKVYqxddx56N9zxfg9m+Rc7Iuzh1M=;
	b=c3OH937VsusJrI6JKxHnU3Iqi7wDLX8h2BuGoFHqzGnG3HMPefWmTkgXFbqUYyj4EE
	MO4/lhhkxomLp/yeQm1eX3KqvuGWzpKSJv8luXSXW6kfLk5ExZk+B3RFG/vfbw+gLi/f
	GVVn5UWa7h9yW3JpRu191VDPNBrpedilIOQeZ47B02s9PNMCCc0g3dLYp0cxxD7b3I9k
	tfPD9x510JetzQTuwFbdMTv6Ca9g7RRz9FNBEWJJZKJvUaiLBIf9YEDd/aS4I73HbduC
	oSX0OcJl0DxYY63t5zSTZo7l6jDWl6jr/sPZEWlBvEr8dK197bC4GYXKBNl3aQWnIT9q
	b2lQ==
X-Gm-Message-State: APjAAAWBI1nEsLTgr/ljbzYQV+SwmX3+GirQ0syY6r9Ej4bAKv5GDPRN
	igr6FsXLlZmhi8gnhJfUtJShqCdavoM=
X-Google-Smtp-Source: APXvYqwwhcdA0DuTo+4s9ON3KR6K7QeNnkr6bVukEFf04Qbkg5hn+XWo1Fk60I9A/h5xkQlML9NORQ==
X-Received: by 2002:a17:90a:a405:: with SMTP id
	y5mr476251pjp.102.1574791614636; 
	Tue, 26 Nov 2019 10:06:54 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v15sm13171989pfe.44.2019.11.26.10.06.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Nov 2019 10:06:53 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 23:08:27 +0500
Message-Id: <20191126180829.25680-1-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/3] acpica: correct flex/bison deps, add explicit m4-native dep
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
X-List-Received-Date: Tue, 26 Nov 2019 18:06:54 -0000

From: Christopher Larson <chris_larson@mentor.com>

This project doesn't require target flex or bison, just the natives,
and it uses m4 explicitly in its configuration.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/acpica/acpica_20191018.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20191018.bb b/meta/recipes-extended/acpica/acpica_20191018.bb
index 4692275762b..04732bbfe3f 100644
--- a/meta/recipes-extended/acpica/acpica_20191018.bb
+++ b/meta/recipes-extended/acpica/acpica_20191018.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-DEPENDS = "bison flex bison-native"
+DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
 SRC_URI[md5sum] = "539a0252bcb42c383ceeaeb12ae9a60d"
-- 
2.11.1


