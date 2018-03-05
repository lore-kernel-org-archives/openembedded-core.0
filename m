Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B752F71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t6so17113139wmt.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Fq7+Z6ZGwvpkqpbXQzwx2L8m+JNWaqh89yd8yMWU9wI=;
	b=WeO50Btt6LNzHiRjKsDnrF9dJFT5KLu8d7+UqKgQmLqIxVoiMbI0RCtNcWgEIobXeg
	MN/+ha6GZiAYNk046Qc0tn9jC4nY2inDJ0KslKXwpWVAI9/vhL9111XCLBKEDDpVYmaR
	mX7SVX7FAuZYMU8ri9obtqYR9khCRiT1l5fJ/rFCFvLS8KbUGVq4qzIg1eqk5VX1SDUA
	Ji8/FY7Nqi23ec2P63tWkFSdyceBZeL82HvzRSsKnnwWosSUc9J475uEoxdaQqOtwrn1
	MJT9AYF+cUw81GaDtnpEZw2YFxFO2IOwGa0sLd6L4kSHp+g3BXB/K1lL68Gf/nN8EkX7
	BO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Fq7+Z6ZGwvpkqpbXQzwx2L8m+JNWaqh89yd8yMWU9wI=;
	b=ISrCJzjcd+ViYQkhfgpwavbQSdMvwnG+wQfRb8t868peQiAkqhVK4LCxYIAPFzoD+c
	7Z7opmheQxEIC6hJOt2AGaj1f1ehrz/I5oW1bOFC7KAZ1znnEHRTUmvNpLPLp38Pk5FD
	DDHRoXC7qQCsn7ywk7Wt/S1YfUBxkDPYdqzQjDzXMYu4a5l0ddfigQe7okhbISirHrXC
	7BwLNYZqUhlclVUuiyOKLELsAJE5dNk8lWk4gDwizjUkO97YP1Rb2yIkoCl6xvufFN03
	fIYJS36pJIdhJH1scrRnLkokR98kadGMQraW4SDKwBuyBIk/UHILp9Mp6RcxxbC+kx72
	LR9Q==
X-Gm-Message-State: AElRT7EyqeOLkSqHlzu+9aQIy5Z2qh7HCaVd2e6bGAssXiQdHoH0+pZD
	NPtJTVXbEPrTwt4mFHLSc8n0vAL7
X-Google-Smtp-Source: AG47ELs7QvHbzPN0qzUpCP2oAj6PRQ5RIH3yMs2OEgY9Ln+NXplkkSwqUhGrjtLwSbmwxRHzaZVq0g==
X-Received: by 10.28.114.6 with SMTP id n6mr8838632wmc.70.1520270468724;
	Mon, 05 Mar 2018 09:21:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:34 +0000
Message-Id: <20180305172046.21729-17-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 17/29] btrfs-tools: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Makefile-build-mktables-using-native-gcc.patch | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
index a81900ee7e7..467de327515 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
@@ -12,19 +12,16 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index b3e2b63..347aaf1 100644
---- a/Makefile
-+++ b/Makefile
-@@ -323,7 +323,7 @@ version.h: version.sh version.h.in configure.ac
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -343,7 +343,7 @@ version.h: version.sh version.h.in confi
  
  mktables: kernel-lib/mktables.c
  	@echo "    [CC]     $@"
 -	$(Q)$(CC) $(CFLAGS) $< -o $@
 +	$(Q)$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
  
- kernel-lib/tables.c: mktables
- 	@echo "    [TABLE]  $@"
--- 
-2.13.2
-
+ # the target can be regenerated manually using mktables, but a local copy is
+ # kept so the build process is simpler
-- 
2.11.0


