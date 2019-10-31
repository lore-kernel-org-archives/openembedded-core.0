Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8219A7F965
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:55:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n7so5413213wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EWmHsnU7wwAIh3zRbo8Aft+cNEc9AwU3nG0YwA21Htw=;
	b=BiDlEhhk9J0sK+Hoy6scAFNlwn2+U/o7zKaE0bipyMR6jj83Rrf7V088Kf90fULRr7
	QIi8drJu5UgpnhyhGjv4ZTuFEQkWO5wWTi4IspDKNWYPnCrcZVzK8wnhZzLjDF2D+NlZ
	JVOb8DuKQifUFEs4VHrwTcDr9R/hnicnvt2Sur2NYwE4IleaAMg877piOqQinOT1fBeN
	c+d4trXJ1kwWiZuDKYEX2PgnKZ9iK7rJaSwbar6bEiTQELBTd7xOi4GNpTG6EW3cYEKJ
	qveOXa72sJW3gzw9LWjKuH6bxXK6N8+h8OoUZLqycoWypNCnJbleFxUeEga3sYdswrX4
	dyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EWmHsnU7wwAIh3zRbo8Aft+cNEc9AwU3nG0YwA21Htw=;
	b=qBOriCK0aM+TU8x0TCJVcN0zMaDSB3ZWCPVa23bgJPN3bNCJiqSWdZYTC6Zk3zKKEE
	fTv+dCW7nQzlhBjrUjboqGRJlmfN2RuotfRUrA9AA8FGW/TNV27L2oNkCetAub4VkyaP
	leYXLGd8qml6UkOMWzkjchoDxT88SuLI/zf/ivGmHhq7ZXcExJ3aXBS+LXAweCF8cAIz
	twGhZei8/Fp8jz/RIav4goqy1vFwfQjMSokJbS23m7w8eoIp+TW85vOx+IoulWKeJOYv
	hZ+Xkcgd9RfPlrRAN4aiRH8rlhRsgdsHRQJlr0N6xxP4AUOfLLv3jIyd5gmZ71/qhrsa
	3UqQ==
X-Gm-Message-State: APjAAAVW4Ok4IXHPMsU1jPR9sg5w7T76HjSrsXKwinGt/OlJUncee3yu
	zTQytlfIae0u+UhleHtbT+NWyf1svKk=
X-Google-Smtp-Source: APXvYqwIeFK/ecmH+pxlJ/SgjrkkjL5OE4TqHsDyUVW2w/91m2Qt31EBmOjzi8FAwUv3RjyveIEBtQ==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr4466338wme.115.1572519323869;
	Thu, 31 Oct 2019 03:55:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm2836496wml.33.2019.10.31.03.55.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:55:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:55:13 +0000
Message-Id: <20191031105518.7716-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031105518.7716-1-ross.burton@intel.com>
References: <20191031105518.7716-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] qemu-helper-native: showing help shouldn't be an error
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
X-List-Received-Date: Thu, 31 Oct 2019 10:55:24 -0000
Content-Transfer-Encoding: 8bit

Displaying a help message if help was requested isn't an error.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu-helper/tunctl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c b/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
index fc00e997891..d745dd06cb4 100644
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
2.20.1


