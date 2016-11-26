Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B240071AE7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 15:35:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so8280580pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Nf9IbLxC1Fw6ch0dJr9ky9tn+uki4GRVp78Oop47MGM=;
	b=FDWG1YdsJsuPdk4LyEEV1YZUt74Y7O/q5ScKeaHQV2XuEygRTbUwNcZPDIhu5uqLxv
	aQAWo4watxdFcOzHnv0QuX1WdXJjnHENZm9EtxDKlf/gptSMYVzl86ytnm67gJ/fT9/u
	qP+cxTbRmAfWj218a2inp2g7pX7W7QAsZSU8LLjR3+4/RhOmOCdK0GrbeoxZZO+pWXrR
	o/bXqsXL/mYJwogmL3dDrLAwFH5U491G4Q3SR+a4Gxp24uylrmYEUKUz4xrA8dFLaNKi
	yRWmECfmWcMY0YTGRKmH5aejzHmNgWp0uzrJnA8W51XUGq1Vm0Cx3WvhKIMm9Koz3PKe
	k7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Nf9IbLxC1Fw6ch0dJr9ky9tn+uki4GRVp78Oop47MGM=;
	b=WMQUMXWJWIldfcbIcmy1Tpd/jEsS7uPyifrE9eMXPsBlGtKq5CTyyDv1mFtQmlm5Jx
	3duGsnF44Y24WNfkRANSirRsIP77xQqv8qLMU93SH1vY2WsHkvVaeqvnzfy3em2zig7A
	ZruKKt5rmMQERv83v74w8qwP0M4YI7IwaL4auI3xQULc71je1vII5MX18sLi3skRdpHZ
	qCPreK5e++Tz/SuH0BAkY0VurxvONcS/L8It7V7W1tXBIjIjv6p1FBWdnqbzmJiy8eBE
	A8Pilz5a5KSp3KkIgbuOGPBxGpM8Tu4xJnpGjrZeUkjlJ0w8e9wEyLNn1VGzUVK5MEHp
	dAlQ==
X-Gm-Message-State: AKaTC00sr79i3QavFEUtbwX3QBTcRQfBX++G5E7RC6rv8wQOtE1vgeDhV+wbGlI1peunBQ==
X-Received: by 10.99.145.74 with SMTP id l71mr24065630pge.128.1480174539868;
	Sat, 26 Nov 2016 07:35:39 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:bcc3:6b30:3fc9:245b?
	([2601:202:4001:9ea0:bcc3:6b30:3fc9:245b])
	by smtp.googlemail.com with ESMTPSA id
	p26sm57837813pgn.11.2016.11.26.07.35.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Nov 2016 07:35:39 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
References: <1479792499-19369-1-git-send-email-akuster@mvista.com>
	<61bcea65-f891-2914-27a4-e788fc517cde@gmail.com>
	<CAJTo0Lbu=AFNagERvJ55T1Lo6b4NotWiXSGn8pXgWJEBXJmEbA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9c2e83c7-00e9-28fc-9947-7f30fbeb8ccd@gmail.com>
Date: Sat, 26 Nov 2016 07:35:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbu=AFNagERvJ55T1Lo6b4NotWiXSGn8pXgWJEBXJmEbA@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Nov 2016 15:35:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/23/2016 08:04 AM, Burton, Ross wrote:
> CCing Leo and Jose who have been working on this.
> 
> Ross
> 

Had to respin do to additional tiff patches in master just added. V2
will be out shortly.

- armin

