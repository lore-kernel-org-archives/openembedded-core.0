Return-Path: <ardeleanalex@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09AEC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 10:33:04 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.18252.1646044383626591484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 02:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gG7ZXczT;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: ardeleanalex@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so10941001pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=3HeyTpq3WNgbz6fHMDn8MxTWw/dKErKfp414cPnm/6g=;
        b=gG7ZXczTKy8xwkHfNozVzhr1YeRDdPydh/tTxvE6FMCWdoJIrMgziQObKaKtThG5hJ
         ohoDH0ypMG3g2glx1pryDsClQsamEFhsh7kKFoLR1ji5glN0Hpq2IO/ry5aAfx8RJrp6
         WKw14xLkrueSsD9js5lun57Ng7A1kcngTD/VYNEKnn6CHCVNGYSZyGH5v/AYakFRRkuu
         86/Tf/2Z8pdtcNkyRdo6TwUNQTzpBoO5F2N2ad3WVYlQ1/SkNuXrueJMmXcT8PYxmUH7
         tO2/5+errvsLi6GUXhd/zLYP5f/5Oc/S2NBmg2XsSFfR2BPz95ecftAfA59o7KTbXRkn
         C2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=3HeyTpq3WNgbz6fHMDn8MxTWw/dKErKfp414cPnm/6g=;
        b=fOKbZsWpdW5jmI7JqhmbmGVtX1sqUzqcHY1JRcE+8fIxuH0O3xd/oL10dfhMNlE8dN
         WoWy8PctEKbCOvUbRHynWUrlzbJP4xLIcKqxD/WyN+ZL8MU64yxvo5AGlGrBQy1+Lpqu
         lUfNQOHiEWmCdJeuBy0Yizc2aH8lEsrh3N8PkCAOsV7eaYFMnL8pb+E1YNPmi6qQa0zV
         fHlsthrexcx9aXua/q7x5Q8bOz7z7roBIVcK2khFSCWLblfhxJX6CgoIjonxRYhS+i7c
         1/XPBOuQSNBljYbvWFAYTKFruGJDu66pjRP2lKNbtCarktLUccaYDDuiGzTDx7+fJWjC
         GL8g==
X-Gm-Message-State: AOAM531N+XvocZamUwyuw8kQKA4sKm8eB+xFr43A6eQUr6w1HNHwl0SQ
	4ltg6sscGk6ue2O/JsexqthDU5Y9iYpcv0cFicLd6WjaMMEDrw==
X-Google-Smtp-Source: 
 ABdhPJyt3TER4HwWI8LMPCGOakiACMsTkvGlCkjzDRiJzicBoKKd8eIxkE2I6jlM7niWyu/pMLYzGN7criV5pRqh6eM=
X-Received: by 2002:a17:90a:7f92:b0:1bc:f09:59 with SMTP id
 m18-20020a17090a7f9200b001bc0f090059mr16121774pjl.98.1646044382323; Mon, 28
 Feb 2022 02:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20220224153034.5140-1-ardeleanalex@gmail.com>
In-Reply-To: <20220224153034.5140-1-ardeleanalex@gmail.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Mon, 28 Feb 2022 12:32:50 +0200
Message-ID: 
 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] libsndfile1: bump to version 1.0.31
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 10:33:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162453

On Thu, Feb 24, 2022 at 5:30 PM Alexandru Ardelean
<ardeleanalex@gmail.com> wrote:
>
> It seems that the homepage has moved (for a while now) from
>   http://www.mega-nerd.com/libsndfile/
> to
>   https://libsndfile.github.io/libsndfile/
>
> On Github, the development group seems to include Erik de Castro Lopo (th=
e
> original author of libsndfile1).
> Link: https://github.com/orgs/libsndfile/people
>
> All backported CVE patches are in version 1.0.31 (I've checked).
>
> The supported format page [1], mentions that Ogg/Opus is supported since
> 1.0.29, however that isn't currently added in this patch. And it may
> require libopus.
> And mp3 is supported at around version 1.1.0, but that version is in beta=
.
>
> This change focuses solely on updating to 1.0.31 and removing all
> backported patches.
>
> [1] https://libsndfile.github.io/libsndfile/formats.html

Bah...

No luck with V2 either.
This would require some patch to allow build without libopus support.
Since there is no libopus available, it will not include support for
libvorbis, libflac.
i.e. libsndfile will build, but will say:

configure: WARNING: *** One or more of the external libraries (ie
libflac, libogg and
configure: WARNING: *** libvorbis) is either missing (possibly only
the development
configure: WARNING: *** headers) or is of an unsupported version.
configure: WARNING: ***
configure: WARNING: *** Unfortunately, for ease of maintenance, the
external libs
configure: WARNING: *** are an all or nothing affair.


Seems I forgot to check these extra configurations.

Please disregard the V2 and apologies for the noise.

I may try again with a V3, but let's see.

>
> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> ---
>
> Changelog v1 -> v2:
> * https://lists.openembedded.org/g/openembedded-core/message/162311
> * fix do_install_append() -> do_install:append() - the correct version in
>   recent bitbake is 'do_install:append()', and I tested on a older poky
>   version
> * generated patch with -M option (hope it worked, I can't tell =C2=AF\_(=
=E3=83=84)_/=C2=AF)
>
>  ...aw-fix-multiple-buffer-overflows-432.patch | 107 ----------------
>  .../libsndfile1/CVE-2017-12562.patch          |  96 ---------------
>  .../libsndfile1/CVE-2017-14634.patch          |  42 -------
>  .../libsndfile1/CVE-2017-6892.patch           |  34 ------
>  .../libsndfile1/CVE-2017-8361-8365.patch      |  73 -----------
>  .../libsndfile1/CVE-2017-8362.patch           |  59 ---------
>  .../libsndfile1/CVE-2017-8363.patch           |  37 ------
>  .../libsndfile1/CVE-2018-13139.patch          |  37 ------
>  .../libsndfile1/CVE-2018-19432.patch          | 115 ------------------
>  .../libsndfile1/CVE-2018-19758.patch          |  34 ------
>  .../libsndfile1/CVE-2019-3832.patch           |  37 ------
>  .../libsndfile/libsndfile1_1.0.28.bb          |  46 -------
>  .../libsndfile/libsndfile1_1.0.31.bb          |  31 +++++
>  13 files changed, 31 insertions(+), 717 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-a=
-ulaw-fix-multiple-buffer-overflows-432.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
17-12562.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
17-14634.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
17-6892.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
17-8361-8365.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
17-8362.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
17-8363.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
18-13139.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
18-19432.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
18-19758.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
19-3832.patch
>  delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28=
.bb
>  create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31=
.bb
>
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-f=
ix-multiple-buffer-overflows-432.patch b/meta/recipes-multimedia/libsndfile=
/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
> deleted file mode 100644
> index a4679cef2a..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-mult=
iple-buffer-overflows-432.patch
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -This patch fixes #429 (CVE-2018-19661 CVE-2018-19662) and #344 (CVE-2017=
-17456
> -CVE-2017-17457). As per
> -https://github.com/erikd/libsndfile/issues/344#issuecomment-448504425 it=
 also
