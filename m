Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id C33897F820
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:43 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id p24so1902000pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6rb/J/AEYQhuTLPYkxMkPGBjGOBNYO33YGlscNFOcyc=;
	b=ac1cRpSVVNz8VIj8AmYnhiYl73JbzdgrcJl+8ZdWmkKMlegUF1atxaGzK1zoE+Y31y
	pHVRALsTWJQujnH2AJuVTqmVnuMUBratmk8RMlIOvFg35WEGxjgFWNakVdvU6E9f3uME
	ZL/IH+tu5PCrIq1A2FHxGdy2klmD7BOIHyWyF2u1nb06LVA4CWsUCFSLYwo2n3PEvMnz
	8mv9OHxTcZgGCtJ68SrGVBXcXrVVQYT/zUyaCmAfkdKdYbUv6WkU/4XfehOZJ7vKfZOW
	gN/SFsBmSTt34AUqsJWxHHM4s9XHwHW3MbBBaQfFSkLF3m090ln58aVRzjiPaoj0LAO9
	v+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6rb/J/AEYQhuTLPYkxMkPGBjGOBNYO33YGlscNFOcyc=;
	b=YLECKk2iDu6y8lXtMvBniGQt8hePUm0bIO4ZF60mD3oSflQ2bXzt+3DjkzlhtHh7kY
	1aFA9f2vIHrCF0tySpg5RsePrIleZtRiYX3ekxaak8XlCkVIFwo3ewixGtBtPVb/dPAc
	TPCQXzkI/It5WxXO7feHZtUOjJ6ySMrJhzEH6hWW5erUQZi5UUVnx527LeTyEwo4egis
	FX5R4XlZCVIgZddvbg0W1ycTpFcuwmsbhs51PKQ1RHOFpi+v6F56uYTQKSoCV1WWhEmD
	EcqzklIYQ2o7ou77maCNolT71UwZyM4tViYZSI54RtHpzBylbMq38fkaOm4jVKeT+S9O
	f98Q==
X-Gm-Message-State: APjAAAX2f0eia5BHaTJLdY9PKvR6P0yH+szTzOsxkZeysIIVUqUu9/kC
	sR86GrgPglNdxMPEophh6VxsjE7p
X-Google-Smtp-Source: APXvYqy7C/Q/91s0l6/TPCMR4fVj7d6N0Kcr5jIfbMlATefUP+WJK1yz1LwfRzSuPJr+0UA0RUBpyA==
X-Received: by 2002:a17:90a:2942:: with SMTP id
	x2mr5750016pjf.119.1573659164367; 
	Wed, 13 Nov 2019 07:32:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:01 -0800
Message-Id: <a1d9cfef7f247d616cd6ca482916ad0469e4fc58.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 19/31] qemu-helper-native: showing help shouldn't be an error
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:44 -0000

From: Ross Burton <ross.burton@intel.com>

Displaying a help message if help was requested isn't an error.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu-helper/tunctl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c b/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
index fc00e99..d745dd0 100644
--- a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
+++ b/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
@@ -19,7 +19,7 @@
 #define TUNSETGROUP   _IOW('T', 206, int)
 #endif
 
-static void Usage(char *name)
+static void Usage(char *name, int status)
 {
   fprintf(stderr, "Create: %s [-b] [-u owner] [-g group] [-t device-name] "
 	  "[-f tun-clone-device]\n", name);
@@ -28,7 +28,7 @@ static void Usage(char *name)
   fprintf(stderr, "The default tun clone device is /dev/net/tun - some systems"
 	  " use\n/dev/misc/net/tun instead\n\n");
   fprintf(stderr, "-b will result in brief output (just the device name)\n");
-  exit(1);
+  exit(status);
 }
 
 int main(int argc, char **argv)
@@ -63,7 +63,7 @@ int main(int argc, char **argv)
 	if(*end != '\0'){
 	  fprintf(stderr, "'%s' is neither a username nor a numeric uid.\n",
 		  optarg);
-	  Usage(name);
+	  Usage(name, 1);
 	}
         break;
       case 'g':
@@ -76,7 +76,7 @@ int main(int argc, char **argv)
 	if(*end != '\0'){
 	  fprintf(stderr, "'%s' is neither a groupname nor a numeric group.\n",
 		  optarg);
-	  Usage(name);
+	  Usage(name, 1);
 	}
         break;
 
@@ -84,8 +84,10 @@ int main(int argc, char **argv)
         tun = optarg;
         break;
       case 'h':
+        Usage(name, 0);
+        break;
       default:
-        Usage(name);
+        Usage(name, 1);
     }
   }
 
@@ -93,7 +95,7 @@ int main(int argc, char **argv)
   argc -= optind;
 
   if(argc > 0)
-    Usage(name);
+    Usage(name, 1);
 
   if((tap_fd = open(file, O_RDWR)) < 0){
     fprintf(stderr, "Failed to open '%s' : ", file);
-- 
2.7.4