> On 23 November 2016 at 15:32, akuster808 <akuster808@gmail.com> wrote:
> 
>> The never made into patchwork. is there a bug there ? is there an issue on
>> how I submitted?
>>
>> - armin
>>
>>
>> On 11/21/2016 09:28 PM, Armin Kuster wrote:
>>
>>> Major changes:
>>> The libtiff tools bmp2tiff, gif2tiff, ras2tiff, sgi2tiff, sgisv, and
>>> ycbcr are completely removed from the distribution, used for demos.
>>>
>>> CVEs fixed:
>>> CVE-2016-9297
>>> CVE-2016-9448
>>> CVE-2016-9273
>>> CVE-2014-8127
>>> CVE-2016-3658
>>> CVE-2016-5875
>>> CVE-2016-5652
>>> CVE-2016-3632
>>>
>>> plus more that are not identified in the changelog.
>>>
>>> removed patches integrated into update.
>>> more info: http://libtiff.maptools.org/v4.0.7.html
>>>
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>>   .../libtiff/files/CVE-2015-8665_8683.patch         | 137
>>> ---------------
>>>   .../libtiff/files/CVE-2015-8781.patch              | 195
>>> ---------------------
>>>   .../libtiff/files/CVE-2015-8784.patch              |  73 --------
>>>   .../libtiff/files/CVE-2016-3186.patch              |  24 ---
>>>   .../libtiff/files/CVE-2016-3622.patch              | 129 --------------
>>>   .../libtiff/files/CVE-2016-3623.patch              |  52 ------
>>>   .../libtiff/files/CVE-2016-3945.patch              | 118 -------------
>>>   .../libtiff/files/CVE-2016-3990.patch              |  66 -------
>>>   .../libtiff/files/CVE-2016-3991.patch              | 147
>>> ----------------
>>>   .../libtiff/files/CVE-2016-5321.patch              |  49 ------
>>>   .../libtiff/files/CVE-2016-5323.patch              | 107 -----------
>>>   .../libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb}       |  15 +-
>>>   12 files changed, 2 insertions(+), 1110 deletions(-)
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2015-8665_8683.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2015-8781.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2015-8784.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-3186.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-3622.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-3623.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-3945.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-3990.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-3991.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-5321.patch
>>>   delete mode 100644 meta/recipes-multimedia/libtif
>>> f/files/CVE-2016-5323.patch
>>>   rename meta/recipes-multimedia/libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb}
>>> (74%)
>>>
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
>>> deleted file mode 100644
>>> index 39c5059..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
>>> +++ /dev/null
>>> @@ -1,137 +0,0 @@
>>> -From f94a29a822f5528d2334592760fbb7938f15eb55 Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Sat, 26 Dec 2015 17:32:03 +0000
>>> -Subject: [PATCH] * libtiff/tif_getimage.c: fix out-of-bound reads in
>>> - TIFFRGBAImage interface in case of unsupported values of
>>> - SamplesPerPixel/ExtraSamples for LogLUV / CIELab. Add explicit call to
>>> - TIFFRGBAImageOK() in TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by
>>> - limingxing and CVE-2015-8683 reported by zzf of Alibaba.
>>> -
>>> -Upstream-Status: Backport
>>> -CVE: CVE-2015-8665
>>> -CVE: CVE-2015-8683
>>> -https://github.com/vadz/libtiff/commit/f94a29a822f5528d2334
>>> 592760fbb7938f15eb55
>>> -
>>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> -
>>> ----
>>> - ChangeLog              |  8 ++++++++
>>> - libtiff/tif_getimage.c | 35 ++++++++++++++++++++++-------------
>>> - 2 files changed, 30 insertions(+), 13 deletions(-)
>>> -
>>> -Index: tiff-4.0.6/libtiff/tif_getimage.c
>>> -===================================================================
>>> ---- tiff-4.0.6.orig/libtiff/tif_getimage.c
>>> -+++ tiff-4.0.6/libtiff/tif_getimage.c
>>> -@@ -182,20 +182,22 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[102
>>> -                                   "Planarconfiguration",
>>> td->td_planarconfig);
>>> -                               return (0);
>>> -                       }
>>> --                      if( td->td_samplesperpixel != 3 )
>>> -+                      if( td->td_samplesperpixel != 3 || colorchannels
>>> != 3 )
>>> -             {
>>> -                 sprintf(emsg,
>>> --                        "Sorry, can not handle image with %s=%d",
>>> --                        "Samples/pixel", td->td_samplesperpixel);
>>> -+                        "Sorry, can not handle image with %s=%d, %s=%d",
>>> -+                        "Samples/pixel", td->td_samplesperpixel,
>>> -+                        "colorchannels", colorchannels);
>>> -                 return 0;
>>> -             }
>>> -                       break;
>>> -               case PHOTOMETRIC_CIELAB:
>>> --            if( td->td_samplesperpixel != 3 || td->td_bitspersample !=
>>> 8 )
>>> -+            if( td->td_samplesperpixel != 3 || colorchannels != 3 ||
>>> td->td_bitspersample != 8 )
>>> -             {
>>> -                 sprintf(emsg,
>>> --                        "Sorry, can not handle image with %s=%d and
>>> %s=%d",
>>> -+                        "Sorry, can not handle image with %s=%d, %s=%d
>>> and %s=%d",
>>> -                         "Samples/pixel", td->td_samplesperpixel,
>>> -+                        "colorchannels", colorchannels,
>>> -                         "Bits/sample", td->td_bitspersample);
>>> -                 return 0;
>>> -             }
>>> -@@ -255,6 +257,9 @@ TIFFRGBAImageBegin(TIFFRGBAImage* img, T
>>> -       int colorchannels;
>>> -       uint16 *red_orig, *green_orig, *blue_orig;
>>> -       int n_color;
>>> -+
>>> -+      if( !TIFFRGBAImageOK(tif, emsg) )
>>> -+              return 0;
>>> -
>>> -       /* Initialize to normal values */
>>> -       img->row_offset = 0;
>>> -@@ -2508,29 +2513,33 @@ PickContigCase(TIFFRGBAImage* img)
>>> -               case PHOTOMETRIC_RGB:
>>> -                       switch (img->bitspersample) {
>>> -                               case 8:
>>> --                                      if (img->alpha ==
>>> EXTRASAMPLE_ASSOCALPHA)
>>> -+                                      if (img->alpha ==
>>> EXTRASAMPLE_ASSOCALPHA &&
>>> -+                                              img->samplesperpixel >= 4)
>>> -                                               img->put.contig =
>>> putRGBAAcontig8bittile;
>>> --                                      else if (img->alpha ==
>>> EXTRASAMPLE_UNASSALPHA)
>>> -+                                      else if (img->alpha ==
>>> EXTRASAMPLE_UNASSALPHA &&
>>> -+
>>>  img->samplesperpixel >= 4)
>>> -                                       {
>>> -                                               if (BuildMapUaToAa(img))
>>> -                                                       img->put.contig =
>>> putRGBUAcontig8bittile;
>>> -                                       }
>>> --                                      else
>>> -+                                      else if( img->samplesperpixel >=
>>> 3 )
>>> -                                               img->put.contig =
>>> putRGBcontig8bittile;
>>> -                                       break;
>>> -                               case 16:
>>> --                                      if (img->alpha ==
>>> EXTRASAMPLE_ASSOCALPHA)
>>> -+                                      if (img->alpha ==
>>> EXTRASAMPLE_ASSOCALPHA &&
>>> -+                                              img->samplesperpixel >=4 )
>>> -                                       {
>>> -                                               if
>>> (BuildMapBitdepth16To8(img))
>>> -                                                       img->put.contig =
>>> putRGBAAcontig16bittile;
>>> -                                       }
>>> --                                      else if (img->alpha ==
>>> EXTRASAMPLE_UNASSALPHA)
>>> -+                                      else if (img->alpha ==
>>> EXTRASAMPLE_UNASSALPHA &&
>>> -+
>>>  img->samplesperpixel >=4 )
>>> -                                       {
>>> -                                               if
>>> (BuildMapBitdepth16To8(img) &&
>>> -                                                   BuildMapUaToAa(img))
>>> -                                                       img->put.contig =
>>> putRGBUAcontig16bittile;
>>> -                                       }
>>> --                                      else
>>> -+                                      else if( img->samplesperpixel >=3
>>> )
>>> -                                       {
>>> -                                               if
>>> (BuildMapBitdepth16To8(img))
>>> -                                                       img->put.contig =
>>> putRGBcontig16bittile;
>>> -@@ -2539,7 +2548,7 @@ PickContigCase(TIFFRGBAImage* img)
>>> -                       }
>>> -                       break;
>>> -               case PHOTOMETRIC_SEPARATED:
>>> --                      if (buildMap(img)) {
>>> -+                      if (img->samplesperpixel >=4 && buildMap(img)) {
>>> -                               if (img->bitspersample == 8) {
>>> -                                       if (!img->Map)
>>> -                                               img->put.contig =
>>> putRGBcontig8bitCMYKtile;
>>> -@@ -2635,7 +2644,7 @@ PickContigCase(TIFFRGBAImage* img)
>>> -                       }
>>> -                       break;
>>> -               case PHOTOMETRIC_CIELAB:
>>> --                      if (buildMap(img)) {
>>> -+                      if (img->samplesperpixel == 3 && buildMap(img)) {
>>> -                               if (img->bitspersample == 8)
>>> -                                       img->put.contig =
>>> initCIELabConversion(img);
>>> -                               break;
>>> -Index: tiff-4.0.6/ChangeLog
>>> -===================================================================
>>> ---- tiff-4.0.6.orig/ChangeLog
>>> -+++ tiff-4.0.6/ChangeLog
>>> -@@ -1,3 +1,11 @@
>>> -+2015-12-26  Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -+   * libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBAImage
>>> -+   interface in case of unsupported values of
>>> SamplesPerPixel/ExtraSamples
>>> -+   for LogLUV / CIELab. Add explicit call to TIFFRGBAImageOK() in
>>> -+   TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by limingxing and
>>> -+   CVE-2015-8683 reported by zzf of Alibaba.
>>> -+
>>> - 2015-09-12  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
>>> -
>>> -       * libtiff 4.0.6 released.
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>>> deleted file mode 100644
>>> index 0846f0f..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>>> +++ /dev/null
>>> @@ -1,195 +0,0 @@
>>> -From aaab5c3c9d2a2c6984f23ccbc79702610439bc65 Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Sun, 27 Dec 2015 16:25:11 +0000
>>> -Subject: [PATCH] * libtiff/tif_luv.c: fix potential out-of-bound writes
>>> in
>>> - decode functions in non debug builds by replacing assert()s by regular
>>> if
>>> - checks (bugzilla #2522). Fix potential out-of-bound reads in case of
>>> short
>>> - input data.
>>> -
>>> -Upstream-Status: Backport
>>> -
>>> -https://github.com/vadz/libtiff/commit/aaab5c3c9d2a2c6984f2
>>> 3ccbc79702610439bc65
>>> -hand applied Changelog changes
>>> -
>>> -CVE: CVE-2015-8781
>>> -
>>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ----
>>> - ChangeLog         |  7 +++++++
>>> - libtiff/tif_luv.c | 55 ++++++++++++++++++++++++++++++
>>> ++++++++++++++-----------
>>> - 2 files changed, 51 insertions(+), 11 deletions(-)
>>> -
>>> -Index: tiff-4.0.4/ChangeLog
>>> -===================================================================
>>> ---- tiff-4.0.4.orig/ChangeLog
>>> -+++ tiff-4.0.4/ChangeLog
>>> -@@ -1,3 +1,10 @@
>>> -+2015-12-27  Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -+      * libtiff/tif_luv.c: fix potential out-of-bound writes in decode
>>> -+      functions in non debug builds by replacing assert()s by regular if
>>> -+      checks (bugzilla #2522).
>>> -+      Fix potential out-of-bound reads in case of short input data.
>>> -+
>>> - 2015-12-26  Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -       * libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBAImage
>>> -Index: tiff-4.0.4/libtiff/tif_luv.c
>>> -===================================================================
>>> ---- tiff-4.0.4.orig/libtiff/tif_luv.c
>>> -+++ tiff-4.0.4/libtiff/tif_luv.c
>>> -@@ -202,7 +202,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
>>> -       if (sp->user_datafmt == SGILOGDATAFMT_16BIT)
>>> -               tp = (int16*) op;
>>> -       else {
>>> --              assert(sp->tbuflen >= npixels);
>>> -+              if(sp->tbuflen < npixels) {
>>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>>> -+                                               "Translation buffer too
>>> short");
>>> -+                      return (0);
>>> -+              }
>>> -               tp = (int16*) sp->tbuf;
>>> -       }
>>> -       _TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0]));
>>> -@@ -211,9 +215,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
>>> -       cc = tif->tif_rawcc;
>>> -       /* get each byte string */
>>> -       for (shft = 2*8; (shft -= 8) >= 0; ) {
>>> --              for (i = 0; i < npixels && cc > 0; )
>>> -+              for (i = 0; i < npixels && cc > 0; ) {
>>> -                       if (*bp >= 128) {               /* run */
>>> --                              rc = *bp++ + (2-128);   /* TODO:
>>> potential input buffer overrun when decoding corrupt or truncated data */
>>> -+                              if( cc < 2 )
>>> -+                                      break;
>>> -+                              rc = *bp++ + (2-128);
>>> -                               b = (int16)(*bp++ << shft);
>>> -                               cc -= 2;
>>> -                               while (rc-- && i < npixels)
>>> -@@ -223,6 +229,7 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
>>> -                               while (--cc && rc-- && i < npixels)
>>> -                                       tp[i++] |= (int16)*bp++ << shft;
>>> -                       }
>>> -+              }
>>> -               if (i != npixels) {
>>> - #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
>>> -                       TIFFErrorExt(tif->tif_clientdata, module,
>>> -@@ -268,13 +275,17 @@ LogLuvDecode24(TIFF* tif, uint8* op, tms
>>> -       if (sp->user_datafmt == SGILOGDATAFMT_RAW)
>>> -               tp = (uint32 *)op;
>>> -       else {
>>> --              assert(sp->tbuflen >= npixels);
>>> -+              if(sp->tbuflen < npixels) {
>>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>>> -+                                               "Translation buffer too
>>> short");
>>> -+                      return (0);
>>> -+              }
>>> -               tp = (uint32 *) sp->tbuf;
>>> -       }
>>> -       /* copy to array of uint32 */
>>> -       bp = (unsigned char*) tif->tif_rawcp;
>>> -       cc = tif->tif_rawcc;
>>> --      for (i = 0; i < npixels && cc > 0; i++) {
>>> -+      for (i = 0; i < npixels && cc >= 3; i++) {
>>> -               tp[i] = bp[0] << 16 | bp[1] << 8 | bp[2];
>>> -               bp += 3;
>>> -               cc -= 3;
>>> -@@ -325,7 +336,11 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
>>> -       if (sp->user_datafmt == SGILOGDATAFMT_RAW)
>>> -               tp = (uint32*) op;
>>> -       else {
>>> --              assert(sp->tbuflen >= npixels);
>>> -+              if(sp->tbuflen < npixels) {
>>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>>> -+                                               "Translation buffer too
>>> short");
>>> -+                      return (0);
>>> -+              }
>>> -               tp = (uint32*) sp->tbuf;
>>> -       }
>>> -       _TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0]));
>>> -@@ -334,11 +349,13 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
>>> -       cc = tif->tif_rawcc;
>>> -       /* get each byte string */
>>> -       for (shft = 4*8; (shft -= 8) >= 0; ) {
>>> --              for (i = 0; i < npixels && cc > 0; )
>>> -+              for (i = 0; i < npixels && cc > 0; ) {
>>> -                       if (*bp >= 128) {               /* run */
>>> -+                              if( cc < 2 )
>>> -+                                      break;
>>> -                               rc = *bp++ + (2-128);
>>> -                               b = (uint32)*bp++ << shft;
>>> --                              cc -= 2;                /* TODO:
>>> potential input buffer overrun when decoding corrupt or truncated data */
>>> -+                              cc -= 2;
>>> -                               while (rc-- && i < npixels)
>>> -                                       tp[i++] |= b;
>>> -                       } else {                        /* non-run */
>>> -@@ -346,6 +363,7 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
>>> -                               while (--cc && rc-- && i < npixels)
>>> -                                       tp[i++] |= (uint32)*bp++ << shft;
>>> -                       }
>>> -+              }
>>> -               if (i != npixels) {
>>> - #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
>>> -                       TIFFErrorExt(tif->tif_clientdata, module,
>>> -@@ -413,6 +431,7 @@ LogLuvDecodeTile(TIFF* tif, uint8* bp, t
>>> - static int
>>> - LogL16Encode(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
>>> - {
>>> -+      static const char module[] = "LogL16Encode";
>>> -       LogLuvState* sp = EncoderState(tif);
>>> -       int shft;
>>> -       tmsize_t i;
>>> -@@ -433,7 +452,11 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz
>>> -               tp = (int16*) bp;
>>> -       else {
>>> -               tp = (int16*) sp->tbuf;
>>> --              assert(sp->tbuflen >= npixels);
>>> -+              if(sp->tbuflen < npixels) {
>>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>>> -+                                               "Translation buffer too
>>> short");
>>> -+                      return (0);
>>> -+              }
>>> -               (*sp->tfunc)(sp, bp, npixels);
>>> -       }
>>> -       /* compress each byte string */
>>> -@@ -506,6 +529,7 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz
>>> - static int
>>> - LogLuvEncode24(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
>>> - {
>>> -+      static const char module[] = "LogLuvEncode24";
>>> -       LogLuvState* sp = EncoderState(tif);
>>> -       tmsize_t i;
>>> -       tmsize_t npixels;
>>> -@@ -521,7 +545,11 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms
>>> -               tp = (uint32*) bp;
>>> -       else {
>>> -               tp = (uint32*) sp->tbuf;
>>> --              assert(sp->tbuflen >= npixels);
>>> -+              if(sp->tbuflen < npixels) {
>>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>>> -+                                               "Translation buffer too
>>> short");
>>> -+                      return (0);
>>> -+              }
>>> -               (*sp->tfunc)(sp, bp, npixels);
>>> -       }
>>> -       /* write out encoded pixels */
>>> -@@ -553,6 +581,7 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms
>>> - static int
>>> - LogLuvEncode32(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
>>> - {
>>> -+      static const char module[] = "LogLuvEncode32";
>>> -       LogLuvState* sp = EncoderState(tif);
>>> -       int shft;
>>> -       tmsize_t i;
>>> -@@ -574,7 +603,11 @@ LogLuvEncode32(TIFF* tif, uint8* bp, tms
>>> -               tp = (uint32*) bp;
>>> -       else {
>>> -               tp = (uint32*) sp->tbuf;
>>> --              assert(sp->tbuflen >= npixels);
>>> -+              if(sp->tbuflen < npixels) {
>>> -+                      TIFFErrorExt(tif->tif_clientdata, module,
>>> -+                                               "Translation buffer too
>>> short");
>>> -+                      return (0);
>>> -+              }
>>> -               (*sp->tfunc)(sp, bp, npixels);
>>> -       }
>>> -       /* compress each byte string */
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
>>> deleted file mode 100644
>>> index 0caf800..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
>>> +++ /dev/null
>>> @@ -1,73 +0,0 @@
>>> -From b18012dae552f85dcc5c57d3bf4e997a15b1cc1c Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Sun, 27 Dec 2015 16:55:20 +0000
>>> -Subject: [PATCH] * libtiff/tif_next.c: fix potential out-of-bound write
>>> in
>>> - NeXTDecode() triggered by http://lcamtuf.coredump.cx/afl
>>> /vulns/libtiff5.tif
>>> - (bugzilla #2508)
>>> -
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/b18012dae552f85dcc5c
>>> 57d3bf4e997a15b1cc1c
>>> -hand applied Changelog changes
>>> -
>>> -CVE:  CVE-2015-8784
>>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> -
>>> ----
>>> - ChangeLog          |  6 ++++++
>>> - libtiff/tif_next.c | 10 ++++++++--
>>> - 2 files changed, 14 insertions(+), 2 deletions(-)
>>> -
>>> -Index: tiff-4.0.4/ChangeLog
>>> -===================================================================
>>> ---- tiff-4.0.4.orig/ChangeLog
>>> -+++ tiff-4.0.4/ChangeLog
>>> -@@ -1,5 +1,11 @@
>>> - 2015-12-27  Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -+      * libtiff/tif_next.c: fix potential out-of-bound write in
>>> NeXTDecode()
>>> -+      triggered by http://lcamtuf.coredump.cx/afl/vulns/libtiff5.tif
>>> -+      (bugzilla #2508)
>>> -+
>>> -+2015-12-27  Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -       * libtiff/tif_luv.c: fix potential out-of-bound writes in decode
>>> -       functions in non debug builds by replacing assert()s by regular if
>>> -       checks (bugzilla #2522).
>>> -Index: tiff-4.0.4/libtiff/tif_next.c
>>> -===================================================================
>>> ---- tiff-4.0.4.orig/libtiff/tif_next.c
>>> -+++ tiff-4.0.4/libtiff/tif_next.c
>>> -@@ -37,7 +37,7 @@
>>> -       case 0: op[0]  = (unsigned char) ((v) << 6); break;     \
>>> -       case 1: op[0] |= (v) << 4; break;       \
>>> -       case 2: op[0] |= (v) << 2; break;       \
>>> --      case 3: *op++ |= (v);      break;       \
>>> -+      case 3: *op++ |= (v);      op_offset++; break;  \
>>> -       }                                       \
>>> - }
>>> -
>>> -@@ -106,6 +106,7 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
>>> -                       uint32 imagewidth = tif->tif_dir.td_imagewidth;
>>> -             if( isTiled(tif) )
>>> -                 imagewidth = tif->tif_dir.td_tilewidth;
>>> -+            tmsize_t op_offset = 0;
>>> -
>>> -                       /*
>>> -                        * The scanline is composed of a sequence of
>>> constant
>>> -@@ -122,10 +123,15 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
>>> -                                * bounds, potentially resulting in a
>>> security
>>> -                                * issue.
>>> -                                */
>>> --                              while (n-- > 0 && npixels < imagewidth)
>>> -+                              while (n-- > 0 && npixels < imagewidth &&
>>> op_offset < scanline)
>>> -                                       SETPIXEL(op, grey);
>>> -                               if (npixels >= imagewidth)
>>> -                                       break;
>>> -+                if (op_offset >= scanline ) {
>>> -+                    TIFFErrorExt(tif->tif_clientdata, module, "Invalid
>>> data for scanline %ld",
>>> -+                        (long) tif->tif_row);
>>> -+                    return (0);
>>> -+                }
>>> -                               if (cc == 0)
>>> -                                       goto bad;
>>> -                               n = *bp++, cc--;
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>>> deleted file mode 100644
>>> index 4a08aba..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>>> +++ /dev/null
>>> @@ -1,24 +0,0 @@
>>> -Buffer overflow in the readextension function in gif2tiff.c
>>> -allows remote attackers to cause a denial of service via a crafted GIF
>>> file.
>>> -
>>> -External References:
>>> -https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3186
>>> -https://bugzilla.redhat.com/show_bug.cgi?id=1319503
>>> -
>>> -CVE: CVE-2016-3186
>>> -Upstream-Status: Backport (RedHat)
>>> -https://bugzilla.redhat.com/attachment.cgi?id=1144235&action=diff
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> -
>>> ---- tiff-4.0.6/tools/gif2tiff.c        2016-04-06 15:43:01.586048341
>>> +0200
>>> -+++ tiff-4.0.6/tools/gif2tiff.c        2016-04-06 15:48:05.523207710
>>> +0200
>>> -@@ -349,7 +349,7 @@
>>> -     int status = 1;
>>> -
>>> -     (void) getc(infile);
>>> --    while ((count = getc(infile)) && count <= 255)
>>> -+    while ((count = getc(infile)) && count >= 0 && count <= 255)
>>> -         if (fread(buf, 1, count, infile) != (size_t) count) {
>>> -             fprintf(stderr, "short read from file %s (%s)\n",
>>> -                     filename, strerror(errno));
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
>>> deleted file mode 100644
>>> index 0c8b716..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
>>> +++ /dev/null
>>> @@ -1,129 +0,0 @@
>>> -From 92d966a5fcfbdca67957c8c5c47b467aa650b286 Mon Sep 17 00:00:00 2001
>>> -From: bfriesen <bfriesen>
>>> -Date: Sat, 24 Sep 2016 23:11:55 +0000
>>> -Subject: [PATCH] * libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject
>>> attempts
>>> - to read floating point images.
>>> -
>>> -* libtiff/tif_predict.c (PredictorSetup): Enforce bits-per-sample
>>> -requirements of floating point predictor (3).  Fixes CVE-2016-3622
>>> -"Divide By Zero in the tiff2rgba tool."
>>> -
>>> -CVE: CVE-2016-3622
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/92d966a5fcfbdca67957
>>> c8c5c47b467aa650b286
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> ----
>>> - ChangeLog              | 11 ++++++++++-
>>> - libtiff/tif_getimage.c | 38 ++++++++++++++++++++------------------
>>> - libtiff/tif_predict.c  | 11 ++++++++++-
>>> - 3 files changed, 40 insertions(+), 20 deletions(-)
>>> -
>>> -diff --git a/ChangeLog b/ChangeLog
>>> -index 26d6f47..a628277 100644
>>> ---- a/ChangeLog
>>> -+++ b/ChangeLog
>>> -@@ -1,3 +1,12 @@
>>> -+2016-09-24  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
>>> -+
>>> -+      * libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject attempts to
>>> -+      read floating point images.
>>> -+
>>> -+      * libtiff/tif_predict.c (PredictorSetup): Enforce bits-per-sample
>>> -+      requirements of floating point predictor (3).  Fixes CVE-2016-3622
>>> -+      "Divide By Zero in the tiff2rgba tool."
>>> -+
>>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -       * tools/rgb2ycbcr.c: validate values of -v and -h parameters to
>>> -diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
>>> -index 386cee0..3e689ee 100644
>>> ---- a/libtiff/tif_getimage.c
>>> -+++ b/libtiff/tif_getimage.c
>>> -@@ -95,6 +95,10 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])
>>> -                           td->td_bitspersample);
>>> -                       return (0);
>>> -       }
>>> -+        if (td->td_sampleformat == SAMPLEFORMAT_IEEEFP) {
>>> -+                sprintf(emsg, "Sorry, can not handle images with IEEE
>>> floating-point samples");
>>> -+                return (0);
>>> -+        }
>>> -       colorchannels = td->td_samplesperpixel - td->td_extrasamples;
>>> -       if (!TIFFGetField(tif, TIFFTAG_PHOTOMETRIC, &photometric)) {
>>> -               switch (colorchannels) {
>>> -@@ -182,27 +186,25 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])
>>> -                                   "Planarconfiguration",
>>> td->td_planarconfig);
>>> -                               return (0);
>>> -                       }
>>> --                      if( td->td_samplesperpixel != 3 || colorchannels
>>> != 3 )
>>> --            {
>>> --                sprintf(emsg,
>>> --                        "Sorry, can not handle image with %s=%d, %s=%d",
>>> --                        "Samples/pixel", td->td_samplesperpixel,
>>> --                        "colorchannels", colorchannels);
>>> --                return 0;
>>> --            }
>>> -+                      if ( td->td_samplesperpixel != 3 || colorchannels
>>> != 3 ) {
>>> -+                                sprintf(emsg,
>>> -+                                        "Sorry, can not handle image
>>> with %s=%d, %s=%d",
>>> -+                                        "Samples/pixel",
>>> td->td_samplesperpixel,
>>> -+                                        "colorchannels", colorchannels);
>>> -+                                return 0;
>>> -+                        }
>>> -                       break;
>>> -               case PHOTOMETRIC_CIELAB:
>>> --            if( td->td_samplesperpixel != 3 || colorchannels != 3 ||
>>> td->td_bitspersample != 8 )
>>> --            {
>>> --                sprintf(emsg,
>>> --                        "Sorry, can not handle image with %s=%d, %s=%d
>>> and %s=%d",
>>> --                        "Samples/pixel", td->td_samplesperpixel,
>>> --                        "colorchannels", colorchannels,
>>> --                        "Bits/sample", td->td_bitspersample);
>>> --                return 0;
>>> --            }
>>> -+                        if ( td->td_samplesperpixel != 3 ||
>>> colorchannels != 3 || td->td_bitspersample != 8 ) {
>>> -+                                sprintf(emsg,
>>> -+                                        "Sorry, can not handle image
>>> with %s=%d, %s=%d and %s=%d",
>>> -+                                        "Samples/pixel",
>>> td->td_samplesperpixel,
>>> -+                                        "colorchannels", colorchannels,
>>> -+                                        "Bits/sample",
>>> td->td_bitspersample);
>>> -+                                return 0;
>>> -+                        }
>>> -                       break;
>>> --              default:
>>> -+                default:
>>> -                       sprintf(emsg, "Sorry, can not handle image with
>>> %s=%d",
>>> -                           photoTag, photometric);
>>> -                       return (0);
>>> -diff --git a/libtiff/tif_predict.c b/libtiff/tif_predict.c
>>> -index 081eb11..555f2f9 100644
>>> ---- a/libtiff/tif_predict.c
>>> -+++ b/libtiff/tif_predict.c
>>> -@@ -80,6 +80,15 @@ PredictorSetup(TIFF* tif)
>>> -                                   td->td_sampleformat);
>>> -                               return 0;
>>> -                       }
>>> -+                        if (td->td_bitspersample != 16
>>> -+                            && td->td_bitspersample != 24
>>> -+                            && td->td_bitspersample != 32
>>> -+                            && td->td_bitspersample != 64) { /* Should
>>> 64 be allowed? */
>>> -+                                TIFFErrorExt(tif->tif_clientdata,
>>> module,
>>> -+                                             "Floating point
>>> \"Predictor\" not supported with %d-bit samples",
>>> -+                                             td->td_bitspersample);
>>> -+                              return 0;
>>> -+                            }
>>> -                       break;
>>> -               default:
>>> -                       TIFFErrorExt(tif->tif_clientdata, module,
>>> -@@ -174,7 +183,7 @@ PredictorSetupDecode(TIFF* tif)
>>> -               }
>>> -               /*
>>> -                * Allocate buffer to keep the decoded bytes before
>>> --               * rearranging in the ight order
>>> -+               * rearranging in the right order
>>> -                */
>>> -       }
>>> -
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
>>> deleted file mode 100644
>>> index f554ac5..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
>>> +++ /dev/null
>>> @@ -1,52 +0,0 @@
>>> -From bd024f07019f5d9fea236675607a69f74a66bc7b Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Mon, 15 Aug 2016 21:26:56 +0000
>>> -Subject: [PATCH] * tools/rgb2ycbcr.c: validate values of -v and -h
>>> parameters
>>> - to avoid potential divide by zero. Fixes CVE-2016-3623 (bugzilla #2569)
>>> -
>>> -CVE: CVE-2016-3623
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/bd024f07019f5d9fea23
>>> 6675607a69f74a66bc7b
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> ----
>>> - ChangeLog         | 5 +++++
>>> - tools/rgb2ycbcr.c | 4 ++++
>>> - 2 files changed, 9 insertions(+)
>>> -
>>> -diff --git a/ChangeLog b/ChangeLog
>>> -index 5d60608..3e6642a 100644
>>> ---- a/ChangeLog
>>> -+++ b/ChangeLog
>>> -@@ -1,5 +1,10 @@
>>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -+      * tools/rgb2ycbcr.c: validate values of -v and -h parameters to
>>> -+      avoid potential divide by zero. Fixes CVE-2016-3623 (bugzilla
>>> #2569)
>>> -+
>>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -       * tools/tiffcrop.c: Fix out-of-bounds write in loadImage().
>>> -       From patch libtiff-CVE-2016-3991.patch from
>>> -       libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
>>> -diff --git a/tools/rgb2ycbcr.c b/tools/rgb2ycbcr.c
>>> -index 3829d6b..51f4259 100644
>>> ---- a/tools/rgb2ycbcr.c
>>> -+++ b/tools/rgb2ycbcr.c
>>> -@@ -95,9 +95,13 @@ main(int argc, char* argv[])
>>> -                       break;
>>> -               case 'h':
>>> -                       horizSubSampling = atoi(optarg);
>>> -+            if( horizSubSampling != 1 && horizSubSampling != 2 &&
>>> horizSubSampling != 4 )
>>> -+                usage(-1);
>>> -                       break;
>>> -               case 'v':
>>> -                       vertSubSampling = atoi(optarg);
>>> -+            if( vertSubSampling != 1 && vertSubSampling != 2 &&
>>> vertSubSampling != 4 )
>>> -+                usage(-1);
>>> -                       break;
>>> -               case 'r':
>>> -                       rowsperstrip = atoi(optarg);
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>>> deleted file mode 100644
>>> index 4d965be..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
>>> +++ /dev/null
>>> @@ -1,118 +0,0 @@
>>> -From 7c39352ccd9060d311d3dc9a1f1bc00133a160e6 Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Mon, 15 Aug 2016 20:06:40 +0000
>>> -Subject: [PATCH] * tools/tiff2rgba.c: Fix integer overflow in size of
>>> - allocated buffer, when -b mode is enabled, that could result in
>>> out-of-bounds
>>> - write. Based initially on patch tiff-CVE-2016-3945.patch from
>>> - libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for
>>> invalid
>>> - tests that rejected valid files.
>>> -
>>> -CVE: CVE-2016-3945
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3
>>> dc9a1f1bc00133a160e6
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> ----
>>> - ChangeLog         |  8 ++++++++
>>> - tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++----
>>> - 2 files changed, 38 insertions(+), 4 deletions(-)
>>> -
>>> -diff --git a/ChangeLog b/ChangeLog
>>> -index 62dc1b5..9c0ab29 100644
>>> ---- a/ChangeLog
>>> -+++ b/ChangeLog
>>> -@@ -1,3 +1,11 @@
>>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -+      * tools/tiff2rgba.c: Fix integer overflow in size of allocated
>>> -+      buffer, when -b mode is enabled, that could result in
>>> out-of-bounds
>>> -+      write. Based initially on patch tiff-CVE-2016-3945.patch from
>>> -+      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction
>>> for
>>> -+      invalid tests that rejected valid files.
>>> -+
>>> - 2016-07-11 Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -       * tools/tiffcrop.c: Avoid access outside of stack allocated array
>>> -diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
>>> -index b7a81eb..16e3dc4 100644
>>> ---- a/tools/tiff2rgba.c
>>> -+++ b/tools/tiff2rgba.c
>>> -@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
>>> -     uint32  row, col;
>>> -     uint32  *wrk_line;
>>> -     int           ok = 1;
>>> -+    uint32  rastersize, wrk_linesize;
>>> -
>>> -     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
>>> -     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
>>> -@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
>>> -     /*
>>> -      * Allocate tile buffer
>>> -      */
>>> --    raster = (uint32*)_TIFFmalloc(tile_width * tile_height * sizeof
>>> (uint32));
>>> -+    rastersize = tile_width * tile_height * sizeof (uint32);
>>> -+    if (tile_width != (rastersize / tile_height) / sizeof( uint32))
>>> -+    {
>>> -+      TIFFError(TIFFFileName(in), "Integer overflow when calculating
>>> raster buffer");
>>> -+      exit(-1);
>>> -+    }
>>> -+    raster = (uint32*)_TIFFmalloc(rastersize);
>>> -     if (raster == 0) {
>>> -         TIFFError(TIFFFileName(in), "No space for raster buffer");
>>> -         return (0);
>>> -@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
>>> -      * Allocate a scanline buffer for swapping during the vertical
>>> -      * mirroring pass.
>>> -      */
>>> --    wrk_line = (uint32*)_TIFFmalloc(tile_width * sizeof (uint32));
>>> -+    wrk_linesize = tile_width * sizeof (uint32);
>>> -+    if (tile_width != wrk_linesize / sizeof (uint32))
>>> -+    {
>>> -+        TIFFError(TIFFFileName(in), "Integer overflow when calculating
>>> wrk_line buffer");
>>> -+      exit(-1);
>>> -+    }
>>> -+    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
>>> -     if (!wrk_line) {
>>> -         TIFFError(TIFFFileName(in), "No space for raster scanline
>>> buffer");
>>> -         ok = 0;
>>> -@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
>>> -     uint32  row;
>>> -     uint32  *wrk_line;
>>> -     int           ok = 1;
>>> -+    uint32  rastersize, wrk_linesize;
>>> -
>>> -     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
>>> -     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
>>> -@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
>>> -     /*
>>> -      * Allocate strip buffer
>>> -      */
>>> --    raster = (uint32*)_TIFFmalloc(width * rowsperstrip * sizeof
>>> (uint32));
>>> -+    rastersize = width * rowsperstrip * sizeof (uint32);
>>> -+    if (width != (rastersize / rowsperstrip) / sizeof( uint32))
>>> -+    {
>>> -+      TIFFError(TIFFFileName(in), "Integer overflow when calculating
>>> raster buffer");
>>> -+      exit(-1);
>>> -+    }
>>> -+    raster = (uint32*)_TIFFmalloc(rastersize);
>>> -     if (raster == 0) {
>>> -         TIFFError(TIFFFileName(in), "No space for raster buffer");
>>> -         return (0);
>>> -@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
>>> -      * Allocate a scanline buffer for swapping during the vertical
>>> -      * mirroring pass.
>>> -      */
>>> --    wrk_line = (uint32*)_TIFFmalloc(width * sizeof (uint32));
>>> -+    wrk_linesize = width * sizeof (uint32);
>>> -+    if (width != wrk_linesize / sizeof (uint32))
>>> -+    {
>>> -+        TIFFError(TIFFFileName(in), "Integer overflow when calculating
>>> wrk_line buffer");
>>> -+      exit(-1);
>>> -+    }
>>> -+    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
>>> -     if (!wrk_line) {
>>> -         TIFFError(TIFFFileName(in), "No space for raster scanline
>>> buffer");
>>> -         ok = 0;
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
>>> deleted file mode 100644
>>> index 7bf52ee..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
>>> +++ /dev/null
>>> @@ -1,66 +0,0 @@
>>> -From 6a4dbb07ccf92836bb4adac7be4575672d0ac5f1 Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Mon, 15 Aug 2016 20:49:48 +0000
>>> -Subject: [PATCH] * libtiff/tif_pixarlog.c: Fix write buffer overflow in
>>> - PixarLogEncode if more input samples are provided than expected by
>>> - PixarLogSetupEncode. Idea based on libtiff-CVE-2016-3990.patch from
>>> - libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but with different and
>>> - simpler check. (bugzilla #2544)
>>> -
>>> -invalid tests that rejected valid files. (bugzilla #2545)
>>> -
>>> -CVE: CVE-2016-3990
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/6a4dbb07ccf92836bb4a
>>> dac7be4575672d0ac5f1
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> ----
>>> - ChangeLog              | 10 +++++++++-
>>> - libtiff/tif_pixarlog.c |  7 +++++++
>>> - 2 files changed, 16 insertions(+), 1 deletion(-)
>>> -
>>> -diff --git a/ChangeLog b/ChangeLog
>>> -index 9c0ab29..db4ea18 100644
>>> ---- a/ChangeLog
>>> -+++ b/ChangeLog
>>> -@@ -1,10 +1,18 @@
>>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -+      * libtiff/tif_pixarlog.c: Fix write buffer overflow in
>>> PixarLogEncode
>>> -+      if more input samples are provided than expected by
>>> PixarLogSetupEncode.
>>> -+      Idea based on libtiff-CVE-2016-3990.patch from
>>> -+      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but with
>>> different and
>>> -+      simpler check. (bugzilla #2544)
>>> -+
>>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -       * tools/tiff2rgba.c: Fix integer overflow in size of allocated
>>> -       buffer, when -b mode is enabled, that could result in
>>> out-of-bounds
>>> -       write. Based initially on patch tiff-CVE-2016-3945.patch from
>>> -       libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction
>>> for
>>> --      invalid tests that rejected valid files.
>>> -+      invalid tests that rejected valid files. (bugzilla #2545)
>>> -
>>> - 2016-07-11 Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -diff --git a/libtiff/tif_pixarlog.c b/libtiff/tif_pixarlog.c
>>> -index e78f788..28329d1 100644
>>> ---- a/libtiff/tif_pixarlog.c
>>> -+++ b/libtiff/tif_pixarlog.c
>>> -@@ -1141,6 +1141,13 @@ PixarLogEncode(TIFF* tif, uint8* bp, tmsize_t cc,
>>> uint16 s)
>>> -       }
>>> -
>>> -       llen = sp->stride * td->td_imagewidth;
>>> -+    /* Check against the number of elements (of size uint16) of
>>> sp->tbuf */
>>> -+    if( n > td->td_rowsperstrip * llen )
>>> -+    {
>>> -+        TIFFErrorExt(tif->tif_clientdata, module,
>>> -+                     "Too many input bytes provided");
>>> -+        return 0;
>>> -+    }
>>> -
>>> -       for (i = 0, up = sp->tbuf; i < n; i += llen, up += llen) {
>>> -               switch (sp->user_datafmt)  {
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
>>> deleted file mode 100644
>>> index 27dfd37..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
>>> +++ /dev/null
>>> @@ -1,147 +0,0 @@
>>> -From e596d4e27c5afb7960dc360fdd3afd90ba0fb8ba Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Mon, 15 Aug 2016 21:05:40 +0000
>>> -Subject: [PATCH 2/2] * tools/tiffcrop.c: Fix out-of-bounds write in
>>> - loadImage(). From patch libtiff-CVE-2016-3991.patch from
>>> - libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
>>> -
>>> -CVE: CVE-2016-3991
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/e596d4e27c5afb7960dc
>>> 360fdd3afd90ba0fb8ba
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> ----
>>> - ChangeLog        |  6 ++++++
>>> - tools/tiffcrop.c | 59 ++++++++++++++++++++++++++++++
>>> +++++++++++++++++++++++---
>>> - 2 files changed, 62 insertions(+), 3 deletions(-)
>>> -
>>> -diff --git a/ChangeLog b/ChangeLog
>>> -index db4ea18..5d60608 100644
>>> ---- a/ChangeLog
>>> -+++ b/ChangeLog
>>> -@@ -1,5 +1,11 @@
>>> - 2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -+      * tools/tiffcrop.c: Fix out-of-bounds write in loadImage().
>>> -+      From patch libtiff-CVE-2016-3991.patch from
>>> -+      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
>>> -+
>>> -+2016-08-15 Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -       * libtiff/tif_pixarlog.c: Fix write buffer overflow in
>>> PixarLogEncode
>>> -       if more input samples are provided than expected by
>>> PixarLogSetupEncode.
>>> -       Idea based on libtiff-CVE-2016-3990.patch from
>>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>>> -index 27abc0b..ddba7b9 100644
>>> ---- a/tools/tiffcrop.c
>>> -+++ b/tools/tiffcrop.c
>>> -@@ -798,6 +798,11 @@ static int readContigTilesIntoBuffer (TIFF* in,
>>> uint8* buf,
>>> -     }
>>> -
>>> -   tile_buffsize = tilesize;
>>> -+  if (tilesize == 0 || tile_rowsize == 0)
>>> -+  {
>>> -+     TIFFError("readContigTilesIntoBuffer", "Tile size or tile rowsize
>>> is zero");
>>> -+     exit(-1);
>>> -+  }
>>> -
>>> -   if (tilesize < (tsize_t)(tl * tile_rowsize))
>>> -     {
>>> -@@ -807,7 +812,12 @@ static int readContigTilesIntoBuffer (TIFF* in,
>>> uint8* buf,
>>> -               tilesize, tl * tile_rowsize);
>>> - #endif
>>> -     tile_buffsize = tl * tile_rowsize;
>>> --    }
>>> -+    if (tl != (tile_buffsize / tile_rowsize))
>>> -+    {
>>> -+      TIFFError("readContigTilesIntoBuffer", "Integer overflow when
>>> calculating buffer size.");
>>> -+        exit(-1);
>>> -+    }
>>> -+    }
>>> -
>>> -   tilebuf = _TIFFmalloc(tile_buffsize);
>>> -   if (tilebuf == 0)
>>> -@@ -1210,6 +1220,12 @@ static int writeBufferToContigTiles (TIFF* out,
>>> uint8* buf, uint32 imagelength,
>>> -       !TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps) )
>>> -       return 1;
>>> -
>>> -+  if (tilesize == 0 || tile_rowsize == 0 || tl == 0 || tw == 0)
>>> -+  {
>>> -+    TIFFError("writeBufferToContigTiles", "Tile size, tile row size,
>>> tile width, or tile length is zero");
>>> -+    exit(-1);
>>> -+  }
>>> -+
>>> -   tile_buffsize = tilesize;
>>> -   if (tilesize < (tsize_t)(tl * tile_rowsize))
>>> -     {
>>> -@@ -1219,6 +1235,11 @@ static int writeBufferToContigTiles (TIFF* out,
>>> uint8* buf, uint32 imagelength,
>>> -               tilesize, tl * tile_rowsize);
>>> - #endif
>>> -     tile_buffsize = tl * tile_rowsize;
>>> -+    if (tl != tile_buffsize / tile_rowsize)
>>> -+    {
>>> -+      TIFFError("writeBufferToContigTiles", "Integer overflow when
>>> calculating buffer size");
>>> -+      exit(-1);
>>> -+    }
>>> -     }
>>> -
>>> -   tilebuf = _TIFFmalloc(tile_buffsize);
>>> -@@ -5945,12 +5966,27 @@ loadImage(TIFF* in, struct image_data *image,
>>> struct dump_opts *dump, unsigned c
>>> -     TIFFGetField(in, TIFFTAG_TILELENGTH, &tl);
>>> -
>>> -     tile_rowsize  = TIFFTileRowSize(in);
>>> -+    if (ntiles == 0 || tlsize == 0 || tile_rowsize == 0)
>>> -+    {
>>> -+      TIFFError("loadImage", "File appears to be tiled, but the number
>>> of tiles, tile size, or tile rowsize is zero.");
>>> -+      exit(-1);
>>> -+    }
>>> -     buffsize = tlsize * ntiles;
>>> -+    if (tlsize != (buffsize / ntiles))
>>> -+    {
>>> -+      TIFFError("loadImage", "Integer overflow when calculating buffer
>>> size");
>>> -+      exit(-1);
>>> -+    }
>>> -
>>> --
>>> -     if (buffsize < (uint32)(ntiles * tl * tile_rowsize))
>>> -       {
>>> -       buffsize = ntiles * tl * tile_rowsize;
>>> -+      if (ntiles != (buffsize / tl / tile_rowsize))
>>> -+      {
>>> -+      TIFFError("loadImage", "Integer overflow when calculating buffer
>>> size");
>>> -+      exit(-1);
>>> -+      }
>>> -+
>>> - #ifdef DEBUG2
>>> -       TIFFError("loadImage",
>>> -               "Tilesize %u is too small, using ntiles * tilelength *
>>> tilerowsize %lu",
>>> -@@ -5969,8 +6005,25 @@ loadImage(TIFF* in, struct image_data *image,
>>> struct dump_opts *dump, unsigned c
>>> -     TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
>>> -     stsize = TIFFStripSize(in);
>>> -     nstrips = TIFFNumberOfStrips(in);
>>> -+    if (nstrips == 0 || stsize == 0)
>>> -+    {
>>> -+      TIFFError("loadImage", "File appears to be striped, but the
>>> number of stipes or stripe size is zero.");
>>> -+      exit(-1);
>>> -+    }
>>> -+
>>> -     buffsize = stsize * nstrips;
>>> --
>>> -+    if (stsize != (buffsize / nstrips))
>>> -+    {
>>> -+      TIFFError("loadImage", "Integer overflow when calculating buffer
>>> size");
>>> -+      exit(-1);
>>> -+    }
>>> -+    uint32 buffsize_check;
>>> -+    buffsize_check = ((length * width * spp * bps) + 7);
>>> -+    if (length != ((buffsize_check - 7) / width / spp / bps))
>>> -+    {
>>> -+      TIFFError("loadImage", "Integer overflow detected.");
>>> -+      exit(-1);
>>> -+    }
>>> -     if (buffsize < (uint32) (((length * width * spp * bps) + 7) / 8))
>>> -       {
>>> -       buffsize =  ((length * width * spp * bps) + 7) / 8;
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>>> deleted file mode 100644
>>> index 63c6650..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>>> +++ /dev/null
>>> @@ -1,49 +0,0 @@
>>> -From d9783e4a1476b6787a51c5ae9e9b3156527589f0 Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Mon, 11 Jul 2016 21:26:03 +0000
>>> -Subject: [PATCH 1/2] * tools/tiffcrop.c: Avoid access outside of stack
>>> - allocated array on a tiled separate TIFF with more than 8 samples per
>>> pixel.
>>> - Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
>>> - (CVE-2016-5321, bugzilla #2558)
>>> -
>>> -CVE: CVE-2016-5321
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/d9783e4a1476b6787a51
>>> c5ae9e9b3156527589f0
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> ----
>>> - ChangeLog        | 7 +++++++
>>> - tools/tiffcrop.c | 2 +-
>>> - 2 files changed, 8 insertions(+), 1 deletion(-)
>>> -
>>> -diff --git a/ChangeLog b/ChangeLog
>>> -index e98d54d..4e0302f 100644
>>> ---- a/ChangeLog
>>> -+++ b/ChangeLog
>>> -@@ -1,3 +1,10 @@
>>> -+2016-07-11 Even Rouault <even.rouault at spatialys.com>
>>> -+
>>> -+      * tools/tiffcrop.c: Avoid access outside of stack allocated array
>>> -+      on a tiled separate TIFF with more than 8 samples per pixel.
>>> -+      Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
>>> -+      (CVE-2016-5321, bugzilla #2558)
>>> -+
>>> - 2015-12-27  Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -       * libtiff/tif_next.c: fix potential out-of-bound write in
>>> NeXTDecode()
>>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>>> -index d959ae3..6fc8fc1 100644
>>> ---- a/tools/tiffcrop.c
>>> -+++ b/tools/tiffcrop.c
>>> -@@ -989,7 +989,7 @@ static int  readSeparateTilesIntoBuffer (TIFF* in,
>>> uint8 *obuf,
>>> -     nrow = (row + tl > imagelength) ? imagelength - row : tl;
>>> -     for (col = 0; col < imagewidth; col += tw)
>>> -       {
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; s < spp && s < MAX_SAMPLES; s++)
>>> -         {  /* Read each plane of a tile set into srcbuffs[s] */
>>> -       tbytes = TIFFReadTile(in, srcbuffs[s], col, row, 0, s);
>>> -         if (tbytes < 0  && !ignore)
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>>> b/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>>> deleted file mode 100644
>>> index 41eab91..0000000
>>> --- a/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>>> +++ /dev/null
>>> @@ -1,107 +0,0 @@
>>> -From 2f79856097f423eb33796a15fcf700d2ea41bf31 Mon Sep 17 00:00:00 2001
>>> -From: erouault <erouault>
>>> -Date: Mon, 11 Jul 2016 21:38:31 +0000
>>> -Subject: [PATCH 2/2] (CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 /
>>> #2559)
>>> -
>>> -CVE: CVE-2016-5323
>>> -Upstream-Status: Backport
>>> -https://github.com/vadz/libtiff/commit/2f79856097f423eb3379
>>> 6a15fcf700d2ea41bf31
>>> -
>>> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
>>> ----
>>> - ChangeLog        |  2 +-
>>> - tools/tiffcrop.c | 16 ++++++++--------
>>> - 2 files changed, 9 insertions(+), 9 deletions(-)
>>> -
>>> -diff --git a/ChangeLog b/ChangeLog
>>> -index 4e0302f..62dc1b5 100644
>>> ---- a/ChangeLog
>>> -+++ b/ChangeLog
>>> -@@ -3,7 +3,7 @@
>>> -       * tools/tiffcrop.c: Avoid access outside of stack allocated array
>>> -       on a tiled separate TIFF with more than 8 samples per pixel.
>>> -       Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
>>> --      (CVE-2016-5321, bugzilla #2558)
>>> -+      (CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 / #2559)
>>> -
>>> - 2016-07-10 Even Rouault <even.rouault at spatialys.com>
>>> -
>>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>>> -index 6fc8fc1..27abc0b 100644
>>> ---- a/tools/tiffcrop.c
>>> -+++ b/tools/tiffcrop.c
>>> -@@ -3738,7 +3738,7 @@ combineSeparateSamples8bits (uint8 *in[], uint8
>>> *out, uint32 cols,
>>> -
>>> -       matchbits = maskbits << (8 - src_bit - bps);
>>> -       /* load up next sample from each plane */
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -         {
>>> -       src = in[s] + src_offset + src_byte;
>>> -         buff1 = ((*src) & matchbits) << (src_bit);
>>> -@@ -3837,7 +3837,7 @@ combineSeparateSamples16bits (uint8 *in[], uint8
>>> *out, uint32 cols,
>>> -       src_bit  = bit_offset % 8;
>>> -
>>> -       matchbits = maskbits << (16 - src_bit - bps);
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -         {
>>> -       src = in[s] + src_offset + src_byte;
>>> -         if (little_endian)
>>> -@@ -3947,7 +3947,7 @@ combineSeparateSamples24bits (uint8 *in[], uint8
>>> *out, uint32 cols,
>>> -       src_bit  = bit_offset % 8;
>>> -
>>> -       matchbits = maskbits << (32 - src_bit - bps);
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -         {
>>> -       src = in[s] + src_offset + src_byte;
>>> -         if (little_endian)
>>> -@@ -4073,7 +4073,7 @@ combineSeparateSamples32bits (uint8 *in[], uint8
>>> *out, uint32 cols,
>>> -       src_bit  = bit_offset % 8;
>>> -
>>> -       matchbits = maskbits << (64 - src_bit - bps);
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -       {
>>> -       src = in[s] + src_offset + src_byte;
>>> -       if (little_endian)
>>> -@@ -4263,7 +4263,7 @@ combineSeparateTileSamples8bits (uint8 *in[],
>>> uint8 *out, uint32 cols,
>>> -
>>> -       matchbits = maskbits << (8 - src_bit - bps);
>>> -       /* load up next sample from each plane */
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -         {
>>> -       src = in[s] + src_offset + src_byte;
>>> -         buff1 = ((*src) & matchbits) << (src_bit);
>>> -@@ -4362,7 +4362,7 @@ combineSeparateTileSamples16bits (uint8 *in[],
>>> uint8 *out, uint32 cols,
>>> -       src_bit  = bit_offset % 8;
>>> -
>>> -       matchbits = maskbits << (16 - src_bit - bps);
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -         {
>>> -       src = in[s] + src_offset + src_byte;
>>> -         if (little_endian)
>>> -@@ -4471,7 +4471,7 @@ combineSeparateTileSamples24bits (uint8 *in[],
>>> uint8 *out, uint32 cols,
>>> -       src_bit  = bit_offset % 8;
>>> -
>>> -       matchbits = maskbits << (32 - src_bit - bps);
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -         {
>>> -       src = in[s] + src_offset + src_byte;
>>> -         if (little_endian)
>>> -@@ -4597,7 +4597,7 @@ combineSeparateTileSamples32bits (uint8 *in[],
>>> uint8 *out, uint32 cols,
>>> -       src_bit  = bit_offset % 8;
>>> -
>>> -       matchbits = maskbits << (64 - src_bit - bps);
>>> --      for (s = 0; s < spp; s++)
>>> -+      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
>>> -       {
>>> -       src = in[s] + src_offset + src_byte;
>>> -       if (little_endian)
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>>> b/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
>>> similarity index 74%
>>> rename from meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>>> rename to meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
>>> index 796d86e..52fc553 100644
>>> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
>>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
>>> @@ -4,21 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db4
>>> 6fab7501992f9615d7e158cf"
>>>     SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>>>              file://libtool2.patch \
>>> -           file://CVE-2015-8665_8683.patch \
>>> -           file://CVE-2015-8781.patch \
>>> -           file://CVE-2015-8784.patch \
>>> -           file://CVE-2016-3186.patch \
>>> -           file://CVE-2016-5321.patch \
>>> -           file://CVE-2016-5323.patch \
>>> -           file://CVE-2016-3945.patch \
>>> -           file://CVE-2016-3990.patch \
>>> -           file://CVE-2016-3991.patch \
>>> -           file://CVE-2016-3623.patch \
>>> -           file://CVE-2016-3622.patch \
>>>             "
>>>   -SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
>>> -SRC_URI[sha256sum] = "4d57a50907b510e3049a4bba0d788
>>> 8930fdfc16ce49f1bf693e5b6247370d68c"
>>> +SRC_URI[md5sum] = "77ae928d2c6b7fb46a21c3a29325157b"
>>> +SRC_URI[sha256sum] = "9f43a2cfb9589e5cecaa66e16bf87
>>> f814c945f22df7ba600d63aac4632c4f019"
>>>     # exclude betas
>>>   UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> 

