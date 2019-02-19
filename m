Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id C985B7C9D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id t15so3646080wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=krp84JAdO4E23zcMCfhtNdM9F5dSGqVeHP1g8XBldbU=;
	b=AXLjn3HXAHkMcZGRu+pPvD8yPDxJKxu6SxgD/lTMi2sP6lVNvp+UioHKkGvemonzo8
	H9Nch/xtkSgnyvvb4BZGgs8tE6+/CWm1JNaBiHEoJh2oejuyy/iIHnz9v5w+fycN95qG
	1obDuUsUWrG9MzV1/k/3NrABkDLvJgSY79DW10cjlYofkwfb2TIWx6YpSNcn0/0pWzIh
	vLBAT0HvexwZczFznBzWi0EQuayLc99FNCUo98cr6Y/3b5XFtMfvtCU4XN7qD0/ZXrH7
	1v12lsw2bS6q78YdIPIBJE2QTqYZdbCgfuK2EAVV3QFFew0PTK8hzxdcraGFqZ1MTfDF
	2R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=krp84JAdO4E23zcMCfhtNdM9F5dSGqVeHP1g8XBldbU=;
	b=dYATe29/mbGckTwNh/PceGXVX9Uizss6jraxX9cBWd3lx0H1FtOl5TFAsAzIU32Xtu
	h6W7C9WPXdBgbiK///vcjH4eI+N+5AEwHgfrlqwxNHhzJQXOM3Bh+DviJMzpXff5hqiA
	mGL4KtV15xLoRnk7TYKAVF9MenAE4aymZ6UQzMVT7KhxFiPgLdIPs9iAyvcfr63AdozA
	kA8WAdS7lKDpJTbtnVDtWdUzcbElecak0DmRHVzrTfyeDc6EQXXDvl95RfVtYo1ufoy0
	tBk5AzbduaghCT8KRNLAhmLrB3S9gIH6Qz8qga3O3ZjmnQGcIgjurvaopO6oje59KFkZ
	N59A==
X-Gm-Message-State: AHQUAuYyj4WrNuH+syCnukB03e0yeMse5odPAcnqG56ZqJOfXhLgWvDU
	2lra3/tEHGyV3H6jpGE6Ge1U9QST
X-Google-Smtp-Source: AHgI3Ia7ALf52Wot5TYZtJ8FZMcREAL8Qj0Fkk8KYGvgPIDUy1sHXPDG1iuX4A3q0C2vsDZl3qLYcw==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr3499384wmk.47.1550598455236;
	Tue, 19 Feb 2019 09:47:35 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:06 +0100
Message-Id: <20190219174712.60694-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/20] librepo: upgrade 1.9.3 -> 1.9.4
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:35 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.9.3.bb => librepo_1.9.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.9.3.bb => librepo_1.9.4.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.9.3.bb b/meta/recipes-devtools/librepo/librepo_1.9.4.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.9.3.bb
rename to meta/recipes-devtools/librepo/librepo_1.9.4.bb
index abfed798f35..c4d6c163e9b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.9.3.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.9.4.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "f1212bd4a55467ab8578c87f98ed363cccd5907a"
+SRCREV = "928c2d9c66f0d10477b8c9d1192785b88e2b1155"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


