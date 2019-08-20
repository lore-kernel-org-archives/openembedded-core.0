Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id AB4DE7E996
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so3058777wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=InP3ITPvbdzEJW+CWnm53y532f3JjHMN37BtMKHBFeY=;
	b=JUdp+3FsOE+/5uqKgfqiGAcs4Ijcro4qkxwpIzZwUJ7nK92BMkXQ/g73o8yWcUaoRx
	ZMSxQxR7vQQX8uANZW6YGd4ZOFcS0IUysbeuL/DWiltK1Fb2+pfMZGS4deieLfk+WM/o
	ITqvyraG0GsVXqCg3rS8+tlwjCchouLQMmhAzLyII/vTNn7SIcWVXHECq0zp3u4x5v3K
	/aXZZ0nRaioiSu+w+WUF0UaWWjMLuE6jmCms3Z/GMszuT2wwckTjIvb1z7bMOwOMA6/E
	PNXW6nDKGYuCcYlSTzb4xTgkiFaJp46R6Lcp2dn1Xodfoql1ZTgSb7sGe1lRLK18+qg9
	s/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=InP3ITPvbdzEJW+CWnm53y532f3JjHMN37BtMKHBFeY=;
	b=DQXXrBftkDt72WOfUXefO37h2g/KnQz/0BlyxaU9f6vig40K08URLMK76N/8QFl3Rw
	WafM7JySU7FyElVrYkizAIwov2HEkcNXu5j1k21WLxcsNex2FurDYvChfy/3qLQj78ts
	WjIfUnT83pEHRYaERjne8mGtL2wDF4dm/pc59Eih2AMyCtG7SWeT0ARRz5FbsmnwcAxU
	fz/oCwqSXMWONTTP4a4C/oHBG/IW6YnkQiFyHT+DUZP5pYyU30vGLiHX0gt0waFO8C1G
	SrulNWVLe8UJqHJ9ppJ4BObHZ4rC0TYTPyd9ORli8jJC7gxegZpqdkGQgrddga78KmPH
	rbPQ==
X-Gm-Message-State: APjAAAVBzLvmKdGjgsxd8NF4+punSz+lcK+nv8i9E4w7zQv7zecXyLR2
	hJbdbxL4IJ0w6WWsJ83Xp5uO8Cqo0X0=
X-Google-Smtp-Source: APXvYqw+0LzHviNctWHmB7lZQhb1TwEjtKhueXD9G08Um9dUBntRGsUvIWFyaiVupaMQHl5tUfj+SA==
X-Received: by 2002:a1c:3d03:: with SMTP id k3mr654135wma.138.1566315150071;
	Tue, 20 Aug 2019 08:32:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:12 +0200
Message-Id: <20190820153219.62435-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/12] rt-tests: exclude another development version
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 84a8f67bd45..227eb99b98d 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -3,8 +3,8 @@ SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
-# 1.2 and 1.3 and 1.4 seem to be development versions
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.2)(?!1\.3)(?!1\.4)(\d+(\.\d+)+))"
+# 1.2 to 1.5 seem to be development versions
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-5])(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


