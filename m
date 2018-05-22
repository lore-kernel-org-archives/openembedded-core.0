Return-Path: <tanuk@iki.fi>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
	[66.111.4.224])
	by mail.openembedded.org (Postfix) with ESMTP id 3495671B2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 15:30:31 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 433F113D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Tue, 22 May 2018 11:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=4rhXmcWnr16C2MzQL1RRsCzsaCzbRsURQIUj1zial/U=; b=VHe8KEkg
	5EW3ny/qYposs3XkF89j78z7+8GLN9UxzkYndeHFf5WUTVASkFRSlW5JKKzo6ZyD
	YjhkrcvkeROwjU0tEDnBXZnqc1ftefcdyNvw85ExezSfR8LUSGogpPW9GvqGYXPw
	0KPfmK7tbLB1Atzz6P6xLm1DiDEIBSx0PR8H9yZOflMZL6IwAbCXNXvpxnic7g3D
	q2utqjYgUCgRh0OeoQNBc/k/qgh6c419pEIDJO+w/qPGwBrvvbpxnKJVBFoBbBBJ
	FbrZTmFP/8AtAF1vm4H7GWCLm0C75Hg44htIpdqUeJdBQHAl1w3Imxu+fCLZN6i7
	MLwihyyjQBmGvw==
X-ME-Proxy: <xmx:mDcEW6egOrls5QB2do62TXQKnwmEzf3UtAhEW3x-3rZO-K_I6i1j8Q>
X-ME-Proxy: <xmx:mDcEW1yu7qjFuf5q2wBUZTADbUgXojE6rIjSeCHnoUdh0epEI7a7WQ>
X-ME-Proxy: <xmx:mDcEW6x7oSmPtf-PJPNhTgloiu9iMY8TTakUrdN6RLikzyIK35tTyA>
X-ME-Proxy: <xmx:mDcEW-YBbSQ4dLDMkqHVL-bLXfRO1pBKs8BB6kZanyNiomgNLW_-TQ>
X-ME-Proxy: <xmx:mDcEW72Av28VY9rypWhx2XauxTPtsnDzALT5r_0dDytaGVLZo2-Rgg>
X-ME-Proxy: <xmx:mDcEW4LHVowUGgkGXrbJr0_ZVMbY-dEF4ijJcAQAMoEGUOh161olTw>
X-ME-Sender: <xms:mDcEW5eS68Ir890VNB3EAIEphthy_bGmMUqKrRO-TRDM4GUz5y3xGg>
Received: from localhost.localdomain (unknown [192.40.95.27])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5475610260
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:31 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 18:30:09 +0300
Message-Id: <20180522153011.18761-2-tanuk@iki.fi>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180522153011.18761-1-tanuk@iki.fi>
References: <20180522153011.18761-1-tanuk@iki.fi>
Subject: [PATCH 1/3] libvorbis: 1.3.5 -> 1.3.6
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
X-List-Received-Date: Tue, 22 May 2018 15:30:31 -0000

Rebased 0001-configure-Check-for-clang.patch.

Removed the backported CVE patches.

License-Update: copyright years refreshed

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../0001-configure-Check-for-clang.patch      |  20 ++--
 .../libvorbis/libvorbis/CVE-2017-14632.patch  |  62 -----------
 .../libvorbis/libvorbis/CVE-2017-14633.patch  |  42 --------
 .../libvorbis/libvorbis/CVE-2018-5146.patch   | 100 ------------------
 ...{libvorbis_1.3.5.bb => libvorbis_1.3.6.bb} |   9 +-
 5 files changed, 13 insertions(+), 220 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.5.bb => libvorbis_1.3.6.bb} (64%)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
index 7dad0cd8a5..b06029b98b 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
@@ -1,4 +1,4 @@
-From 44b4511784f9b51c514dff4ceb3cbeaf9c374d08 Mon Sep 17 00:00:00 2001
+From d619ccf6c11ab574466914c57994a82fb99401af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 22 Mar 2017 16:06:55 +0000
 Subject: [PATCH] configure: Check for clang
@@ -13,12 +13,12 @@ Upstream-Status: Pending
  1 file changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index eddd02d..00ecba5 100644
