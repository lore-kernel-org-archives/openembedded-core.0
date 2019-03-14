Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Mar 2019 15:58:32 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 986DD7C410
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1552578211; x=1555170211;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nWtiF49itqm8mn94O4+ay9kqPOqc4KVDInBEpJ1AjQA=;
	b=JzyRczfJYDo5/kqwvNtCGRTKSzv2Hk51FQnHihWdJtf9rEtKG7eWGk6PE5lorH1q
	KxsDORSRSYWzB0YpbgiXbt+zp/dTPC5OvCUDsSWYF/8AwGrUiL0+gpu2NDIivlGi
	4SPrfHxRsOChpcn7SC5+t8w6S+yTGSTPnOz4xD/Uyq0=;
X-AuditID: c39127d2-4dfff70000000d5a-56-5c8a76a3e49b
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	6C.75.03418.3A67A8C5; Thu, 14 Mar 2019 16:43:31 +0100 (CET)
Received: from lws-mklieser.phytec.de ([172.16.21.1])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019031416433155-74946 ;
	Thu, 14 Mar 2019 16:43:31 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 16:43:30 +0100
Message-Id: <20190314154330.1427-1-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 14.03.2019 16:43:31,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 14.03.2019 16:43:31
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42JZI8DApbu4rCvG4ORyK4s7P9+xOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoEr48XVjSwFvcsYK3obv7I3ML7rZOxi5OSQEDCRePR+OVsXIxeH
	kMB2RonPBw9AORcYJe5f6QGq4uBgE/CRWDrTEsQUEdCRePPRC6RXWMBC4nvLFlYQm0VAVeL/
	kw1sIDavgL3E88ffmCDmy0uc713HDhEXlDg58wkLyHgJgSuMEk1Lz0EVCUmcXnyWGWQ+s4C6
	xPp5QiBhZgFtiWULXzNPYOSbhaR9FkLVLCRVCxiZVzEK5WYmZ6cWZWbrFWRUlqQm66WkbmIE
	BtPhieqXdjD2zfE4xCjAwajEw8sQ2hUjxJpYVlyZe4hRgoNZSYR3TyBQiDclsbIqtSg/vqg0
	J7X4EKM0B4uSOO8G3pIwIYH0xJLU7NTUgtQimCwTB6dUA+PcY4Jpe7U33nvCr7E9Tjsrp/dx
	0VeelzbamTyNXpWsVZe9BV6ulDAzMveo4fxuO6l1Vr99zvRFn9aqLnGrf3Qg9/+PfP8Qv7/K
	j29mTT87iT9JSsH54Qm900zbbztK283q4kizfhwksfSr+XOfjZrzT6h4GyzglFq9Zo3tDivD
	jRc2GsurzlFiKc5INNRiLipOBADMh+SVIgIAAA==
Subject: [sumo][PATCH] coreutils: 8.29: fix native build
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
X-List-Received-Date: Thu, 14 Mar 2019 15:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This fixes the native build on glibc 2.28 hosts, by backporting two
gnulib patches from master.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 ...adjust-to-glibc-2.28-libio.h-removal.patch | 193 ++++++++++++++++++
 ...e-more-paranoid-about-libio.h-change.patch | 187 +++++++++++++++++
 meta/recipes-core/coreutils/coreutils=5F8.29.bb |   2 +
 3 files changed, 382 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-fflush-adjus=
t-to-glibc-2.28-libio.h-removal.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils/0002-fflush-be-mo=
re-paranoid-about-libio.h-change.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to-gl=
ibc-2.28-libio.h-removal.patch b/meta/recipes-core/coreutils/coreutils/0001=
-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
new file mode 100644
index 000000000000..110b34372db1
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to-glibc-2.2=
8-libio.h-removal.patch
@@ -0,0 +1,193 @@
+From 269a8987224ec62b7a9aa6202772b07d5be424d2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kliese=
r@phytec.de>
+Date: Mon, 11 Mar 2019 16:00:33 +0100
+Subject: [PATCH 1/2] fflush: adjust to glibc 2.28 libio.h removal
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of patch:
+4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
+Paul Eggert <eggert@cs.ucla.edu>
+fflush: adjust to glibc 2.28 libio.h removal
+
+Upstream-Status: Backport [master]
+
+Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+---
+ lib/fflush.c     | 6 +++---
+ lib/fpending.c   | 2 +-
+ lib/fpurge.c     | 2 +-
+ lib/freadahead.c | 2 +-
+ lib/freading.c   | 2 +-
+ lib/freadptr.c   | 2 +-
+ lib/freadseek.c  | 2 +-
+ lib/fseeko.c     | 4 ++--
+ lib/fseterr.c    | 2 +-
+ lib/stdio-impl.h | 6 ++++++
+ 10 files changed, 18 insertions(+), 12 deletions(-)
+
+diff --git a/lib/fflush.c b/lib/fflush.c
+index 4e65692644b1..c16da5fdcf23 100644
+--- a/lib/fflush.c
++++ b/lib/fflush.c
+@@ -33,7 +33,7 @@
+ #undef fflush
+=20
+=20
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+=20
+ /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).=
  */
