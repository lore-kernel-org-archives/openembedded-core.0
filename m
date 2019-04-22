Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 953B179D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:12 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id y10so17953358itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1ZS5bTvqUmIPCcR8gWRoaIPFdxRau7Mt0lJmV8WHbJo=;
	b=dmp8w1MFPnkMfHEGsIBgZSufZgC2WfVG8mPf48w561NDIin0uhXJk7Ug3moG3rv/K7
	oYF6fp1c19CCgKPZ0t1+MZag9Pq32pFxXFNDm+WfWwNt8CwDb9u4WYAr4j3cd302uTm2
	pgSrJ6je1xKLtfyX0r0QUyfqlD/9/u3N/1yCX5XKPtYi+iDB9afAwAKOpp6V4yP0Tl5V
	8F/OHGU8EdtDuIewdTaY5X0nBVR7M7v36L4oysoYnJKOoezzxsMjR3S/qrbfmYZSg3v4
	OHRygxGB2Pk11+MsJpezX+5BRqgDrMUyRIUa3Iwt3A6TY0A/pGCX/cyaTTfGMR48t/Go
	VVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1ZS5bTvqUmIPCcR8gWRoaIPFdxRau7Mt0lJmV8WHbJo=;
	b=pQ4ikIS45KcvAOsLv/eirbkRKVUHFx43IqtsgG4oszUtlDAInhZX0/9DEwXUaHflpu
	ve7lfD4G0jJojgsD5uVhswfqGye8PdtCI2FgtfZbMMM8QkzyIFNIlh2EiNNGg7GUkhsM
	u1s7VvJr7omNsyG45ocxJnsrGRe7jSPIFomxB+i7bkmArXNvdhvWGxfRxGxGoUSFT6DT
	DxsApTgpGGczHKk2ENnUyu0SKetKbP4hzf6+GDvF+GUEKPH/U/XF3pXEhbeGSHMb+2i6
	5NoQz9GQKf42ZY1vnKIo5il8soKD3JIPvkpSSby2Wxpd+ISgqfPqYmRmX9+iLtMLPZ1s
	9I7w==
X-Gm-Message-State: APjAAAUXyt5rEJg1L2AEju8X/b9/VfDvGFINH5bxRxaGOimjAco2Zf6Z
	3JjsdPaKitirQghj7HdbRf5M/zZN
X-Google-Smtp-Source: APXvYqzrEkRDKLvihDV/fURxTAwkglQBLs25jMgp6kDIKAR17mDVzEp9m7jz09QVxE/c8PG12msocA==
X-Received: by 2002:a05:6638:3b0:: with SMTP id
	z16mr13546085jap.131.1555936933560; 
	Mon, 22 Apr 2019 05:42:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:57 -0600
Message-Id: <1555936919-19078-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 5/7] manual/bsp-qemu: drop xserver test
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


