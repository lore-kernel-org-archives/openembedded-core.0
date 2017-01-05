Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85E4571B29
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:38 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 3so51661997oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tF5iIFHguacQlUSMo+tH6HqIy+TCINmKqmNI3ZwDlyo=;
	b=Ff8aJp/RxZ8VQ9NgJQu4j3xOHcn0tf/zIMemDjEzQ+hKkyry+4s177mJhGyUcOOh49
	5YJ5ardOSANuvN1Mka3iVcx3qqOTJ7My5rNQFmyBgpdM/KP5tuvYSXE4oggEj1e+Ti9E
	503wnZLl9fFou1adelMYZkmKG6ply/y4qhVvhOvAUEU/GxbXOliYnw9aReRK7g62BUjY
	zwucKtAec7E64IbEDdUTcz1aDCHZywMJSZMunjTGNLU1guu5ome2JsQ7s4UsRmP8IjFX
	MGfCLdBFxyAUAN4LWVgUZdJ3ncZtHvhvHzRRv4l79GdCO0gjQKzznILDieNHo0XuxtoV
	jjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tF5iIFHguacQlUSMo+tH6HqIy+TCINmKqmNI3ZwDlyo=;
	b=jZW9kgBVQh1V5uIfES0rbisexKJbahdeAa+yU0xXPqo6Ng4qA6RKnv5kj9amR6d2zs
	1Y1e1o0V1+jJK38Rjw/eSkPeH7Dt6S8X3bLIBfQKaSc4zKb6btwWoRFSUwBq/ATRgbU/
	bPQXiSuhvLsAlkJN0dkGng8RgOqnik60rzfOZlREkE+xiSwZW9G2V/G/ixubyawifcXr
	NKfuzZsZyXrbx5fKQnPO0r1Z6zru+uj0+J1WgJj4HO2+JZww09he58i2y3AUU9bQiJHR
	BmkvL+oH8/JsX/ViW54UcOFCPPnj/bRhxRU6OJnyytyrFamu/BjI5JAtTOPtTE8l8OHB
	KE9Q==
X-Gm-Message-State: AIkVDXJiKPtzKiokFAQgYNJVrOhgQBe4rupIKtCnkeYfdvRWXP2ab7eVfsg25kmCMx4OmQ==
X-Received: by 10.157.33.46 with SMTP id i43mr31544517otb.220.1483645598756;
	Thu, 05 Jan 2017 11:46:38 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:37 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:17 -0700
Message-Id: <f776bb458e8570ec6f6c9fff1dada3ecd7a36090.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 05/16] gnu-efi: build 64-bit for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

We're targeting the x86_64 EFI ABI.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
index 9ddc4ba..e55ab7f 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
@@ -52,3 +52,12 @@ BBCLASSEXTEND = "native"
 # CFLAGS += -mno-mmx -mno-sse
 # So also remove -mfpmath=sse from TUNE_CCARGS
 TUNE_CCARGS_remove = "-mfpmath=sse"
+
+python () {
+    ccargs = d.getVar('TUNE_CCARGS', True).split()
+    if '-mx32' in ccargs:
+        # use x86_64 EFI ABI
+        ccargs.remove('-mx32')
+        ccargs.append('-m64')
+        d.setVar('TUNE_CCARGS', ' '.join(ccargs))
+}
-- 
2.8.0


