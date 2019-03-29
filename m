Return-Path: <s.mueller-klieser@phytec.de>
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id DF0BA7D252
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1553849061; x=1556441061;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fI+5zOVkUQMp4FoGUBhu5deN34lY7IG3Knl9f1der1k=;
	b=hlJUtHNiH7QSqz6Y4nkS4kie9qsHRz7gTIGwFYsbfpwkvDNjM+U7maCr/CFyBOyd
	qClclGEQ+etSMwOd2ujayRBN9URbjTrdBNHdAMMY7d6CCix2/1rdJo5vUfsK9kun
	XtTXco8Q//hBVzeGBV8nz+JE4SoIE7ACVvdwCTT0Dok=;
X-AuditID: c39127d2-4dfff70000000d5a-bf-5c9ddae5945c
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	CB.9A.03418.5EADD9C5; Fri, 29 Mar 2019 09:44:21 +0100 (CET)
Received: from [172.16.21.77] ([172.16.21.77])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019032909442117-87899 ;
	Fri, 29 Mar 2019 09:44:21 +0100 
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20190314154330.1427-1-s.mueller-klieser@phytec.de>
	<760b9e00-9649-76ac-a93d-229d394de223@gmail.com>
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
Message-ID: <b8f3c96a-6b22-f2c4-5b1c-e34c4dfb8fc7@phytec.de>
Date: Fri, 29 Mar 2019 09:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <760b9e00-9649-76ac-a93d-229d394de223@gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 29.03.2019 09:44:21,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 29.03.2019 09:44:21
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRoCBS/fprbkxBou/CVrs/bSI0eLOz3fs
	DkweO2fdZfc4t3EFYwBTFJdNSmpOZllqkb5dAlfGuj9L2AsWb2SsWLnuG2sD48SJjF2MnBwS
	AiYSN+7NZepi5OIQEtjOKHFxRjcrhHOSUWLV5hlAGQ4OYQE3iT2HREAaRAT8JU69bAVrFhIo
	krjdeBfMZhPwkri3vZEJxOYVsJF4tK0TzGYRUJXYueQ5WI2oQITE3YsvWCBqBCVOznwCZnMK
	2Ep0rL0ItldC4AqjxNPzP6GuE5I4vfgsM4jNLGAmMW/zQyhbXOLWk/lMELa2xLKFr5knMArO
	QjJ3FpKWWUhaZiFpWcDIsopRKDczOTu1KDNbryCjsiQ1WS8ldRMjMIwPT1S/tIOxb47HIUYB
	DkYlHt4Pu+fECLEmlhVX5h5ilOBgVhLhDTw3N0aINyWxsiq1KD++qDQntfgQozQHi5I47wbe
	kjAhgfTEktTs1NSC1CKYLBMHp1QDY1tG0fZbXHYvdvwwZv6dx2Fa1vOsuoupzUd4UyR3D29e
	bMPyj2HXN6uefnZGV2CCA1//ZkneaS3ORj6WLpNzP9XlpksLRfQ39snP/ah0z3TvEp6rUcfO
	hJwoOLckt+/o4ZtVQjX/r6VNSbp0z2ZXplmXpcKk878XTFwbtMGyLiPnq/Jk4/OrlFiKMxIN
	tZiLihMBWZMtp18CAAA=
Subject: Re: [sumo][PATCH] coreutils: 8.29: fix native build
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
X-List-Received-Date: Fri, 29 Mar 2019 08:44:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Armin,

On 19.03.19 16:13, akuster808 wrote:
> On 3/14/19 8:43 AM, Stefan M=C3=BCller-Klieser wrote:
>> This fixes the native build on glibc 2.28 hosts, by backporting two
>> gnulib patches from master.
> This will need to be done for Thud too.
> - armin

coreutils 8.30 in thud already carries those patches.
Stefan

