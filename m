Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4572B7FC09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id w8so8840577plq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A4FbUU2uyTbMefCDP7wNhpKHAW9/GA9BJVaZDS8shL8=;
	b=HMPuWoYBqYnJS/B3MubUrdw4a6GL1Lrokw7JJu9dydFn6hLEquJ/ySLn9oYtxefYji
	G3juApDfw25QV4LYBYvmL5Djl1t7gk2loujiEMuAYPqQzgpin01SS+oWLQ4mGIOosJJ8
	nojs9Gvdgu8T/4QtHf9usXBhcvfZ9HrzYJzuezJedTeqIXdKrH3n3jZqaJpn0MEiSMYL
	NUq+EF47xRxeZfReiBgpe1BTFMZNA7Insfmq/juXv+AjAGkjU5dpkeWY9Rqe2wzc2O2t
	O9eY5p0LoF+0FWIgzN0HIxdjMrLHFi65WRATkOU9ihj234FYvMej07ag4L+MYLg5IPq+
	feGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A4FbUU2uyTbMefCDP7wNhpKHAW9/GA9BJVaZDS8shL8=;
	b=l3zWVry/q4SJDA0WAp0Vdev6m2NgaE5+tvxL1lm61lxjY+4qF/bOR5WH1Z7HKMZDCw
	YJ004lMSsPSlJHNbjgNDfZHn8LfNwhwp4t8DjoAl9vgfaGkHqRy4ffJIajldWDbwaPnb
	x1EkOenqi3n7e9mWVyadQaVOupy7ooL/9UtYT3sFMW1xkkvAS/9Vta51yFVpMpY7el9t
	845REOA7NRYyYT08tuwa/OYnfD55CaBvvscw5k7yB697FJ8guTqFWyzeQWzh5HhpL4aS
	OVXYsLk1B+afxZxmKiA/7Tp9rhUP9Qg9e87kZidpqWk3y3/LVsOqU2WsOiYg6cXF+cdF
	cBUA==
X-Gm-Message-State: APjAAAWelTx2qFxp5Mm2i6iVu7/7/DyRXuUbMDD6AnD5qnAfGPHvLMVs
	Om0JZMCINXepC7IAlmrZ6LmsO++w
X-Google-Smtp-Source: APXvYqwCO+MAzBhEFwG7sEPHpysByUeaplDJ3Z89TgL8UB7tBzL8E0QkP/VQWIqcBPWer72ykIdVLg==
X-Received: by 2002:a17:902:6b0c:: with SMTP id
	o12mr2346571plk.173.1573533232244; 
	Mon, 11 Nov 2019 20:33:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:30 -0800
Message-Id: <6ee2fe30c4ecf396ec79768d608bbbd22b99dbd2.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 11/20] manual/bsp-qemu: remove only_one_connmand_in_background test done at runtime
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:51 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index 7a3d994..5ec275c 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -61,36 +61,6 @@
   },
   {
     "test": {
-      "@alias": "bsps-qemu.bsps-runtime.only_one_connmand_in_background(auto)",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Boot system",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Run \"ps aux |grep connmand\" or \"ps -ef | grep connmand\" or \"ps | grep connmand\"",
-          "expected_results": "Connmand (connection manager, used to manage internet connections)  should be shown as an active process \n\n"
-        },
-        "3": {
-          "action": "Run command \"connmand\" to try to launch to a second connmand process",
-          "expected_results": ""
-        },
-        "4": {
-          "action": "Check, with \"ps\" connmand  if a second connmand can be generated ",
-          "expected_results": "There should be only one connmand process instance in background ."
-        }
-      },
-      "summary": "only_one_connmand_in_background"
-    }
-  },
-  {
-    "test": {
       "@alias": "bsps-qemu.bsps-runtime.check_bash_in_image",
       "author": [
         {
-- 
2.7.4