+index 28b0a14..2d4e984 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -93,6 +93,16 @@ AC_ARG_ENABLE(examples,
-  	
- AM_CONDITIONAL(BUILD_EXAMPLES, [test "x$enable_examples" = xyes]) 
+@@ -98,6 +98,16 @@ AC_ARG_ENABLE(examples,
+ 
+ AM_CONDITIONAL(BUILD_EXAMPLES, [test "x$enable_examples" = xyes])
  
 +AC_MSG_CHECKING([whether C compiler is clang])
 +$CC -x c /dev/null -dM -E > conftest.txt 2>&1
@@ -33,9 +33,9 @@ index eddd02d..00ecba5 100644
  dnl --------------------------------------------------
  dnl Set build flags based on environment
  dnl --------------------------------------------------
-@@ -127,10 +137,15 @@ else
+@@ -132,10 +142,15 @@ else
  	AC_MSG_RESULT([$GCC_VERSION])
- 	case $host in 
+ 	case $host in
  	*86-*-linux*)
 +		if test "$CC_CLANG" = "1"; then
 +			ieeefp=""
@@ -43,8 +43,8 @@ index eddd02d..00ecba5 100644
 +			ieefp="-mno-ieee-fp"
 +		fi
  		DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES -fsigned-char"
--		CFLAGS="-O3 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char"
-+		CFLAGS="-O3 -ffast-math -D_REENTRANT -fsigned-char ${ieefp}"
+-		CFLAGS="-O3 -Wall -Wextra -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char"
++		CFLAGS="-O3 -Wall -Wextra -ffast-math -D_REENTRANT -fsigned-char ${ieefp}"
  #              	PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math -D_REENTRANT -fsigned-char -fno-inline -static"
 -		PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char -fno-inline"
 +		PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math ${ieefp} -D_REENTRANT -fsigned-char -fno-inline"
@@ -52,5 +52,5 @@ index eddd02d..00ecba5 100644
  		# glibc < 2.1.3 has a serious FP bug in the math inline header
  		# that will cripple Vorbis.  Look to see if the magic FP stack
 -- 
-1.8.3.1
+2.17.0
 
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
deleted file mode 100644
index 4036b966fe..0000000000
--- a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 39704ce16835e5c019bb03f6a94dc1f0677406c5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
-Date: Wed, 15 Nov 2017 18:22:59 +0100
-Subject: [PATCH] CVE-2017-14632: vorbis_analysis_header_out: Don't clear opb
- if not initialized
-
-If the number of channels is not within the allowed range
-we call oggback_writeclear altough it's not initialized yet.
-
-This fixes
-
-    =23371== Invalid free() / delete / delete[] / realloc()
-    ==23371==    at 0x4C2CE1B: free (vg_replace_malloc.c:530)
-    ==23371==    by 0x829CA31: oggpack_writeclear (in /usr/lib/x86_64-linux-gnu/libogg.so.0.8.2)
-    ==23371==    by 0x84B96EE: vorbis_analysis_headerout (info.c:652)
-    ==23371==    by 0x9FBCBCC: ??? (in /usr/lib/x86_64-linux-gnu/sox/libsox_fmt_vorbis.so)
-    ==23371==    by 0x4E524F1: ??? (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x4E52CCA: sox_open_write (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x10D82A: open_output_file (sox.c:1556)
-    ==23371==    by 0x10D82A: process (sox.c:1753)
-    ==23371==    by 0x10D82A: main (sox.c:3012)
-    ==23371==  Address 0x68768c8 is 488 bytes inside a block of size 880 alloc'd
-    ==23371==    at 0x4C2BB1F: malloc (vg_replace_malloc.c:298)
-    ==23371==    by 0x4C2DE9F: realloc (vg_replace_malloc.c:785)
-    ==23371==    by 0x4E545C2: lsx_realloc (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x9FBC9A0: ??? (in /usr/lib/x86_64-linux-gnu/sox/libsox_fmt_vorbis.so)
-    ==23371==    by 0x4E524F1: ??? (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x4E52CCA: sox_open_write (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x10D82A: open_output_file (sox.c:1556)
-    ==23371==    by 0x10D82A: process (sox.c:1753)
-    ==23371==    by 0x10D82A: main (sox.c:3012)
-
-as seen when using the testcase from CVE-2017-11333 with
-008d23b782be09c8d75ba8190b1794abd66c7121 applied. However the error was
-there before.
-
-Upstream-Status: Backport
-CVE: CVE-2017-14632
-
-Reference to upstream patch:
-https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=c1c2831fc7306d5fbd7bc800324efd12b28d327f
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- lib/info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/info.c b/lib/info.c
-index 81b7557..4d82568 100644
---- a/lib/info.c
-+++ b/lib/info.c
-@@ -584,6 +584,7 @@ int vorbis_analysis_headerout(vorbis_dsp_state *v,
-   private_state *b=v->backend_state;
- 
-   if(!b||vi->channels<=0||vi->channels>256){
-+    b = NULL;
-     ret=OV_EFAULT;
-     goto err_out;
-   }
--- 
-2.16.2
-
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
deleted file mode 100644
index 9c9e688d43..0000000000
--- a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 07eda55f336e5c44dfc0e4a1e21628faed7255fa Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
-Date: Tue, 31 Oct 2017 18:32:46 +0100
-Subject: [PATCH] CVE-2017-14633: Don't allow for more than 256 channels
-
-Otherwise
-
- for(i=0;i<vi->channels;i++){
-      /* the encoder setup assumes that all the modes used by any
-         specific bitrate tweaking use the same floor */
-      int submap=info->chmuxlist[i];
-
-overreads later in mapping0_forward since chmuxlist is a fixed array of
-256 elements max.
-
-Upstream-Status: Backport
-CVE: CVE-2017-14633
-
-Reference to upstream patch:
-https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=667ceb4aab60c1f74060143bb24e5f427b3cce5f
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- lib/info.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/info.c b/lib/info.c
-index e447a0c..81b7557 100644
---- a/lib/info.c
-+++ b/lib/info.c
-@@ -583,7 +583,7 @@ int vorbis_analysis_headerout(vorbis_dsp_state *v,
-   oggpack_buffer opb;
-   private_state *b=v->backend_state;
- 
--  if(!b||vi->channels<=0){
-+  if(!b||vi->channels<=0||vi->channels>256){
-     ret=OV_EFAULT;
-     goto err_out;
-   }
--- 
-2.16.2
-
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch
deleted file mode 100644
index 6d4052a872..0000000000
--- a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 3a017f591457bf6e80231b563bf83ee583fdbca8 Mon Sep 17 00:00:00 2001
-From: Thomas Daede <daede003@umn.edu>
-Date: Thu, 15 Mar 2018 14:15:31 -0700
-Subject: [PATCH] CVE-2018-5146: Prevent out-of-bounds write in codebook
- decoding.
-
-Codebooks that are not an exact divisor of the partition size are now
-truncated to fit within the partition.
-
-Upstream-Status: Backport
-CVE: CVE-2018-5146
-
-Reference to upstream patch:
-https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=667ceb4aab60c1f74060143bb24e5f427b3cce5f
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- lib/codebook.c | 48 ++++++++++--------------------------------------
- 1 file changed, 10 insertions(+), 38 deletions(-)
-
-diff --git a/lib/codebook.c b/lib/codebook.c
-index 8b766e8..7022fd2 100644
---- a/lib/codebook.c
-+++ b/lib/codebook.c
-@@ -387,7 +387,7 @@ long vorbis_book_decodevs_add(codebook *book,float *a,oggpack_buffer *b,int n){
-       t[i] = book->valuelist+entry[i]*book->dim;
-     }
-     for(i=0,o=0;i<book->dim;i++,o+=step)
--      for (j=0;j<step;j++)
-+      for (j=0;o+j<n && j<step;j++)
-         a[o+j]+=t[j][i];
-   }
-   return(0);
-@@ -399,41 +399,12 @@ long vorbis_book_decodev_add(codebook *book,float *a,oggpack_buffer *b,int n){
-     int i,j,entry;
-     float *t;
- 
--    if(book->dim>8){
--      for(i=0;i<n;){
--        entry = decode_packed_entry_number(book,b);
--        if(entry==-1)return(-1);
--        t     = book->valuelist+entry*book->dim;
--        for (j=0;j<book->dim;)
--          a[i++]+=t[j++];
--      }
--    }else{
--      for(i=0;i<n;){
--        entry = decode_packed_entry_number(book,b);
--        if(entry==-1)return(-1);
--        t     = book->valuelist+entry*book->dim;
--        j=0;
--        switch((int)book->dim){
--        case 8:
--          a[i++]+=t[j++];
--        case 7:
--          a[i++]+=t[j++];
--        case 6:
--          a[i++]+=t[j++];
--        case 5:
--          a[i++]+=t[j++];
--        case 4:
--          a[i++]+=t[j++];
--        case 3:
--          a[i++]+=t[j++];
--        case 2:
--          a[i++]+=t[j++];
--        case 1:
--          a[i++]+=t[j++];
--        case 0:
--          break;
--        }
--      }
-+    for(i=0;i<n;){
-+      entry = decode_packed_entry_number(book,b);
-+      if(entry==-1)return(-1);
-+      t     = book->valuelist+entry*book->dim;
-+      for(j=0;i<n && j<book->dim;)
-+        a[i++]+=t[j++];
-     }
-   }
-   return(0);
-@@ -471,12 +442,13 @@ long vorbis_book_decodevv_add(codebook *book,float **a,long offset,int ch,
-   long i,j,entry;
-   int chptr=0;
-   if(book->used_entries>0){
--    for(i=offset/ch;i<(offset+n)/ch;){
-+    int m=(offset+n)/ch;
-+    for(i=offset/ch;i<m;){
-       entry = decode_packed_entry_number(book,b);
-       if(entry==-1)return(-1);
-       {
-         const float *t = book->valuelist+entry*book->dim;
--        for (j=0;j<book->dim;j++){
-+        for (j=0;i<m && j<book->dim;j++){
-           a[chptr++][i]+=t[j];
-           if(chptr==ch){
-             chptr=0;
--- 
-2.16.2
-
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
similarity index 64%
rename from meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
rename to meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
index 20f887c252..bd46451612 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
@@ -6,17 +6,14 @@ HOMEPAGE = "http://www.vorbis.com/"
 BUGTRACKER = "https://trac.xiph.org"
 SECTION = "libs"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=70c7063491d2d9f76a098d62ed5134f1 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
-           file://CVE-2017-14633.patch \
-           file://CVE-2017-14632.patch \
-           file://CVE-2018-5146.patch \
           "
-SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
-SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
+SRC_URI[md5sum] = "b7d1692f275c73e7833ed1cc2697cd65"
+SRC_URI[sha256sum] = "af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415"
 
 inherit autotools pkgconfig
-- 
2.17.0