>>
>> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
>> ---
>>   ...adjust-to-glibc-2.28-libio.h-removal.patch | 193 ++++++++++++++++++
>>   ...e-more-paranoid-about-libio.h-change.patch | 187 +++++++++++++++++
>>   meta/recipes-core/coreutils/coreutils=5F8.29.bb |   2 +
>>   3 files changed, 382 insertions(+)
>>   create mode 100644 meta/recipes-core/coreutils/coreutils/0001-fflush-a=
djust-to-glibc-2.28-libio.h-removal.patch
>>   create mode 100644 meta/recipes-core/coreutils/coreutils/0002-fflush-b=
e-more-paranoid-about-libio.h-change.patch
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to=
-glibc-2.28-libio.h-removal.patch b/meta/recipes-core/coreutils/coreutils/0=
001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
>> new file mode 100644
>> index 000000000000..110b34372db1
>> --- /dev/null
>> +++ b/meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to-glibc-=
2.28-libio.h-removal.patch
>> @@ -0,0 +1,193 @@
>> +From 269a8987224ec62b7a9aa6202772b07d5be424d2 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kli=
eser@phytec.de>
>> +Date: Mon, 11 Mar 2019 16:00:33 +0100
>> +Subject: [PATCH 1/2] fflush: adjust to glibc 2.28 libio.h removal
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Backport of patch:
>> +4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
>> +Paul Eggert <eggert@cs.ucla.edu>
>> +fflush: adjust to glibc 2.28 libio.h removal
>> +
>> +Upstream-Status: Backport [master]
>> +
>> +Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
>> +---
>> + lib/fflush.c     | 6 +++---
>> + lib/fpending.c   | 2 +-
>> + lib/fpurge.c     | 2 +-
>> + lib/freadahead.c | 2 +-
>> + lib/freading.c   | 2 +-
>> + lib/freadptr.c   | 2 +-
>> + lib/freadseek.c  | 2 +-
>> + lib/fseeko.c     | 4 ++--
>> + lib/fseterr.c    | 2 +-
>> + lib/stdio-impl.h | 6 ++++++
>> + 10 files changed, 18 insertions(+), 12 deletions(-)
>> +
>> +diff --git a/lib/fflush.c b/lib/fflush.c
>> +index 4e65692644b1..c16da5fdcf23 100644
>> +--- a/lib/fflush.c
>> ++++ b/lib/fflush.c
>> +@@ -33,7 +33,7 @@
>> + #undef fflush
>> +
>> +
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +
>> + /* Clear the stream's ungetc buffer, preserving the value of ftello (f=
p).  */
>> + static void
>> +@@ -72,7 +72,7 @@ clear=5Fungetc=5Fbuffer (FILE *fp)
>> +
>> + #endif
>> +
>> +-#if ! (defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=
=3D 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
>> ++#if ! (defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D =
1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
>> +
>> + # if (defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F) && defined =5F=5FSNPT
>> + /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, And=
roid */
>> +@@ -148,7 +148,7 @@ rpl=5Ffflush (FILE *stream)
>> +   if (stream =3D=3D NULL || ! freading (stream))
>> +     return fflush (stream);
>> +
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +
>> +   clear=5Fungetc=5Fbuffer=5Fpreserving=5Fposition (stream);
>> +
>> +diff --git a/lib/fpending.c b/lib/fpending.c
>> +index 5811a4a74750..9e21a165e220 100644
>> +--- a/lib/fpending.c
>> ++++ b/lib/fpending.c
>> +@@ -32,7 +32,7 @@ =5F=5Ffpending (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   return fp->=5FIO=5Fwrite=5Fptr - fp->=5FIO=5Fwrite=5Fbase;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, A=
ndroid */
>> +diff --git a/lib/fpurge.c b/lib/fpurge.c
>> +index 408b8fcbb3b8..3a160004d49d 100644
>> +--- a/lib/fpurge.c
>> ++++ b/lib/fpurge.c
>> +@@ -62,7 +62,7 @@ fpurge (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-# if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D =
1 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 =
/* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   fp->=5FIO=5Fread=5Fend =3D fp->=5FIO=5Fread=5Fptr;
>> +   fp->=5FIO=5Fwrite=5Fptr =3D fp->=5FIO=5Fwrite=5Fbase;
>> +   /* Avoid memory leak when there is an active ungetc buffer.  */
>> +diff --git a/lib/freadahead.c b/lib/freadahead.c
>> +index f335f041ee5e..e7cb77b6722b 100644
>> +--- a/lib/freadahead.c
>> ++++ b/lib/freadahead.c
>> +@@ -30,7 +30,7 @@ extern size=5Ft =5F=5Fsreadahead (FILE *);
>> + size=5Ft
>> + freadahead (FILE *fp)
>> + {
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
>> +     return 0;
>> +   return (fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr)
>> +diff --git a/lib/freading.c b/lib/freading.c
>> +index 78140d27bfef..c9d33449e948 100644
>> +--- a/lib/freading.c
>> ++++ b/lib/freading.c
>> +@@ -31,7 +31,7 @@ freading (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-# if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D =
1 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 =
/* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   return ((fp->=5Fflags & =5FIO=5FNO=5FWRITES) !=3D 0
>> +           || ((fp->=5Fflags & (=5FIO=5FNO=5FREADS | =5FIO=5FCURRENTLY=
=5FPUTTING)) =3D=3D 0
>> +               && fp->=5FIO=5Fread=5Fbase !=3D NULL));
>> +diff --git a/lib/freadptr.c b/lib/freadptr.c
>> +index e4cc0b02fba2..aba8dd5964fc 100644
>> +--- a/lib/freadptr.c
>> ++++ b/lib/freadptr.c
>> +@@ -29,7 +29,7 @@ freadptr (FILE *fp, size=5Ft *sizep)
>> +   size=5Ft size;
>> +
>> +   /* Keep this code in sync with freadahead!  */
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
>> +     return NULL;
>> +   size =3D fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr;
>> +diff --git a/lib/freadseek.c b/lib/freadseek.c
>> +index fcecba6829c5..98726f845f88 100644
>> +--- a/lib/freadseek.c
>> ++++ b/lib/freadseek.c
>> +@@ -36,7 +36,7 @@ freadptrinc (FILE *fp, size=5Ft increment)
>> +   /* Keep this code in sync with freadptr!  */
>> + #if HAVE=5F=5F=5FFREADPTRINC              /* musl libc */
>> +   =5F=5Ffreadptrinc (fp, increment);
>> +-#elif defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D=
 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#elif defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   fp->=5FIO=5Fread=5Fptr +=3D increment;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, A=
ndroid */
>> +diff --git a/lib/fseeko.c b/lib/fseeko.c
>> +index d0f24d8a838f..0ae2b153cff5 100644
>> +--- a/lib/fseeko.c
>> ++++ b/lib/fseeko.c
>> +@@ -47,7 +47,7 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
>> + #endif
>> +
>> +   /* These tests are based on fpurge.c.  */
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   if (fp->=5FIO=5Fread=5Fend =3D=3D fp->=5FIO=5Fread=5Fptr
>> +       && fp->=5FIO=5Fwrite=5Fptr =3D=3D fp->=5FIO=5Fwrite=5Fbase
>> +       && fp->=5FIO=5Fsave=5Fbase =3D=3D NULL)
>> +@@ -123,7 +123,7 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
>> +           return -1;
>> +         }
>> +
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +       fp->=5Fflags &=3D ~=5FIO=5FEOF=5FSEEN;
>> +       fp->=5Foffset =3D pos;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +diff --git a/lib/fseterr.c b/lib/fseterr.c
>> +index 739e5453d04e..d998619771f3 100644
>> +--- a/lib/fseterr.c
>> ++++ b/lib/fseterr.c
>> +@@ -29,7 +29,7 @@ fseterr (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-#if defined =5FIO=5Fftrylockfile || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   fp->=5Fflags |=3D =5FIO=5FERR=5FSEEN;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, A=
ndroid */
>> +diff --git a/lib/stdio-impl.h b/lib/stdio-impl.h
>> +index 329801ad23b0..eeaabab66b2f 100644
>> +--- a/lib/stdio-impl.h
>> ++++ b/lib/stdio-impl.h
>> +@@ -18,6 +18,12 @@
>> +    the same implementation of stdio extension API, except that some fi=
elds
>> +    have different naming conventions, or their access requires some ca=
sts.  */
>> +
>> ++/* Glibc 2.28 made =5FIO=5FIN=5FBACKUP private.  For now, work around =
this
>> ++   problem by defining it ourselves.  FIXME: Do not rely on glibc
>> ++   internals.  */
>> ++#if !defined =5FIO=5FIN=5FBACKUP && defined =5FIO=5FEOF=5FSEEN
>> ++# define =5FIO=5FIN=5FBACKUP 0x100
>> ++#endif
>> +
>> + /* BSD stdio derived implementations.  */
>> +
>> +--
>> +2.20.1
>> +
>> diff --git a/meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-p=
aranoid-about-libio.h-change.patch b/meta/recipes-core/coreutils/coreutils/=
0002-fflush-be-more-paranoid-about-libio.h-change.patch
>> new file mode 100644
>> index 000000000000..8cc7d6377947
>> --- /dev/null
>> +++ b/meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-paranoid=
-about-libio.h-change.patch
>> @@ -0,0 +1,187 @@
>> +From 72a2dae68c9101d80abdce8c4e41f7e562bd2399 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kli=
eser@phytec.de>
>> +Date: Wed, 13 Mar 2019 14:09:39 +0100
>> +Subject: [PATCH 2/2] fflush: be more paranoid about libio.h change
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Backport of patch:
>> +74d9d6a293d7462dea8f83e7fc5ac792e956a0ad
>> +Paul Eggert <eggert@cs.ucla.edu>
>> +fflush: be more paranoid about libio.h change
>> +
>> +Upstream-Status: Backport [master]
>> +
>> +Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
>> +---
>> + lib/fflush.c     | 9 ++++++---
>> + lib/fpending.c   | 3 ++-
>> + lib/fpurge.c     | 3 ++-
>> + lib/freadahead.c | 3 ++-
>> + lib/freading.c   | 3 ++-
>> + lib/freadptr.c   | 3 ++-
>> + lib/freadseek.c  | 3 ++-
>> + lib/fseeko.c     | 6 ++++--
>> + lib/fseterr.c    | 3 ++-
>> + 9 files changed, 24 insertions(+), 12 deletions(-)
>> +
>> +diff --git a/lib/fflush.c b/lib/fflush.c
>> +index c16da5fdcf23..b69206296e9a 100644
>> +--- a/lib/fflush.c
>> ++++ b/lib/fflush.c
>> +@@ -33,7 +33,8 @@
>> + #undef fflush
>> +
>> +
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++/* GNU libc, BeOS, Haiku, Linux libc5 */
>> +
>> + /* Clear the stream's ungetc buffer, preserving the value of ftello (f=
p).  */
>> + static void
>> +@@ -72,7 +73,8 @@ clear=5Fungetc=5Fbuffer (FILE *fp)
>> +
>> + #endif
>> +
>> +-#if ! (defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D =
1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
>> ++#if ! (defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =
=5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1)
>> ++/* GNU libc, BeOS, Haiku, Linux libc5 */
>> +
>> + # if (defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F) && defined =5F=5FSNPT
>> + /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, And=
roid */
>> +@@ -148,7 +150,8 @@ rpl=5Ffflush (FILE *stream)
>> +   if (stream =3D=3D NULL || ! freading (stream))
>> +     return fflush (stream);
>> +
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +
>> +   clear=5Fungetc=5Fbuffer=5Fpreserving=5Fposition (stream);
>> +
>> +diff --git a/lib/fpending.c b/lib/fpending.c
>> +index 9e21a165e220..0c3b931dba9a 100644
>> +--- a/lib/fpending.c
>> ++++ b/lib/fpending.c
>> +@@ -32,7 +32,8 @@ =5F=5Ffpending (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   return fp->=5FIO=5Fwrite=5Fptr - fp->=5FIO=5Fwrite=5Fbase;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, A=
ndroid */
>> +diff --git a/lib/fpurge.c b/lib/fpurge.c
>> +index 3a160004d49d..4558ab9a0783 100644
>> +--- a/lib/fpurge.c
>> ++++ b/lib/fpurge.c
>> +@@ -62,7 +62,8 @@ fpurge (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 =
/* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++# if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   fp->=5FIO=5Fread=5Fend =3D fp->=5FIO=5Fread=5Fptr;
>> +   fp->=5FIO=5Fwrite=5Fptr =3D fp->=5FIO=5Fwrite=5Fbase;
>> +   /* Avoid memory leak when there is an active ungetc buffer.  */
>> +diff --git a/lib/freadahead.c b/lib/freadahead.c
>> +index e7cb77b6722b..496686042d1e 100644
>> +--- a/lib/freadahead.c
>> ++++ b/lib/freadahead.c
>> +@@ -30,7 +30,8 @@ extern size=5Ft =5F=5Fsreadahead (FILE *);
>> + size=5Ft
>> + freadahead (FILE *fp)
>> + {
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
>> +     return 0;
>> +   return (fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr)
>> +diff --git a/lib/freading.c b/lib/freading.c
>> +index c9d33449e948..5e66df1dc7dd 100644
>> +--- a/lib/freading.c
>> ++++ b/lib/freading.c
>> +@@ -31,7 +31,8 @@ freading (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-# if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 =
/* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++# if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   return ((fp->=5Fflags & =5FIO=5FNO=5FWRITES) !=3D 0
>> +           || ((fp->=5Fflags & (=5FIO=5FNO=5FREADS | =5FIO=5FCURRENTLY=
=5FPUTTING)) =3D=3D 0
>> +               && fp->=5FIO=5Fread=5Fbase !=3D NULL));
>> +diff --git a/lib/freadptr.c b/lib/freadptr.c
>> +index aba8dd5964fc..e82b41e3f4d9 100644
>> +--- a/lib/freadptr.c
>> ++++ b/lib/freadptr.c
>> +@@ -29,7 +29,8 @@ freadptr (FILE *fp, size=5Ft *sizep)
>> +   size=5Ft size;
>> +
>> +   /* Keep this code in sync with freadahead!  */
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   if (fp->=5FIO=5Fwrite=5Fptr > fp->=5FIO=5Fwrite=5Fbase)
>> +     return NULL;
>> +   size =3D fp->=5FIO=5Fread=5Fend - fp->=5FIO=5Fread=5Fptr;
>> +diff --git a/lib/freadseek.c b/lib/freadseek.c
>> +index 98726f845f88..f547bfd4257b 100644
>> +--- a/lib/freadseek.c
>> ++++ b/lib/freadseek.c
>> +@@ -36,7 +36,8 @@ freadptrinc (FILE *fp, size=5Ft increment)
>> +   /* Keep this code in sync with freadptr!  */
>> + #if HAVE=5F=5F=5FFREADPTRINC              /* musl libc */
>> +   =5F=5Ffreadptrinc (fp, increment);
>> +-#elif defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1=
 /* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#elif defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =
=5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   fp->=5FIO=5Fread=5Fptr +=3D increment;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, A=
ndroid */
>> +diff --git a/lib/fseeko.c b/lib/fseeko.c
>> +index 0ae2b153cff5..ee8efa49ac34 100644
>> +--- a/lib/fseeko.c
>> ++++ b/lib/fseeko.c
>> +@@ -47,7 +47,8 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
>> + #endif
>> +
>> +   /* These tests are based on fpurge.c.  */
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   if (fp->=5FIO=5Fread=5Fend =3D=3D fp->=5FIO=5Fread=5Fptr
>> +       && fp->=5FIO=5Fwrite=5Fptr =3D=3D fp->=5FIO=5Fwrite=5Fbase
>> +       && fp->=5FIO=5Fsave=5Fbase =3D=3D NULL)
>> +@@ -123,7 +124,8 @@ fseeko (FILE *fp, off=5Ft offset, int whence)
>> +           return -1;
>> +         }
>> +
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++      /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +       fp->=5Fflags &=3D ~=5FIO=5FEOF=5FSEEN;
>> +       fp->=5Foffset =3D pos;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +diff --git a/lib/fseterr.c b/lib/fseterr.c
>> +index d998619771f3..23f4e3593800 100644
>> +--- a/lib/fseterr.c
>> ++++ b/lib/fseterr.c
>> +@@ -29,7 +29,8 @@ fseterr (FILE *fp)
>> +   /* Most systems provide FILE as a struct and the necessary bitmask in
>> +      <stdio.h>, because they need it for implementing getc() and putc(=
) as
>> +      fast macros.  */
>> +-#if defined =5FIO=5FEOF=5FSEEN || =5F=5FGNU=5FLIBRARY=5F=5F =3D=3D 1 /=
* GNU libc, BeOS, Haiku, Linux libc5 */
>> ++#if defined =5FIO=5FEOF=5FSEEN || defined =5FIO=5Fftrylockfile || =5F=
=5FGNU=5FLIBRARY=5F=5F =3D=3D 1
>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>> +   fp->=5Fflags |=3D =5FIO=5FERR=5FSEEN;
>> + #elif defined =5F=5Fsferror || defined =5F=5FDragonFly=5F=5F || define=
d =5F=5FANDROID=5F=5F
>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, A=
ndroid */
>> +--
>> +2.20.1
>> +
>> diff --git a/meta/recipes-core/coreutils/coreutils=5F8.29.bb b/meta/reci=
pes-core/coreutils/coreutils=5F8.29.bb
>> index b0572afdc001..3c72bdd75023 100644
>> --- a/meta/recipes-core/coreutils/coreutils=5F8.29.bb
>> +++ b/meta/recipes-core/coreutils/coreutils=5F8.29.bb
>> @@ -21,6 +21,8 @@ SRC=5FURI =3D "${GNU=5FMIRROR}/coreutils/${BP}.tar.xz \
>>              file://0001-local.mk-fix-cross-compiling-problem.patch \
>>              file://CVE-2017-18018-1.patch \
>>              file://CVE-2017-18018-2.patch \
>> +           file://0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patc=
h \
>> +           file://0002-fflush-be-more-paranoid-about-libio.h-change.pat=
ch \
>>             "
>>  =20
>>   SRC=5FURI[md5sum] =3D "960cfe75a42c9907c71439f8eb436303"
>=20


