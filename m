Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 330B57F93B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:55 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h27so11009277pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aPgqfFQ0hseRBlnhYYvREF9jSYv1jOuxPW16scYMLWQ=;
	b=iU4nmOCZpvI0zLULCd27c6l/Hc6/EDPoGbAUEKy70pjH8wI+6gTjsQYZeVJjIeEIQE
	2xImWp5sIKHB971dSNebaadBzxmuv2Muxa/EgzP53C7Qg8fSJ/2UrTrcaqaU81ewc7l8
	I+22R1iybiRidn8oVclZLS0JB07Vj5wV7k8TLm7ymBkWeVJ8wUX8UiUbn8brld9Zjot1
	cxcDunlhvP6c3WRu3/jimyL8/y5c6qdZPD9O4+m0PtGpxez18nMcEF7OC94WGS9Zdedv
	dV5QJ0ssey2yBonO9cLaHQzEQf01hqddVz9ujc3JNjWnyFdPU5tDA+sCFqpWCqK7dqJv
	oPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aPgqfFQ0hseRBlnhYYvREF9jSYv1jOuxPW16scYMLWQ=;
	b=a4gCb2Jjz6Y17C1df3ZXUhyRACKkKat1Th2zfetACsr616N5XAHCMzwlEzSGxo8j6t
	2EsZXDVBD3PcXJcAEwcpU/q9seFQ0NM/5DiutvmfjXcJhWZKXgiee1hZqbp9TK6APAm1
	6EhWAW4KKOql5A5wH8/J115NJNUFwocFvSlNH8Ara/SqHG+QVeRLd0iUUvypoglLNv/+
	yr3wkZQMJJKpFkxtSKNSqbOqnIx3CDkVybk7ApUi8Q+gWepcw1XDYf0bbpYpvVhIjvRm
	m4k6wbl4krm4Kiatc5pj4OWvnIT5I7A7bpvBLVTkP4VIbMEB3JZtt1GV0ltZq3B4Slib
	/n7g==
X-Gm-Message-State: APjAAAUnZpQ07tNQeKwhWuzz9HgGx7DqZKxxNyWzl/ZC7GbqIrA86Kk7
	X3RmZy9RhR6l8uIxmEFLGUYQ6qxL
X-Google-Smtp-Source: APXvYqyA1r5Nj040xurOJEQ/X8CAQmNHLux8j6/4r21St7Na7cUsrTb7PK+ScHoBhyQJqwJXJfEwJw==
X-Received: by 2002:a62:7a85:: with SMTP id v127mr619471pfc.141.1573533236046; 
	Mon, 11 Nov 2019 20:33:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:35 -0800
Message-Id: <7eab462b4d6efcb57dc8ce088299b9372df0458c.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 16/20] OEQA: remove manual useradd test
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:55 -0000

useradd tested is done via:
test_non_root_user_can_connect_via_ssh_without_password and
test_non_root_user_can_connect_via_ssh_without_password

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta/lib/oeqa/manual/bsp-qemu.json

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
deleted file mode 100644
index b19bf4b..0000000
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ /dev/null
@@ -1,28 +0,0 @@
-[
-  {
-    "test": {
-      "@alias": "bsps-qemu.bsps-tools.Add_user_with_cleartext_type_password_during_filesystem_construction",
-      "author": [
-        {
-          "email": "ke.zou@windriver.com",
-          "name": "ke.zou@windriver.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Download the poky source and set the environment  \n\n",
-          "expected_results": "No error during image building procedure. \n"
-        },
-        "2": {
-          "action": "Add the following lines in conf/local.conf  \n\nINHERIT += \"extrausers\"  \n\nEXTRA_USERS_PARAMS = \"\\ \nuseradd -s /bin/sh -P 'tester3' tester3;\\ \n\"  \n\nThe above settings do the following things: \na. Add a user tester3 with cleartext password 'tester3' ",
-          "expected_results": "Image can boot up \n"
-        },
-        "3": {
-          "action": "Build the image\n ",
-          "expected_results": "Login with user name \"tester3\" and password \"tester3\" "
-        }
-      },
-      "summary": "Add_user_with_cleartext_type_password_during_filesystem_construction"
-    }
-  },
-]
-- 
2.7.4


