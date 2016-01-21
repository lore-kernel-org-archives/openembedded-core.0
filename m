Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 91DDD731CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:26:52 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id cy9so17027407pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KuXsOJjkAHoepsLTGgcggkO+0hJ2VgdKdp0WSrEZW34=;
	b=wGVi+87roAAkmK6ueXKdtBshihR/OAnIkslvf5MdvOSLwJZBKyDkI2PihIRjLtrnq3
	BisGDTWsi4gJTC55kkDMPbXZrBxdUvlu6Vdau6t2xxBev7E2ajhOIr3EyBvm9/gHyi59
	1PuIyPG0wbjbNNtkcRcWpbrkqAkpybO6Pdv+elpHXZ86EMevyI6cPtTJmZwuQtOWj+o2
	B6y5gfXsa+53sNiWjBlnDnu3uRrbXlIj9DuhBn08ZsN8BWvzQqObqosct/3h9VW7EdM5
	DNmbOb3uSADlBlujQsJZ2DXAt4aXEto1oiQYaX+q8h46rHQjjft05DZ6h/cEqIIMo4eg
	VvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KuXsOJjkAHoepsLTGgcggkO+0hJ2VgdKdp0WSrEZW34=;
	b=Nh9QXx+/qWvlKH+YhJ72yQfWukP9BhoB8qiy5cE2WkTZ0gslPcQnoOZIpOWhH/BMk7
	zo4Oxg0NnBSIT5sWWJHqtokf6rHqaACUtzsMgfrc2jQYzGIliBBjcUgGBs3DhWTGeaPz
	McYK3Bsnmm2m062fubnU5UNc4x6rbCUKYabLzhMmAbJ1ABId2tvq0DyTcbo6wFLSZWpZ
	A4klhO2Fbv5EQX7s8EBR5XRdQlT56eDiLLhbRddZ1YsCnzcIsrJ+q3DOCLAvK+ICq8fZ
	mIxWOK1xQA5vQqkclcAKAIXIU7td2txjVCeNFK+eYjs5l/eO0EGpUw4xX0erpT+pGbyQ
	sorA==
X-Gm-Message-State: ALoCoQlg/heU1fo49FC4vCvXYMCUJjA3MEhIRQdhovTjIxrUPD9o3r1f8euOxGJqt+5SWRhqMAisc+Kn+A0Xnnn6Gt3qPdxecA==
X-Received: by 10.66.187.145 with SMTP id fs17mr58178944pac.81.1453354012890; 
	Wed, 20 Jan 2016 21:26:52 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	n8sm52431254pfj.46.2016.01.20.21.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:26:51 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:26:46 -0800
Message-Id: <1453354006-18992-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] valgrind: remove unused valgrind-remove-rpath.patch
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
X-List-Received-Date: Thu, 21 Jan 2016 05:26:57 -0000

Replaced by 0002-remove-rpath.patch during the 3.10 -> 3.11 update.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../valgrind/valgrind/valgrind-remove-rpath.patch  | 25 ----------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
deleted file mode 100644
index f72e9ca..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-
-Upstream-Status: Inappropriate [embedded config]
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: valgrind-3.10.0/none/tests/Makefile.am
-===================================================================
---- valgrind-3.10.0.orig/none/tests/Makefile.am
-+++ valgrind-3.10.0/none/tests/Makefile.am
-@@ -280,7 +280,6 @@ threaded_fork_LDADD	= -lpthread
- threadederrno_LDADD	= -lpthread
- tls_SOURCES		= tls.c tls2.c
- tls_DEPENDENCIES	= tls.so tls2.so
--tls_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests
- tls_LDADD		= tls.so tls2.so -lpthread
- tls_so_SOURCES		= tls_so.c
- tls_so_DEPENDENCIES	= tls2.so
-@@ -288,7 +287,7 @@ if VGCONF_OS_IS_DARWIN
-  tls_so_LDFLAGS		= -dynamic -dynamiclib -all_load -fpic
-  tls_so_LDADD		= `pwd`/tls2.so
- else
-- tls_so_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests -shared -fPIC
-+ tls_so_LDFLAGS		= -shared -fPIC
-  tls_so_LDADD		= tls2.so
- endif
- tls_so_CFLAGS		= $(AM_CFLAGS) -fPIC
-- 
1.9.1


