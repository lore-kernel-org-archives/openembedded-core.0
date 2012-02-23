Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0cpM-0001wi-Nr
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 18:51:36 +0100
Received: by wibhq7 with SMTP id hq7so983589wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 09:43:15 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.101.72 as permitted sender)
	client-ip=10.180.101.72; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.101.72 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.101.72])
	by 10.180.101.72 with SMTP id fe8mr5030578wib.4.1330018995387 (num_hops
	= 1); Thu, 23 Feb 2012 09:43:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.101.72 with SMTP id fe8mr4109258wib.4.1330018995325;
	Thu, 23 Feb 2012 09:43:15 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id h19sm5726785wiw.9.2012.02.23.09.43.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 09:43:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 18:43:05 +0100
Message-Id: <1330018985-21603-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmDIYKJP13TVe/KLLh45OmQxUNRaUtJFjJG9BK2ov4KCFRgCNr9Tx3BPXywPpts7hyBLqdB
Cc: Koen Kooi <koen@dominion.thruhere.net>, martin.jansa@gmail.com
Subject: [PATCH] libsdl 1.2.14: regenerate patch so it applies with 'patch' as well as 'git apply'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 17:51:36 -0000

The '@@ -, +, @@' part upsets plain 'patch'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libsdl-1.2.14/add.XGetRequest.symbol.patch     |   27 +++++++++++++------
 1 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
index 7bab177..33ba8ec 100644
--- a/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
@@ -1,5 +1,8 @@
-_XGetRequest API was backported to libx11-1.4.4 in:
-http://git.openembedded.org/openembedded-core/commit/?id=e08604800fe1cb8f240f53c147ceb4ee08a29b91
+From e49fe9e2d75764d2d7ef79ab4252a1f6b99adcd3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Thu, 23 Feb 2012 18:38:19 +0100
+Subject: [PATCH] _XGetRequest API was backported to libx11-1.4.4 in:
+ http://git.openembedded.org/openembedded-core/commit/?id=e08604800fe1cb8f240f53c147ceb4ee08a29b91
 
 This breaks e.g. libsdl-image build with:
 | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libSDL.so: undefined reference to `_XGetRequest'
@@ -7,14 +10,15 @@ This breaks e.g. libsdl-image build with:
 For details see: https://bugzilla.redhat.com/show_bug.cgi?id=782251
 
 Upstream-Status: Accepted
-
-@@ -, +, @@ 
- added.
+---
  src/video/x11/SDL_x11dyn.c |   24 ++++++++++++++++++++++++
  src/video/x11/SDL_x11sym.h |    6 ++++++
  2 files changed, 30 insertions(+), 0 deletions(-)
---- a/src/video/x11/SDL_x11dyn.c	
-+++ a/src/video/x11/SDL_x11dyn.c	
+
+diff --git a/src/video/x11/SDL_x11dyn.c b/src/video/x11/SDL_x11dyn.c
+index 4e549b3..a7e800e 100644
+--- a/src/video/x11/SDL_x11dyn.c
++++ b/src/video/x11/SDL_x11dyn.c
 @@ -109,6 +109,21 @@ char *(*pXGetICValues)(XIC, ...) = NULL;
  #undef SDL_X11_SYM
  
@@ -53,8 +57,10 @@ Upstream-Status: Accepted
  		if (SDL_X11_HAVE_BASEXLIB) {  /* all required symbols loaded. */
  			SDL_ClearError();
  		} else {
---- a/src/video/x11/SDL_x11sym.h	
-+++ a/src/video/x11/SDL_x11sym.h	
+diff --git a/src/video/x11/SDL_x11sym.h b/src/video/x11/SDL_x11sym.h
+index 3dfa146..f1e7841 100644
+--- a/src/video/x11/SDL_x11sym.h
++++ b/src/video/x11/SDL_x11sym.h
 @@ -170,6 +170,12 @@ SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,
  #endif
  
@@ -68,3 +74,6 @@ Upstream-Status: Accepted
   * These only show up on some variants of Unix.
   */
  #if defined(__osf__)
+-- 
+1.7.2.5
+
-- 
1.7.2.5



