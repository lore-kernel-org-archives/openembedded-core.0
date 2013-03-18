Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UHPiR-0007Ls-68
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 03:22:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2EYqj024771; Mon, 18 Mar 2013 02:14:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hx-pt5ZJ0G9l; Mon, 18 Mar 2013 02:14:36 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2EUNi024755
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 18 Mar 2013 02:14:31 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UHPRv-0003Vj-Uu; Mon, 18 Mar 2013 02:05:19 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 02:05:10 +0000
Message-Id: <1363572312-13399-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/13] xcursor-transparent-theme: Refresh patches and ${B} != ${S} fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 02:22:59 -0000

Refresh the patches and fix out of tree build issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fix_watch_cursor.patch                         |   23 ++++++-------------
 .../use-relative-symlinks.patch                    |   24 +++++++++++++++-----
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
index 722bda3..cfac55c 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
@@ -1,8 +1,11 @@
-Upstream-Status: Inappropriate [configuration]
+Fix typo in Makefile
 
-diff -NurP xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.am xcursor-transparent-theme-0.1.1/cursors/Makefile.am
---- xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.am	2003-10-30 13:13:59.000000000 +0100
-+++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2005-12-20 23:35:17.000000000 +0100
+Upstream-Status: Pending
+
+Index: xcursor-transparent-theme-0.1.1/cursors/Makefile.am
+===================================================================
+--- xcursor-transparent-theme-0.1.1.orig/cursors/Makefile.am	2013-03-07 22:25:04.001435305 +0000
++++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2013-03-07 22:25:04.061435302 +0000
 @@ -79,7 +79,7 @@
  	ul_angle \
  	ur_angle \
@@ -12,15 +15,3 @@ diff -NurP xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.am xcursor-tran
  	xterm  
  
  CURSOR_DIR = $(datadir)/icons/xcursor-transparent/cursors
-diff -NurP xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.in xcursor-transparent-theme-0.1.1/cursors/Makefile.in
---- xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.in	2003-10-31 15:31:13.000000000 +0100
-+++ xcursor-transparent-theme-0.1.1/cursors/Makefile.in	2005-12-20 23:35:36.000000000 +0100
-@@ -67,7 +67,7 @@
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
- 
--CURSOR_NAMES =  	00008160000006810000408080010102 	028006030e0e7ebffc7f7070c0600140 	03b6e0fcb3499374a867c041f52298f0 	08e8e1c95fe2fc01f976f1e063a24ccd 	14fef782d02440884392942c11205230 	2870a09082c103050810ffdffffe0204 	3ecb610c1bf2410f44200f48c40d3599 	4498f0e0c1937ffe01fd06f973665830 	9d800788f1b08800ae810202380a0822 	c7088f0f3e6c8088236ef8e1e3e70000 	d9ce0ab605698f320427677b458ad60b 	e29285e634086352946a0e7090d73106 	fcf1c3c7cd4491d801f1e1c78f100000 	X_cursor 	arrow 	base_arrow_down 	base_arrow_up 	based_arrow_down 	based_arrow_up 	bd_double_arrow 	boat 	bottom_left_corner 	bottom_right_corner 	bottom_side 	bottom_tee 	center_ptr 	circle 	cross 	cross_reverse 	crossed_circle 	crosshair 	dot 	dot_box_mask 	dotbox 	double_arrow 	draft_large  	draft_small  	draped_box   	exchange     	fd_double_arrow 	fleur 	gumby 	h_double_arrow 	hand 	hand1 	hand2 	left_ptr 	left_ptr_watch 	left_side 	left_tee  	ll_angle  	lr_angle  	move      	pencil    	pirate    	plus      	question_!
 arrow 	right_ptr      	right_side     	right_tee      	sailboat       	sb_down_arrow  	sb_h_double_arrow 	sb_left_arrow 	sb_right_arrow 	sb_up_arrow 	sb_v_double_arrow 	shuttle 	sizing  	target  	tcross  	top_left_arrow  	top_left_corner 	top_right_corner 	top_side 	top_tee 	trek 	ul_angle 	ur_angle 	v_double_arrow 	watcha 	xterm  
