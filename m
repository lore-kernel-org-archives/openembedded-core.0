Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 939AC78236
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:09 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t3so1891024pgt.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qtLJ5cMHxYAiPrCMOkDDG/FuIkceQrbomshvLUy8R+c=;
	b=nk+MtEA62graNzPtsfCl9Ec7+rInEB4NfoJlPUKNNl3BWxdMzzHwsyyKnKwhq237i7
	uUNLxdH6/nUFV4xIyfn7tVOxq8G29wzcHL101V97Sq9sIKEaPLonpxMs8EyYYfOQhnqs
	KnQPEdUWV9hk48Utwvp3gtBkYriIIy8AWeOW936fa3ZIqnWsEwYQMSWZi4xuCvZ5LZ/x
	z1HJylv9OZd9c4w3dTsH0zacERjy/+4liyAe2uC4cYhiyDoNN69qFpkCAB35QUjgq78x
	X77VVQKLQXNABp8hprsXxcv38TiHPO8V8DfZCYwth3Z1JJ89W0iRc4JXrgvmATU5Gdn4
	vIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qtLJ5cMHxYAiPrCMOkDDG/FuIkceQrbomshvLUy8R+c=;
	b=YhD/uLzTErGptz4tFzpwEuVV4uxXSnF9cEfiMU33Y4lbEwVWCfhregPxkGcoJ1rqZR
	+R115Q+SXOFDzxeeLLOyckhrugQ/VrreVpEDfY8/rJfIBADAVJRtBJV5vaKa5Tn/2xNf
	/NNChDwFr0aTGXo6fiIqR6/OWqp2Jw8JtmB0se9BpfqgV49IxRkrs8ssSJ2gv3D5uEP4
	ZL+bFUuIQlqHA7d5uTivLI7AIPU2opADcxKYIo6witwus8gCPqCeGqLEa/SoCs5XlOwT
	lIQrBHW5cuuPI242EbNLzBhzP7soWlQV9eZ9akVtSTbX6pksLQKciSefrEdAZfvue8Tq
	OL0g==
X-Gm-Message-State: AHPjjUgyBeDhof5sWrwAfF8Wrvh4eos/No2Hm7n4UmHIvSX6KZxyJf+4
	gyaSaXSZbRraXaJB
X-Google-Smtp-Source: ADKCNb62JKDpBr1wC0r+vHh4J7FX9Z4ymattIx8lw6nQ4+diFjrkd6k/0pqOkfFlVyzI1gseUACdqg==
X-Received: by 10.98.70.90 with SMTP id t87mr4612928pfa.114.1504912930502;
	Fri, 08 Sep 2017 16:22:10 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:09 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:38 -0700
Message-Id: <1504912911-23120-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 02/15] kernel: Added bc-native as DEPENDS
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:09 -0000

From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

The makefile checks for bc during for compilation

[YOCTO #6781]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c067e52cffe002de3b39aa1bced308dd532859c1)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 58b0ec8..922752b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base kernel-module-split
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.9.1


