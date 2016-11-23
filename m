Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 33C5271AA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 16:05:09 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id p16so15643020qta.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 08:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=64jRHNx/lA7aD/078rYreWwHs7pwGQUCsby8Kg2UIZk=;
	b=YL4dDxdG1ST7vCjxB/MhTihrCSm9e8yvNbXYuOI/JfgrXN9hIqnt/F8mR9PJliX2IX
	LfVSHsKx2QYwfN0fHXke8Ut41/8e4z8U3GQGuLXNJ5Ba0ayXCmdY7Va7cvANldUtMZ14
	2R0TOZD1q+sf0NwNRVXbhA6zDxcHxPmIXoJG+fha0rb4YI3xuFwhjN0zQnOc57A+HIix
	TnHPeQdCJ8mxxEq/iK7Cim5Vrxnld792ncoxxBLBnbO1cUj510z+PZFqIdbddeZrH20y
	JSPZzjUnq9k4nxxN5jxRUJCqaWWf5DpjVa3bJuAQpFngtd6/9MZI1wTgponH4X+fnX57
	yXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=64jRHNx/lA7aD/078rYreWwHs7pwGQUCsby8Kg2UIZk=;
	b=IkXi6tFmfmSScIsFpnSt1BdibO0B8aeR6+weeC+xFbDBwXxUe+1QdyqsL5OaEgsrg1
	V3pMx9i7LegjVnxZZeQfF/Lx2IeNKqk7wdy3gm4Iu5ilZcwgfkBN57pFvCS/8R8SwiTh
	YtHWh5KVwhdV+0I4H4M4wIgVIYAeZda/Jcj1EIo9rFZ3XQvpQHiuOWsfDWK3hmEb4yoR
	IdKbQGII7ipIXKbItJ2pAIT83r6mXl+xLljLvi+c2RpK4fdufuWQ3eOpq1YEtPV2lYfU
	xmj+sugHWX2ajQqPF/zvc36IEgy7oTMPpMppBJWIQm8Q/graepEVVlVu8NHGfR2ND3L7
	gChQ==
X-Gm-Message-State: AKaTC03wARXcDUYRqvaZQUMfK1MLMF3XGIHHT2q++YyZEB70bPc31iuvde7qJaKsfrExfVSiL1e+Y27U09DxNiSF
X-Received: by 10.200.57.54 with SMTP id s51mr3103674qtb.68.1479917110714;
	Wed, 23 Nov 2016 08:05:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 23 Nov 2016 08:04:50 -0800 (PST)
In-Reply-To: <61bcea65-f891-2914-27a4-e788fc517cde@gmail.com>
References: <1479792499-19369-1-git-send-email-akuster@mvista.com>
	<61bcea65-f891-2914-27a4-e788fc517cde@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Nov 2016 16:04:50 +0000
Message-ID: <CAJTo0Lbu=AFNagERvJ55T1Lo6b4NotWiXSGn8pXgWJEBXJmEbA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, 
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, 
	Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Master][PATCH] libtiff: Update to 4.0.7
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
X-List-Received-Date: Wed, 23 Nov 2016 16:05:10 -0000
Content-Type: multipart/alternative; boundary=001a113a01e8aeaaeb0541fa0db8

--001a113a01e8aeaaeb0541fa0db8
Content-Type: text/plain; charset=UTF-8

CCing Leo and Jose who have been working on this.

Ross

On 23 November 2016 at 15:32, akuster808 <akuster808@gmail.com> wrote:

