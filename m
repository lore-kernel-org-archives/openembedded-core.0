Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF977FC09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:50 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id b19so128469pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1ZS5bTvqUmIPCcR8gWRoaIPFdxRau7Mt0lJmV8WHbJo=;
	b=CPlTWdnXdv5nz+bykuunxAiey5/u9pbfyaCo35mOVBqeaaaS502TXmb92/DS6q7UF3
	wJoYHKHMOHBUrjuo8KAbLseRlGATB7JvoE6K1K/yDAVuvJXTaPgT89LQ7SYwJTsuTyXM
	8dpXNe7d5yUcW2SBGDmPk+LV2hyIhzgX9t35iSR+Uj4M3heUhIIovJInWSqSbjbQuGKM
	PhtdvYfqXhec84ykIt374BUL7WKCUJ4vkbn96oSLlxnXKuu9gosx3g4sSZAH+OSRCT9Y
	GpuCBgfdejRkFdh5w6wZDuThzsre4sV6mt7ZI+0J3CDlNHsOm6SvIKbqqU3R3VM/fE1B
	0LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1ZS5bTvqUmIPCcR8gWRoaIPFdxRau7Mt0lJmV8WHbJo=;
	b=ndypFMTn31pjQtzcfPjDiKLKRF0YGZmHwP4QslXIe6uSL1ilNtFk71SHw6a36dsUEV
	cBwxT0gkNfnCrHgHzbunEUqKuQJr1qMRRAUZ8s8xcW3MeFncmyujHEdQ+xyMPOiQLgRm
	Nfp70vm6uNC0eWisyKkTbQUx/zk/c6IQ6Gz/CimMzYU5Dn2aCkoYKwqrZWZhJUCjIsb7
	4iq1vrvJAcffYmrrxyh0DbyIQe5G+EvsJgQHDdHnYE6Vncsv8Vb2yn/Xfw3xwTsGrZuQ
	pBnIj3QnC7qGurkjCgynWjNpPwL4xAXhu+OPe71cA6FrVNHUSV7kh+PN2TCuDStlLPfM
	iW6A==
X-Gm-Message-State: APjAAAUwYt9HPCMceJI9Y6rkSKnm3mHwuWjxggp+SXoIX2PvZLs6Apl1
	JmxbD3hDlMDbgoAwIR+TWXBKkXE3
X-Google-Smtp-Source: APXvYqy62n0ONIPqL65OkeeAa1qyWZ6KN/f4Nbjy+CtSQESDz2pU2pLQhfZ/cttjWvxrFWC8JHlWiw==
X-Received: by 2002:aa7:9787:: with SMTP id o7mr34487389pfp.120.1573533231490; 
	Mon, 11 Nov 2019 20:33:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:29 -0800
Message-Id: <85d04759c7971714b10ef632425779bae02b83ae.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 10/20] manual/bsp-qemu: drop xserver test done at runtime
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:50 -0000

xserver testing is done at runtime and selftest via sato image

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index b49abf4..7a3d994 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -91,28 +91,6 @@
   },
   {
     "test": {
-      "@alias": "bsps-qemu.bsps-runtime.X_server_can_start_up_with_runlevel_5_boot",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "boot up system with default runlevel  \n\n",
-          "expected_results": "X server can start up well and desktop display has no problem .  \n\n"
-        },
-        "2": {
-          "action": "type runlevel at command prompt",
-          "expected_results": "Output:N 5"
-        }
-      },
-      "summary": "X_server_can_start_up_with_runlevel_5_boot"
-    }
-  },
-  {
-    "test": {
       "@alias": "bsps-qemu.bsps-runtime.check_bash_in_image",
       "author": [
         {
-- 
2.7.4


