Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B60467F33B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 11:21:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so1466579wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GLdLXfTX/5vrGz1r6crt4bgjyu4hnEN2tWUVSegWNKI=;
	b=mNHZBkwZVK1S+MIhh4jpENCMJigZzxl4ceK2UfsgsXRsv0qb80Mq+NM5nSZCm4HpqQ
	k992qG5gZC7gbyeYm0oF7lSfaVrtSurT2lM4GIRAfePXGXtnCWPKYkXeg9TsSSW6O4mL
	Di6L933ZBnmguQEhRJ1k6DS4wmEUPjUeo1073FYRlD6D8058bjR6HVSonF9hkDdZszE8
	X+35/HGO+3LzSiUaSdmRlJYnH7oJMH5xu9IWBnCmjM1IlxE2XUFjRJ0fYjkX4/MLqJx3
	VQi52LzmF20R3pYC0xzUVBGZ2JOaL4wUG2z27b2pu3Uo1Ev2kuaKwpoRqWLr6X7L40Zn
	eetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GLdLXfTX/5vrGz1r6crt4bgjyu4hnEN2tWUVSegWNKI=;
	b=PPYUKlofEUGxX94mYPySpFTsTLf654gfrNvdFY0/O43foVCbyJnyTL8rNDcCi894Lt
	Tu0mxvJJ9jMHOXwAlpbhDU+3DjPD1swxRsyLXwrYcY7w3Rwhua4ySqeS3qj42DKvznrN
	AVGrl1VcrVaV0C5+vAY2V0joTMsLFt18+QFR3fJ7d70a4Y+7wGvg9GQDHc3Y9Df5RdLg
	LWvdKXhR8BhFWtqgi9/Kd5zDlQ0H3EBdy4WjUyDdrWqtRnfqXx/61GmEZrwe03S/UT+f
	7324e+wE6dtzYZKvRUMahYadKFDYVKsxCIgI7nHsJRQUo2onVg+aSn5PVIfSKgj4jTEv
	LIpw==
X-Gm-Message-State: APjAAAVJsDKWibB4+1eH7W0ULQLf9t28jF6Hr1HncjSIcPBnPBbbBysK
	eHybiZ9rVWVp5OOjkKVH6dt8ZMsb
X-Google-Smtp-Source: APXvYqyY1qpR0Ug7S+V4kGObn83YFPHdPfuBDamiz/B6MujglDafuPbARQfZMpBDMNaBWRFDoHckUg==
X-Received: by 2002:a05:600c:2101:: with SMTP id
	u1mr14033365wml.43.1575372120241; 
	Tue, 03 Dec 2019 03:22:00 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	u14sm3112508wrm.51.2019.12.03.03.21.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 03:21:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Dec 2019 12:21:55 +0100
Message-Id: <20191203112155.107442-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] piglist: update to latest revision
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
X-List-Received-Date: Tue, 03 Dec 2019 11:22:00 -0000

This is needed in particular to un-break builds against python 3.8.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 696d438c5a8..a95bb5ab937 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "0d1a47a4c10d4dd7225bd6510f8191684b31235e"
+SRCREV = "068581c29c95fe2681023e12745007dd17b38ce5"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.17.1