+ static void
+@@ -72,7 +72,7 @@ clear=5Fungetc=5Fbuffer (FILE *fp)
+=20
+ #endif
+=20
+-#if ! (defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */)
++#if ! (defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */)
+=20
+ # if (defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F) && defined =5F=5FSNPT
+ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Androi=
d */
+@@ -148,7 +148,7 @@ rpl=5Ffflush (FILE *stream)
+   if (stream =3D=3D NULL || ! freading (stream))
+     return fflush (stream);
+=20
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+=20
+   clear=5Fungetc=5Fbuffer=5Fpreserving=5Fposition (stream);
+=20
+diff --git a/lib/fpending.c b/lib/fpending.c
+index 5811a4a74750..9e21a165e220 100644
+--- a/lib/fpending.c
++++ b/lib/fpending.c
+@@ -32,7 +32,7 @@ =5F=5Ffpending (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+   return fp->=5FIO=5Fwrite=5Fptr - fp->=5FIO=5Fwrite=5Fbase;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Andr=
oid */
+diff --git a/lib/fpurge.c b/lib/fpurge.c
+index 408b8fcbb3b8..3a160004d49d 100644
+--- a/lib/fpurge.c
++++ b/lib/fpurge.c
+@@ -62,7 +62,7 @@ fpurge (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* =
GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->=5FIO=5Fread=5Fend =3D fp->=5FIO=5Fread=5Fptr;
+   fp->=5FIO=5Fwrite=5Fptr =3D fp->=5FIO=5Fwrite=5Fbase;
+   /* Avoid memory leak when there is an active ungetc buffer.  */
+diff --git a/lib/freadahead.c b/lib/freadahead.c
+index f335f041ee5e..e7cb77b6722b 100644
+--- a/lib/freadahead.c
++++ b/lib/freadahead.c
+@@ -30,7 +30,7 @@ extern size=5Ft =5F=5Fsreadahead (FILE *);
+ size=5Ft
+ freadahead (FILE *fp)
+ {
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
+     return 0;
+   return (fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr)
+diff --git a/lib/freading.c b/lib/freading.c
+index 78140d27bfef..c9d33449e948 100644
+--- a/lib/freading.c
++++ b/lib/freading.c
+@@ -31,7 +31,7 @@ freading (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* =
GNU libc, BeOS, Haiku, Linux libc5 */
+   return ((fp->=5Fflags & =5FIO=5FNO=5FWRITES) !=3D 0
+           || ((fp->=5Fflags & (=5FIO=5FNO=5FREADS | =5FIO=5FCURRENTLY=5FP=
UTTING)) =3D=3D 0
+               && fp->=5FIO=5Fread=5Fbase !=3D NULL));
+diff --git a/lib/freadptr.c b/lib/freadptr.c
+index e4cc0b02fba2..aba8dd5964fc 100644
+--- a/lib/freadptr.c
++++ b/lib/freadptr.c
+@@ -29,7 +29,7 @@ freadptr (FILE *fp, size=5Ft *sizep)
+   size=5Ft size;
+=20
+   /* Keep this code in sync with freadahead!  */
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
+     return NULL;
+   size =3D fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr;
+diff --git a/lib/freadseek.c b/lib/freadseek.c
+index fcecba6829c5..98726f845f88 100644
+--- a/lib/freadseek.c
++++ b/lib/freadseek.c
+@@ -36,7 +36,7 @@ freadptrinc (FILE *fp, size=5Ft increment)
+   /* Keep this code in sync with freadptr!  */
+ #if HAVE=5F=5F=5FFREADPTRINC              /* musl libc */
+   =5F=5Ffreadptrinc (fp, increment);
+-#elif defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 =
/* GNU libc, BeOS, Haiku, Linux libc5 */
++#elif defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->=5FIO=5Fread=5Fptr +=3D increment;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Andr=
oid */
+diff --git a/lib/fseeko.c b/lib/fseeko.c
+index d0f24d8a838f..0ae2b153cff5 100644
+--- a/lib/fseeko.c
++++ b/lib/fseeko.c
+@@ -47,7 +47,7 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
+ #endif
+=20
+   /* These tests are based on fpurge.c.  */
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->=5FIO=5Fread=5Fend =3D=3D fp->=5FIO=5Fread=5Fptr
+       && fp->=5FIO=5Fwrite=5Fptr =3D=3D fp->=5FIO=5Fwrite=5Fbase
+       && fp->=5FIO=5Fsave=5Fbase =3D=3D NULL)
+@@ -123,7 +123,7 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
+           return -1;
+         }
+=20
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+       fp->=5Fflags &=3D ~=5FIO=5FEOF=5FSEEN;
+       fp->=5Foffset =3D pos;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+diff --git a/lib/fseterr.c b/lib/fseterr.c
+index 739e5453d04e..d998619771f3 100644
+--- a/lib/fseterr.c
++++ b/lib/fseterr.c
+@@ -29,7 +29,7 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
+   fp->=5Fflags |=3D =5FIO=5FERR=5FSEEN;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Andr=
oid */
+diff --git a/lib/stdio-impl.h b/lib/stdio-impl.h
+index 329801ad23b0..eeaabab66b2f 100644
+--- a/lib/stdio-impl.h
++++ b/lib/stdio-impl.h
+@@ -18,6 +18,12 @@
+    the same implementation of stdio extension API, except that some fields
+    have different naming conventions, or their access requires some casts=
.  */
+=20
++/* Glibc 2.28 made =5FIO=5FIN=5FBACKUP private.  For now, work around this
++   problem by defining it ourselves.  FIXME: Do not rely on glibc
++   internals.  */
++#if !defined =5FIO=5FIN=5FBACKUP && defined =5FIO=5FEOF=5FSEEN
++# define =5FIO=5FIN=5FBACKUP 0x100
++#endif
+=20
+ /* BSD stdio derived implementations.  */
+=20
+--=20
+2.20.1
+
diff --git a/meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-para=
noid-about-libio.h-change.patch b/meta/recipes-core/coreutils/coreutils/000=
2-fflush-be-more-paranoid-about-libio.h-change.patch
new file mode 100644
index 000000000000..8cc7d6377947
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-paranoid-ab=
out-libio.h-change.patch
@@ -0,0 +1,187 @@
+From 72a2dae68c9101d80abdce8c4e41f7e562bd2399 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kliese=
r@phytec.de>
+Date: Wed, 13 Mar 2019 14:09:39 +0100
+Subject: [PATCH 2/2] fflush: be more paranoid about libio.h change
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of patch:
+74d9d6a293d7462dea8f83e7fc5ac792e956a0ad
+Paul Eggert <eggert@cs.ucla.edu>
+fflush: be more paranoid about libio.h change
+
+Upstream-Status: Backport [master]
+
+Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+---
+ lib/fflush.c     | 9 ++++++---
+ lib/fpending.c   | 3 ++-
+ lib/fpurge.c     | 3 ++-
+ lib/freadahead.c | 3 ++-
+ lib/freading.c   | 3 ++-
+ lib/freadptr.c   | 3 ++-
+ lib/freadseek.c  | 3 ++-
+ lib/fseeko.c     | 6 ++++--
+ lib/fseterr.c    | 3 ++-
+ 9 files changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/lib/fflush.c b/lib/fflush.c
+index c16da5fdcf23..b69206296e9a 100644
+--- a/lib/fflush.c
++++ b/lib/fflush.c
+@@ -33,7 +33,8 @@
+ #undef fflush
+=20
+=20
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++/* GNU libc, BeOS, Haiku, Linux libc5 */
+=20
+ /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).=
  */
+ static void
+@@ -72,7 +73,8 @@ clear=5Fungetc=5Fbuffer (FILE *fp)
+=20
+ #endif
+=20
+-#if ! (defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */)
++#if ! (defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1)
++/* GNU libc, BeOS, Haiku, Linux libc5 */
+=20
+ # if (defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F) && defined =5F=5FSNPT
+ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Androi=
d */
+@@ -148,7 +150,8 @@ rpl=5Ffflush (FILE *stream)
+   if (stream =3D=3D NULL || ! freading (stream))
+     return fflush (stream);
+=20
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+=20
+   clear=5Fungetc=5Fbuffer=5Fpreserving=5Fposition (stream);
+=20
+diff --git a/lib/fpending.c b/lib/fpending.c
+index 9e21a165e220..0c3b931dba9a 100644
+--- a/lib/fpending.c
++++ b/lib/fpending.c
+@@ -32,7 +32,8 @@ =5F=5Ffpending (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   return fp->=5FIO=5Fwrite=5Fptr - fp->=5FIO=5Fwrite=5Fbase;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Andr=
oid */
+diff --git a/lib/fpurge.c b/lib/fpurge.c
+index 3a160004d49d..4558ab9a0783 100644
+--- a/lib/fpurge.c
++++ b/lib/fpurge.c
+@@ -62,7 +62,8 @@ fpurge (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* =
GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5F=
GNU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->=5FIO=5Fread=5Fend =3D fp->=5FIO=5Fread=5Fptr;
+   fp->=5FIO=5Fwrite=5Fptr =3D fp->=5FIO=5Fwrite=5Fbase;
+   /* Avoid memory leak when there is an active ungetc buffer.  */
+diff --git a/lib/freadahead.c b/lib/freadahead.c
+index e7cb77b6722b..496686042d1e 100644
+--- a/lib/freadahead.c
++++ b/lib/freadahead.c
+@@ -30,7 +30,8 @@ extern size=5Ft =5F=5Fsreadahead (FILE *);
+ size=5Ft
+ freadahead (FILE *fp)
+ {
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
+     return 0;
+   return (fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr)
+diff --git a/lib/freading.c b/lib/freading.c
+index c9d33449e948..5e66df1dc7dd 100644
+--- a/lib/freading.c
++++ b/lib/freading.c
+@@ -31,7 +31,8 @@ freading (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* =
GNU libc, BeOS, Haiku, Linux libc5 */
++# if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5F=
GNU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   return ((fp->=5Fflags & =5FIO=5FNO=5FWRITES) !=3D 0
+           || ((fp->=5Fflags & (=5FIO=5FNO=5FREADS | =5FIO=5FCURRENTLY=5FP=
UTTING)) =3D=3D 0
+               && fp->=5FIO=5Fread=5Fbase !=3D NULL));
+diff --git a/lib/freadptr.c b/lib/freadptr.c
+index aba8dd5964fc..e82b41e3f4d9 100644
+--- a/lib/freadptr.c
++++ b/lib/freadptr.c
+@@ -29,7 +29,8 @@ freadptr (FILE *fp, size=5Ft *sizep)
+   size=5Ft size;
+=20
+   /* Keep this code in sync with freadahead!  */
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
+     return NULL;
+   size =3D fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr;
+diff --git a/lib/freadseek.c b/lib/freadseek.c
+index 98726f845f88..f547bfd4257b 100644
+--- a/lib/freadseek.c
++++ b/lib/freadseek.c
+@@ -36,7 +36,8 @@ freadptrinc (FILE *fp, size=5Ft increment)
+   /* Keep this code in sync with freadptr!  */
+ #if HAVE=5F=5F=5FFREADPTRINC              /* musl libc */
+   =5F=5Ffreadptrinc (fp, increment);
+-#elif defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /*=
 GNU libc, BeOS, Haiku, Linux libc5 */
++#elif defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->=5FIO=5Fread=5Fptr +=3D increment;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Andr=
oid */
+diff --git a/lib/fseeko.c b/lib/fseeko.c
+index 0ae2b153cff5..ee8efa49ac34 100644
+--- a/lib/fseeko.c
++++ b/lib/fseeko.c
+@@ -47,7 +47,8 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
+ #endif
+=20
+   /* These tests are based on fpurge.c.  */
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   if (fp->=5FIO=5Fread=5Fend =3D=3D fp->=5FIO=5Fread=5Fptr
+       && fp->=5FIO=5Fwrite=5Fptr =3D=3D fp->=5FIO=5Fwrite=5Fbase
+       && fp->=5FIO=5Fsave=5Fbase =3D=3D NULL)
+@@ -123,7 +124,8 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
+           return -1;
+         }
+=20
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++      /* GNU libc, BeOS, Haiku, Linux libc5 */
+       fp->=5Fflags &=3D ~=5FIO=5FEOF=5FSEEN;
+       fp->=5Foffset =3D pos;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+diff --git a/lib/fseterr.c b/lib/fseterr.c
+index d998619771f3..23f4e3593800 100644
+--- a/lib/fseterr.c
++++ b/lib/fseterr.c
+@@ -29,7 +29,8 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /* G=
NU libc, BeOS, Haiku, Linux libc5 */
++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=5FG=
NU=5FLIBRARY=5F=5F =3D=3D 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->=5Fflags |=3D =5FIO=5FERR=5FSEEN;
+ #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || defined =
=5F=5FANDROID=5F=5F
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Andr=
oid */
+--=20
+2.20.1
+
diff --git a/meta/recipes-core/coreutils/coreutils=5F8.29.bb b/meta/recipes=
-core/coreutils/coreutils=5F8.29.bb
index b0572afdc001..3c72bdd75023 100644
--- a/meta/recipes-core/coreutils/coreutils=5F8.29.bb
+++ b/meta/recipes-core/coreutils/coreutils=5F8.29.bb
@@ -21,6 +21,8 @@ SRC=5FURI =3D "${GNU=5FMIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://CVE-2017-18018-1.patch \
            file://CVE-2017-18018-2.patch \
+           file://0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch \
+           file://0002-fflush-be-more-paranoid-about-libio.h-change.patch \
           "
=20
 SRC=5FURI[md5sum] =3D "960cfe75a42c9907c71439f8eb436303"
--=20
2.20.1