> The never made into patchwork. is there a bug there ? is there an issue on
> how I submitted?
>
> - armin
>
>
> On 11/21/2016 09:28 PM, Armin Kuster wrote:
>
>> Major changes:
>> The libtiff tools bmp2tiff, gif2tiff, ras2tiff, sgi2tiff, sgisv, and
>> ycbcr are completely removed from the distribution, used for demos.
>>
>> CVEs fixed:
>> CVE-2016-9297
>> CVE-2016-9448
>> CVE-2016-9273
>> CVE-2014-8127
>> CVE-2016-3658
>> CVE-2016-5875
>> CVE-2016-5652
>> CVE-2016-3632
>>
>> plus more that are not identified in the changelog.
>>
>> removed patches integrated into update.
>> more info: http://libtiff.maptools.org/v4.0.7.html
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   .../libtiff/files/CVE-2015-8665_8683.patch         | 137
>> ---------------
>>   .../libtiff/files/CVE-2015-8781.patch              | 195
>> ---------------------
>>   .../libtiff/files/CVE-2015-8784.patch              |  73 --------
>>   .../libtiff/files/CVE-2016-3186.patch              |  24 ---
>>   .../libtiff/files/CVE-2016-3622.patch              | 129 --------------
>>   .../libtiff/files/CVE-2016-3623.patch              |  52 ------
>>   .../libtiff/files/CVE-2016-3945.patch              | 118 -------------
>>   .../libtiff/files/CVE-2016-3990.patch              |  66 -------
>>   .../libtiff/files/CVE-2016-3991.patch              | 147
>> ----------------
>>   .../libtiff/files/CVE-2016-5321.patch              |  49 ------
>>   .../libtiff/files/CVE-2016-5323.patch              | 107 -----------
>>   .../libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb}       |  15 +-
>>   12 files changed, 2 insertions(+), 1110 deletions(-)
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2015-8665_8683.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2015-8781.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2015-8784.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-3186.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-3622.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-3623.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-3945.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-3990.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-3991.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-5321.patch
>>   delete mode 100644 meta/recipes-multimedia/libtif
>> f/files/CVE-2016-5323.patch
>>   rename meta/recipes-multimedia/libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb}
>> (74%)
>>
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
>> deleted file mode 100644
>> index 39c5059..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
>> +++ /dev/null
>> @@ -1,137 +0,0 @@
>> -From f94a29a822f5528d2334592760fbb7938f15eb55 Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Sat, 26 Dec 2015 17:32:03 +0000
>> -Subject: [PATCH] * libtiff/tif_getimage.c: fix out-of-bound reads in
>> - TIFFRGBAImage interface in case of unsupported values of
>> - SamplesPerPixel/ExtraSamples for LogLUV / CIELab. Add explicit call to
>> - TIFFRGBAImageOK() in TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by
>> - limingxing and CVE-2015-8683 reported by zzf of Alibaba.
>> -
>> -Upstream-Status: Backport
>> -CVE: CVE-2015-8665
>> -CVE: CVE-2015-8683
>> -https://github.com/vadz/libtiff/commit/f94a29a822f5528d2334
>> 592760fbb7938f15eb55
>> -
>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>> -
>> ----
>> - ChangeLog              |  8 ++++++++
>> - libtiff/tif_getimage.c | 35 ++++++++++++++++++++++-------------
>> - 2 files changed, 30 insertions(+), 13 deletions(-)
>> -
>> -Index: tiff-4.0.6/libtiff/tif_getimage.c
>> -===================================================================
>> ---- tiff-4.0.6.orig/libtiff/tif_getimage.c
>> -+++ tiff-4.0.6/libtiff/tif_getimage.c
>> -@@ -182,20 +182,22 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[102
>> -                                   "Planarconfiguration",
>> td->td_planarconfig);
>> -                               return (0);
>> -                       }
>> --                      if( td->td_samplesperpixel != 3 )
>> -+                      if( td->td_samplesperpixel != 3 || colorchannels
>> != 3 )
>> -             {
>> -                 sprintf(emsg,
>> --                        "Sorry, can not handle image with %s=%d",
>> --                        "Samples/pixel", td->td_samplesperpixel);
>> -+                        "Sorry, can not handle image with %s=%d, %s=%d",
>> -+                        "Samples/pixel", td->td_samplesperpixel,
>> -+                        "colorchannels", colorchannels);
>> -                 return 0;
>> -             }
>> -                       break;
>> -               case PHOTOMETRIC_CIELAB:
>> --            if( td->td_samplesperpixel != 3 || td->td_bitspersample !=
>> 8 )
>> -+            if( td->td_samplesperpixel != 3 || colorchannels != 3 ||
>> td->td_bitspersample != 8 )
>> -             {
>> -                 sprintf(emsg,
>> --                        "Sorry, can not handle image with %s=%d and
>> %s=%d",
>> -+                        "Sorry, can not handle image with %s=%d, %s=%d
>> and %s=%d",
>> -                         "Samples/pixel", td->td_samplesperpixel,
>> -+                        "colorchannels", colorchannels,
>> -                         "Bits/sample", td->td_bitspersample);
>> -                 return 0;
>> -             }
>> -@@ -255,6 +257,9 @@ TIFFRGBAImageBegin(TIFFRGBAImage* img, T
>> -       int colorchannels;
>> -       uint16 *red_orig, *green_orig, *blue_orig;
>> -       int n_color;
>> -+
>> -+      if( !TIFFRGBAImageOK(tif, emsg) )
>> -+              return 0;
>> -
>> -       /* Initialize to normal values */
>> -       img->row_offset = 0;
>> -@@ -2508,29 +2513,33 @@ PickContigCase(TIFFRGBAImage* img)
>> -               case PHOTOMETRIC_RGB:
>> -                       switch (img->bitspersample) {
>> -                               case 8:
>> --                                      if (img->alpha ==
>> EXTRASAMPLE_ASSOCALPHA)
>> -+                                      if (img->alpha ==
>> EXTRASAMPLE_ASSOCALPHA &&
>> -+                                              img->samplesperpixel >= 4)
>> -                                               img->put.contig =
>> putRGBAAcontig8bittile;
>> --                                      else if (img->alpha ==
>> EXTRASAMPLE_UNASSALPHA)
>> -+                                      else if (img->alpha ==
>> EXTRASAMPLE_UNASSALPHA &&
>> -+
>>  img->samplesperpixel >= 4)
>> -                                       {
>> -                                               if (BuildMapUaToAa(img))
>> -                                                       img->put.contig =
>> putRGBUAcontig8bittile;
>> -                                       }
>> --                                      else
>> -+                                      else if( img->samplesperpixel >=
>> 3 )
>> -                                               img->put.contig =
>> putRGBcontig8bittile;
>> -                                       break;
>> -                               case 16:
>> --                                      if (img->alpha ==
>> EXTRASAMPLE_ASSOCALPHA)
>> -+                                      if (img->alpha ==
>> EXTRASAMPLE_ASSOCALPHA &&
>> -+                                              img->samplesperpixel >=4 )
>> -                                       {
>> -                                               if
>> (BuildMapBitdepth16To8(img))
>> -                                                       img->put.contig =
>> putRGBAAcontig16bittile;
>> -                                       }
>> --                                      else if (img->alpha ==
>> EXTRASAMPLE_UNASSALPHA)
>> -+                                      else if (img->alpha ==
>> EXTRASAMPLE_UNASSALPHA &&
>> -+
>>  img->samplesperpixel >=4 )
>> -                                       {
>> -                                               if
>> (BuildMapBitdepth16To8(img) &&
>> -                                                   BuildMapUaToAa(img))
>> -                                                       img->put.contig =
>> putRGBUAcontig16bittile;
>> -                                       }
>> --                                      else
>> -+                                      else if( img->samplesperpixel >=3
>> )
>> -                                       {
>> -                                               if
>> (BuildMapBitdepth16To8(img))
>> -                                                       img->put.contig =
>> putRGBcontig16bittile;
>> -@@ -2539,7 +2548,7 @@ PickContigCase(TIFFRGBAImage* img)
>> -                       }
>> -                       break;
>> -               case PHOTOMETRIC_SEPARATED:
>> --                      if (buildMap(img)) {
>> -+                      if (img->samplesperpixel >=4 && buildMap(img)) {
>> -                               if (img->bitspersample == 8) {
>> -                                       if (!img->Map)
>> -                                               img->put.contig =
>> putRGBcontig8bitCMYKtile;
>> -@@ -2635,7 +2644,7 @@ PickContigCase(TIFFRGBAImage* img)
>> -                       }
>> -                       break;
>> -               case PHOTOMETRIC_CIELAB:
>> --                      if (buildMap(img)) {
>> -+                      if (img->samplesperpixel == 3 && buildMap(img)) {
>> -                               if (img->bitspersample == 8)
>> -                                       img->put.contig =
>> initCIELabConversion(img);
>> -                               break;
>> -Index: tiff-4.0.6/ChangeLog
>> -===================================================================
>> ---- tiff-4.0.6.orig/ChangeLog
>> -+++ tiff-4.0.6/ChangeLog
>> -@@ -1,3 +1,11 @@
>> -+2015-12-26  Even Rouault <even.rouault at spatialys.com>
>> -+
>> -+   * libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBAImage
>> -+   interface in case of unsupported values of
>> SamplesPerPixel/ExtraSamples
>> -+   for LogLUV / CIELab. Add explicit call to TIFFRGBAImageOK() in
>> -+   TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by limingxing and
>> -+   CVE-2015-8683 reported by zzf of Alibaba.
>> -+
>> - 2015-09-12  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
>> -
>> -       * libtiff 4.0.6 released.
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>> deleted file mode 100644
>> index 0846f0f..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>> +++ /dev/null
>> @@ -1,195 +0,0 @@
>> -From aaab5c3c9d2a2c6984f23ccbc79702610439bc65 Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Sun, 27 Dec 2015 16:25:11 +0000
>> -Subject: [PATCH] * libtiff/tif_luv.c: fix potential out-of-bound writes
>> in
>> - decode functions in non debug builds by replacing assert()s by regular
>> if
>> - checks (bugzilla #2522). Fix potential out-of-bound reads in case of
>> short
>> - input data.
>> -
>> -Upstream-Status: Backport
>> -
>> -https://github.com/vadz/libtiff/commit/aaab5c3c9d2a2c6984f2
>> 3ccbc79702610439bc65
>> -hand applied Changelog changes
>> -
>> -CVE: CVE-2015-8781
>> -
>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ----
>> - ChangeLog         |  7 +++++++
>> - libtiff/tif_luv.c | 55 ++++++++++++++++++++++++++++++
>> ++++++++++++++-----------
>> - 2 files changed, 51 insertions(+), 11 deletions(-)
>> -
>> -Index: tiff-4.0.4/ChangeLog
>> -===================================================================
>> ---- tiff-4.0.4.orig/ChangeLog
>> -+++ tiff-4.0.4/ChangeLog
>> -@@ -1,3 +1,10 @@
>> -+2015-12-27  Even Rouault <even.rouault at spatialys.com>
>> -+
>> -+      * libtiff/tif_luv.c: fix potential out-of-bound writes in decode
>> -+      functions in non debug builds by replacing assert()s by regular if
>> -+      checks (bugzilla #2522).
>> -+      Fix potential out-of-bound reads in case of short input data.
>> -+
>> - 2015-12-26  Even Rouault <even.rouault at spatialys.com>
>> -
>> -       * libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBAImage
>> -Index: tiff-4.0.4/libtiff/tif_luv.c
>> -===================================================================
>> ---- tiff-4.0.4.orig/libtiff/tif_luv.c
>> -+++ tiff-4.0.4/libtiff/tif_luv.c
>> -@@ -202,7 +202,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
>> -       if (sp->user_datafmt == SGILOGDATAFMT_16BIT)
>> -               tp = (int16*) op;
>> -       else {
>> --              assert(sp->tbuflen >= npixels);
>> -+              if(sp->tbuflen < npixels) {
>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>> -+                                               "Translation buffer too
>> short");
>> -+                      return (0);
>> -+              }
>> -               tp = (int16*) sp->tbuf;
>> -       }
>> -       _TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0]));
>> -@@ -211,9 +215,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
>> -       cc = tif->tif_rawcc;
>> -       /* get each byte string */
>> -       for (shft = 2*8; (shft -= 8) >= 0; ) {
>> --              for (i = 0; i < npixels && cc > 0; )
>> -+              for (i = 0; i < npixels && cc > 0; ) {
>> -                       if (*bp >= 128) {               /* run */
>> --                              rc = *bp++ + (2-128);   /* TODO:
>> potential input buffer overrun when decoding corrupt or truncated data */
>> -+                              if( cc < 2 )
>> -+                                      break;
>> -+                              rc = *bp++ + (2-128);
>> -                               b = (int16)(*bp++ << shft);
>> -                               cc -= 2;
>> -                               while (rc-- && i < npixels)
>> -@@ -223,6 +229,7 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
>> -                               while (--cc && rc-- && i < npixels)
>> -                                       tp[i++] |= (int16)*bp++ << shft;
>> -                       }
>> -+              }
>> -               if (i != npixels) {
>> - #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
>> -                       TIFFErrorExt(tif->tif_clientdata, module,
>> -@@ -268,13 +275,17 @@ LogLuvDecode24(TIFF* tif, uint8* op, tms
>> -       if (sp->user_datafmt == SGILOGDATAFMT_RAW)
>> -               tp = (uint32 *)op;
>> -       else {
>> --              assert(sp->tbuflen >= npixels);
>> -+              if(sp->tbuflen < npixels) {
>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>> -+                                               "Translation buffer too
>> short");
>> -+                      return (0);
>> -+              }
>> -               tp = (uint32 *) sp->tbuf;
>> -       }
>> -       /* copy to array of uint32 */
>> -       bp = (unsigned char*) tif->tif_rawcp;
>> -       cc = tif->tif_rawcc;
>> --      for (i = 0; i < npixels && cc > 0; i++) {
>> -+      for (i = 0; i < npixels && cc >= 3; i++) {
>> -               tp[i] = bp[0] << 16 | bp[1] << 8 | bp[2];
>> -               bp += 3;
>> -               cc -= 3;
>> -@@ -325,7 +336,11 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
>> -       if (sp->user_datafmt == SGILOGDATAFMT_RAW)
>> -               tp = (uint32*) op;
>> -       else {
>> --              assert(sp->tbuflen >= npixels);
>> -+              if(sp->tbuflen < npixels) {
>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>> -+                                               "Translation buffer too
>> short");
>> -+                      return (0);
>> -+              }
>> -               tp = (uint32*) sp->tbuf;
>> -       }
>> -       _TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0]));
>> -@@ -334,11 +349,13 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
>> -       cc = tif->tif_rawcc;
>> -       /* get each byte string */
>> -       for (shft = 4*8; (shft -= 8) >= 0; ) {
>> --              for (i = 0; i < npixels && cc > 0; )
>> -+              for (i = 0; i < npixels && cc > 0; ) {
>> -                       if (*bp >= 128) {               /* run */
>> -+                              if( cc < 2 )
>> -+                                      break;
>> -                               rc = *bp++ + (2-128);
>> -                               b = (uint32)*bp++ << shft;
>> --                              cc -= 2;                /* TODO:
>> potential input buffer overrun when decoding corrupt or truncated data */
>> -+                              cc -= 2;
>> -                               while (rc-- && i < npixels)
>> -                                       tp[i++] |= b;
>> -                       } else {                        /* non-run */
>> -@@ -346,6 +363,7 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
>> -                               while (--cc && rc-- && i < npixels)
>> -                                       tp[i++] |= (uint32)*bp++ << shft;
>> -                       }
>> -+              }
>> -               if (i != npixels) {
>> - #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
>> -                       TIFFErrorExt(tif->tif_clientdata, module,
>> -@@ -413,6 +431,7 @@ LogLuvDecodeTile(TIFF* tif, uint8* bp, t
>> - static int
>> - LogL16Encode(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
>> - {
>> -+      static const char module[] = "LogL16Encode";
>> -       LogLuvState* sp = EncoderState(tif);
>> -       int shft;
>> -       tmsize_t i;
>> -@@ -433,7 +452,11 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz
>> -               tp = (int16*) bp;
>> -       else {
>> -               tp = (int16*) sp->tbuf;
>> --              assert(sp->tbuflen >= npixels);
>> -+              if(sp->tbuflen < npixels) {
>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>> -+                                               "Translation buffer too
>> short");
>> -+                      return (0);
>> -+              }
>> -               (*sp->tfunc)(sp, bp, npixels);
>> -       }
>> -       /* compress each byte string */
>> -@@ -506,6 +529,7 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz
>> - static int
>> - LogLuvEncode24(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
>> - {
>> -+      static const char module[] = "LogLuvEncode24";
>> -       LogLuvState* sp = EncoderState(tif);
>> -       tmsize_t i;
>> -       tmsize_t npixels;
>> -@@ -521,7 +545,11 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms
>> -               tp = (uint32*) bp;
>> -       else {
>> -               tp = (uint32*) sp->tbuf;
>> --              assert(sp->tbuflen >= npixels);
>> -+              if(sp->tbuflen < npixels) {
>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>> -+                                               "Translation buffer too
>> short");
>> -+                      return (0);
>> -+              }
>> -               (*sp->tfunc)(sp, bp, npixels);
>> -       }
>> -       /* write out encoded pixels */
>> -@@ -553,6 +581,7 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms
>> - static int
>> - LogLuvEncode32(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
>> - {
>> -+      static const char module[] = "LogLuvEncode32";
>> -       LogLuvState* sp = EncoderState(tif);
>> -       int shft;
>> -       tmsize_t i;
>> -@@ -574,7 +603,11 @@ LogLuvEncode32(TIFF* tif, uint8* bp, tms
>> -               tp = (uint32*) bp;
>> -       else {
>> -               tp = (uint32*) sp->tbuf;
>> --              assert(sp->tbuflen >= npixels);
>> -+              if(sp->tbuflen < npixels) {
>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>> -+                                               "Translation buffer too
>> short");
>> -+                      return (0);
>> -+              }
>> -               (*sp->tfunc)(sp, bp, npixels);
>> -       }
>> -       /* compress each byte string */
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
>> deleted file mode 100644
>> index 0caf800..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
>> +++ /dev/null
>> @@ -1,73 +0,0 @@
>> -From b18012dae552f85dcc5c57d3bf4e997a15b1cc1c Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Sun, 27 Dec 2015 16:55:20 +0000
>> -Subject: [PATCH] * libtiff/tif_next.c: fix potential out-of-bound write
>> in
>> - NeXTDecode() triggered by http://lcamtuf.coredump.cx/afl
>> /vulns/libtiff5.tif
>> - (bugzilla #2508)
>> -
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/b18012dae552f85dcc5c
>> 57d3bf4e997a15b1cc1c
>> -hand applied Changelog changes
>> -
>> -CVE:  CVE-2015-8784
>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>> -
>> ----
>> - ChangeLog          |  6 ++++++
>> - libtiff/tif_next.c | 10 ++++++++--
>> - 2 files changed, 14 insertions(+), 2 deletions(-)
>> -
>> -Index: tiff-4.0.4/ChangeLog
>> -===================================================================
>> ---- tiff-4.0.4.orig/ChangeLog
>> -+++ tiff-4.0.4/ChangeLog
>> -@@ -1,5 +1,11 @@
>> - 2015-12-27  Even Rouault <even.rouault at spatialys.com>
>> -
>> -+      * libtiff/tif_next.c: fix potential out-of-bound write in
>> NeXTDecode()
>> -+      triggered by http://lcamtuf.coredump.cx/afl/vulns/libtiff5.tif
>> -+      (bugzilla #2508)
>> -+
>> -+2015-12-27  Even Rouault <even.rouault at spatialys.com>
>> -+
>> -       * libtiff/tif_luv.c: fix potential out-of-bound writes in decode
>> -       functions in non debug builds by replacing assert()s by regular if
>> -       checks (bugzilla #2522).
>> -Index: tiff-4.0.4/libtiff/tif_next.c
>> -===================================================================
>> ---- tiff-4.0.4.orig/libtiff/tif_next.c
>> -+++ tiff-4.0.4/libtiff/tif_next.c
>> -@@ -37,7 +37,7 @@
>> -       case 0: op[0]  = (unsigned char) ((v) << 6); break;     \
>> -       case 1: op[0] |= (v) << 4; break;       \
>> -       case 2: op[0] |= (v) << 2; break;       \
>> --      case 3: *op++ |= (v);      break;       \
>> -+      case 3: *op++ |= (v);      op_offset++; break;  \
>> -       }                                       \
>> - }
>> -
>> -@@ -106,6 +106,7 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
>> -                       uint32 imagewidth = tif->tif_dir.td_imagewidth;
>> -             if( isTiled(tif) )
>> -                 imagewidth = tif->tif_dir.td_tilewidth;
>> -+            tmsize_t op_offset = 0;
>> -
>> -                       /*
>> -                        * The scanline is composed of a sequence of
>> constant
>> -@@ -122,10 +123,15 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
>> -                                * bounds, potentially resulting in a
>> security
>> -                                * issue.
>> -                                */
>> --                              while (n-- > 0 && npixels < imagewidth)
>> -+                              while (n-- > 0 && npixels < imagewidth &&
>> op_offset < scanline)
>> -                                       SETPIXEL(op, grey);
>> -                               if (npixels >= imagewidth)
>> -                                       break;
>> -+                if (op_offset >= scanline ) {
>> -+                    TIFFErrorExt(tif->tif_clientdata, module, "Invalid
>> data for scanline %ld",
>> -+                        (long) tif->tif_row);
>> -+                    return (0);
>> -+                }
>> -                               if (cc == 0)
>> -                                       goto bad;
>> -                               n = *bp++, cc--;
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>> deleted file mode 100644
>> index 4a08aba..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -Buffer overflow in the readextension function in gif2tiff.c
>> -allows remote attackers to cause a denial of service via a crafted GIF
>> file.
>> -
>> -External References:
>> -https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3186
>> -https://bugzilla.redhat.com/show_bug.cgi?id=1319503
>> -
>> -CVE: CVE-2016-3186
>> -Upstream-Status: Backport (RedHat)
>> -https://bugzilla.redhat.com/attachment.cgi?id=1144235&action=diff
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> -
>> ---- tiff-4.0.6/tools/gif2tiff.c        2016-04-06 15:43:01.586048341
>> +0200
>> -+++ tiff-4.0.6/tools/gif2tiff.c        2016-04-06 15:48:05.523207710
>> +0200
>> -@@ -349,7 +349,7 @@
>> -     int status = 1;
>> -
>> -     (void) getc(infile);
>> --    while ((count = getc(infile)) && count <= 255)
>> -+    while ((count = getc(infile)) && count >= 0 && count <= 255)
>> -         if (fread(buf, 1, count, infile) != (size_t) count) {
>> -             fprintf(stderr, "short read from file %s (%s)\n",
>> -                     filename, strerror(errno));
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
>> deleted file mode 100644
>> index 0c8b716..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
>> +++ /dev/null
>> @@ -1,129 +0,0 @@
>> -From 92d966a5fcfbdca67957c8c5c47b467aa650b286 Mon Sep 17 00:00:00 2001
>> -From: bfriesen <bfriesen>
>> -Date: Sat, 24 Sep 2016 23:11:55 +0000
>> -Subject: [PATCH] * libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject
>> attempts
>> - to read floating point images.
>> -
>> -* libtiff/tif_predict.c (PredictorSetup): Enforce bits-per-sample
>> -requirements of floating point predictor (3).  Fixes CVE-2016-3622
>> -"Divide By Zero in the tiff2rgba tool."
>> -
>> -CVE: CVE-2016-3622
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/92d966a5fcfbdca67957
>> c8c5c47b467aa650b286
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> ----
>> - ChangeLog              | 11 ++++++++++-
>> - libtiff/tif_getimage.c | 38 ++++++++++++++++++++------------------
>> - libtiff/tif_predict.c  | 11 ++++++++++-
>> - 3 files changed, 40 insertions(+), 20 deletions(-)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index 26d6f47..a628277 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -1,3 +1,12 @@
>> -+2016-09-24  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
>> -+
>> -+      * libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject attempts to
>> -+      read floating point images.
>> -+
>> -+      * libtiff/tif_predict.c (PredictorSetup): Enforce bits-per-sample
>> -+      requirements of floating point predictor (3).  Fixes CVE-2016-3622
>> -+      "Divide By Zero in the tiff2rgba tool."
>> -+
>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -
>> -       * tools/rgb2ycbcr.c: validate values of -v and -h parameters to
>> -diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
>> -index 386cee0..3e689ee 100644
>> ---- a/libtiff/tif_getimage.c
>> -+++ b/libtiff/tif_getimage.c
>> -@@ -95,6 +95,10 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])
>> -                           td->td_bitspersample);
>> -                       return (0);
>> -       }
>> -+        if (td->td_sampleformat == SAMPLEFORMAT_IEEEFP) {
>> -+                sprintf(emsg, "Sorry, can not handle images with IEEE
>> floating-point samples");
>> -+                return (0);
>> -+        }
>> -       colorchannels = td->td_samplesperpixel - td->td_extrasamples;
>> -       if (!TIFFGetField(tif, TIFFTAG_PHOTOMETRIC, &photometric)) {
>> -               switch (colorchannels) {
>> -@@ -182,27 +186,25 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])
>> -                                   "Planarconfiguration",
>> td->td_planarconfig);
>> -                               return (0);
>> -                       }
>> --                      if( td->td_samplesperpixel != 3 || colorchannels
>> != 3 )
>> --            {
>> --                sprintf(emsg,
>> --                        "Sorry, can not handle image with %s=%d, %s=%d",
>> --                        "Samples/pixel", td->td_samplesperpixel,
>> --                        "colorchannels", colorchannels);
>> --                return 0;
>> --            }
>> -+                      if ( td->td_samplesperpixel != 3 || colorchannels
>> != 3 ) {
>> -+                                sprintf(emsg,
>> -+                                        "Sorry, can not handle image
>> with %s=%d, %s=%d",
>> -+                                        "Samples/pixel",
>> td->td_samplesperpixel,
>> -+                                        "colorchannels", colorchannels);
>> -+                                return 0;
>> -+                        }
>> -                       break;
>> -               case PHOTOMETRIC_CIELAB:
>> --            if( td->td_samplesperpixel != 3 || colorchannels != 3 ||
>> td->td_bitspersample != 8 )
>> --            {
>> --                sprintf(emsg,
>> --                        "Sorry, can not handle image with %s=%d, %s=%d
>> and %s=%d",
>> --                        "Samples/pixel", td->td_samplesperpixel,
>> --                        "colorchannels", colorchannels,
>> --                        "Bits/sample", td->td_bitspersample);
>> --                return 0;
>> --            }
>> -+                        if ( td->td_samplesperpixel != 3 ||
>> colorchannels != 3 || td->td_bitspersample != 8 ) {
>> -+                                sprintf(emsg,
>> -+                                        "Sorry, can not handle image
>> with %s=%d, %s=%d and %s=%d",
>> -+                                        "Samples/pixel",
>> td->td_samplesperpixel,
>> -+                                        "colorchannels", colorchannels,
>> -+                                        "Bits/sample",
>> td->td_bitspersample);
>> -+                                return 0;
>> -+                        }
>> -                       break;
>> --              default:
>> -+                default:
>> -                       sprintf(emsg, "Sorry, can not handle image with
>> %s=%d",
>> -                           photoTag, photometric);
>> -                       return (0);
>> -diff --git a/libtiff/tif_predict.c b/libtiff/tif_predict.c
>> -index 081eb11..555f2f9 100644
>> ---- a/libtiff/tif_predict.c
>> -+++ b/libtiff/tif_predict.c
>> -@@ -80,6 +80,15 @@ PredictorSetup(TIFF* tif)
>> -                                   td->td_sampleformat);
>> -                               return 0;
>> -                       }
>> -+                        if (td->td_bitspersample != 16
>> -+                            && td->td_bitspersample != 24
>> -+                            && td->td_bitspersample != 32
>> -+                            && td->td_bitspersample != 64) { /* Should
>> 64 be allowed? */
>> -+                                TIFFErrorExt(tif->tif_clientdata,
>> module,
>> -+                                             "Floating point
>> \"Predictor\" not supported with %d-bit samples",
>> -+                                             td->td_bitspersample);
>> -+                              return 0;
>> -+                            }
>> -                       break;
>> -               default:
>> -                       TIFFErrorExt(tif->tif_clientdata, module,
>> -@@ -174,7 +183,7 @@ PredictorSetupDecode(TIFF* tif)
>> -               }
>> -               /*
>> -                * Allocate buffer to keep the decoded bytes before
>> --               * rearranging in the ight order
>> -+               * rearranging in the right order
>> -                */
>> -       }
>> -
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
>> deleted file mode 100644
>> index f554ac5..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -From bd024f07019f5d9fea236675607a69f74a66bc7b Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Mon, 15 Aug 2016 21:26:56 +0000
>> -Subject: [PATCH] * tools/rgb2ycbcr.c: validate values of -v and -h
>> parameters
>> - to avoid potential divide by zero. Fixes CVE-2016-3623 (bugzilla #2569)
>> -
>> -CVE: CVE-2016-3623
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/bd024f07019f5d9fea23
>> 6675607a69f74a66bc7b
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> ----
>> - ChangeLog         | 5 +++++
>> - tools/rgb2ycbcr.c | 4 ++++
>> - 2 files changed, 9 insertions(+)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index 5d60608..3e6642a 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -1,5 +1,10 @@
>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -
>> -+      * tools/rgb2ycbcr.c: validate values of -v and -h parameters to
>> -+      avoid potential divide by zero. Fixes CVE-2016-3623 (bugzilla
>> #2569)
>> -+
>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -+
>> -       * tools/tiffcrop.c: Fix out-of-bounds write in loadImage().
>> -       From patch libtiff-CVE-2016-3991.patch from
>> -       libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
>> -diff --git a/tools/rgb2ycbcr.c b/tools/rgb2ycbcr.c
>> -index 3829d6b..51f4259 100644
>> ---- a/tools/rgb2ycbcr.c
>> -+++ b/tools/rgb2ycbcr.c
>> -@@ -95,9 +95,13 @@ main(int argc, char* argv[])
>> -                       break;
>> -               case 'h':
>> -                       horizSubSampling = atoi(optarg);
>> -+            if( horizSubSampling != 1 && horizSubSampling != 2 &&
>> horizSubSampling != 4 )
>> -+                usage(-1);
>> -                       break;
>> -               case 'v':
>> -                       vertSubSampling = atoi(optarg);
>> -+            if( vertSubSampling != 1 && vertSubSampling != 2 &&
>> vertSubSampling != 4 )
>> -+                usage(-1);
>> -                       break;
>> -               case 'r':
>> -                       rowsperstrip = atoi(optarg);
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>> deleted file mode 100644
>> index 4d965be..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>> +++ /dev/null
>> @@ -1,118 +0,0 @@
>> -From 7c39352ccd9060d311d3dc9a1f1bc00133a160e6 Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Mon, 15 Aug 2016 20:06:40 +0000
>> -Subject: [PATCH] * tools/tiff2rgba.c: Fix integer overflow in size of
>> - allocated buffer, when -b mode is enabled, that could result in
>> out-of-bounds
>> - write. Based initially on patch tiff-CVE-2016-3945.patch from
>> - libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for
>> invalid
>> - tests that rejected valid files.
>> -
>> -CVE: CVE-2016-3945
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3
>> dc9a1f1bc00133a160e6
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> ----
>> - ChangeLog         |  8 ++++++++
>> - tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++----
>> - 2 files changed, 38 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index 62dc1b5..9c0ab29 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -1,3 +1,11 @@
>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -+
>> -+      * tools/tiff2rgba.c: Fix integer overflow in size of allocated
>> -+      buffer, when -b mode is enabled, that could result in
>> out-of-bounds
>> -+      write. Based initially on patch tiff-CVE-2016-3945.patch from
>> -+      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction
>> for
>> -+      invalid tests that rejected valid files.
>> -+
>> - 2016-07-11 Even Rouault <even.rouault at spatialys.com>
>> -
>> -       * tools/tiffcrop.c: Avoid access outside of stack allocated array
>> -diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
>> -index b7a81eb..16e3dc4 100644
>> ---- a/tools/tiff2rgba.c
>> -+++ b/tools/tiff2rgba.c
>> -@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
>> -     uint32  row, col;
>> -     uint32  *wrk_line;
>> -     int           ok = 1;
>> -+    uint32  rastersize, wrk_linesize;
>> -
>> -     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
>> -     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
>> -@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
>> -     /*
>> -      * Allocate tile buffer
>> -      */
>> --    raster = (uint32*)_TIFFmalloc(tile_width * tile_height * sizeof
>> (uint32));
>> -+    rastersize = tile_width * tile_height * sizeof (uint32);
>> -+    if (tile_width != (rastersize / tile_height) / sizeof( uint32))
>> -+    {
>> -+      TIFFError(TIFFFileName(in), "Integer overflow when calculating
>> raster buffer");
>> -+      exit(-1);
>> -+    }
>> -+    raster = (uint32*)_TIFFmalloc(rastersize);
>> -     if (raster == 0) {
>> -         TIFFError(TIFFFileName(in), "No space for raster buffer");
>> -         return (0);
>> -@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
>> -      * Allocate a scanline buffer for swapping during the vertical
>> -      * mirroring pass.
>> -      */
>> --    wrk_line = (uint32*)_TIFFmalloc(tile_width * sizeof (uint32));
>> -+    wrk_linesize = tile_width * sizeof (uint32);
>> -+    if (tile_width != wrk_linesize / sizeof (uint32))
>> -+    {
>> -+        TIFFError(TIFFFileName(in), "Integer overflow when calculating
>> wrk_line buffer");
>> -+      exit(-1);
>> -+    }
>> -+    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
>> -     if (!wrk_line) {
>> -         TIFFError(TIFFFileName(in), "No space for raster scanline
>> buffer");
>> -         ok = 0;
>> -@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
>> -     uint32  row;
>> -     uint32  *wrk_line;
>> -     int           ok = 1;
>> -+    uint32  rastersize, wrk_linesize;
>> -
>> -     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
>> -     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
>> -@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
>> -     /*
>> -      * Allocate strip buffer
>> -      */
>> --    raster = (uint32*)_TIFFmalloc(width * rowsperstrip * sizeof
>> (uint32));
>> -+    rastersize = width * rowsperstrip * sizeof (uint32);
>> -+    if (width != (rastersize / rowsperstrip) / sizeof( uint32))
>> -+    {
>> -+      TIFFError(TIFFFileName(in), "Integer overflow when calculating
>> raster buffer");
>> -+      exit(-1);
>> -+    }
>> -+    raster = (uint32*)_TIFFmalloc(rastersize);
>> -     if (raster == 0) {
>> -         TIFFError(TIFFFileName(in), "No space for raster buffer");
>> -         return (0);
>> -@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
>> -      * Allocate a scanline buffer for swapping during the vertical
>> -      * mirroring pass.
>> -      */
>> --    wrk_line = (uint32*)_TIFFmalloc(width * sizeof (uint32));
>> -+    wrk_linesize = width * sizeof (uint32);
>> -+    if (width != wrk_linesize / sizeof (uint32))
>> -+    {
>> -+        TIFFError(TIFFFileName(in), "Integer overflow when calculating
>> wrk_line buffer");
>> -+      exit(-1);
>> -+    }
>> -+    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
>> -     if (!wrk_line) {
>> -         TIFFError(TIFFFileName(in), "No space for raster scanline
>> buffer");
>> -         ok = 0;
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
>> deleted file mode 100644
>> index 7bf52ee..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
>> +++ /dev/null
>> @@ -1,66 +0,0 @@
>> -From 6a4dbb07ccf92836bb4adac7be4575672d0ac5f1 Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Mon, 15 Aug 2016 20:49:48 +0000
>> -Subject: [PATCH] * libtiff/tif_pixarlog.c: Fix write buffer overflow in
>> - PixarLogEncode if more input samples are provided than expected by
>> - PixarLogSetupEncode. Idea based on libtiff-CVE-2016-3990.patch from
>> - libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but with different and
>> - simpler check. (bugzilla #2544)
>> -
>> -invalid tests that rejected valid files. (bugzilla #2545)
>> -
>> -CVE: CVE-2016-3990
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/6a4dbb07ccf92836bb4a
>> dac7be4575672d0ac5f1
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> ----
>> - ChangeLog              | 10 +++++++++-
>> - libtiff/tif_pixarlog.c |  7 +++++++
>> - 2 files changed, 16 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index 9c0ab29..db4ea18 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -1,10 +1,18 @@
>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -
>> -+      * libtiff/tif_pixarlog.c: Fix write buffer overflow in
>> PixarLogEncode
>> -+      if more input samples are provided than expected by
>> PixarLogSetupEncode.
>> -+      Idea based on libtiff-CVE-2016-3990.patch from
>> -+      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but with
>> different and
>> -+      simpler check. (bugzilla #2544)
>> -+
>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -+
>> -       * tools/tiff2rgba.c: Fix integer overflow in size of allocated
>> -       buffer, when -b mode is enabled, that could result in
>> out-of-bounds
>> -       write. Based initially on patch tiff-CVE-2016-3945.patch from
>> -       libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction
>> for
>> --      invalid tests that rejected valid files.
>> -+      invalid tests that rejected valid files. (bugzilla #2545)
>> -
>> - 2016-07-11 Even Rouault <even.rouault at spatialys.com>
>> -
>> -diff --git a/libtiff/tif_pixarlog.c b/libtiff/tif_pixarlog.c
>> -index e78f788..28329d1 100644
>> ---- a/libtiff/tif_pixarlog.c
>> -+++ b/libtiff/tif_pixarlog.c
>> -@@ -1141,6 +1141,13 @@ PixarLogEncode(TIFF* tif, uint8* bp, tmsize_t cc,
>> uint16 s)
>> -       }
>> -
>> -       llen = sp->stride * td->td_imagewidth;
>> -+    /* Check against the number of elements (of size uint16) of
>> sp->tbuf */
>> -+    if( n > td->td_rowsperstrip * llen )
>> -+    {
>> -+        TIFFErrorExt(tif->tif_clientdata, module,
>> -+                     "Too many input bytes provided");
>> -+        return 0;
>> -+    }
>> -
>> -       for (i = 0, up = sp->tbuf; i < n; i += llen, up += llen) {
>> -               switch (sp->user_datafmt)  {
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
>> deleted file mode 100644
>> index 27dfd37..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
>> +++ /dev/null
>> @@ -1,147 +0,0 @@
>> -From e596d4e27c5afb7960dc360fdd3afd90ba0fb8ba Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Mon, 15 Aug 2016 21:05:40 +0000
>> -Subject: [PATCH 2/2] * tools/tiffcrop.c: Fix out-of-bounds write in
>> - loadImage(). From patch libtiff-CVE-2016-3991.patch from
>> - libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
>> -
>> -CVE: CVE-2016-3991
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/e596d4e27c5afb7960dc
>> 360fdd3afd90ba0fb8ba
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> ----
>> - ChangeLog        |  6 ++++++
>> - tools/tiffcrop.c | 59 ++++++++++++++++++++++++++++++
>> +++++++++++++++++++++++---
>> - 2 files changed, 62 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index db4ea18..5d60608 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -1,5 +1,11 @@
>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -
>> -+      * tools/tiffcrop.c: Fix out-of-bounds write in loadImage().
>> -+      From patch libtiff-CVE-2016-3991.patch from
>> -+      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
>> -+
>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>> -+
>> -       * libtiff/tif_pixarlog.c: Fix write buffer overflow in
>> PixarLogEncode
>> -       if more input samples are provided than expected by
>> PixarLogSetupEncode.
>> -       Idea based on libtiff-CVE-2016-3990.patch from
>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>> -index 27abc0b..ddba7b9 100644
>> ---- a/tools/tiffcrop.c
>> -+++ b/tools/tiffcrop.c
>> -@@ -798,6 +798,11 @@ static int readContigTilesIntoBuffer (TIFF* in,
>> uint8* buf,
>> -     }
>> -
>> -   tile_buffsize = tilesize;
>> -+  if (tilesize == 0 || tile_rowsize == 0)
>> -+  {
>> -+     TIFFError("readContigTilesIntoBuffer", "Tile size or tile rowsize
>> is zero");
>> -+     exit(-1);
>> -+  }
>> -
>> -   if (tilesize < (tsize_t)(tl * tile_rowsize))
>> -     {
>> -@@ -807,7 +812,12 @@ static int readContigTilesIntoBuffer (TIFF* in,
>> uint8* buf,
>> -               tilesize, tl * tile_rowsize);
>> - #endif
>> -     tile_buffsize = tl * tile_rowsize;
>> --    }
>> -+    if (tl != (tile_buffsize / tile_rowsize))
>> -+    {
>> -+      TIFFError("readContigTilesIntoBuffer", "Integer overflow when
>> calculating buffer size.");
>> -+        exit(-1);
>> -+    }
>> -+    }
>> -
>> -   tilebuf = _TIFFmalloc(tile_buffsize);
>> -   if (tilebuf == 0)
>> -@@ -1210,6 +1220,12 @@ static int writeBufferToContigTiles (TIFF* out,
>> uint8* buf, uint32 imagelength,
>> -       !TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps) )
>> -       return 1;
>> -
>> -+  if (tilesize == 0 || tile_rowsize == 0 || tl == 0 || tw == 0)
>> -+  {
>> -+    TIFFError("writeBufferToContigTiles", "Tile size, tile row size,
>> tile width, or tile length is zero");
>> -+    exit(-1);
>> -+  }
>> -+
>> -   tile_buffsize = tilesize;
>> -   if (tilesize < (tsize_t)(tl * tile_rowsize))
>> -     {
>> -@@ -1219,6 +1235,11 @@ static int writeBufferToContigTiles (TIFF* out,
>> uint8* buf, uint32 imagelength,
>> -               tilesize, tl * tile_rowsize);
>> - #endif
>> -     tile_buffsize = tl * tile_rowsize;
>> -+    if (tl != tile_buffsize / tile_rowsize)
>> -+    {
>> -+      TIFFError("writeBufferToContigTiles", "Integer overflow when
>> calculating buffer size");
>> -+      exit(-1);
>> -+    }
>> -     }
>> -
>> -   tilebuf = _TIFFmalloc(tile_buffsize);
>> -@@ -5945,12 +5966,27 @@ loadImage(TIFF* in, struct image_data *image,
>> struct dump_opts *dump, unsigned c
>> -     TIFFGetField(in, TIFFTAG_TILELENGTH, &tl);
>> -
>> -     tile_rowsize  = TIFFTileRowSize(in);
>> -+    if (ntiles == 0 || tlsize == 0 || tile_rowsize == 0)
>> -+    {
>> -+      TIFFError("loadImage", "File appears to be tiled, but the number
>> of tiles, tile size, or tile rowsize is zero.");
>> -+      exit(-1);
>> -+    }
>> -     buffsize = tlsize * ntiles;
>> -+    if (tlsize != (buffsize / ntiles))
>> -+    {
>> -+      TIFFError("loadImage", "Integer overflow when calculating buffer
>> size");
>> -+      exit(-1);
>> -+    }
>> -
>> --
>> -     if (buffsize < (uint32)(ntiles * tl * tile_rowsize))
>> -       {
>> -       buffsize = ntiles * tl * tile_rowsize;
>> -+      if (ntiles != (buffsize / tl / tile_rowsize))
>> -+      {
>> -+      TIFFError("loadImage", "Integer overflow when calculating buffer
>> size");
>> -+      exit(-1);
>> -+      }
>> -+
>> - #ifdef DEBUG2
>> -       TIFFError("loadImage",
>> -               "Tilesize %u is too small, using ntiles * tilelength *
>> tilerowsize %lu",
>> -@@ -5969,8 +6005,25 @@ loadImage(TIFF* in, struct image_data *image,
>> struct dump_opts *dump, unsigned c
>> -     TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
>> -     stsize = TIFFStripSize(in);
>> -     nstrips = TIFFNumberOfStrips(in);
>> -+    if (nstrips == 0 || stsize == 0)
>> -+    {
>> -+      TIFFError("loadImage", "File appears to be striped, but the
>> number of stipes or stripe size is zero.");
>> -+      exit(-1);
>> -+    }
>> -+
>> -     buffsize = stsize * nstrips;
>> --
>> -+    if (stsize != (buffsize / nstrips))
>> -+    {
>> -+      TIFFError("loadImage", "Integer overflow when calculating buffer
>> size");
>> -+      exit(-1);
>> -+    }
>> -+    uint32 buffsize_check;
>> -+    buffsize_check = ((length * width * spp * bps) + 7);
>> -+    if (length != ((buffsize_check - 7) / width / spp / bps))
>> -+    {
>> -+      TIFFError("loadImage", "Integer overflow detected.");
>> -+      exit(-1);
>> -+    }
>> -     if (buffsize < (uint32) (((length * width * spp * bps) + 7) / 8))
>> -       {
>> -       buffsize =  ((length * width * spp * bps) + 7) / 8;
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>> deleted file mode 100644
>> index 63c6650..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>> +++ /dev/null
>> @@ -1,49 +0,0 @@
>> -From d9783e4a1476b6787a51c5ae9e9b3156527589f0 Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Mon, 11 Jul 2016 21:26:03 +0000
>> -Subject: [PATCH 1/2] * tools/tiffcrop.c: Avoid access outside of stack
>> - allocated array on a tiled separate TIFF with more than 8 samples per
>> pixel.
>> - Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
>> - (CVE-2016-5321, bugzilla #2558)
>> -
>> -CVE: CVE-2016-5321
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/d9783e4a1476b6787a51
>> c5ae9e9b3156527589f0
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> ----
>> - ChangeLog        | 7 +++++++
>> - tools/tiffcrop.c | 2 +-
>> - 2 files changed, 8 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index e98d54d..4e0302f 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -1,3 +1,10 @@
>> -+2016-07-11 Even Rouault <even.rouault at spatialys.com>
>> -+
>> -+      * tools/tiffcrop.c: Avoid access outside of stack allocated array
>> -+      on a tiled separate TIFF with more than 8 samples per pixel.
>> -+      Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
>> -+      (CVE-2016-5321, bugzilla #2558)
>> -+
>> - 2015-12-27  Even Rouault <even.rouault at spatialys.com>
>> -
>> -       * libtiff/tif_next.c: fix potential out-of-bound write in
>> NeXTDecode()
>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>> -index d959ae3..6fc8fc1 100644
>> ---- a/tools/tiffcrop.c
>> -+++ b/tools/tiffcrop.c
>> -@@ -989,7 +989,7 @@ static int  readSeparateTilesIntoBuffer (TIFF* in,
>> uint8 *obuf,
>> -     nrow = (row + tl > imagelength) ? imagelength - row : tl;
>> -     for (col = 0; col < imagewidth; col += tw)
>> -       {
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; s < spp && s < MAX_SAMPLES; s++)
>> -         {  /* Read each plane of a tile set into srcbuffs[s] */
>> -       tbytes = TIFFReadTile(in, srcbuffs[s], col, row, 0, s);
>> -         if (tbytes < 0  && !ignore)
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>> deleted file mode 100644
>> index 41eab91..0000000
>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>> +++ /dev/null
>> @@ -1,107 +0,0 @@
>> -From 2f79856097f423eb33796a15fcf700d2ea41bf31 Mon Sep 17 00:00:00 2001
>> -From: erouault <erouault>
>> -Date: Mon, 11 Jul 2016 21:38:31 +0000
>> -Subject: [PATCH 2/2] (CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 /
>> #2559)
>> -
>> -CVE: CVE-2016-5323
>> -Upstream-Status: Backport
>> -https://github.com/vadz/libtiff/commit/2f79856097f423eb3379
>> 6a15fcf700d2ea41bf31
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>> ----
>> - ChangeLog        |  2 +-
>> - tools/tiffcrop.c | 16 ++++++++--------
>> - 2 files changed, 9 insertions(+), 9 deletions(-)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index 4e0302f..62dc1b5 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -3,7 +3,7 @@
>> -       * tools/tiffcrop.c: Avoid access outside of stack allocated array
>> -       on a tiled separate TIFF with more than 8 samples per pixel.
>> -       Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
>> --      (CVE-2016-5321, bugzilla #2558)
>> -+      (CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 / #2559)
>> -
>> - 2016-07-10 Even Rouault <even.rouault at spatialys.com>
>> -
>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>> -index 6fc8fc1..27abc0b 100644
>> ---- a/tools/tiffcrop.c
>> -+++ b/tools/tiffcrop.c
>> -@@ -3738,7 +3738,7 @@ combineSeparateSamples8bits (uint8 *in[], uint8
>> *out, uint32 cols,
>> -
>> -       matchbits = maskbits << (8 - src_bit - bps);
>> -       /* load up next sample from each plane */
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -         {
>> -       src = in[s] + src_offset + src_byte;
>> -         buff1 = ((*src) & matchbits) << (src_bit);
>> -@@ -3837,7 +3837,7 @@ combineSeparateSamples16bits (uint8 *in[], uint8
>> *out, uint32 cols,
>> -       src_bit  = bit_offset % 8;
>> -
>> -       matchbits = maskbits << (16 - src_bit - bps);
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -         {
>> -       src = in[s] + src_offset + src_byte;
>> -         if (little_endian)
>> -@@ -3947,7 +3947,7 @@ combineSeparateSamples24bits (uint8 *in[], uint8
>> *out, uint32 cols,
>> -       src_bit  = bit_offset % 8;
>> -
>> -       matchbits = maskbits << (32 - src_bit - bps);
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -         {
>> -       src = in[s] + src_offset + src_byte;
>> -         if (little_endian)
>> -@@ -4073,7 +4073,7 @@ combineSeparateSamples32bits (uint8 *in[], uint8
>> *out, uint32 cols,
>> -       src_bit  = bit_offset % 8;
>> -
>> -       matchbits = maskbits << (64 - src_bit - bps);
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -       {
>> -       src = in[s] + src_offset + src_byte;
>> -       if (little_endian)
>> -@@ -4263,7 +4263,7 @@ combineSeparateTileSamples8bits (uint8 *in[],
>> uint8 *out, uint32 cols,
>> -
>> -       matchbits = maskbits << (8 - src_bit - bps);
>> -       /* load up next sample from each plane */
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -         {
>> -       src = in[s] + src_offset + src_byte;
>> -         buff1 = ((*src) & matchbits) << (src_bit);
>> -@@ -4362,7 +4362,7 @@ combineSeparateTileSamples16bits (uint8 *in[],
>> uint8 *out, uint32 cols,
>> -       src_bit  = bit_offset % 8;
>> -
>> -       matchbits = maskbits << (16 - src_bit - bps);
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -         {
>> -       src = in[s] + src_offset + src_byte;
>> -         if (little_endian)
>> -@@ -4471,7 +4471,7 @@ combineSeparateTileSamples24bits (uint8 *in[],
>> uint8 *out, uint32 cols,
>> -       src_bit  = bit_offset % 8;
>> -
>> -       matchbits = maskbits << (32 - src_bit - bps);
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -         {
>> -       src = in[s] + src_offset + src_byte;
>> -         if (little_endian)
>> -@@ -4597,7 +4597,7 @@ combineSeparateTileSamples32bits (uint8 *in[],
>> uint8 *out, uint32 cols,
>> -       src_bit  = bit_offset % 8;
>> -
>> -       matchbits = maskbits << (64 - src_bit - bps);
>> --      for (s = 0; s < spp; s++)
>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>> -       {
>> -       src = in[s] + src_offset + src_byte;
>> -       if (little_endian)
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>> b/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
>> similarity index 74%
>> rename from meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>> rename to meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
>> index 796d86e..52fc553 100644
>> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
>> @@ -4,21 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db4
>> 6fab7501992f9615d7e158cf"
>>     SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>>              file://libtool2.patch \
>> -           file://CVE-2015-8665_8683.patch \
>> -           file://CVE-2015-8781.patch \
>> -           file://CVE-2015-8784.patch \
>> -           file://CVE-2016-3186.patch \
>> -           file://CVE-2016-5321.patch \
>> -           file://CVE-2016-5323.patch \
>> -           file://CVE-2016-3945.patch \
>> -           file://CVE-2016-3990.patch \
>> -           file://CVE-2016-3991.patch \
>> -           file://CVE-2016-3623.patch \
>> -           file://CVE-2016-3622.patch \
>>             "
>>   -SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
>> -SRC_URI[sha256sum] = "4d57a50907b510e3049a4bba0d788
>> 8930fdfc16ce49f1bf693e5b6247370d68c"
>> +SRC_URI[md5sum] = "77ae928d2c6b7fb46a21c3a29325157b"
>> +SRC_URI[sha256sum] = "9f43a2cfb9589e5cecaa66e16bf87
>> f814c945f22df7ba600d63aac4632c4f019"
>>     # exclude betas
>>   UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113a01e8aeaaeb0541fa0db8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">CCing Leo and Jose who have been working on this.<div><br>=
</div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 23 November 2016 at 15:32, akuster808 <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The never made in=
to patchwork. is there a bug there ? is there an issue on how I submitted?<=
br>
<br>
- armin<br>
<br>
<br>
On 11/21/2016 09:28 PM, Armin Kuster wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Major changes:<br>
The libtiff tools bmp2tiff, gif2tiff, ras2tiff, sgi2tiff, sgisv, and ycbcr =
are completely removed from the distribution, used for demos.<br>
<br>
CVEs fixed:<br>
CVE-2016-9297<br>
CVE-2016-9448<br>
CVE-2016-9273<br>
CVE-2014-8127<br>
CVE-2016-3658<br>
CVE-2016-5875<br>
CVE-2016-5652<br>
CVE-2016-3632<br>
<br>
plus more that are not identified in the changelog.<br>
<br>
removed patches integrated into update.<br>
more info: <a href=3D"http://libtiff.maptools.org/v4.0.7.html" rel=3D"noref=
errer" target=3D"_blank">http://libtiff.maptools.org/v4<wbr>.0.7.html</a><b=
r>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targe=
t=3D"_blank">akuster@mvista.com</a>&gt;<br>
---<br>
=C2=A0 .../libtiff/files/CVE-2015-866<wbr>5_8683.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 137 ---------------<br>
=C2=A0 .../libtiff/files/CVE-2015-878<wbr>1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 195 ---------------------<br>
=C2=A0 .../libtiff/files/CVE-2015-878<wbr>4.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 73 --------<br>
=C2=A0 .../libtiff/files/CVE-2016-318<wbr>6.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 ---<br>
=C2=A0 .../libtiff/files/CVE-2016-362<wbr>2.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 129 --------------<br>
=C2=A0 .../libtiff/files/CVE-2016-362<wbr>3.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 52 ------<br>
=C2=A0 .../libtiff/files/CVE-2016-394<wbr>5.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 118 -------------<br>
=C2=A0 .../libtiff/files/CVE-2016-399<wbr>0.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 66 -------<br>
=C2=A0 .../libtiff/files/CVE-2016-399<wbr>1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 147 ----------------<br>
=C2=A0 .../libtiff/files/CVE-2016-532<wbr>1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 49 ------<br>
=C2=A0 .../libtiff/files/CVE-2016-532<wbr>3.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 107 -----------<br>
=C2=A0 .../libtiff/{<a href=3D"http://tiff_4.0.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">tiff_4.0.6.bb</a> =3D&gt; <a href=3D"http://tiff_4.0.7.bb" r=
el=3D"noreferrer" target=3D"_blank">tiff_4.0.7.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 15 +-<br>
=C2=A0 12 files changed, 2 insertions(+), 1110 deletions(-)<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
15-8665_8683.<wbr>patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
15-8781.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
15-8784.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-3186.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-3622.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-3623.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-3945.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-3990.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-3991.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-5321.patch<br>
=C2=A0 delete mode 100644 meta/recipes-multimedia/libtif<wbr>f/files/CVE-20=
16-5323.patch<br>
=C2=A0 rename meta/recipes-multimedia/libtif<wbr>f/{<a href=3D"http://tiff_=
4.0.6.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a> =3D&gt; <a=
 href=3D"http://tiff_4.0.7.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.=
0.7.bb</a>} (74%)<br>
<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8665_8683.=
<wbr>patch b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8665_8683.=
<wbr>patch<br>
deleted file mode 100644<br>
index 39c5059..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8665_8683.<wbr>pa=
tch<br>
+++ /dev/null<br>
@@ -1,137 +0,0 @@<br>
-From f94a29a822f5528d2334592760fbb7<wbr>938f15eb55 Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Sat, 26 Dec 2015 17:32:03 +0000<br>
-Subject: [PATCH] * libtiff/tif_getimage.c: fix out-of-bound reads in<br>
- TIFFRGBAImage interface in case of unsupported values of<br>
- SamplesPerPixel/ExtraSamples for LogLUV / CIELab. Add explicit call to<br=
>
- TIFFRGBAImageOK() in TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by<=
br>
- limingxing and CVE-2015-8683 reported by zzf of Alibaba.<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2015-8665<br>
-CVE: CVE-2015-8683<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/f94a29a822f5528d23345927=
60fbb7938f15eb55" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/f94a29a822f5528d2334<wbr>592760fbb7938f15eb55</a><b=
r>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targ=
et=3D"_blank">akuster@mvista.com</a>&gt;<br>
-<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++=
+++<br>
- libtiff/tif_getimage.c | 35 ++++++++++++++++++++++--------<wbr>-----<br>
- 2 files changed, 30 insertions(+), 13 deletions(-)<br>
-<br>
-Index: tiff-4.0.6/libtiff/tif_getimag<wbr>e.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- tiff-4.0.6.orig/libtiff/tif_ge<wbr>timage.c<br>
-+++ tiff-4.0.6/libtiff/tif_getimag<wbr>e.c<br>
-@@ -182,20 +182,22 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[102<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Planarconfigurati=
on&quot;, td-&gt;td_planarconfig);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if( td-&gt;td_samplesperpixel !=3D 3 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if( td-&gt;td_samplesperpixel !=3D 3 || colorchannels !=3D 3 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(emsg=
,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Sorry, can not handle image with %s=3D%d&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Samples/pixel&quot;, td-&gt;td_samplesperpixel);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Sorry, can not handle image with %s=3D%d, %s=3D%d&quot;,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Samples/pixel&quot;, td-&gt;td_samplesperpixel,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;colorchannels&quot;, colorchannels);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PHOTOMETRIC_CI=
ELAB:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( td-&gt;td_samplesperpixel !=
=3D 3 || td-&gt;td_bitspersample !=3D 8 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( td-&gt;td_samplesperpixel !=
=3D 3 || colorchannels !=3D 3 || td-&gt;td_bitspersample !=3D 8 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(emsg=
,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Sorry, can not handle image with %s=3D%d and %s=3D%d&quot;=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Sorry, can not handle image with %s=3D%d, %s=3D%d and %s=
=3D%d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Samples/pixel&quot;, td-&gt;td_samplesperpixel,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;colorchannels&quot;, colorchannels,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Bits/sample&quot;, td-&gt;td_bitspersample);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -255,6 +257,9 @@ TIFFRGBAImageBegin(TIFFRGBAIma<wbr>ge* img, T<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int colorchannels;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16 *red_orig, *green_orig, *blue_orig;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int n_color;<br>
-+=C2=A0 =C2=A0 =C2=A0 <br>
-+=C2=A0 =C2=A0 =C2=A0 if( !TIFFRGBAImageOK(tif, emsg) )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize to normal values */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;row_offset =3D 0;<br>
-@@ -2508,29 +2513,33 @@ PickContigCase(TIFFRGBAImage* img)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PHOTOMETRIC_RG=
B:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0switch (img-&gt;bitspersample) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 8:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (img-&gt;alp=
ha =3D=3D EXTRASAMPLE_ASSOCALPHA)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (img-&gt;alp=
ha =3D=3D EXTRASAMPLE_ASSOCALPHA &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 img-&gt;samplesperpixel &gt;=3D 4)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0img-&gt;put.contig =3D putRGBAAcontig8bittile;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (img-&g=
t;alpha =3D=3D EXTRASAMPLE_UNASSALPHA)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (img-&g=
t;alpha =3D=3D EXTRASAMPLE_UNASSALPHA &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;samplesperpixel &gt=
;=3D 4)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (BuildMapUaToAa(img))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;put.contig =3D putR=
GBUAcontig8bittile;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if( img-&g=
t;samplesperpixel &gt;=3D 3 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0img-&gt;put.contig =3D putRGBcontig8bittile;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 16:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (img-&gt;alp=
ha =3D=3D EXTRASAMPLE_ASSOCALPHA)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (img-&gt;alp=
ha =3D=3D EXTRASAMPLE_ASSOCALPHA &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 img-&gt;samplesperpixel &gt;=3D4 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (BuildMapBitdepth16To8(img))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;put.contig =3D putR=
GBAAcontig16bittile;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (img-&g=
t;alpha =3D=3D EXTRASAMPLE_UNASSALPHA)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (img-&g=
t;alpha =3D=3D EXTRASAMPLE_UNASSALPHA &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;samplesperpixel &gt=
;=3D4 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (BuildMapBitdepth16To8(img) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BuildMapUaToAa(img))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;put.contig =3D putR=
GBUAcontig16bittile;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if( img-&g=
t;samplesperpixel &gt;=3D3 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (BuildMapBitdepth16To8(img))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;put.contig =3D putR=
GBcontig16bittile;<br>
-@@ -2539,7 +2548,7 @@ PickContigCase(TIFFRGBAImage* img)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PHOTOMETRIC_SE=
PARATED:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (buildMap(img)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (img-&gt;samplesperpixel &gt;=3D4 &amp;&amp; buildMap(img)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (img-&gt;bitspersample =3D=3D 8) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!img-=
&gt;Map)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0img-&gt;put.contig =3D putRGBcontig8bitCMYKtile;<br>
-@@ -2635,7 +2644,7 @@ PickContigCase(TIFFRGBAImage* img)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PHOTOMETRIC_CI=
ELAB:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (buildMap(img)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (img-&gt;samplesperpixel =3D=3D 3 &amp;&amp; buildMap(img)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (img-&gt;bitspersample =3D=3D 8)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img-&gt;p=
ut.contig =3D initCIELabConversion(img);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-Index: tiff-4.0.6/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- tiff-4.0.6.orig/ChangeLog<br>
-+++ tiff-4.0.6/ChangeLog<br>
-@@ -1,3 +1,11 @@<br>
-+2015-12-26=C2=A0 Even Rouault &lt;even.rouault at <a href=3D"http://spati=
alys.com" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0* libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBA=
Image<br>
-+=C2=A0 =C2=A0interface in case of unsupported values of SamplesPerPixel/E=
xtraSamples<br>
-+=C2=A0 =C2=A0for LogLUV / CIELab. Add explicit call to TIFFRGBAImageOK() =
in<br>
-+=C2=A0 =C2=A0TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by limingxi=
ng and<br>
-+=C2=A0 =C2=A0CVE-2015-8683 reported by zzf of Alibaba.<br>
-+<br>
- 2015-09-12=C2=A0 Bob Friesenhahn=C2=A0 &lt;<a href=3D"mailto:bfriesen@sim=
ple.dallas.tx.us" target=3D"_blank">bfriesen@simple.dallas.tx.us</a>&gt;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* libtiff 4.0.6 released.<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8781.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8781.patch<br>
deleted file mode 100644<br>
index 0846f0f..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8781.patch<br>
+++ /dev/null<br>
@@ -1,195 +0,0 @@<br>
-From aaab5c3c9d2a2c6984f23ccbc79702<wbr>610439bc65 Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Sun, 27 Dec 2015 16:25:11 +0000<br>
-Subject: [PATCH] * libtiff/tif_luv.c: fix potential out-of-bound writes in=
<br>
- decode functions in non debug builds by replacing assert()s by regular if=
<br>
- checks (bugzilla #2522). Fix potential out-of-bound reads in case of shor=
t<br>
- input data.<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/aaab5c3c9d2a2c6984f23ccb=
c79702610439bc65" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/aaab5c3c9d2a2c6984f2<wbr>3ccbc79702610439bc65</a><b=
r>
-hand applied Changelog changes<br>
-<br>
-CVE: CVE-2015-8781<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targ=
et=3D"_blank">akuster@mvista.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
- libtiff/tif_luv.c | 55 ++++++++++++++++++++++++++++++<wbr>++++++++++++++-=
----------<br>
- 2 files changed, 51 insertions(+), 11 deletions(-)<br>
-<br>
-Index: tiff-4.0.4/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- tiff-4.0.4.orig/ChangeLog<br>
-+++ tiff-4.0.4/ChangeLog<br>
-@@ -1,3 +1,10 @@<br>
-+2015-12-27=C2=A0 Even Rouault &lt;even.rouault at <a href=3D"http://spati=
alys.com" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 * libtiff/tif_luv.c: fix potential out-of-bound writ=
es in decode<br>
-+=C2=A0 =C2=A0 =C2=A0 functions in non debug builds by replacing assert()s=
 by regular if<br>
-+=C2=A0 =C2=A0 =C2=A0 checks (bugzilla #2522).<br>
-+=C2=A0 =C2=A0 =C2=A0 Fix potential out-of-bound reads in case of short in=
put data.<br>
-+<br>
- 2015-12-26=C2=A0 Even Rouault &lt;even.rouault at <a href=3D"http://spati=
alys.com" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* libtiff/tif_getimage.c: fix out-of-bound read=
s in TIFFRGBAImage<br>
-Index: tiff-4.0.4/libtiff/tif_luv.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- tiff-4.0.4.orig/libtiff/tif_lu<wbr>v.c<br>
-+++ tiff-4.0.4/libtiff/tif_luv.c<br>
-@@ -202,7 +202,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sp-&gt;user_datafmt =3D=3D SGILOGDATAFMT_16=
BIT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (int16*) op;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(sp-&gt;tbuflen &g=
t;=3D npixels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sp-&gt;tbuflen &lt; n=
pixels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TIFFErrorExt(tif-&gt;tif_clientda<wbr>ta, module,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Translation buffer too short&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (int16*) sp-=
&gt;tbuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0=
]));<br>
-@@ -211,9 +215,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cc =3D tif-&gt;tif_rawcc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* get each byte string */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (shft =3D 2*8; (shft -=3D 8) &gt;=3D 0; ) {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; npi=
xels &amp;&amp; cc &gt; 0; )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; npi=
xels &amp;&amp; cc &gt; 0; ) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (*bp &gt;=3D 128) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* run */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D *bp++ + (2-128);=C2=A0 =C2=A0/* TODO=
: potential input buffer overrun when decoding corrupt or truncated data */=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( cc &lt; 2 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D *bp++ + (2-128);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D (int16)(*bp++ &lt;&lt; shft);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc -=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (rc-- &amp;&amp; i &lt; npixels=
)<br>
-@@ -223,6 +229,7 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (--cc &amp;&amp; rc-- &amp;&amp=
; i &lt; npixels)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp[i++] |=
=3D (int16)*bp++ &lt;&lt; shft;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i !=3D npixels)=
 {<br>
- #if defined(__WIN32__) &amp;&amp; (defined(_MSC_VER) || defined(__MINGW32=
__))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TIFFErrorExt(tif-&gt;tif_clientd<wbr>ata, module,<br>
-@@ -268,13 +275,17 @@ LogLuvDecode24(TIFF* tif, uint8* op, tms<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sp-&gt;user_datafmt =3D=3D SGILOGDATAFMT_RA=
W)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32 *)op=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(sp-&gt;tbuflen &g=
t;=3D npixels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sp-&gt;tbuflen &lt; n=
pixels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TIFFErrorExt(tif-&gt;tif_clientda<wbr>ta, module,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Translation buffer too short&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32 *) s=
p-&gt;tbuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* copy to array of uint32 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bp =3D (unsigned char*) tif-&gt;tif_rawcp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cc =3D tif-&gt;tif_rawcc;<br>
--=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; npixels &amp;&amp; cc &gt; 0; i=
++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; npixels &amp;&amp; cc &gt;=3D 3=
; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp[i] =3D bp[0] &lt=
;&lt; 16 | bp[1] &lt;&lt; 8 | bp[2];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bp +=3D 3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc -=3D 3;<br>
-@@ -325,7 +336,11 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sp-&gt;user_datafmt =3D=3D SGILOGDATAFMT_RA=
W)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32*) op=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(sp-&gt;tbuflen &g=
t;=3D npixels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sp-&gt;tbuflen &lt; n=
pixels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TIFFErrorExt(tif-&gt;tif_clientda<wbr>ta, module,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Translation buffer too short&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32*) sp=
-&gt;tbuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0=
]));<br>
-@@ -334,11 +349,13 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cc =3D tif-&gt;tif_rawcc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* get each byte string */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (shft =3D 4*8; (shft -=3D 8) &gt;=3D 0; ) {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; npi=
xels &amp;&amp; cc &gt; 0; )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; npi=
xels &amp;&amp; cc &gt; 0; ) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (*bp &gt;=3D 128) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* run */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( cc &lt; 2 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D *bp++ + (2-128);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D (uint32)*bp++ &lt;&lt; shft;<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc -=3D 2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO: potential input buffer overrun when decod=
ing corrupt or truncated data */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc -=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (rc-- &amp;&amp; i &lt; npixels=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp[i++] |=
=3D b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* non-run */<br>
-@@ -346,6 +363,7 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (--cc &amp;&amp; rc-- &amp;&amp=
; i &lt; npixels)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp[i++] |=
=3D (uint32)*bp++ &lt;&lt; shft;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i !=3D npixels)=
 {<br>
- #if defined(__WIN32__) &amp;&amp; (defined(_MSC_VER) || defined(__MINGW32=
__))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TIFFErrorExt(tif-&gt;tif_clientd<wbr>ata, module,<br>
-@@ -413,6 +431,7 @@ LogLuvDecodeTile(TIFF* tif, uint8* bp, t<br>
- static int<br>
- LogL16Encode(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 static const char module[] =3D &quot;LogL16Encode&qu=
ot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LogLuvState* sp =3D EncoderState(tif);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int shft;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmsize_t i;<br>
-@@ -433,7 +452,11 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (int16*) bp;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (int16*) sp-=
&gt;tbuf;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(sp-&gt;tbuflen &g=
t;=3D npixels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sp-&gt;tbuflen &lt; n=
pixels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TIFFErrorExt(tif-&gt;tif_clientda<wbr>ta, module,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Translation buffer too short&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*sp-&gt;tfunc)(sp,=
 bp, npixels);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* compress each byte string */<br>
-@@ -506,6 +529,7 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz<br>
- static int<br>
- LogLuvEncode24(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 static const char module[] =3D &quot;LogLuvEncode24&=
quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LogLuvState* sp =3D EncoderState(tif);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmsize_t i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmsize_t npixels;<br>
-@@ -521,7 +545,11 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32*) bp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32*) sp=
-&gt;tbuf;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(sp-&gt;tbuflen &g=
t;=3D npixels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sp-&gt;tbuflen &lt; n=
pixels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TIFFErrorExt(tif-&gt;tif_clientda<wbr>ta, module,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Translation buffer too short&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*sp-&gt;tfunc)(sp,=
 bp, npixels);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* write out encoded pixels */<br>
-@@ -553,6 +581,7 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms<br>
- static int<br>
- LogLuvEncode32(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 static const char module[] =3D &quot;LogLuvEncode32&=
quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LogLuvState* sp =3D EncoderState(tif);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int shft;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmsize_t i;<br>
-@@ -574,7 +603,11 @@ LogLuvEncode32(TIFF* tif, uint8* bp, tms<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32*) bp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp =3D (uint32*) sp=
-&gt;tbuf;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(sp-&gt;tbuflen &g=
t;=3D npixels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sp-&gt;tbuflen &lt; n=
pixels) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TIFFErrorExt(tif-&gt;tif_clientda<wbr>ta, module,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Translation buffer too short&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*sp-&gt;tfunc)(sp,=
 bp, npixels);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* compress each byte string */<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8784.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8784.patch<br>
deleted file mode 100644<br>
index 0caf800..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2015-8784.patch<br>
+++ /dev/null<br>
@@ -1,73 +0,0 @@<br>
-From b18012dae552f85dcc5c57d3bf4e99<wbr>7a15b1cc1c Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Sun, 27 Dec 2015 16:55:20 +0000<br>
-Subject: [PATCH] * libtiff/tif_next.c: fix potential out-of-bound write in=
<br>
- NeXTDecode() triggered by <a href=3D"http://lcamtuf.coredump.cx/afl/vulns=
/libtiff5.tif" rel=3D"noreferrer" target=3D"_blank">http://lcamtuf.coredump=
.cx/afl<wbr>/vulns/libtiff5.tif</a><br>
- (bugzilla #2508)<br>
-<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/b18012dae552f85dcc5c57d3=
bf4e997a15b1cc1c" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/b18012dae552f85dcc5c<wbr>57d3bf4e997a15b1cc1c</a><b=
r>
-hand applied Changelog changes<br>
-<br>
-CVE:=C2=A0 CVE-2015-8784<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targ=
et=3D"_blank">akuster@mvista.com</a>&gt;<br>
-<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
- libtiff/tif_next.c | 10 ++++++++--<br>
- 2 files changed, 14 insertions(+), 2 deletions(-)<br>
-<br>
-Index: tiff-4.0.4/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- tiff-4.0.4.orig/ChangeLog<br>
-+++ tiff-4.0.4/ChangeLog<br>
-@@ -1,5 +1,11 @@<br>
- 2015-12-27=C2=A0 Even Rouault &lt;even.rouault at <a href=3D"http://spati=
alys.com" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 * libtiff/tif_next.c: fix potential out-of-bound wri=
te in NeXTDecode()<br>
-+=C2=A0 =C2=A0 =C2=A0 triggered by <a href=3D"http://lcamtuf.coredump.cx/a=
fl/vulns/libtiff5.tif" rel=3D"noreferrer" target=3D"_blank">http://lcamtuf.=
coredump.cx/afl<wbr>/vulns/libtiff5.tif</a><br>
-+=C2=A0 =C2=A0 =C2=A0 (bugzilla #2508)<br>
-+<br>
-+2015-12-27=C2=A0 Even Rouault &lt;even.rouault at <a href=3D"http://spati=
alys.com" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* libtiff/tif_luv.c: fix potential out-of-bound=
 writes in decode<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0functions in non debug builds by replacing asse=
rt()s by regular if<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0checks (bugzilla #2522).<br>
-Index: tiff-4.0.4/libtiff/tif_next.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- tiff-4.0.4.orig/libtiff/tif_ne<wbr>xt.c<br>
-+++ tiff-4.0.4/libtiff/tif_next.c<br>
-@@ -37,7 +37,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0: op[0]=C2=A0 =3D (unsigned char) ((v) &l=
t;&lt; 6); break;=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1: op[0] |=3D (v) &lt;&lt; 4; break;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 2: op[0] |=3D (v) &lt;&lt; 2; break;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 case 3: *op++ |=3D (v);=C2=A0 =C2=A0 =C2=A0 break;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0 case 3: *op++ |=3D (v);=C2=A0 =C2=A0 =C2=A0 op_offse=
t++; break;=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
- }<br>
-<br>
-@@ -106,6 +106,7 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32 imagewidth =3D tif-&gt;tif_dir.td_imagewidth;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( isTiled(tif) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imagewidth =
=3D tif-&gt;tif_dir.td_tilewidth;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmsize_t op_offset =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * The scanline is composed of a sequence of constant<br>
-@@ -122,10 +123,15 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * bounds, potentially resulting in a=
 security<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * issue.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (n-- &gt; 0 &amp;&amp; npixels &lt; i=
magewidth)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (n-- &gt; 0 &amp;&amp; npixels &lt; i=
magewidth &amp;&amp; op_offset &lt; scanline)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SETPIXEL(=
op, grey);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (npixels &gt;=3D imagewidth)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op_offset &gt=
;=3D scanline ) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TIF=
FErrorExt(tif-&gt;tif_clientda<wbr>ta, module, &quot;Invalid data for scanl=
ine %ld&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (long) tif-&gt;tif_row);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cc =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D *bp++, cc--;<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3186.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3186.patch<br>
deleted file mode 100644<br>
index 4a08aba..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3186.patch<br>
+++ /dev/null<br>
@@ -1,24 +0,0 @@<br>
-Buffer overflow in the readextension function in gif2tiff.c<br>
-allows remote attackers to cause a denial of service via a crafted GIF fil=
e.<br>
-<br>
-External References:<br>
-<a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2016-318=
6" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view<wbr>/=
vuln/detail?vulnId=3DCVE-2016-<wbr>3186</a><br>
-<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1319503" rel=3D"n=
oreferrer" target=3D"_blank">https://bugzilla.redhat.com/s<wbr>how_bug.cgi?=
id=3D1319503</a><br>
-<br>
-CVE: CVE-2016-3186<br>
-Upstream-Status: Backport (RedHat)<br>
-<a href=3D"https://bugzilla.redhat.com/attachment.cgi?id=3D1144235&amp;act=
ion=3Ddiff" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.co=
m/a<wbr>ttachment.cgi?id=3D1144235&amp;actio<wbr>n=3Ddiff</a><br>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
-<br>
---- tiff-4.0.6/tools/gif2tiff.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2016-04-06 15:4=
3:01.586048341 +0200<br>
-+++ tiff-4.0.6/tools/gif2tiff.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2016-04-06 15:4=
8:05.523207710 +0200<br>
-@@ -349,7 +349,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0int status =3D 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0(void) getc(infile);<br>
--=C2=A0 =C2=A0 while ((count =3D getc(infile)) &amp;&amp; count &lt;=3D 25=
5)<br>
-+=C2=A0 =C2=A0 while ((count =3D getc(infile)) &amp;&amp; count &gt;=3D 0 =
&amp;&amp; count &lt;=3D 255)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fread(buf, 1, count, infile) !=3D (s=
ize_t) count) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;shor=
t read from file %s (%s)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0filename, strerror(errno));<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3622.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3622.patch<br>
deleted file mode 100644<br>
index 0c8b716..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3622.patch<br>
+++ /dev/null<br>
@@ -1,129 +0,0 @@<br>
-From 92d966a5fcfbdca67957c8c5c47b46<wbr>7aa650b286 Mon Sep 17 00:00:00 200=
1<br>
-From: bfriesen &lt;bfriesen&gt;<br>
-Date: Sat, 24 Sep 2016 23:11:55 +0000<br>
-Subject: [PATCH] * libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject attemp=
ts<br>
- to read floating point images.<br>
-<br>
-* libtiff/tif_predict.c (PredictorSetup): Enforce bits-per-sample<br>
-requirements of floating point predictor (3).=C2=A0 Fixes CVE-2016-3622<br=
>
-&quot;Divide By Zero in the tiff2rgba tool.&quot;<br>
-<br>
-CVE: CVE-2016-3622<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/92d966a5fcfbdca67957c8c5=
c47b467aa650b286" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/92d966a5fcfbdca67957<wbr>c8c5c47b467aa650b286</a><b=
r>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++++++=
-<br>
- libtiff/tif_getimage.c | 38 ++++++++++++++++++++----------<wbr>--------<b=
r>
- libtiff/tif_predict.c=C2=A0 | 11 ++++++++++-<br>
- 3 files changed, 40 insertions(+), 20 deletions(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index 26d6f47..a628277 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,3 +1,12 @@<br>
-+2016-09-24=C2=A0 Bob Friesenhahn=C2=A0 &lt;<a href=3D"mailto:bfriesen@sim=
ple.dallas.tx.us" target=3D"_blank">bfriesen@simple.dallas.tx.us</a>&gt;<br=
>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 * libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject a=
ttempts to<br>
-+=C2=A0 =C2=A0 =C2=A0 read floating point images.<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 * libtiff/tif_predict.c (PredictorSetup): Enforce bi=
ts-per-sample<br>
-+=C2=A0 =C2=A0 =C2=A0 requirements of floating point predictor (3).=C2=A0 =
Fixes CVE-2016-3622<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;Divide By Zero in the tiff2rgba tool.&quot;<br=
>
-+<br>
- 2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* tools/rgb2ycbcr.c: validate values of -v and =
-h parameters to<br>
-diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c<br>
-index 386cee0..3e689ee 100644<br>
---- a/libtiff/tif_getimage.c<br>
-+++ b/libtiff/tif_getimage.c<br>
-@@ -95,6 +95,10 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0td-&gt;td_bitspersample);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return (0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (td-&gt;td_sampleformat =3D=3D SAMPLEFORMA=
T_IEEEFP) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(emsg, &qu=
ot;Sorry, can not handle images with IEEE floating-point samples&quot;);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0colorchannels =3D td-&gt;td_samplesperpixel - t=
d-&gt;td_extrasamples;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!TIFFGetField(tif, TIFFTAG_PHOTOMETRIC, &am=
p;photometric)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (colorchanne=
ls) {<br>
-@@ -182,27 +186,25 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Planarconfigurati=
on&quot;, td-&gt;td_planarconfig);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if( td-&gt;td_samplesperpixel !=3D 3 || colorchannels !=3D 3 )<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(emsg,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Sorry, can not handle image with %s=3D%d, %s=3D%d&quot;,<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Samples/pixel&quot;, td-&gt;td_samplesperpixel,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;colorchannels&quot;, colorchannels);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ( td-&gt;td_samplesperpixel !=3D 3 || colorchannels !=3D 3 ) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(emsg,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;So=
rry, can not handle image with %s=3D%d, %s=3D%d&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Sa=
mples/pixel&quot;, td-&gt;td_samplesperpixel,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;co=
lorchannels&quot;, colorchannels);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PHOTOMETRIC_CI=
ELAB:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( td-&gt;td_samplesperpixel !=
=3D 3 || colorchannels !=3D 3 || td-&gt;td_bitspersample !=3D 8 )<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(emsg,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Sorry, can not handle image with %s=3D%d, %s=3D%d and %s=
=3D%d&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Samples/pixel&quot;, td-&gt;td_samplesperpixel,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;colorchannels&quot;, colorchannels,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Bits/sample&quot;, td-&gt;td_bitspersample);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ( td-&gt;td_samplesperpixel !=3D 3 || colorchannels !=3D 3 ||=
 td-&gt;td_bitspersample !=3D 8 ) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(emsg,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;So=
rry, can not handle image with %s=3D%d, %s=3D%d and %s=3D%d&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Sa=
mples/pixel&quot;, td-&gt;td_samplesperpixel,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;co=
lorchannels&quot;, colorchannels,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Bi=
ts/sample&quot;, td-&gt;td_bitspersample);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sprintf(emsg, &quot;Sorry, can not handle image with %s=3D%d&quot=
;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0photoTag, photometric);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return (0);<br>
-diff --git a/libtiff/tif_predict.c b/libtiff/tif_predict.c<br>
-index 081eb11..555f2f9 100644<br>
---- a/libtiff/tif_predict.c<br>
-+++ b/libtiff/tif_predict.c<br>
-@@ -80,6 +80,15 @@ PredictorSetup(TIFF* tif)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td-&gt;td_sampleformat)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (td-&gt;td_bitspersample !=3D 16<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; td-&gt;td_bitspersample !=3D 24<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; td-&gt;td_bitspersample !=3D 32<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; td-&gt;td_bitspersample !=3D 64) { /* S=
hould 64 be allowed? */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFErrorExt(tif-&gt;tif_clientda<wb=
r>ta, module,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;Floating point \&quot;Predictor\&quot; not supported wit=
h %d-bit samples&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0td-&gt;td_bitspersample);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TIFFErrorExt(tif-&gt;tif_clientd<wbr>ata, module,<br>
-@@ -174,7 +183,7 @@ PredictorSetupDecode(TIFF* tif)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Allocate buffer =
to keep the decoded bytes before<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* rearranging in t=
he ight order<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* rearranging in t=
he right order<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3623.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3623.patch<br>
deleted file mode 100644<br>
index f554ac5..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3623.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From bd024f07019f5d9fea236675607a69<wbr>f74a66bc7b Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Mon, 15 Aug 2016 21:26:56 +0000<br>
-Subject: [PATCH] * tools/rgb2ycbcr.c: validate values of -v and -h paramet=
ers<br>
- to avoid potential divide by zero. Fixes CVE-2016-3623 (bugzilla #2569)<b=
r>
-<br>
-CVE: CVE-2016-3623<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/bd024f07019f5d9fea236675=
607a69f74a66bc7b" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/bd024f07019f5d9fea23<wbr>6675607a69f74a66bc7b</a><b=
r>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
- tools/rgb2ycbcr.c | 4 ++++<br>
- 2 files changed, 9 insertions(+)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index 5d60608..3e6642a 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,5 +1,10 @@<br>
- 2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 * tools/rgb2ycbcr.c: validate values of -v and -h pa=
rameters to<br>
-+=C2=A0 =C2=A0 =C2=A0 avoid potential divide by zero. Fixes CVE-2016-3623 =
(bugzilla #2569)<br>
-+<br>
-+2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* tools/tiffcrop.c: Fix out-of-bounds write in =
loadImage().<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0From patch libtiff-CVE-2016-3991.patch from<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libtiff-4.0.3-25.el7_2.src.<wbr>rpm by Nikola F=
orro (bugzilla #2543)<br>
-diff --git a/tools/rgb2ycbcr.c b/tools/rgb2ycbcr.c<br>
-index 3829d6b..51f4259 100644<br>
---- a/tools/rgb2ycbcr.c<br>
-+++ b/tools/rgb2ycbcr.c<br>
-@@ -95,9 +95,13 @@ main(int argc, char* argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;h&#39;:<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0horizSubSampling =3D atoi(optarg);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( horizSubSampling !=3D 1 &am=
p;&amp; horizSubSampling !=3D 2 &amp;&amp; horizSubSampling !=3D 4 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usage(-1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;v&#39;:<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vertSubSampling =3D atoi(optarg);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( vertSubSampling !=3D 1 &amp=
;&amp; vertSubSampling !=3D 2 &amp;&amp; vertSubSampling !=3D 4 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usage(-1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;r&#39;:<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rowsperstrip =3D atoi(optarg);<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3945.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3945.patch<br>
deleted file mode 100644<br>
index 4d965be..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3945.patch<br>
+++ /dev/null<br>
@@ -1,118 +0,0 @@<br>
-From 7c39352ccd9060d311d3dc9a1f1bc0<wbr>0133a160e6 Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Mon, 15 Aug 2016 20:06:40 +0000<br>
-Subject: [PATCH] * tools/tiff2rgba.c: Fix integer overflow in size of<br>
- allocated buffer, when -b mode is enabled, that could result in out-of-bo=
unds<br>
- write. Based initially on patch tiff-CVE-2016-3945.patch from<br>
- libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for inval=
id<br>
- tests that rejected valid files.<br>
-<br>
-CVE: CVE-2016-3945<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a=
1f1bc00133a160e6" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/7c39352ccd9060d311d3<wbr>dc9a1f1bc00133a160e6</a><b=
r>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
- tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++<wbr>----<br>
- 2 files changed, 38 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index 62dc1b5..9c0ab29 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,3 +1,11 @@<br>
-+2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 * tools/tiff2rgba.c: Fix integer overflow in size of=
 allocated<br>
-+=C2=A0 =C2=A0 =C2=A0 buffer, when -b mode is enabled, that could result i=
n out-of-bounds<br>
-+=C2=A0 =C2=A0 =C2=A0 write. Based initially on patch tiff-CVE-2016-3945.p=
atch from<br>
-+=C2=A0 =C2=A0 =C2=A0 libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with=
 correction for<br>
-+=C2=A0 =C2=A0 =C2=A0 invalid tests that rejected valid files.<br>
-+<br>
- 2016-07-11 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* tools/tiffcrop.c: Avoid access outside of sta=
ck allocated array<br>
-diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c<br>
-index b7a81eb..16e3dc4 100644<br>
---- a/tools/tiff2rgba.c<br>
-+++ b/tools/tiff2rgba.c<br>
-@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
-=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 row, col;<br>
-=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 *wrk_line;<br>
-=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 1;<=
br>
-+=C2=A0 =C2=A0 uint32=C2=A0 rastersize, wrk_linesize;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &amp;width);<br>
-=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGELENGTH, &amp;height);<br=
>
-@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
-=C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 * Allocate tile buffer<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(tile_widt<wbr>h * tile_heig=
ht * sizeof (uint32));<br>
-+=C2=A0 =C2=A0 rastersize =3D tile_width * tile_height * sizeof (uint32);<=
br>
-+=C2=A0 =C2=A0 if (tile_width !=3D (rastersize / tile_height) / sizeof( ui=
nt32))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer overflow w=
hen calculating raster buffer&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(rastersiz<wbr>e);<br>
-=C2=A0 =C2=A0 =C2=A0if (raster =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster buffer&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (0);<br>
-@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
-=C2=A0 =C2=A0 =C2=A0 * Allocate a scanline buffer for swapping during the =
vertical<br>
-=C2=A0 =C2=A0 =C2=A0 * mirroring pass.<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(tile_widt<wbr>h * sizeof =
(uint32));<br>
-+=C2=A0 =C2=A0 wrk_linesize =3D tile_width * sizeof (uint32);<br>
-+=C2=A0 =C2=A0 if (tile_width !=3D wrk_linesize / sizeof (uint32))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer ove=
rflow when calculating wrk_line buffer&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(wrk_lines<wbr>ize);<br>
-=C2=A0 =C2=A0 =C2=A0if (!wrk_line) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster scanline buffer&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 0;<br>
-@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
-=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 row;<br>
-=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 *wrk_line;<br>
-=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 1;<=
br>
-+=C2=A0 =C2=A0 uint32=C2=A0 rastersize, wrk_linesize;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &amp;width);<br>
-=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGELENGTH, &amp;height);<br=
>
-@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
-=C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 * Allocate strip buffer<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(width * rowsperstrip * size=
of (uint32));<br>
-+=C2=A0 =C2=A0 rastersize =3D width * rowsperstrip * sizeof (uint32);<br>
-+=C2=A0 =C2=A0 if (width !=3D (rastersize / rowsperstrip) / sizeof( uint32=
))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer overflow w=
hen calculating raster buffer&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(rastersiz<wbr>e);<br>
-=C2=A0 =C2=A0 =C2=A0if (raster =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster buffer&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (0);<br>
-@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
-=C2=A0 =C2=A0 =C2=A0 * Allocate a scanline buffer for swapping during the =
vertical<br>
-=C2=A0 =C2=A0 =C2=A0 * mirroring pass.<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(width * sizeof (uint32));=
<br>
-+=C2=A0 =C2=A0 wrk_linesize =3D width * sizeof (uint32);<br>
-+=C2=A0 =C2=A0 if (width !=3D wrk_linesize / sizeof (uint32))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer ove=
rflow when calculating wrk_line buffer&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(wrk_lines<wbr>ize);<br>
-=C2=A0 =C2=A0 =C2=A0if (!wrk_line) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster scanline buffer&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 0;<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3990.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3990.patch<br>
deleted file mode 100644<br>
index 7bf52ee..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3990.patch<br>
+++ /dev/null<br>
@@ -1,66 +0,0 @@<br>
-From 6a4dbb07ccf92836bb4adac7be4575<wbr>672d0ac5f1 Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Mon, 15 Aug 2016 20:49:48 +0000<br>
-Subject: [PATCH] * libtiff/tif_pixarlog.c: Fix write buffer overflow in<br=
>
- PixarLogEncode if more input samples are provided than expected by<br>
- PixarLogSetupEncode. Idea based on libtiff-CVE-2016-3990.patch from<br>
- libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but with different and<br=
>
- simpler check. (bugzilla #2544)<br>
-<br>
-invalid tests that rejected valid files. (bugzilla #2545)<br>
-<br>
-CVE: CVE-2016-3990<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/6a4dbb07ccf92836bb4adac7=
be4575672d0ac5f1" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/6a4dbb07ccf92836bb4a<wbr>dac7be4575672d0ac5f1</a><b=
r>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++++++-=
<br>
- libtiff/tif_pixarlog.c |=C2=A0 7 +++++++<br>
- 2 files changed, 16 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index 9c0ab29..db4ea18 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,10 +1,18 @@<br>
- 2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 * libtiff/tif_pixarlog.c: Fix write buffer overflow =
in PixarLogEncode<br>
-+=C2=A0 =C2=A0 =C2=A0 if more input samples are provided than expected by =
PixarLogSetupEncode.<br>
-+=C2=A0 =C2=A0 =C2=A0 Idea based on libtiff-CVE-2016-3990.patch from<br>
-+=C2=A0 =C2=A0 =C2=A0 libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but =
with different and<br>
-+=C2=A0 =C2=A0 =C2=A0 simpler check. (bugzilla #2544)<br>
-+<br>
-+2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* tools/tiff2rgba.c: Fix integer overflow in si=
ze of allocated<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer, when -b mode is enabled, that could res=
ult in out-of-bounds<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0write. Based initially on patch tiff-CVE-2016-3=
945.patch from<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libtiff-4.0.3-25.el7_2.src.<wbr>rpm by Nikola F=
orro, with correction for<br>
--=C2=A0 =C2=A0 =C2=A0 invalid tests that rejected valid files.<br>
-+=C2=A0 =C2=A0 =C2=A0 invalid tests that rejected valid files. (bugzilla #=
2545)<br>
-<br>
- 2016-07-11 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-diff --git a/libtiff/tif_pixarlog.c b/libtiff/tif_pixarlog.c<br>
-index e78f788..28329d1 100644<br>
---- a/libtiff/tif_pixarlog.c<br>
-+++ b/libtiff/tif_pixarlog.c<br>
-@@ -1141,6 +1141,13 @@ PixarLogEncode(TIFF* tif, uint8* bp, tmsize_t cc, u=
int16 s)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0llen =3D sp-&gt;stride * td-&gt;td_imagewidth;<=
br>
-+=C2=A0 =C2=A0 /* Check against the number of elements (of size uint16) of=
 sp-&gt;tbuf */<br>
-+=C2=A0 =C2=A0 if( n &gt; td-&gt;td_rowsperstrip * llen )<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFErrorExt(tif-&gt;tif_clientda<wbr>ta, mod=
ule,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;Too many input bytes provided&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0, up =3D sp-&gt;tbuf; i &lt; n; i +=
=3D llen, up +=3D llen) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (sp-&gt;user=
_datafmt)=C2=A0 {<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3991.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3991.patch<br>
deleted file mode 100644<br>
index 27dfd37..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-3991.patch<br>
+++ /dev/null<br>
@@ -1,147 +0,0 @@<br>
-From e596d4e27c5afb7960dc360fdd3afd<wbr>90ba0fb8ba Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Mon, 15 Aug 2016 21:05:40 +0000<br>
-Subject: [PATCH 2/2] * tools/tiffcrop.c: Fix out-of-bounds write in<br>
- loadImage(). From patch libtiff-CVE-2016-3991.patch from<br>
- libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)<br>
-<br>
-CVE: CVE-2016-3991<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/e596d4e27c5afb7960dc360f=
dd3afd90ba0fb8ba" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/e596d4e27c5afb7960dc<wbr>360fdd3afd90ba0fb8ba</a><b=
r>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
- tools/tiffcrop.c | 59 ++++++++++++++++++++++++++++++<wbr>++++++++++++++++=
+++++++---<br>
- 2 files changed, 62 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index db4ea18..5d60608 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,5 +1,11 @@<br>
- 2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 * tools/tiffcrop.c: Fix out-of-bounds write in loadI=
mage().<br>
-+=C2=A0 =C2=A0 =C2=A0 From patch libtiff-CVE-2016-3991.patch from<br>
-+=C2=A0 =C2=A0 =C2=A0 libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugz=
illa #2543)<br>
-+<br>
-+2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* libtiff/tif_pixarlog.c: Fix write buffer over=
flow in PixarLogEncode<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if more input samples are provided than expecte=
d by PixarLogSetupEncode.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Idea based on libtiff-CVE-2016-3990.patch from<=
br>
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c<br>
-index 27abc0b..ddba7b9 100644<br>
---- a/tools/tiffcrop.c<br>
-+++ b/tools/tiffcrop.c<br>
-@@ -798,6 +798,11 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8=
* buf,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0tile_buffsize =3D tilesize;<br>
-+=C2=A0 if (tilesize =3D=3D 0 || tile_rowsize =3D=3D 0)<br>
-+=C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0TIFFError(&quot;readContigTilesInt<wbr>oBuffer&quot;,=
 &quot;Tile size or tile rowsize is zero&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0exit(-1);<br>
-+=C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0if (tilesize &lt; (tsize_t)(tl * tile_rowsize))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -807,7 +812,12 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8=
* buf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tilesize, tl * tile=
_rowsize);<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0tile_buffsize =3D tl * tile_rowsize;<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (tl !=3D (tile_buffsize / tile_rowsize))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;readContigTilesInto<wbr>Buffer&quot;=
, &quot;Integer overflow when calculating buffer size.&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0tilebuf =3D _TIFFmalloc(tile_buffsize);<br>
-=C2=A0 =C2=A0if (tilebuf =3D=3D 0)<br>
-@@ -1210,6 +1220,12 @@ static int writeBufferToContigTiles (TIFF* out, uin=
t8* buf, uint32 imagelength,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0!TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &amp;=
bps) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-<br>
-+=C2=A0 if (tilesize =3D=3D 0 || tile_rowsize =3D=3D 0 || tl =3D=3D 0 || t=
w =3D=3D 0)<br>
-+=C2=A0 {<br>
-+=C2=A0 =C2=A0 TIFFError(&quot;writeBufferToContig<wbr>Tiles&quot;, &quot;=
Tile size, tile row size, tile width, or tile length is zero&quot;);<br>
-+=C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0tile_buffsize =3D tilesize;<br>
-=C2=A0 =C2=A0if (tilesize &lt; (tsize_t)(tl * tile_rowsize))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -1219,6 +1235,11 @@ static int writeBufferToContigTiles (TIFF* out, uin=
t8* buf, uint32 imagelength,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tilesize, tl * tile=
_rowsize);<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0tile_buffsize =3D tl * tile_rowsize;<br>
-+=C2=A0 =C2=A0 if (tl !=3D tile_buffsize / tile_rowsize)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;writeBufferToContig<wbr>Tiles&quot;,=
 &quot;Integer overflow when calculating buffer size&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0tilebuf =3D _TIFFmalloc(tile_buffsize);<br>
-@@ -5945,12 +5966,27 @@ loadImage(TIFF* in, struct image_data *image, stru=
ct dump_opts *dump, unsigned c<br>
-=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_TILELENGTH, &amp;tl);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0tile_rowsize=C2=A0 =3D TIFFTileRowSize(in);<br>
-+=C2=A0 =C2=A0 if (ntiles =3D=3D 0 || tlsize =3D=3D 0 || tile_rowsize =3D=
=3D 0)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;loadImage&quot;, &quot;File appears =
to be tiled, but the number of tiles, tile size, or tile rowsize is zero.&q=
uot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0buffsize =3D tlsize * ntiles;<br>
-+=C2=A0 =C2=A0 if (tlsize !=3D (buffsize / ntiles))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;loadImage&quot;, &quot;Integer overf=
low when calculating buffer size&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0if (buffsize &lt; (uint32)(ntiles * tl * tile_rowsize)=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buffsize =3D ntiles * tl * tile_rowsize;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (ntiles !=3D (buffsize / tl / tile_rowsize))<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;loadImage&quot;, &quot;Integer overf=
low when calculating buffer size&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
- #ifdef DEBUG2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(&quot;loadImage&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Tilesize %u i=
s too small, using ntiles * tilelength * tilerowsize %lu&quot;,<br>
-@@ -5969,8 +6005,25 @@ loadImage(TIFF* in, struct image_data *image, struc=
t dump_opts *dump, unsigned c<br>
-=C2=A0 =C2=A0 =C2=A0TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP, &amp;r=
owsperstrip);<br>
-=C2=A0 =C2=A0 =C2=A0stsize =3D TIFFStripSize(in);<br>
-=C2=A0 =C2=A0 =C2=A0nstrips =3D TIFFNumberOfStrips(in);<br>
-+=C2=A0 =C2=A0 if (nstrips =3D=3D 0 || stsize =3D=3D 0)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;loadImage&quot;, &quot;File appears =
to be striped, but the number of stipes or stripe size is zero.&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0buffsize =3D stsize * nstrips;<br>
--<br>
-+=C2=A0 =C2=A0 if (stsize !=3D (buffsize / nstrips))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;loadImage&quot;, &quot;Integer overf=
low when calculating buffer size&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 uint32 buffsize_check;<br>
-+=C2=A0 =C2=A0 buffsize_check =3D ((length * width * spp * bps) + 7);<br>
-+=C2=A0 =C2=A0 if (length !=3D ((buffsize_check - 7) / width / spp / bps))=
<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;loadImage&quot;, &quot;Integer overf=
low detected.&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0if (buffsize &lt; (uint32) (((length * width * spp * b=
ps) + 7) / 8))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buffsize =3D=C2=A0 ((length * width * spp * bps=
) + 7) / 8;<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-5321.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-5321.patch<br>
deleted file mode 100644<br>
index 63c6650..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-5321.patch<br>
+++ /dev/null<br>
@@ -1,49 +0,0 @@<br>
-From d9783e4a1476b6787a51c5ae9e9b31<wbr>56527589f0 Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Mon, 11 Jul 2016 21:26:03 +0000<br>
-Subject: [PATCH 1/2] * tools/tiffcrop.c: Avoid access outside of stack<br>
- allocated array on a tiled separate TIFF with more than 8 samples per pix=
el.<br>
- Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360<br>
- (CVE-2016-5321, bugzilla #2558)<br>
-<br>
-CVE: CVE-2016-5321<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/d9783e4a1476b6787a51c5ae=
9e9b3156527589f0" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/d9783e4a1476b6787a51<wbr>c5ae9e9b3156527589f0</a><b=
r>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
- tools/tiffcrop.c | 2 +-<br>
- 2 files changed, 8 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index e98d54d..4e0302f 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,3 +1,10 @@<br>
-+2016-07-11 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 * tools/tiffcrop.c: Avoid access outside of stack al=
located array<br>
-+=C2=A0 =C2=A0 =C2=A0 on a tiled separate TIFF with more than 8 samples pe=
r pixel.<br>
-+=C2=A0 =C2=A0 =C2=A0 Reported by Kaixiang Zhang of the Cloud Security Tea=
m, Qihoo 360<br>
-+=C2=A0 =C2=A0 =C2=A0 (CVE-2016-5321, bugzilla #2558)<br>
-+<br>
- 2015-12-27=C2=A0 Even Rouault &lt;even.rouault at <a href=3D"http://spati=
alys.com" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* libtiff/tif_next.c: fix potential out-of-boun=
d write in NeXTDecode()<br>
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c<br>
-index d959ae3..6fc8fc1 100644<br>
---- a/tools/tiffcrop.c<br>
-+++ b/tools/tiffcrop.c<br>
-@@ -989,7 +989,7 @@ static int=C2=A0 readSeparateTilesIntoBuffer (TIFF* in=
, uint8 *obuf,<br>
-=C2=A0 =C2=A0 =C2=A0nrow =3D (row + tl &gt; imagelength) ? imagelength - r=
ow : tl;<br>
-=C2=A0 =C2=A0 =C2=A0for (col =3D 0; col &lt; imagewidth; col +=3D tw)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp &amp;&amp; s &lt; MAX_SAMPL=
ES; s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 /* Read each plane of a tile set=
 into srcbuffs[s] */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tbytes =3D TIFFReadTile(in, srcbuffs[s], col, r=
ow, 0, s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tbytes &lt; 0=C2=A0 &amp;&amp; !igno=
re)<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-5323.patch=
 b/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-5323.patch<br>
deleted file mode 100644<br>
index 41eab91..0000000<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/files/CVE-2016-5323.patch<br>
+++ /dev/null<br>
@@ -1,107 +0,0 @@<br>
-From 2f79856097f423eb33796a15fcf700<wbr>d2ea41bf31 Mon Sep 17 00:00:00 200=
1<br>
-From: erouault &lt;erouault&gt;<br>
-Date: Mon, 11 Jul 2016 21:38:31 +0000<br>
-Subject: [PATCH 2/2] (CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 / #25=
59)<br>
-<br>
-CVE: CVE-2016-5323<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/vadz/libtiff/commit/2f79856097f423eb33796a15=
fcf700d2ea41bf31" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/libti<wbr>ff/commit/2f79856097f423eb3379<wbr>6a15fcf700d2ea41bf31</a><b=
r>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com" target=
=3D"_blank">yi.zhao@windirver.com</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- tools/tiffcrop.c | 16 ++++++++--------<br>
- 2 files changed, 9 insertions(+), 9 deletions(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index 4e0302f..62dc1b5 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -3,7 +3,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* tools/tiffcrop.c: Avoid access outside of sta=
ck allocated array<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0on a tiled separate TIFF with more than 8 sampl=
es per pixel.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Reported by Kaixiang Zhang of the Cloud Securit=
y Team, Qihoo 360<br>
--=C2=A0 =C2=A0 =C2=A0 (CVE-2016-5321, bugzilla #2558)<br>
-+=C2=A0 =C2=A0 =C2=A0 (CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 / #2=
559)<br>
-<br>
- 2016-07-10 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
-<br>
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c<br>
-index 6fc8fc1..27abc0b 100644<br>
---- a/tools/tiffcrop.c<br>
-+++ b/tools/tiffcrop.c<br>
-@@ -3738,7 +3738,7 @@ combineSeparateSamples8bits (uint8 *in[], uint8 *out=
, uint32 cols,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (8 - src_bit - =
bps);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* load up next sample from each plane */<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buff1 =3D ((*src) &amp; matchbits) &lt;&=
lt; (src_bit);<br>
-@@ -3837,7 +3837,7 @@ combineSeparateSamples16bits (uint8 *in[], uint8 *ou=
t, uint32 cols,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src_bit=C2=A0 =3D bit_offset % 8;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (16 - src_bit -=
 bps);<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (little_endian)<br>
-@@ -3947,7 +3947,7 @@ combineSeparateSamples24bits (uint8 *in[], uint8 *ou=
t, uint32 cols,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src_bit=C2=A0 =3D bit_offset % 8;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (32 - src_bit -=
 bps);<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (little_endian)<br>
-@@ -4073,7 +4073,7 @@ combineSeparateSamples32bits (uint8 *in[], uint8 *ou=
t, uint32 cols,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src_bit=C2=A0 =3D bit_offset % 8;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (64 - src_bit -=
 bps);<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (little_endian)<br>
-@@ -4263,7 +4263,7 @@ combineSeparateTileSamples8bit<wbr>s (uint8 *in[], u=
int8 *out, uint32 cols,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (8 - src_bit - =
bps);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* load up next sample from each plane */<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buff1 =3D ((*src) &amp; matchbits) &lt;&=
lt; (src_bit);<br>
-@@ -4362,7 +4362,7 @@ combineSeparateTileSamples16bi<wbr>ts (uint8 *in[], =
uint8 *out, uint32 cols,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src_bit=C2=A0 =3D bit_offset % 8;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (16 - src_bit -=
 bps);<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (little_endian)<br>
-@@ -4471,7 +4471,7 @@ combineSeparateTileSamples24bi<wbr>ts (uint8 *in[], =
uint8 *out, uint32 cols,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src_bit=C2=A0 =3D bit_offset % 8;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (32 - src_bit -=
 bps);<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (little_endian)<br>
-@@ -4597,7 +4597,7 @@ combineSeparateTileSamples32bi<wbr>ts (uint8 *in[], =
uint8 *out, uint32 cols,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src_bit=C2=A0 =3D bit_offset % 8;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0matchbits =3D maskbits &lt;&lt; (64 - src_bit -=
 bps);<br>
--=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; s &lt; spp; s++)<br>
-+=C2=A0 =C2=A0 =C2=A0 for (s =3D 0; (s &lt; spp) &amp;&amp; (s &lt; MAX_SA=
MPLES); s++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D in[s] + src_offset + src_byte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (little_endian)<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/libt<wbr>iff/<a href=3D"http://tiff_4.=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a> b/meta/recip=
es-multimedia/libt<wbr>iff/<a href=3D"http://tiff_4.0.7.bb" rel=3D"noreferr=
er" target=3D"_blank">tiff_4.0.7.bb</a><br>
similarity index 74%<br>
rename from meta/recipes-multimedia/libtif<wbr>f/<a href=3D"http://tiff_4.0=
.6.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a><br>
rename to meta/recipes-multimedia/libtif<wbr>f/<a href=3D"http://tiff_4.0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.0.7.bb</a><br>
index 796d86e..52fc553 100644<br>
--- a/meta/recipes-multimedia/libt<wbr>iff/<a href=3D"http://tiff_4.0.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a><br>
+++ b/meta/recipes-multimedia/libt<wbr>iff/<a href=3D"http://tiff_4.0.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">tiff_4.0.7.bb</a><br>
@@ -4,21 +4,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D34da3db=
4<wbr>6fab7501992f9615d7e158cf&quot;<br>
=C2=A0 =C2=A0 SRC_URI =3D &quot;<a href=3D"http://download.osgeo.org/libtif=
f/tiff-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downlo=
ad.osgeo.org/lib<wbr>tiff/tiff-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libtool2.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2015-8665_8683.pat<wbr=
>ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2015-8781.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2015-8784.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-3186.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-5321.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-5323.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-3945.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-3990.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-3991.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-3623.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-3622.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0 -SRC_URI[md5sum] =3D &quot;d1d2e940dea0b5ad435f21f03d96d<wbr>d72&quo=
t;<br>
-SRC_URI[sha256sum] =3D &quot;4d57a50907b510e3049a4bba0d788<wbr>8930fdfc16c=
e49f1bf693e5b624737<wbr>0d68c&quot;<br>
+SRC_URI[md5sum] =3D &quot;77ae928d2c6b7fb46a21c3a293251<wbr>57b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9f43a2cfb9589e5cecaa66e16bf87<wbr>f814c945f22=
df7ba600d63aac4632c<wbr>4f019&quot;<br>
=C2=A0 =C2=A0 # exclude betas<br>
=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;tiff-(?P&lt;pver&gt;\d+(\.\d+)+).ta<w=
br>r&quot;<span class=3D"HOEnZb"><font color=3D"#888888"><br>
</font></span></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113a01e8aeaaeb0541fa0db8--
