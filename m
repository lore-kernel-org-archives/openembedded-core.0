Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD157FAB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:16 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id z24so9961518pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6rb/J/AEYQhuTLPYkxMkPGBjGOBNYO33YGlscNFOcyc=;
	b=cE4nsdwhlfUuH2cLo3c2NOzRTrBVSPl5SB7+pa+Qaa6VLAKRFPxR8QPYzfheK4Mg+N
	MGHbn0Yz3BcD0FjRPzjrEFQSz7OFGQP4nb9C32B+arrNH+sdyUbpSp5qHG2iQ+XjhlhC
	JQcd+2qXCCHuQPwBMECrMVrHMDzJj+SmK1s1iHslqFNH9W5XNvPKOiLyZWdj2RkZViz5
	eEhrfFGC5zZSkvd+STCuMlTGu4CsIyY+yK2Q2OFriAjEDWiX093NlmmdYGX2PaaplEeS
	XcMP8xJnsgY/vZi1ocysn9WwSL/PDsDfzwnwQjvTD666b1xhFZhYrG0qpE6DitMLiS9c
	jVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6rb/J/AEYQhuTLPYkxMkPGBjGOBNYO33YGlscNFOcyc=;
	b=Tp783rQEnBvFLx4IwnKeudxAjxhTxzQFmQw7YBQ/745UySH+9pzBgvuWESbMVJuXYV
	9yr/SevuO0F8Mrpz+jT9Edm4tlDzRbJl1RneO/w0uTLE8jFBpR+6Z6PP6iajA83q2cTr
	UTr4+KdObQSU2YWc3TzxwqGdK+CglseFFJ9r6tPWhcq8MMD095rpIsRRJSOx+ooQYgUU
	Io0eTswILwtCtDQiyTjrYZeOcz6Rjlu9BXxhoKMWbv/IMpG1M1DyN/nvgtv/1CQXca6L
	ZLF8qLfGhfSzvzgGDZoeEyVuUqZ6gSOdfvPmtydNThOaf69HT6ERcL5jMqFYM9vwazEI
	NhYA==
X-Gm-Message-State: APjAAAUNude0r+fuXPbwveCHY3EPxKY47MsHR1H1+3+xTHeZQJZYvxH8
	dQoLJOozIM27S2X/k5czePyE3Fr2
X-Google-Smtp-Source: APXvYqwmNvIrQ9vCQ450JTxkEwlDJlyiF0gZehLkhqhaGbau5NefQ5sLoRV7JB6NgDPC4NzuLq4Pgg==
X-Received: by 2002:a17:90a:1782:: with SMTP id q2mr489874pja.57.1573497017249;
	Mon, 11 Nov 2019 10:30:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:51 -0800
Message-Id: <a1d9cfef7f247d616cd6ca482916ad0469e4fc58.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 09/21] qemu-helper-native: showing help shouldn't be an error
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:16 -0000

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