-+CURSOR_NAMES =  	00008160000006810000408080010102 	028006030e0e7ebffc7f7070c0600140 	03b6e0fcb3499374a867c041f52298f0 	08e8e1c95fe2fc01f976f1e063a24ccd 	14fef782d02440884392942c11205230 	2870a09082c103050810ffdffffe0204 	3ecb610c1bf2410f44200f48c40d3599 	4498f0e0c1937ffe01fd06f973665830 	9d800788f1b08800ae810202380a0822 	c7088f0f3e6c8088236ef8e1e3e70000 	d9ce0ab605698f320427677b458ad60b 	e29285e634086352946a0e7090d73106 	fcf1c3c7cd4491d801f1e1c78f100000 	X_cursor 	arrow 	base_arrow_down 	base_arrow_up 	based_arrow_down 	based_arrow_up 	bd_double_arrow 	boat 	bottom_left_corner 	bottom_right_corner 	bottom_side 	bottom_tee 	center_ptr 	circle 	cross 	cross_reverse 	crossed_circle 	crosshair 	dot 	dot_box_mask 	dotbox 	double_arrow 	draft_large  	draft_small  	draped_box   	exchange     	fd_double_arrow 	fleur 	gumby 	h_double_arrow 	hand 	hand1 	hand2 	left_ptr 	left_ptr_watch 	left_side 	left_tee  	ll_angle  	lr_angle  	move      	pencil    	pirate    	plus      	question_!
 arrow 	right_ptr      	right_side     	right_tee      	sailboat       	sb_down_arrow  	sb_h_double_arrow 	sb_left_arrow 	sb_right_arrow 	sb_up_arrow 	sb_v_double_arrow 	shuttle 	sizing  	target  	tcross  	top_left_arrow  	top_left_corner 	top_right_corner 	top_side 	top_tee 	trek 	ul_angle 	ur_angle 	v_double_arrow 	watch 	xterm  
- 
- 
- CURSOR_DIR = $(datadir)/icons/xcursor-transparent/cursors
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
index ae9640c..5028fd6 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
@@ -1,10 +1,22 @@
-Upstream-Status: Inappropriate [configuration]
+Use relative symlink for link rather than absolute path which 
+doesn't work well in DESTDIR setting.
 
-diff -ur xcursor-transparent-theme-0.1.1~/cursors/Makefile.am xcursor-transparent-theme-0.1.1/cursors/Makefile.am
---- xcursor-transparent-theme-0.1.1~/cursors/Makefile.am	2003-10-30 12:13:59.000000000 +0000
-+++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2004-07-27 12:56:24.000000000 +0100
-@@ -91,6 +91,6 @@
- 	$(INSTALL_DATA) $(CURSOR_REAL) $(DESTDIR)$(CURSOR_DIR)/ 
+Also fix out of tree builds to use correct srcdir.
+
+Upstream-Status: Pending
+
+RP 2013/3/8
+
+Index: xcursor-transparent-theme-0.1.1/cursors/Makefile.am
+===================================================================
+--- xcursor-transparent-theme-0.1.1.orig/cursors/Makefile.am	2013-03-07 22:25:03.933435307 +0000
++++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2013-03-07 22:25:27.293434755 +0000
+@@ -88,9 +88,9 @@
+ 
+ install-data-local:
+ 	$(mkinstalldirs) $(DESTDIR)$(CURSOR_DIR); 
+-	$(INSTALL_DATA) $(CURSOR_REAL) $(DESTDIR)$(CURSOR_DIR)/ 
++	$(INSTALL_DATA) $(srcdir)/$(CURSOR_REAL) $(DESTDIR)$(CURSOR_DIR)/
  	for CURSOR in $(CURSOR_NAMES); do \
  		echo '-- Installing cursor '$$CURSOR; \
 -		ln -s $(DESTDIR)$(CURSOR_DIR)/transp $(DESTDIR)$(CURSOR_DIR)/$$CURSOR; \
-- 
1.7.10.4



