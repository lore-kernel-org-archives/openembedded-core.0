Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 87BDA6C5D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 10:48:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n190so6598074wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 02:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EDSdYnbwREY70MOtOemk9fS694lCRQ45ktjQ3ZSLx7M=;
	b=Lr7bVU7VuKH0b7Dmrn8XcW/tFnXxPGua9vs8nNhvCaBCdJycz/xlWx9Bcni+ieAXrz
	dDUKdDS+poI9YyFazKCLj29WmNlf7phOJbzVnwOHKKjfqTE7CUtMs/2nCqsGHKHS8Nuk
	ty1Sy5qT0IgxN2CxOf+K3O44W7Wtsyq7+yfjhg8kIQWd/OR5Yzsvwp+HecWOS/LXL2SJ
	fiRM43fUohhq0LcydHmA7x6ymUZJrOmqyy0ge3U3BsPN2Ch7wLnjP4bO9dR+zAqFSJ1E
	R/TfXMzzLKCA128z4p0Gs5iDeFwy+y+CsL9ENpBGtufappXPWsZGphVxS5FENLjjGxl5
	AiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EDSdYnbwREY70MOtOemk9fS694lCRQ45ktjQ3ZSLx7M=;
	b=ZqyfOiquMceuRuU0PYBSwe9RyyG+nhxSwgVmyUbMulRW0ylLeU8Jb3+HFoVu6+wkY2
	NCytcWAVxeWL2WXh5X5AK0gxV2gtRlevs18y4OFsWiduHl9BIoypB1ySpYzElWdfbx/z
	DUaPgYQAVjF+7ZDsUHQx93UkvOX7hgclgkAg2RJMqxpVNpVxuEADrxgocBO1+xJgzA+O
	wn3NM1CMxMwHym+gkNGKgVvBFT6TFXVNlYl/AdcLl0WvLBVObaXm/2Uf8ijE92apoL/J
	WmzYVNmPjD6iUWyYFLEUuZQhd06G20BWTXc5WkOXei6UxWpNXiaNjxHKUlP4fxl3ZAqY
	JdbA==
X-Gm-Message-State: AA+aEWZ3uzAxgcpDtvkcZZZupzdVvpgsW+idShT/RHEMningIaAY12R7
	d4t7cZ/mZ8rrXNpPkOm1XOyeIt98
X-Google-Smtp-Source: AFSGD/VmRtL9euOlbRjn3itw3G4v5knQ0IhLm9d4SlqQCuaO1u2PSZHBN5cp5lPZRs/rDtePytImfg==
X-Received: by 2002:a1c:7616:: with SMTP id r22mr11760534wmc.35.1543920532887; 
	Tue, 04 Dec 2018 02:48:52 -0800 (PST)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	v5sm21541265wrn.71.2018.12.04.02.48.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Dec 2018 02:48:52 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2018 10:48:48 +0000
Message-Id: <1543920528-21433-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-docutils: Fix shebang path to point at python3
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
X-List-Received-Date: Tue, 04 Dec 2018 10:48:52 -0000

By default we get a shebang path pointing at python; when building the
python3 version, ensure we use python3.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/python/python3-docutils_0.14.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.14.bb b/meta/recipes-devtools/python/python3-docutils_0.14.bb
index 81a449d64604..a2880a9601d7 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.14.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.14.bb
@@ -14,5 +14,8 @@ S = "${WORKDIR}/docutils-${PV}"
 
 inherit distutils3
 
-BBCLASSEXTEND = "native"
+do_install_append() {
+    sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' ${D}${bindir}/*
+}
 
+BBCLASSEXTEND = "native"
-- 
2.7.4


