Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB4E7BD82
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:13 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id k64so17914492itb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A4FbUU2uyTbMefCDP7wNhpKHAW9/GA9BJVaZDS8shL8=;
	b=gaMJbsgBaLsPy46Kt8N6d7HSlLLLmhZdF2sOboDpOak8ba0WFywK0rVAkimLselYHd
	+EABUFfpLXPNegcXmXKczH0/WWff/sK7LNVqYl9Cm83Ogl7bgQhbEBgWNXj3dgVF7r+p
	NKOPKwRytqcJHRZ2pcsaiCs4I+41Z5InkjVpVIPJzoxNpXbjiha6wi9TS+p1Hca8KRdD
	fNHrCLdv2LlQ8T3UXjcSXdfVzewVKtLlDfdIFgxhsUVz6hhZkUejZqJ9bajnxTQp141/
	+P28J3KjdVxR98d83txkCnbbzzDcu605QCU7EdIEiI1CuoTQYS6ZD5Dao25L2UHszPac
	fh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A4FbUU2uyTbMefCDP7wNhpKHAW9/GA9BJVaZDS8shL8=;
	b=hirU2RyygeEQV/zU+mBc3J3jNerBILKM9WaLVnXs2Bb0IIkgXUUKN9pP20RZC3DzIB
	n/BaWX140jIiRv0LEFs11JChQf85vta838i7tyhuuvEXjLEfmkfdsYgP4SEGEj064FFL
	t4x6F8JYcc/Bg2b9TA8NlQj/+ZR6p/00oAwN/zXZUigvPorQQpRP93wSNpLLIEYDIAQ1
	i5q9kuPJgnL3zfK+1JN/SnmfIVn0UIBbRk40yghsmu5dpOimVj4AVkcuqNnvK7vzp0MD
	z+JbRMzvyglrgcFrUmDbCvlJUb6Xl6eUYhFmOReUMfQh6uDjxAcILo+ULdKPQ4Wj46UG
	7wrA==
X-Gm-Message-State: APjAAAXGqs3zo+oFD+GYq2w9AJ+E17QthgB2pZBokU5dxnjCrNdPGfeQ
	gqZC6OfLlr3Nmix/Loblq55lmHlF
X-Google-Smtp-Source: APXvYqyU+4Yme8c+IRh4oUmmFslrcktu8vc8CqViTSSO+qYeK+faGpEj/AQiF1jj7FTg7/Wwsx2P+w==
X-Received: by 2002:a24:4acd:: with SMTP id
	k196mr13262199itb.101.1555936934374; 
	Mon, 22 Apr 2019 05:42:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:58 -0600
Message-Id: <1555936919-19078-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 6/7] manual/bsp-qemu: remove connmand test done in runtime test
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
X-List-Received-Date: Mon, 22 Apr 2019 12:42:13 -0000

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