> -fixes #317 (CVE-2017-14245 CVE-2017-14246).
> -
> -CVE: CVE-2017-14245 CVE-2017-14246
> -CVE: CVE-2017-17456 CVE-2017-17457
> -CVE: CVE-2018-19661 CVE-2018-19662
> -
> -Upstream-Status: Backport [8ddc442d539ca775d80cdbc7af17a718634a743f]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 39453899fe1bb39b2e041fdf51a85aecd177e9c7 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 7 Jan 2019 15:55:03 +0800
> -Subject: [PATCH] a/ulaw: fix multiple buffer overflows (#432)
> -
> -i2ulaw_array() and i2alaw_array() fail to handle ptr [count] =3D INT_MIN
> -properly, leading to buffer underflow. INT_MIN is a special value
> -since - INT_MIN cannot be represented as int.
> -
> -In this case round - INT_MIN to INT_MAX and proceed as usual.
> -
> -f2ulaw_array() and f2alaw_array() fail to handle ptr [count] =3D NaN
> -properly, leading to null pointer dereference.
> -
> -In this case, arbitrarily set the buffer value to 0.
> -
> -This commit fixes #429 (CVE-2018-19661 and CVE-2018-19662) and
> -fixes #344 (CVE-2017-17456 and CVE-2017-17457).
> -
> ----
> - src/alaw.c | 9 +++++++--
> - src/ulaw.c | 9 +++++++--
> - 2 files changed, 14 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/alaw.c b/src/alaw.c
> -index 063fd1a..4220224 100644
> ---- a/src/alaw.c
> -+++ b/src/alaw.c
> -@@ -19,6 +19,7 @@
> - #include      "sfconfig.h"
> -
> - #include      <math.h>
> -+#include      <limits.h>
> -
> - #include      "sndfile.h"
> - #include      "common.h"
> -@@ -326,7 +327,9 @@ s2alaw_array (const short *ptr, int count, unsigned =
char *buffer)
> - static inline void
> - i2alaw_array (const int *ptr, int count, unsigned char *buffer)
> - {     while (--count >=3D 0)
> --      {       if (ptr [count] >=3D 0)
> -+      {       if (ptr [count] =3D=3D INT_MIN)
> -+                      buffer [count] =3D alaw_encode [INT_MAX >> (16 + =
4)] ;
> -+              else if (ptr [count] >=3D 0)
> -                       buffer [count] =3D alaw_encode [ptr [count] >> (1=
6 + 4)] ;
> -               else
> -                       buffer [count] =3D 0x7F & alaw_encode [- ptr [cou=
nt] >> (16 + 4)] ;
> -@@ -346,7 +349,9 @@ f2alaw_array (const float *ptr, int count, unsigned =
char *buffer, float normfact
> - static inline void
> - d2alaw_array (const double *ptr, int count, unsigned char *buffer, doub=
le normfact)
> - {     while (--count >=3D 0)
> --      {       if (ptr [count] >=3D 0)
> -+      {       if (!isfinite (ptr [count]))
> -+                      buffer [count] =3D 0 ;
> -+              else if (ptr [count] >=3D 0)
> -                       buffer [count] =3D alaw_encode [lrint (normfact *=
 ptr [count])] ;
> -               else
> -                       buffer [count] =3D 0x7F & alaw_encode [- lrint (n=
ormfact * ptr [count])] ;
> -diff --git a/src/ulaw.c b/src/ulaw.c
> -index e50b4cb..b6070ad 100644
> ---- a/src/ulaw.c
> -+++ b/src/ulaw.c
> -@@ -19,6 +19,7 @@
> - #include      "sfconfig.h"
> -
> - #include      <math.h>
> -+#include      <limits.h>
> -
> - #include      "sndfile.h"
> - #include      "common.h"
> -@@ -827,7 +828,9 @@ s2ulaw_array (const short *ptr, int count, unsigned =
char *buffer)
> - static inline void
> - i2ulaw_array (const int *ptr, int count, unsigned char *buffer)
> - {     while (--count >=3D 0)
> --      {       if (ptr [count] >=3D 0)
> -+      {       if (ptr [count] =3D=3D INT_MIN)
> -+                      buffer [count] =3D ulaw_encode [INT_MAX >> (16 + =
2)] ;
> -+              else if (ptr [count] >=3D 0)
> -                       buffer [count] =3D ulaw_encode [ptr [count] >> (1=
6 + 2)] ;
> -               else
> -                       buffer [count] =3D 0x7F & ulaw_encode [-ptr [coun=
t] >> (16 + 2)] ;
> -@@ -847,7 +850,9 @@ f2ulaw_array (const float *ptr, int count, unsigned =
char *buffer, float normfact
> - static inline void
> - d2ulaw_array (const double *ptr, int count, unsigned char *buffer, doub=
le normfact)
> - {     while (--count >=3D 0)
> --      {       if (ptr [count] >=3D 0)
> -+      {       if (!isfinite (ptr [count]))
> -+                      buffer [count] =3D 0 ;
> -+              else if (ptr [count] >=3D 0)
> -                       buffer [count] =3D ulaw_encode [lrint (normfact *=
 ptr [count])] ;
> -               else
> -                       buffer [count] =3D 0x7F & ulaw_encode [- lrint (n=
ormfact * ptr [count])] ;
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-1256=
2.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.pat=
ch
> deleted file mode 100644
> index 491dae3114..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -Heap-based Buffer Overflow in the psf_binheader_writef function in commo=
n.c in
> -libsndfile through 1.0.28 allows remote attackers to cause a denial of s=
ervice
> -(application crash) or possibly have unspecified other impact.
> -
> -CVE: CVE-2017-12562
> -Upstream-Status: Backport [cf7a8182c2642c50f1cf90dddea9ce96a8bad2e8]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From b6a9d7e95888ffa77d8c75ce3f03e6c7165587cd Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?J=3DC3=3DB6rn=3D20Heusipp?=3D <osmanx@problemloesungsm=
aschine.de>
> -Date: Wed, 14 Jun 2017 12:25:40 +0200
> -Subject: [PATCH] src/common.c: Fix heap buffer overflows when writing st=
rings
> - in binheader
> -
> -Fixes the following problems:
> - 1. Case 's' only enlarges the buffer by 16 bytes instead of size bytes.
> - 2. psf_binheader_writef() enlarges the header buffer (if needed) prior =
to the
> -    big switch statement by an amount (16 bytes) which is enough for all=
 cases
> -    where only a single value gets added. Cases 's', 'S', 'p' however
> -    additionally write an arbitrary length block of data and again enlar=
ge the
> -    buffer to the required amount. However, the required space calculati=
on does
> -    not take into account the size of the length field which gets output=
 before
> -    the data.
> - 3. Buffer size requirement calculation in case 'S' does not account for=
 the
> -    padding byte ("size +=3D (size & 1) ;" happens after the calculation=
 which
> -    uses "size").
> - 4. Case 'S' can overrun the header buffer by 1 byte when no padding is
> -    involved
> -    ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;=
" while
> -    the buffer is only guaranteed to have "size" space available).
> - 5. "psf->header.ptr [psf->header.indx] =3D 0 ;" in case 'S' always writ=
es 1 byte
> -    beyond the space which is guaranteed to be allocated in the header b=
uffer.
> - 6. Case 's' can overrun the provided source string by 1 byte if padding=
 is
> -    involved ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, si=
ze) ;"
> -    where "size" is "strlen (strptr) + 1" (which includes the 0 terminat=
or,
> -    plus optionally another 1 which is padding and not guaranteed to be
> -    readable via the source string pointer).
> -
> -Closes: https://github.com/erikd/libsndfile/issues/292
> ----
> - src/common.c | 15 +++++++--------
> - 1 file changed, 7 insertions(+), 8 deletions(-)
> -
> -diff --git a/src/common.c b/src/common.c
> -index 1a6204ca..6b2a2ee9 100644
> ---- a/src/common.c
> -+++ b/src/common.c
> -@@ -681,16 +681,16 @@ psf_binheader_writef (SF_PRIVATE *psf, const char =
*format, ...)
> -                                       /* Write a C string (guaranteed t=
o have a zero terminator). */
> -                                       strptr =3D va_arg (argptr, char *=
) ;
> -                                       size =3D strlen (strptr) + 1 ;
> --                                      size +=3D (size & 1) ;
> -
> --                                      if (psf->header.indx + (sf_count_=
t) size >=3D psf->header.len && psf_bump_header_allocation (psf, 16))
> -+                                      if (psf->header.indx + 4 + (sf_co=
unt_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_=
allocation (psf, 4 + size + (size & 1)))
> -                                               return count ;
> -
> -                                       if (psf->rwf_endian =3D=3D SF_END=
IAN_BIG)
> --                                              header_put_be_int (psf, s=
ize) ;
> -+                                              header_put_be_int (psf, s=
ize + (size & 1)) ;
> -                                       else
> --                                              header_put_le_int (psf, s=
ize) ;
> -+                                              header_put_le_int (psf, s=
ize + (size & 1)) ;
> -                                       memcpy (&(psf->header.ptr [psf->h=
eader.indx]), strptr, size) ;
> -+                                      size +=3D (size & 1) ;
> -                                       psf->header.indx +=3D size ;
> -                                       psf->header.ptr [psf->header.indx=
 - 1] =3D 0 ;
> -                                       count +=3D 4 + size ;
> -@@ -703,16 +703,15 @@ psf_binheader_writef (SF_PRIVATE *psf, const char =
*format, ...)
> -                                       */
> -                                       strptr =3D va_arg (argptr, char *=
) ;
> -                                       size =3D strlen (strptr) ;
> --                                      if (psf->header.indx + (sf_count_=
t) size > psf->header.len && psf_bump_header_allocation (psf, size))
> -+                                      if (psf->header.indx + 4 + (sf_co=
unt_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_=
allocation (psf, 4 + size + (size & 1)))
> -                                               return count ;
> -                                       if (psf->rwf_endian =3D=3D SF_END=
IAN_BIG)
> -                                               header_put_be_int (psf, s=
ize) ;
> -                                       else
> -                                               header_put_le_int (psf, s=
ize) ;
> --                                      memcpy (&(psf->header.ptr [psf->h=
eader.indx]), strptr, size + 1) ;
> -+                                      memcpy (&(psf->header.ptr [psf->h=
eader.indx]), strptr, size + (size & 1)) ;
> -                                       size +=3D (size & 1) ;
> -                                       psf->header.indx +=3D size ;
> --                                      psf->header.ptr [psf->header.indx=
] =3D 0 ;
> -                                       count +=3D 4 + size ;
> -                                       break ;
> -
> -@@ -724,7 +723,7 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *f=
ormat, ...)
> -                                       size =3D (size & 1) ? size : size=
 + 1 ;
> -                                       size =3D (size > 254) ? 254 : siz=
e ;
> -
> --                                      if (psf->header.indx + (sf_count_=
t) size > psf->header.len && psf_bump_header_allocation (psf, size))
> -+                                      if (psf->header.indx + 1 + (sf_co=
unt_t) size > psf->header.len && psf_bump_header_allocation (psf, 1 + size)=
)
> -                                               return count ;
> -
> -                                       header_put_byte (psf, size) ;
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-1463=
4.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.pat=
ch
> deleted file mode 100644
> index 39b4ec1101..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 85c877d5072866aadbe8ed0c3e0590fbb5e16788 Mon Sep 17 00:00:00 2001
> -From: Fabian Greffrath <fabian@greffrath.com>
> -Date: Thu, 28 Sep 2017 12:15:04 +0200
> -Subject: [PATCH] double64_init: Check psf->sf.channels against upper bou=
nd
> -
> -This prevents division by zero later in the code.
> -
> -While the trivial case to catch this (i.e. sf.channels < 1) has already
> -been covered, a crafted file may report a number of channels that is
> -so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
> -miscalculated to zero (if this makes sense) in the determination of the
> -blockwidth. Since we only support a limited number of channels anyway,
> -make sure to check here as well.
> -
> -CVE: CVE-2017-14634
> -
> -Closes: https://github.com/erikd/libsndfile/issues/318
> -
> -Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/85=
c877d5072866aadbe8ed0c3e0590fbb5e16788]
> -
> -Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
> -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ----
> - src/double64.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/double64.c b/src/double64.c
> -index b318ea8..78dfef7 100644
> ---- a/src/double64.c
> -+++ b/src/double64.c
> -@@ -91,7 +91,7 @@ int
> - double64_init (SF_PRIVATE *psf)
> - {     static int double64_caps ;
> -
> --      if (psf->sf.channels < 1)
> -+      if (psf->sf.channels < 1 || psf->sf.channels > SF_MAX_CHANNELS)
> -       {       psf_log_printf (psf, "double64_init : internal error : ch=
annels =3D %d\n", psf->sf.channels) ;
> -               return SFE_INTERNAL ;
> -               } ;
> ---
> -2.13.3
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-6892=
.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-6892.patch
> deleted file mode 100644
> index 89552ac2d9..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-6892.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f833c53cb596e9e1792949f762e0b33661822748 Mon Sep 17 00:00:00 2001
> -From: Erik de Castro Lopo <erikd@mega-nerd.com>
> -Date: Tue, 23 May 2017 20:15:24 +1000
> -Subject: [PATCH] src/aiff.c: Fix a buffer read overflow
> -
> -Secunia Advisory SA76717.
> -
> -Found by: Laurent Delosieres, Secunia Research at Flexera Software
> -
> -CVE: CVE-2017-6892
> -Upstream-Status: Backport
> -
> -Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> -
> ----
> - src/aiff.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/aiff.c b/src/aiff.c
> -index 5b5f9f5..45864b7 100644
> ---- a/src/aiff.c
> -+++ b/src/aiff.c
> -@@ -1759,7 +1759,7 @@ aiff_read_chanmap (SF_PRIVATE * psf, unsigned dwor=
d)
> -               psf_binheader_readf (psf, "j", dword - bytesread) ;
> -
> -       if (map_info->channel_map !=3D NULL)
> --      {       size_t chanmap_size =3D psf->sf.channels * sizeof (psf->c=
hannel_map [0]) ;
> -+      {       size_t chanmap_size =3D SF_MIN (psf->sf.channels, layout_=
tag & 0xffff) * sizeof (psf->channel_map [0]) ;
> -
> -               free (psf->channel_map) ;
> -
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361=
-8365.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361-=
8365.patch
> deleted file mode 100644
> index ac99516bb3..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361-8365.p=
atch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From fd0484aba8e51d16af1e3a880f9b8b857b385eb3 Mon Sep 17 00:00:00 2001
> -From: Erik de Castro Lopo <erikd@mega-nerd.com>
> -Date: Wed, 12 Apr 2017 19:45:30 +1000
> -Subject: [PATCH] FLAC: Fix a buffer read overrun
> -
> -Buffer read overrun occurs when reading a FLAC file that switches
> -from 2 channels to one channel mid-stream. Only option is to
> -abort the read.
> -
> -Closes: https://github.com/erikd/libsndfile/issues/230
> -
> -CVE: CVE-2017-8361 CVE-2017-8365
> -
> -Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/fd=
0484aba8e51d16af1e3a880f9b8b857b385eb3]
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - src/common.h  |  1 +
> - src/flac.c    | 13 +++++++++++++
> - src/sndfile.c |  1 +
> - 3 files changed, 15 insertions(+)
> -
> -diff --git a/src/common.h b/src/common.h
> -index 0bd810c..e2669b6 100644
> ---- a/src/common.h
> -+++ b/src/common.h
> -@@ -725,6 +725,7 @@ enum
> -       SFE_FLAC_INIT_DECODER,
> -       SFE_FLAC_LOST_SYNC,
> -       SFE_FLAC_BAD_SAMPLE_RATE,
> -+      SFE_FLAC_CHANNEL_COUNT_CHANGED,
> -       SFE_FLAC_UNKOWN_ERROR,
> -
> -       SFE_WVE_NOT_WVE,
> -diff --git a/src/flac.c b/src/flac.c
> -index 84de0e2..986a7b8 100644
> ---- a/src/flac.c
> -+++ b/src/flac.c
> -@@ -434,6 +434,19 @@ sf_flac_meta_callback (const FLAC__StreamDecoder * =
UNUSED (decoder), const FLAC_
> -
> -       switch (metadata->type)
> -       {       case FLAC__METADATA_TYPE_STREAMINFO :
> -+                      if (psf->sf.channels > 0 && psf->sf.channels !=3D=
 (int) metadata->data.stream_info.channels)
> -+                      {       psf_log_printf (psf, "Error: FLAC stream =
changed from %d to %d channels\n"
> -+                                                                      "=
Nothing to be but to error out.\n" ,
> -+                                                                      p=
sf->sf.channels, metadata->data.stream_info.channels) ;
> -+                              psf->error =3D SFE_FLAC_CHANNEL_COUNT_CHA=
NGED ;
> -+                              return ;
> -+                              } ;
> -+
> -+                      if (psf->sf.channels > 0 && psf->sf.samplerate !=
=3D (int) metadata->data.stream_info.sample_rate)
> -+                      {       psf_log_printf (psf, "Warning: FLAC strea=
m changed sample rates from %d to %d.\n"
> -+                                                                      "=
Carrying on as if nothing happened.",
> -+                                                                      p=
sf->sf.samplerate, metadata->data.stream_info.sample_rate) ;
> -+                              } ;
> -                       psf->sf.channels =3D metadata->data.stream_info.c=
hannels ;
> -                       psf->sf.samplerate =3D metadata->data.stream_info=
.sample_rate ;
> -                       psf->sf.frames =3D metadata->data.stream_info.tot=
al_samples ;
> -diff --git a/src/sndfile.c b/src/sndfile.c
> -index 4187561..e2a87be 100644
> ---- a/src/sndfile.c
> -+++ b/src/sndfile.c
> -@@ -245,6 +245,7 @@ ErrorStruct SndfileErrors [] =3D
> -       {       SFE_FLAC_INIT_DECODER   , "Error : problem with initializ=
ation of the flac decoder." },
> -       {       SFE_FLAC_LOST_SYNC              , "Error : flac decoder l=
ost sync." },
> -       {       SFE_FLAC_BAD_SAMPLE_RATE, "Error : flac does not support =
this sample rate." },
> -+      {       SFE_FLAC_CHANNEL_COUNT_CHANGED, "Error : flac channel cha=
nged mid stream." },
> -       {       SFE_FLAC_UNKOWN_ERROR   , "Error : unknown error in flac =
decoder." },
> -
> -       {       SFE_WVE_NOT_WVE                 , "Error : not a WVE file=
." },
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8362=
.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8362.patch
> deleted file mode 100644
> index 9ee7e46a6d..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8362.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From ef1dbb2df1c0e741486646de40bd638a9c4cd808 Mon Sep 17 00:00:00 2001
> -From: Erik de Castro Lopo <erikd@mega-nerd.com>
> -Date: Fri, 14 Apr 2017 15:19:16 +1000
> -Subject: [PATCH] src/flac.c: Fix a buffer read overflow
> -
> -A file (generated by a fuzzer) which increased the number of channels
> -from one frame to the next could cause a read beyond the end of the
> -buffer provided by libFLAC. Only option is to abort the read.
> -
> -Closes: https://github.com/erikd/libsndfile/issues/231
> -
> -CVE: CVE-2017-8362
> -
> -Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/ef=
1dbb2df1c0e741486646de40bd638a9c4cd808]
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - src/flac.c | 11 +++++++++--
> - 1 file changed, 9 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/flac.c b/src/flac.c
> -index 5a4f8c2..e4f9aaa 100644
> ---- a/src/flac.c
> -+++ b/src/flac.c
> -@@ -169,6 +169,14 @@ flac_buffer_copy (SF_PRIVATE *psf)
> -       const int32_t* const *buffer =3D pflac->wbuffer ;
> -       unsigned i =3D 0, j, offset, channels, len ;
> -
> -+      if (psf->sf.channels !=3D (int) frame->header.channels)
> -+      {       psf_log_printf (psf, "Error: FLAC frame changed from %d t=
o %d channels\n"
> -+                                                                      "=
Nothing to do but to error out.\n" ,
> -+                                                                      p=
sf->sf.channels, frame->header.channels) ;
> -+              psf->error =3D SFE_FLAC_CHANNEL_COUNT_CHANGED ;
> -+              return 0 ;
> -+              } ;
> -+
> -       /*
> -       **      frame->header.blocksize is variable and we're using a con=
stant blocksize
> -       **      of FLAC__MAX_BLOCK_SIZE.
> -@@ -202,7 +210,6 @@ flac_buffer_copy (SF_PRIVATE *psf)
> -               return 0 ;
> -               } ;
> -
> --
> -       len =3D SF_MIN (pflac->len, frame->header.blocksize) ;
> -
> -       if (pflac->remain % channels !=3D 0)
> -@@ -436,7 +443,7 @@ sf_flac_meta_callback (const FLAC__StreamDecoder * U=
NUSED (decoder), const FLAC_
> -       {       case FLAC__METADATA_TYPE_STREAMINFO :
> -                       if (psf->sf.channels > 0 && psf->sf.channels !=3D=
 (int) metadata->data.stream_info.channels)
> -                       {       psf_log_printf (psf, "Error: FLAC stream =
changed from %d to %d channels\n"
> --                                                                      "=
Nothing to be but to error out.\n" ,
> -+                                                                      "=
Nothing to do but to error out.\n" ,
> -                                                                       p=
sf->sf.channels, metadata->data.stream_info.channels) ;
> -                               psf->error =3D SFE_FLAC_CHANNEL_COUNT_CHA=
NGED ;
> -                               return ;
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363=
.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363.patch
> deleted file mode 100644
> index e526e5a346..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From cd7da8dbf6ee4310d21d9e44b385d6797160d9e8 Mon Sep 17 00:00:00 2001
> -From: Erik de Castro Lopo <erikd@mega-nerd.com>
> -Date: Wed, 12 Apr 2017 20:19:34 +1000
> -Subject: [PATCH] src/flac.c: Fix another memory leak
> -
> -When the FLAC decoder was passed a malformed file, the associated
> -`FLAC__StreamDecoder` object was not getting released.
> -
> -Closes: https://github.com/erikd/libsndfile/issues/233
> -
> -CVE: CVE-2017-8363
> -
> -Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/cd=
7da8dbf6ee4310d21d9e44b385d6797160d9e8]
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - src/flac.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/flac.c b/src/flac.c
> -index 986a7b8..5a4f8c2 100644
> ---- a/src/flac.c
> -+++ b/src/flac.c
> -@@ -841,7 +841,9 @@ flac_read_header (SF_PRIVATE *psf)
> -
> -       psf_log_printf (psf, "End\n") ;
> -
> --      if (psf->error =3D=3D 0)
> -+      if (psf->error !=3D 0)
> -+              FLAC__stream_decoder_delete (pflac->fsd) ;
> -+      else
> -       {       FLAC__uint64 position ;
> -
> -               FLAC__stream_decoder_get_decode_position (pflac->fsd, &po=
sition) ;
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-1313=
9.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.pat=
ch
> deleted file mode 100644
> index 707373d414..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -CVE: CVE-2018-13139
> -Upstream-Status: Backport [9dc989eb89cd697e19897afa616d6ab0debe4822]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 9dc989eb89cd697e19897afa616d6ab0debe4822 Mon Sep 17 00:00:00 2001
> -From: "Brett T. Warden" <brett.t.warden@intel.com>
> -Date: Tue, 28 Aug 2018 12:01:17 -0700
> -Subject: [PATCH] Check MAX_CHANNELS in sndfile-deinterleave
> -
> -Allocated buffer has space for only 16 channels. Verify that input file
> -meets this limit.
> -
> -Fixes #397
> ----
> - programs/sndfile-deinterleave.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/programs/sndfile-deinterleave.c b/programs/sndfile-deinterl=
eave.c
> -index e27593e2..cb497e1f 100644
> ---- a/programs/sndfile-deinterleave.c
> -+++ b/programs/sndfile-deinterleave.c
> -@@ -89,6 +89,13 @@ main (int argc, char **argv)
> -               exit (1) ;
> -               } ;
> -
> -+      if (sfinfo.channels > MAX_CHANNELS)
> -+      {       printf ("\nError : Input file '%s' has too many (%d) chan=
nels. Limit is %d.\n",
> -+                      argv [1], sfinfo.channels, MAX_CHANNELS) ;
> -+              exit (1) ;
> -+              } ;
> -+
> -+
> -       state.channels =3D sfinfo.channels ;
> -       sfinfo.channels =3D 1 ;
> -
> ---
> -2.11.0
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-1943=
2.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.pat=
ch
> deleted file mode 100644
> index 8ded2c0f85..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch
> +++ /dev/null
> @@ -1,115 +0,0 @@
> -From 6f3266277bed16525f0ac2f0f03ff4626f1923e5 Mon Sep 17 00:00:00 2001
> -From: Erik de Castro Lopo <erikd@mega-nerd.com>
> -Date: Thu, 8 Mar 2018 18:00:21 +1100
> -Subject: [PATCH] Fix max channel count bug
> -
> -The code was allowing files to be written with a channel count of exactl=
y
> -`SF_MAX_CHANNELS` but was failing to read some file formats with the sam=
e
> -channel count.
> -
> -Upstream-Status: Backport [https://github.com/erikd/libsndfile/
> -commit/6f3266277bed16525f0ac2f0f03ff4626f1923e5]
> -
> -CVE: CVE-2018-19432
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> ----
> - src/aiff.c |    6 +++---
> - src/rf64.c |    4 ++--
> - src/w64.c  |    4 ++--
> - src/wav.c  |    4 ++--
> - 4 files changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/src/aiff.c b/src/aiff.c
> -index fbd43cb..6386bce 100644
> ---- a/src/aiff.c
> -+++ b/src/aiff.c
> -@@ -1,5 +1,5 @@
> - /*
> --** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
> -+** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
> - ** Copyright (C) 2005 David Viens <davidv@plogue.com>
> - **
> - ** This program is free software; you can redistribute it and/or modify
> -@@ -950,7 +950,7 @@ aiff_read_header (SF_PRIVATE *psf, COMM_
> -       if (psf->sf.channels < 1)
> -               return SFE_CHANNEL_COUNT_ZERO ;
> -
> --      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
> -+      if (psf->sf.channels > SF_MAX_CHANNELS)
> -               return SFE_CHANNEL_COUNT ;
> -
> -       if (! (found_chunk & HAVE_FORM))
> -@@ -1030,7 +1030,7 @@ aiff_read_comm_chunk (SF_PRIVATE *psf, C
> -       psf_log_printf (psf, "  Sample Rate : %d\n", samplerate) ;
> -       psf_log_printf (psf, "  Frames      : %u%s\n", comm_fmt->numSampl=
eFrames, (comm_fmt->numSampleFrames =3D=3D 0 && psf->filelength > 104) ? " =
(Should not be 0)" : "") ;
> -
> --      if (comm_fmt->numChannels < 1 || comm_fmt->numChannels >=3D SF_MA=
X_CHANNELS)
> -+      if (comm_fmt->numChannels < 1 || comm_fmt->numChannels > SF_MAX_C=
HANNELS)
> -       {       psf_log_printf (psf, "  Channels    : %d (should be >=3D =
1 and < %d)\n", comm_fmt->numChannels, SF_MAX_CHANNELS) ;
> -               return SFE_CHANNEL_COUNT_BAD ;
> -               } ;
> -diff --git a/src/rf64.c b/src/rf64.c
> -index d57f0f3..876cd45 100644
> ---- a/src/rf64.c
> -+++ b/src/rf64.c
> -@@ -1,5 +1,5 @@
> - /*
> --** Copyright (C) 2008-2017 Erik de Castro Lopo <erikd@mega-nerd.com>
> -+** Copyright (C) 2008-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
> - ** Copyright (C) 2009      Uli Franke <cls@nebadje.org>
> - **
> - ** This program is free software; you can redistribute it and/or modify
> -@@ -382,7 +382,7 @@ rf64_read_header (SF_PRIVATE *psf, int *
> -       if (psf->sf.channels < 1)
> -               return SFE_CHANNEL_COUNT_ZERO ;
> -
> --      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
> -+      if (psf->sf.channels > SF_MAX_CHANNELS)
> -               return SFE_CHANNEL_COUNT ;
> -
> -       /* WAVs can be little or big endian */
> -diff --git a/src/w64.c b/src/w64.c
> -index 939b716..a37d2c5 100644
> ---- a/src/w64.c
> -+++ b/src/w64.c
> -@@ -1,5 +1,5 @@
> - /*
> --** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
> -+** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
> - **
> - ** This program is free software; you can redistribute it and/or modify
> - ** it under the terms of the GNU Lesser General Public License as publi=
shed by
> -@@ -383,7 +383,7 @@ w64_read_header    (SF_PRIVATE *psf, int *b
> -       if (psf->sf.channels < 1)
> -               return SFE_CHANNEL_COUNT_ZERO ;
> -
> --      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
> -+      if (psf->sf.channels > SF_MAX_CHANNELS)
> -               return SFE_CHANNEL_COUNT ;
> -
> -       psf->endian =3D SF_ENDIAN_LITTLE ;                /* All W64 file=
s are little endian. */
> -diff --git a/src/wav.c b/src/wav.c
> -index 7bd97bc..dc97545 100644
> ---- a/src/wav.c
> -+++ b/src/wav.c
> -@@ -1,5 +1,5 @@
> - /*
> --** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
> -+** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
> - ** Copyright (C) 2004-2005 David Viens <davidv@plogue.com>
> - **
> - ** This program is free software; you can redistribute it and/or modify
> -@@ -627,7 +627,7 @@ wav_read_header    (SF_PRIVATE *psf, int *b
> -       if (psf->sf.channels < 1)
> -               return SFE_CHANNEL_COUNT_ZERO ;
> -
> --      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
> -+      if (psf->sf.channels > SF_MAX_CHANNELS)
> -               return SFE_CHANNEL_COUNT ;
> -
> -       if (format !=3D WAVE_FORMAT_PCM && (parsestage & HAVE_fact) =3D=
=3D 0)
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-1975=
8.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.pat=
ch
> deleted file mode 100644
> index c3586f9dfc..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -There is a heap-based buffer over-read at wav.c in wav_write_header in
> -libsndfile 1.0.28 that will cause a denial of service.
> -
> -CVE: CVE-2018-19758
> -Upstream-Status: Backport [42132c543358cee9f7c3e9e9b15bb6c1063a608e]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From c12173b0197dd0c5cfa2cd27977e982d2ae59486 Mon Sep 17 00:00:00 2001
> -From: Erik de Castro Lopo <erikd@mega-nerd.com>
> -Date: Tue, 1 Jan 2019 20:11:46 +1100
> -Subject: [PATCH] src/wav.c: Fix heap read overflow
> -
> -This is CVE-2018-19758.
> -
> -Closes: https://github.com/erikd/libsndfile/issues/435
> ----
> - src/wav.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/wav.c b/src/wav.c
> -index e8405b55..6fb94ae8 100644
> ---- a/src/wav.c
> -+++ b/src/wav.c
> -@@ -1094,6 +1094,8 @@ wav_write_header (SF_PRIVATE *psf, int calc_length=
)
> -               psf_binheader_writef (psf, "44", 0, 0) ; /* SMTPE format =
*/
> -               psf_binheader_writef (psf, "44", psf->instrument->loop_co=
unt, 0) ;
> -
> -+              /* Loop count is signed 16 bit number so we limit it rang=
e to something sensible. */
> -+              psf->instrument->loop_count &=3D 0x7fff ;
> -               for (tmp =3D 0 ; tmp < psf->instrument->loop_count ; tmp+=
+)
> -               {       int type ;
> -
> ---
> -2.11.0
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832=
.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
> deleted file mode 100644
> index ab37211399..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 43886efc408c21e1e329086ef70c88860310f25b Mon Sep 17 00:00:00 2001
> -From: Emilio Pozuelo Monfort <pochu27@gmail.com>
> -Date: Tue, 5 Mar 2019 11:27:17 +0100
> -Subject: [PATCH] wav_write_header: don't read past the array end
> -
> -CVE-2018-19758 wasn't entirely fixed in the fix, so fix it harder.
> -
> -CVE: CVE-2019-3832
> -Upstream-Status: Backport [7408c4c788ce047d4e652b60a04e7796bcd7267e]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -If loop_count is bigger than the array, truncate it to the array
> -length (and not to 32k).
> -
> -CVE-2019-3832
> -
> ----
> - src/wav.c | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/wav.c b/src/wav.c
> -index daae3cc..8851549 100644
> ---- a/src/wav.c
> -+++ b/src/wav.c
> -@@ -1094,8 +1094,10 @@ wav_write_header (SF_PRIVATE *psf, int calc_lengt=
h)
> -               psf_binheader_writef (psf, "44", 0, 0) ; /* SMTPE format =
*/
> -               psf_binheader_writef (psf, "44", psf->instrument->loop_co=
unt, 0) ;
> -
> --              /* Loop count is signed 16 bit number so we limit it rang=
e to something sensible. */
> --              psf->instrument->loop_count &=3D 0x7fff ;
> -+              /* Make sure we don't read past the loops array end. */
> -+              if (psf->instrument->loop_count > ARRAY_LEN (psf->instrum=
ent->loops))
> -+                      psf->instrument->loop_count =3D ARRAY_LEN (psf->i=
nstrument->loops) ;
> -+
> -               for (tmp =3D 0 ; tmp < psf->instrument->loop_count ; tmp+=
+)
> -               {       int type ;
> -
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/m=
eta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> deleted file mode 100644
> index b8e703d084..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -SUMMARY =3D "Audio format Conversion library"
> -DESCRIPTION =3D "Library for reading and writing files containing sample=
d \
> -sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
> -one standard library interface."
> -HOMEPAGE =3D "http://www.mega-nerd.com/libsndfile"
> -AUTHOR =3D "Erik de Castro Lopo"
> -DEPENDS =3D "flac libogg libvorbis"
> -SECTION =3D "libs/multimedia"
> -LICENSE =3D "LGPL-2.1-only"
> -
> -SRC_URI =3D "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.=
tar.gz \
> -           file://CVE-2017-6892.patch \
> -           file://CVE-2017-8361-8365.patch \
> -           file://CVE-2017-8362.patch \
> -           file://CVE-2017-8363.patch \
> -           file://CVE-2017-14634.patch \
> -           file://CVE-2018-13139.patch \
> -           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
> -           file://CVE-2018-19432.patch \
> -           file://CVE-2017-12562.patch \
> -           file://CVE-2018-19758.patch \
> -           file://CVE-2019-3832.patch \
> -          "
> -
> -SRC_URI[md5sum] =3D "646b5f98ce89ac60cdb060fcd398247c"
> -SRC_URI[sha256sum] =3D "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686=
c55092d1e5a9dfa9"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De77fe93202736b47c07035910f479=
74a"
> -
> -CVE_PRODUCT =3D "libsndfile"
> -
> -S =3D "${WORKDIR}/libsndfile-${PV}"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
> -PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> -PACKAGECONFIG[regtest] =3D "--enable-sqlite,--disable-sqlite,sqlite3"
> -
> -inherit autotools lib_package pkgconfig multilib_header
> -
> -do_install:append() {
> -    oe_multilib_header sndfile.h
> -}
> -
> -# This can't be replicated and is just a memory leak.
> -# https://github.com/erikd/libsndfile/issues/398
> -CVE_CHECK_IGNORE +=3D "CVE-2018-13419"
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/m=
eta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
> new file mode 100644
> index 0000000000..8430dee103
> --- /dev/null
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "Audio format Conversion library"
> +DESCRIPTION =3D "Library for reading and writing files containing sample=
d \
> +sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
> +one standard library interface."
> +HOMEPAGE =3D "https://libsndfile.github.io/libsndfile/"
> +AUTHOR =3D "Erik de Castro Lopo"
> +DEPENDS =3D "flac libogg libvorbis"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "LGPL-2.1-only"
> +
> +SRC_URI =3D "https://github.com/libsndfile/libsndfile/releases/download/=
${PV}/libsndfile-${PV}.tar.bz2 \
> +          "
> +
> +SRC_URI[md5sum] =3D "3f3b2a86a032f064ef922a2c8c191f7b"
> +SRC_URI[sha256sum] =3D "a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b4=
0bf77e751cc02163"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De77fe93202736b47c07035910f479=
74a"
> +
> +CVE_PRODUCT =3D "libsndfile"
> +
> +S =3D "${WORKDIR}/libsndfile-${PV}"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[regtest] =3D "--enable-sqlite,--disable-sqlite,sqlite3"
> +
> +inherit autotools lib_package pkgconfig multilib_header
> +
> +do_install:append() {
> +    oe_multilib_header sndfile.h
> +}
> --
> 2.25.1
>

