Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0853C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 10:27:29 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.1727.1667989646534488940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 02:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bvPM8vzl;
 spf=pass (domain: mvista.com, ip: 209.85.218.53, mailfrom: skulkarni@mvista.com)
Received: by mail-ej1-f53.google.com with SMTP id f5so45455295ejc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 02:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHmm8CEwwkZhPpHihqnMLnSK+cuBZcDaNwUobL8mE8M=;
        b=bvPM8vzl9WxTZJOE20r16m+NXsjI05ztm6S3Q7xYBnsnlQFhgFXmLrZ8Dwb07Vh7j5
         NEX8EdDoORyhrHEapf+3T6BoX2UEeY3rhCNxeZvfJS9DSaOHV1Ni68mK6SohnMi170qm
         1oHX5FmYxsG3OSdBZ1ZAzgbKFbPs3yfWlr7GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHmm8CEwwkZhPpHihqnMLnSK+cuBZcDaNwUobL8mE8M=;
        b=c2atOzWhCQslxBrh+dF4g7DFoLNseMgxsr2nSYcbJTTLsgU9RMFFjfVNieN+uDII95
         c4TVT+ZQuAdilFSqVETeBjQL4WyP0BaNVWSo4MaYscx9tu6zihQSLvsX6ncyZTCuFzTK
         ynbkJfTG8OjqkHCfldsy4cdY5QyTN6O4ZhcsS/i/eeXK7A/o/s6blyjc/qntoQzNIDDQ
         jshmeV8XaGwjf60kgyYBKzL9A9cch3tM1NxCaxuSakwip1pH00f3e2CwQa/QHPIn9T0I
         k2EnqjHryKkdcVcjDy1ZYeXxYHwyuzGy/+BXa2eYEc8M79sPESE7vm7GVpop3ob+tspd
         P+8Q==
X-Gm-Message-State: ACrzQf3JY4cdh2oAZ7EGojKVW+2LAaasy63BluKJjfLZFDXaWpnXj/te
	EewFVBaa6Q7ydmK/4kCiTBFZ3r89Ug0EhG9EtktJaw==
X-Google-Smtp-Source: AMsMyM7rv0UM1vovTl7PejYOFNAoYyMMOsXmeIQxzFmgugJU9QjHK9nb7tzzwyKYP+V1CfJuuEdBH0Vw9QfFgti0vC4=
X-Received: by 2002:a17:906:d550:b0:7ad:d367:fabb with SMTP id
 cr16-20020a170906d55000b007add367fabbmr49041629ejc.285.1667989644563; Wed, 09
 Nov 2022 02:27:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667530733.git.steve@sakoman.com> <469ac1fc6f18f0db72a13bde2268ba54ae37da75.1667530733.git.steve@sakoman.com>
 <CAKzga+xbh7XiB-cqg9EzKKLekK2YLiS_wOZdOmeF0FFReypwGg@mail.gmail.com> <CAOSpxdZ2jgLiNa3p+VKc2+=XPYiMJG17+Wb5bGVQ_9GxfOHk2w@mail.gmail.com>
In-Reply-To: <CAOSpxdZ2jgLiNa3p+VKc2+=XPYiMJG17+Wb5bGVQ_9GxfOHk2w@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Wed, 9 Nov 2022 15:57:12 +0530
Message-ID: <CAKzga+yt-8gpAe8qofTLDEQjMA3eSF0yJD90BfLp07XHxwqQXg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 06/31] tiff: fix CVE-2022-2953
To: Zheng Qiu <zheng.qiu@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>, Shubham Kulkarni <skulkarni@mvista.com>
Content-Type: multipart/alternative; boundary="00000000000040ff1b05ed071a3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 10:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173015

--00000000000040ff1b05ed071a3d
Content-Type: text/plain; charset="UTF-8"

Hi Zheng,

Can you please clear my confusion, if possible.

Thanks,
Shubham

On Mon, Nov 7, 2022 at 7:49 PM Steve Sakoman <steve@sakoman.com> wrote:

> Hello Zheng,
>
> Could you respond to Shubham's question on your patch?
>
> Thanks,
>
> Steve
>
> On Sun, Nov 6, 2022 at 11:10 PM Shubham Kulkarni <skulkarni@mvista.com>
> wrote:
> >
> > Hello, I am new to this community and trying to understand the CVE patch
> fixing process. Kindly correct me if I am wrong with my understanding.
> >
> > So, this patch is fixing the code present in the file tools/tiffcrop.c .
> I can see this patch is having combined changes from following commits:
> >
> > 1] https://gitlab.com/libtiff/libtiff/-/commit/e319508 - tiffcrop: Fix
> issue #330 and some more from 320 to 349
> > 2] https://gitlab.com/libtiff/libtiff/-/commit/8fe3735  - According to
> Richard Nolde #401 (comment 877637400)
> > 3] https://gitlab.com/libtiff/libtiff/-/commit/bad48e9 - tiffcrop -S
> option: Make decision simpler.
> >
> > Debian website for this CVE (
> https://security-tracker.debian.org/tracker/CVE-2022-2953) suggests
> commits "2]" & "3]" as a fix. And both "2]" & "3]" fixes the code
> introduced by commit "1]". So, can we say that the vulnerability was
> introduced by commit "1]" , and solved by "2]" & "3]" ?
> >
> > If yes, then as per my understanding, there is no need of fixing, as
> vulnerability itself is not present in current code and it's Not Affected
> by the CVE. But this patch is introducing the vulnerability ("1]") and on
> top of it, fixing the same ("2]" & "3]"). Is it required Or can we just say
> that this version of code/tiff package is not affected by this CVE?
> > Please rectify my understanding.
> >
> > Thanks in Advance,
> > Shubham
> >
> >
> > On Fri, Nov 4, 2022 at 8:31 AM Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> From: Zheng Qiu <zheng.qiu@windriver.com>
> >>
> >> While this does not happen with the tiff 4.3.0 release, it does happen
> with
> >> the series of patches we have, so backport the two simple changes that
> >> restrict the tiffcrop options to avoid the vulnerability.
> >>
> >> CVE-2022-2953.patch was taken from upstream, and a small typo was fixed
> >> for the CVE number. The other patch is included in tiff 4.4.0 but not
> >> 4.3.0, so add it as well.
> >>
> >> Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
> >> Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>  ...ue-330-and-some-more-from-320-to-349.patch | 609 ++++++++++++++++++
> >>  .../libtiff/tiff/CVE-2022-2953.patch          |  87 +++
> >>  meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
> >>  3 files changed, 698 insertions(+)
> >>  create mode 100644
> meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
> >>  create mode 100644
> meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
> >>
> >> diff --git
> a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
> b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
> >> new file mode 100644
> >> index 0000000000..07acf5eb90
> >> --- /dev/null
> >> +++
> b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
> >> @@ -0,0 +1,609 @@
> >> +From e319508023580e2f70e6e626f745b5b2a1707313 Mon Sep 17 00:00:00 2001
> >> +From: Su Laus <sulau@freenet.de>
> >> +Date: Tue, 10 May 2022 20:03:17 +0000
> >> +Subject: [PATCH] tiffcrop: Fix issue #330 and some more from 320 to 349
> >> +Upstream-Status: Backport
> >> +Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> >> +---
> >> + tools/tiffcrop.c | 282 +++++++++++++++++++++++++++++++++++------------
> >> + 1 file changed, 210 insertions(+), 72 deletions(-)
> >> +
> >> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
> >> +index 77cf6ed1..791ec5e7 100644
> >> +--- a/tools/tiffcrop.c
> >> ++++ b/tools/tiffcrop.c
> >> +@@ -63,20 +63,24 @@
> >> +  *                units when sectioning image into columns x rows
> >> +  *                using the -S cols:rows option.
> >> +  * -X #           Horizontal dimension of region to extract expressed
> in current
> >> +- *                units
> >> ++ *                units, relative to the specified origin reference
> 'edge' left (default for X) or right.
> >> +  * -Y #           Vertical dimension of region to extract expressed
> in current
> >> +- *                units
> >> ++ *                units, relative to the specified origin reference
> 'edge' top (default for Y) or bottom.
> >> +  * -O orient      Orientation for output image, portrait, landscape,
> auto
> >> +  * -P page        Page size for output image segments, eg letter,
> legal, tabloid,
> >> +  *                etc.
> >> +  * -S cols:rows   Divide the image into equal sized segments using
> cols across
> >> +  *                and rows down
> >> +- * -E t|l|r|b     Edge to use as origin
> >> ++ * -E t|l|r|b     Edge to use as origin (i.e. 'side' of the image not
> 'corner')
> >> ++ *                  top    = width from left, zones from top to
> bottom (default)
> >> ++ *                  bottom = width from left, zones from bottom to top
> >> ++ *                  left   = zones from left to right, length from top
> >> ++ *                  right  = zones from right to left, length from top
> >> +  * -m #,#,#,#     Margins from edges for selection: top, left,
> bottom, right
> >> +  *                (commas separated)
> >> +  * -Z #:#,#:#     Zones of the image designated as zone X of Y,
> >> +  *                eg 1:3 would be first of three equal portions
> measured
> >> +- *                from reference edge
> >> ++ *                from reference edge (i.e. 'side' not corner)
> >> +  * -N odd|even|#,#-#,#|last
> >> +  *                Select sequences and/or ranges of images within file
> >> +  *                to process. The words odd or even may be used to
> specify
> >> +@@ -103,10 +107,13 @@
> >> +  *                selects which functions dump data, with higher
> numbers selecting
> >> +  *                lower level, scanline level routines. Debug reports
> a limited set
> >> +  *                of messages to monitor progress without enabling
> dump logs.
> >> ++ *
> >> ++ * Note:    The (-X|-Y), -Z and -z options are mutually exclusive.
> >> ++ *          In no case should the options be applied to a given
> selection successively.
> >> +  */
> >> +
> >> +-static   char tiffcrop_version_id[] = "2.4.1";
> >> +-static   char tiffcrop_rev_date[] = "03-03-2010";
> >> ++static   char tiffcrop_version_id[] = "2.5";
> >> ++static   char tiffcrop_rev_date[] = "02-09-2022";
> >> +
> >> + #include "tif_config.h"
> >> + #include "libport.h"
> >> +@@ -774,6 +781,9 @@ static const char usage_info[] =
> >> + "             The four debug/dump options are independent, though it
> makes little sense to\n"
> >> + "             specify a dump file without specifying a detail
> level.\n"
> >> + "\n"
> >> ++"Note:        The (-X|-Y), -Z and -z options are mutually
> exclusive.\n"
> >> ++"             In no case should the options be applied to a given
> selection successively.\n"
> >> ++"\n"
> >> + ;
> >> +
> >> + /* This function could be modified to pass starting sample offset
> >> +@@ -2121,6 +2131,15 @@ void  process_command_opts (int argc, char
> *argv[], char *mp, char *mode, uint32
> >> +               /*NOTREACHED*/
> >> +       }
> >> +     }
> >> ++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and
> -z are mutually exclusive) --*/
> >> ++    char XY, Z, R;
> >> ++    XY = ((crop_data->crop_mode & CROP_WIDTH) ||
> (crop_data->crop_mode & CROP_LENGTH));
> >> ++    Z = (crop_data->crop_mode & CROP_ZONES);
> >> ++    R = (crop_data->crop_mode & CROP_REGIONS);
> >> ++    if ((XY && Z) || (XY && R) || (Z && R)) {
> >> ++        TIFFError("tiffcrop input error", "The crop options(-X|-Y),
> -Z and -z are mutually exclusive.->Exit");
> >> ++        exit(EXIT_FAILURE);
> >> ++    }
> >> +   }  /* end process_command_opts */
> >> +
> >> + /* Start a new output file if one has not been previously opened or
> >> +@@ -2746,7 +2765,7 @@ extractContigSamplesBytes (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                            tsample_t count, uint32_t start, uint32_t
> end)
> >> +   {
> >> +   int i, bytes_per_sample, sindex;
> >> +-  uint32_t col, dst_rowsize, bit_offset;
> >> ++  uint32_t col, dst_rowsize, bit_offset, numcols;
> >> +   uint32_t src_byte /*, src_bit */;
> >> +   uint8_t *src = in;
> >> +   uint8_t *dst = out;
> >> +@@ -2757,6 +2776,10 @@ extractContigSamplesBytes (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +     return (1);
> >> +     }
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamplesBytes",
> >> +@@ -2769,6 +2792,9 @@ extractContigSamplesBytes (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   dst_rowsize = (bps * (end - start) * count) / 8;
> >> +
> >> +@@ -2812,7 +2838,7 @@ extractContigSamples8bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                            tsample_t count, uint32_t start, uint32_t
> end)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint8_t  maskbits = 0, matchbits = 0;
> >> +   uint8_t  buff1 = 0, buff2 = 0;
> >> +   uint8_t *src = in;
> >> +@@ -2824,6 +2850,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +     return (1);
> >> +     }
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamples8bits",
> >> +@@ -2836,7 +2866,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> +-
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> ++
> >> +   ready_bits = 0;
> >> +   maskbits =  (uint8_t)-1 >> (8 - bps);
> >> +   buff1 = buff2 = 0;
> >> +@@ -2889,7 +2922,7 @@ extractContigSamples16bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                             tsample_t count, uint32_t start, uint32_t
> end)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint16_t maskbits = 0, matchbits = 0;
> >> +   uint16_t buff1 = 0, buff2 = 0;
> >> +   uint8_t  bytebuff = 0;
> >> +@@ -2902,6 +2935,10 @@ extractContigSamples16bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     return (1);
> >> +     }
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamples16bits",
> >> +@@ -2914,6 +2951,9 @@ extractContigSamples16bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   ready_bits = 0;
> >> +   maskbits = (uint16_t)-1 >> (16 - bps);
> >> +@@ -2978,7 +3018,7 @@ extractContigSamples24bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                             tsample_t count, uint32_t start, uint32_t
> end)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint32_t maskbits = 0, matchbits = 0;
> >> +   uint32_t buff1 = 0, buff2 = 0;
> >> +   uint8_t  bytebuff1 = 0, bytebuff2 = 0;
> >> +@@ -2991,6 +3031,10 @@ extractContigSamples24bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     return (1);
> >> +     }
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamples24bits",
> >> +@@ -3003,6 +3047,9 @@ extractContigSamples24bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   ready_bits = 0;
> >> +   maskbits =  (uint32_t)-1 >> (32 - bps);
> >> +@@ -3087,7 +3134,7 @@ extractContigSamples32bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                             tsample_t count, uint32_t start, uint32_t
> end)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint32_t longbuff1 = 0, longbuff2 = 0;
> >> +   uint64_t maskbits = 0, matchbits = 0;
> >> +   uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
> >> +@@ -3102,6 +3149,10 @@ extractContigSamples32bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     }
> >> +
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamples32bits",
> >> +@@ -3114,6 +3165,9 @@ extractContigSamples32bits (uint8_t *in, uint8_t
> *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   /* shift_width = ((bps + 7) / 8) + 1; */
> >> +   ready_bits = 0;
> >> +@@ -3193,7 +3247,7 @@ extractContigSamplesShifted8bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                                   int shift)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint8_t  maskbits = 0, matchbits = 0;
> >> +   uint8_t  buff1 = 0, buff2 = 0;
> >> +   uint8_t *src = in;
> >> +@@ -3205,6 +3259,10 @@ extractContigSamplesShifted8bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     return (1);
> >> +     }
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamplesShifted8bits",
> >> +@@ -3217,6 +3275,9 @@ extractContigSamplesShifted8bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   ready_bits = shift;
> >> +   maskbits =  (uint8_t)-1 >> (8 - bps);
> >> +@@ -3273,7 +3334,7 @@ extractContigSamplesShifted16bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                                    int shift)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint16_t maskbits = 0, matchbits = 0;
> >> +   uint16_t buff1 = 0, buff2 = 0;
> >> +   uint8_t  bytebuff = 0;
> >> +@@ -3286,6 +3347,10 @@ extractContigSamplesShifted16bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     return (1);
> >> +     }
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamplesShifted16bits",
> >> +@@ -3298,6 +3363,9 @@ extractContigSamplesShifted16bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   ready_bits = shift;
> >> +   maskbits = (uint16_t)-1 >> (16 - bps);
> >> +@@ -3363,7 +3431,7 @@ extractContigSamplesShifted24bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                                    int shift)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint32_t maskbits = 0, matchbits = 0;
> >> +   uint32_t buff1 = 0, buff2 = 0;
> >> +   uint8_t  bytebuff1 = 0, bytebuff2 = 0;
> >> +@@ -3376,6 +3444,16 @@ extractContigSamplesShifted24bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     return (1);
> >> +     }
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  /*--- Remark, which is true for all those functions
> extractCongigSamplesXXX() --
> >> ++  *  The mitigation of the start/end test does not allways make
> sense, because the function is often called with e.g.:
> >> ++  *  start = 31; end = 32; cols = 32  to extract the last column in a
> 32x32 sample image.
> >> ++  *  If then, a worng parameter (e.g. cols = 10) is provided, the
> mitigated settings would be start=0; end=1.
> >> ++  *  Therefore, an error message and no copy action might be the
> better reaction to wrong parameter configurations.
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamplesShifted24bits",
> >> +@@ -3388,6 +3466,9 @@ extractContigSamplesShifted24bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   ready_bits = shift;
> >> +   maskbits =  (uint32_t)-1 >> (32 - bps);
> >> +@@ -3449,7 +3530,7 @@ extractContigSamplesShifted24bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     buff2 = (buff2 << 8);
> >> +     bytebuff2 = bytebuff1;
> >> +     ready_bits -= 8;
> >> +-    }
> >> ++  }
> >> +
> >> +   return (0);
> >> +   } /* end extractContigSamplesShifted24bits */
> >> +@@ -3461,7 +3542,7 @@ extractContigSamplesShifted32bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                                    int shift)
> >> +   {
> >> +   int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
> >> +-  uint32_t col, src_byte, src_bit, bit_offset;
> >> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
> >> +   uint32_t longbuff1 = 0, longbuff2 = 0;
> >> +   uint64_t maskbits = 0, matchbits = 0;
> >> +   uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
> >> +@@ -3476,6 +3557,10 @@ extractContigSamplesShifted32bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +     }
> >> +
> >> +
> >> ++  /* Number of extracted columns shall be kept as (end-start + 1).
> Otherwise buffer-overflow might occur.
> >> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be
> set one after the index of the last column to be copied!
> >> ++   */
> >> ++  numcols = abs(end - start);
> >> +   if ((start > end) || (start > cols))
> >> +     {
> >> +     TIFFError ("extractContigSamplesShifted32bits",
> >> +@@ -3488,6 +3573,9 @@ extractContigSamplesShifted32bits (uint8_t *in,
> uint8_t *out, uint32_t cols,
> >> +                "Invalid end column value %"PRIu32" ignored", end);
> >> +     end = cols;
> >> +     }
> >> ++  if (abs(end - start) > numcols) {
> >> ++      end = start + numcols;
> >> ++  }
> >> +
> >> +   /* shift_width = ((bps + 7) / 8) + 1; */
> >> +   ready_bits = shift;
> >> +@@ -5429,7 +5517,7 @@ getCropOffsets(struct image_data *image, struct
> crop_mask *crop, struct dump_opt
> >> +   {
> >> +   struct offset offsets;
> >> +   int    i;
> >> +-  int32_t  test;
> >> ++  uint32_t uaux;
> >> +   uint32_t seg, total, need_buff = 0;
> >> +   uint32_t buffsize;
> >> +   uint32_t zwidth, zlength;
> >> +@@ -5510,8 +5598,13 @@ getCropOffsets(struct image_data *image, struct
> crop_mask *crop, struct dump_opt
> >> +     seg = crop->zonelist[j].position;
> >> +     total = crop->zonelist[j].total;
> >> +
> >> +-    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip
> that input */
> >> ++    /* check for not allowed zone cases like 0:0; 4:3; or negative
> ones etc. and skip that input */
> >> ++    if (crop->zonelist[j].position < 0 || crop->zonelist[j].total <
> 0) {
> >> ++        TIFFError("getCropOffsets", "Negative crop zone values %d:%d
> are not allowed, thus skipped.", crop->zonelist[j].position,
> crop->zonelist[j].total);
> >> ++        continue;
> >> ++    }
> >> +     if (seg == 0 || total == 0 || seg > total) {
> >> ++        TIFFError("getCropOffsets", "Crop zone %d:%d is out of
> specification, thus skipped.", seg, total);
> >> +         continue;
> >> +     }
> >> +
> >> +@@ -5524,17 +5617,23 @@ getCropOffsets(struct image_data *image,
> struct crop_mask *crop, struct dump_opt
> >> +
> >> +            crop->regionlist[i].x1 = offsets.startx +
> >> +                                   (uint32_t)(offsets.crop_width * 1.0
> * (seg - 1) / total);
> >> +-           test = (int32_t)offsets.startx +
> >> +-                  (int32_t)(offsets.crop_width * 1.0 * seg / total);
> >> +-           if (test < 1 )
> >> +-             crop->regionlist[i].x2 = 0;
> >> +-           else
> >> +-           {
> >> +-           if (test > (int32_t)(image->width - 1))
> >> ++           /* FAULT: IMHO in the old code here, the calculation of x2
> was based on wrong assumtions. The whole image was assumed and 'endy' and
> 'starty' are not respected anymore!*/
> >> ++           /* NEW PROPOSED Code: Assumption: offsets are within image
> with top left corner as origin (0,0) and 'start' <= 'end'. */
> >> ++           if (crop->regionlist[i].x1 > offsets.endx) {
> >> ++                crop->regionlist[i].x1 = offsets.endx;
> >> ++           } else if (crop->regionlist[i].x1 >= image->width) {
> >> ++               crop->regionlist[i].x1 = image->width - 1;
> >> ++           }
> >> ++
> >> ++           crop->regionlist[i].x2 = offsets.startx +
> (uint32_t)(offsets.crop_width * 1.0 * seg / total);
> >> ++           if (crop->regionlist[i].x2 > 0) crop->regionlist[i].x2 =
> crop->regionlist[i].x2 - 1;
> >> ++           if (crop->regionlist[i].x2 < crop->regionlist[i].x1) {
> >> ++               crop->regionlist[i].x2 = crop->regionlist[i].x1;
> >> ++           } else if (crop->regionlist[i].x2 > offsets.endx) {
> >> ++               crop->regionlist[i].x2 = offsets.endx;
> >> ++           } else if (crop->regionlist[i].x2 >= image->width) {
> >> +                crop->regionlist[i].x2 = image->width - 1;
> >> +-             else
> >> +-             crop->regionlist[i].x2 = test - 1;
> >> +-             }
> >> ++           }
> >> +            zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1
> + 1;
> >> +
> >> +          /* This is passed to extractCropZone or
> extractCompositeZones */
> >> +@@ -5549,22 +5648,27 @@ getCropOffsets(struct image_data *image,
> struct crop_mask *crop, struct dump_opt
> >> +          crop->regionlist[i].x1 = offsets.startx;
> >> +            crop->regionlist[i].x2 = offsets.endx;
> >> +
> >> +-           test = offsets.endy - (uint32_t)(offsets.crop_length * 1.0
> * seg / total);
> >> +-           if (test < 1 )
> >> +-           crop->regionlist[i].y1 = 0;
> >> +-           else
> >> +-           crop->regionlist[i].y1 = test + 1;
> >> ++           /* FAULT: IMHO in the old code here, the calculation of
> y1/y2 was based on wrong assumtions. The whole image was assumed and 'endy'
> and 'starty' are not respected anymore!*/
> >> ++           /* NEW PROPOSED Code: Assumption: offsets are within image
> with top left corner as origin (0,0) and 'start' <= 'end'. */
> >> ++           uaux = (uint32_t)(offsets.crop_length * 1.0 * seg / total);
> >> ++           if (uaux <= offsets.endy + 1) {
> >> ++               crop->regionlist[i].y1 = offsets.endy - uaux + 1;
> >> ++           } else {
> >> ++               crop->regionlist[i].y1 = 0;
> >> ++           }
> >> ++           if (crop->regionlist[i].y1 < offsets.starty) {
> >> ++               crop->regionlist[i].y1 = offsets.starty;
> >> ++           }
> >> +
> >> +-           test = offsets.endy - (offsets.crop_length * 1.0 * (seg -
> 1) / total);
> >> +-           if (test < 1 )
> >> +-             crop->regionlist[i].y2 = 0;
> >> +-           else
> >> +-           {
> >> +-             if (test > (int32_t)(image->length - 1))
> >> +-               crop->regionlist[i].y2 = image->length - 1;
> >> +-             else
> >> +-               crop->regionlist[i].y2 = test;
> >> +-           }
> >> ++           uaux = (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) /
> total);
> >> ++           if (uaux <= offsets.endy) {
> >> ++               crop->regionlist[i].y2 = offsets.endy - uaux;
> >> ++           } else {
> >> ++               crop->regionlist[i].y2 = 0;
> >> ++           }
> >> ++           if (crop->regionlist[i].y2 < offsets.starty) {
> >> ++               crop->regionlist[i].y2 = offsets.starty;
> >> ++           }
> >> +            zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1
> + 1;
> >> +
> >> +          /* This is passed to extractCropZone or
> extractCompositeZones */
> >> +@@ -5575,32 +5679,42 @@ getCropOffsets(struct image_data *image,
> struct crop_mask *crop, struct dump_opt
> >> +            crop->combined_width = (uint32_t)zwidth;
> >> +            break;
> >> +       case EDGE_RIGHT: /* zones from right to left, length from top */
> >> +-           zlength = offsets.crop_length;
> >> +-         crop->regionlist[i].y1 = offsets.starty;
> >> +-           crop->regionlist[i].y2 = offsets.endy;
> >> +-
> >> +-           crop->regionlist[i].x1 = offsets.startx +
> >> +-                                  (uint32_t)(offsets.crop_width *
> (total - seg) * 1.0 / total);
> >> +-           test = offsets.startx +
> >> +-                (offsets.crop_width * (total - seg + 1) * 1.0 /
> total);
> >> +-           if (test < 1 )
> >> +-             crop->regionlist[i].x2 = 0;
> >> +-           else
> >> +-           {
> >> +-           if (test > (int32_t)(image->width - 1))
> >> +-               crop->regionlist[i].x2 = image->width - 1;
> >> +-             else
> >> +-               crop->regionlist[i].x2 = test - 1;
> >> +-             }
> >> +-           zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1
> + 1;
> >> ++                zlength = offsets.crop_length;
> >> ++                crop->regionlist[i].y1 = offsets.starty;
> >> ++                crop->regionlist[i].y2 = offsets.endy;
> >> ++
> >> ++                crop->regionlist[i].x1 = offsets.startx +
> >> ++                        (uint32_t)(offsets.crop_width * (total - seg)
> * 1.0 / total);
> >> ++          /* FAULT: IMHO from here on, the calculation of y2 are
> based on wrong assumtions. The whole image is assumed and 'endy' and
> 'starty' are not respected anymore!*/
> >> ++          /* NEW PROPOSED Code: Assumption: offsets are within image
> with top left corner as origin (0,0) and 'start' <= 'end'. */
> >> ++          uaux = (uint32_t)(offsets.crop_width * 1.0 * seg / total);
> >> ++          if (uaux <= offsets.endx + 1) {
> >> ++              crop->regionlist[i].x1 = offsets.endx - uaux + 1;
> >> ++          } else {
> >> ++              crop->regionlist[i].x1 = 0;
> >> ++          }
> >> ++          if (crop->regionlist[i].x1 < offsets.startx) {
> >> ++              crop->regionlist[i].x1 = offsets.startx;
> >> ++          }
> >> +
> >> +-         /* This is passed to extractCropZone or
> extractCompositeZones */
> >> +-           crop->combined_length = (uint32_t)zlength;
> >> +-           if (crop->exp_mode == COMPOSITE_IMAGES)
> >> +-             crop->combined_width += (uint32_t)zwidth;
> >> +-           else
> >> +-             crop->combined_width = (uint32_t)zwidth;
> >> +-           break;
> >> ++          uaux = (uint32_t)(offsets.crop_width * 1.0 * (seg - 1) /
> total);
> >> ++          if (uaux <= offsets.endx) {
> >> ++              crop->regionlist[i].x2 = offsets.endx - uaux;
> >> ++          } else {
> >> ++              crop->regionlist[i].x2 = 0;
> >> ++          }
> >> ++          if (crop->regionlist[i].x2 < offsets.startx) {
> >> ++              crop->regionlist[i].x2 = offsets.startx;
> >> ++          }
> >> ++          zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1 +
> 1;
> >> ++
> >> ++                /* This is passed to extractCropZone or
> extractCompositeZones */
> >> ++                crop->combined_length = (uint32_t)zlength;
> >> ++                if (crop->exp_mode == COMPOSITE_IMAGES)
> >> ++                        crop->combined_width += (uint32_t)zwidth;
> >> ++                else
> >> ++                        crop->combined_width = (uint32_t)zwidth;
> >> ++                break;
> >> +       case EDGE_TOP: /* width from left, zones from top to bottom */
> >> +       default:
> >> +            zwidth = offsets.crop_width;
> >> +@@ -5608,6 +5722,14 @@ getCropOffsets(struct image_data *image, struct
> crop_mask *crop, struct dump_opt
> >> +            crop->regionlist[i].x2 = offsets.endx;
> >> +
> >> +            crop->regionlist[i].y1 = offsets.starty +
> (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) / total);
> >> ++           if (crop->regionlist[i].y1 > offsets.endy) {
> >> ++               crop->regionlist[i].y1 = offsets.endy;
> >> ++           } else if (crop->regionlist[i].y1 >= image->length) {
> >> ++               crop->regionlist[i].y1 = image->length - 1;
> >> ++           }
> >> ++
> >> ++           /* FAULT: IMHO from here on, the calculation of y2 are
> based on wrong assumtions. The whole image is assumed and 'endy' and
> 'starty' are not respected anymore!*/
> >> ++           /* OLD Code:
> >> +            test = offsets.starty + (uint32_t)(offsets.crop_length *
> 1.0 * seg / total);
> >> +            if (test < 1 )
> >> +              crop->regionlist[i].y2 = 0;
> >> +@@ -5618,6 +5740,18 @@ getCropOffsets(struct image_data *image, struct
> crop_mask *crop, struct dump_opt
> >> +              else
> >> +              crop->regionlist[i].y2 = test - 1;
> >> +            }
> >> ++           */
> >> ++                 /* NEW PROPOSED Code: Assumption: offsets are within
> image with top left corner as origin (0,0) and 'start' <= 'end'. */
> >> ++                 crop->regionlist[i].y2 = offsets.starty +
> (uint32_t)(offsets.crop_length * 1.0 * seg / total);
> >> ++           if (crop->regionlist[i].y2 > 0)crop->regionlist[i].y2 =
> crop->regionlist[i].y2 - 1;
> >> ++                 if (crop->regionlist[i].y2 < crop->regionlist[i].y1)
> {
> >> ++                         crop->regionlist[i].y2 =
> crop->regionlist[i].y1;
> >> ++                 } else if (crop->regionlist[i].y2 > offsets.endy) {
> >> ++                         crop->regionlist[i].y2 = offsets.endy;
> >> ++                 } else if (crop->regionlist[i].y2 >= image->length) {
> >> ++                         crop->regionlist[i].y2 = image->length - 1;
> >> ++                 }
> >> ++
> >> +            zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1
> + 1;
> >> +
> >> +          /* This is passed to extractCropZone or
> extractCompositeZones */
> >> +@@ -7551,7 +7685,8 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> >> +     total_width = total_length = 0;
> >> +     for (i = 0; i < crop->selections; i++)
> >> +       {
> >> +-      cropsize = crop->bufftotal;
> >> ++
> >> ++        cropsize = crop->bufftotal;
> >> +       crop_buff = seg_buffs[i].buffer;
> >> +       if (!crop_buff)
> >> +         crop_buff = (unsigned char *)limitMalloc(cropsize);
> >> +@@ -7640,6 +7775,9 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> >> +
> >> +       if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as
> it can reallocate the buffer */
> >> +         {
> >> ++          /* rotateImage() changes image->width, ->length, ->xres and
> ->yres, what it schouldn't do here, when more than one section is processed.
> >> ++           * ToDo: Therefore rotateImage() and its usage has to be
> reworked (e.g. like mirrorImage()) !!
> >> ++           */
> >> +       if (rotateImage(crop->rotation, image,
> &crop->regionlist[i].width,
> >> +                       &crop->regionlist[i].length, &crop_buff))
> >> +           {
> >> +@@ -7655,8 +7793,8 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> >> +         seg_buffs[i].size = (((crop->regionlist[i].width * image->bps
> + 7 ) / 8)
> >> +                                * image->spp) *
> crop->regionlist[i].length;
> >> +         }
> >> +-      }
> >> +-    }
> >> ++      }  /* for crop->selections loop */
> >> ++    }  /* Separated Images (else case) */
> >> +   return (0);
> >> +   } /* end processCropSelections */
> >> +
> >> +--
> >> +2.33.0
> >> +
> >> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
> b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
> >> new file mode 100644
> >> index 0000000000..3a3a915688
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
> >> @@ -0,0 +1,87 @@
> >> +CVE: CVE-2022-2953
> >> +Upstream-Status: Backport
> >> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> >> +Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> >> +
> >> +From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00 2001
> >> +From: Su_Laus <sulau@freenet.de>
> >> +Date: Mon, 15 Aug 2022 22:11:03 +0200
> >> +Subject: [PATCH] =?UTF-8?q?According=20to=20Richard=20Nolde=20
> https://gitl?=
> >> + =?UTF-8?q?
> ab.com/libtiff/libtiff/-/issues/401#note=5F877637400=20the=20ti?=
> >> +
> =?UTF-8?q?ffcrop=20option=20=E2=80=9E-S=E2=80=9C=20is=20also=20mutually?=
> >> +
> =?UTF-8?q?=20exclusive=20to=20the=20other=20crop=20options=20(-X|-Y),=20-?=
> >> + =?UTF-8?q?Z=20and=20-z.?=
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=UTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +This is now checked and ends tiffcrop if those arguments are not
> mutually exclusive.
> >> +
> >> +This MR will fix the following tiffcrop issues: #349, #414, #422,
> #423, #424
> >> +---
> >> + tools/tiffcrop.c | 31 ++++++++++++++++---------------
> >> + 1 file changed, 16 insertions(+), 15 deletions(-)
> >> +
> >> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
> >> +index 90286a5e..c3b758ec 100644
> >> +--- a/tools/tiffcrop.c
> >> ++++ b/tools/tiffcrop.c
> >> +@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] = "02-09-2022";
> >> + #define ROTATECW_270 32
> >> + #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
> >> +
> >> +-#define CROP_NONE     0
> >> +-#define CROP_MARGINS  1
> >> +-#define CROP_WIDTH    2
> >> +-#define CROP_LENGTH   4
> >> +-#define CROP_ZONES    8
> >> +-#define CROP_REGIONS 16
> >> ++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and
> page->rows/->cols != 0 */
> >> ++#define CROP_MARGINS  1     /* "-m" */
> >> ++#define CROP_WIDTH    2     /* "-X" */
> >> ++#define CROP_LENGTH   4     /* "-Y" */
> >> ++#define CROP_ZONES    8     /* "-Z" */
> >> ++#define CROP_REGIONS 16     /* "-z" */
> >> + #define CROP_ROTATE  32
> >> + #define CROP_MIRROR  64
> >> + #define CROP_INVERT 128
> >> +@@ -316,7 +316,7 @@ struct crop_mask {
> >> + #define PAGE_MODE_RESOLUTION   1
> >> + #define PAGE_MODE_PAPERSIZE    2
> >> + #define PAGE_MODE_MARGINS      4
> >> +-#define PAGE_MODE_ROWSCOLS     8
> >> ++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
> >> +
> >> + #define INVERT_DATA_ONLY      10
> >> + #define INVERT_DATA_AND_TAG   11
> >> +@@ -781,7 +781,7 @@ static const char usage_info[] =
> >> + "             The four debug/dump options are independent, though it
> makes little sense to\n"
> >> + "             specify a dump file without specifying a detail
> level.\n"
> >> + "\n"
> >> +-"Note:        The (-X|-Y), -Z and -z options are mutually
> exclusive.\n"
> >> ++"Note:        The (-X|-Y), -Z, -z and -S options are mutually
> exclusive.\n"
> >> + "             In no case should the options be applied to a given
> selection successively.\n"
> >> + "\n"
> >> + ;
> >> +@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char
> *argv[], char *mp, char *mode, uint32
> >> +               /*NOTREACHED*/
> >> +       }
> >> +     }
> >> +-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and
> -z are mutually exclusive) --*/
> >> +-    char XY, Z, R;
> >> ++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z
> and -S are mutually exclusive) --*/
> >> ++    char XY, Z, R, S;
> >> +     XY = ((crop_data->crop_mode & CROP_WIDTH) ||
> (crop_data->crop_mode & CROP_LENGTH));
> >> +     Z = (crop_data->crop_mode & CROP_ZONES);
> >> +     R = (crop_data->crop_mode & CROP_REGIONS);
> >> +-    if ((XY && Z) || (XY && R) || (Z && R)) {
> >> +-        TIFFError("tiffcrop input error", "The crop options(-X|-Y),
> -Z and -z are mutually exclusive.->Exit");
> >> ++    S = (page->mode & PAGE_MODE_ROWSCOLS);
> >> ++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S)
> || (R && S)) {
> >> ++        TIFFError("tiffcrop input error", "The crop options(-X|-Y),
> -Z, -z and -S are mutually exclusive.->Exit");
> >> +         exit(EXIT_FAILURE);
> >> +     }
> >> +   }  /* end process_command_opts */
> >> +--
> >> +2.34.1
> >> +
> >> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> >> index f84057c46b..29a2c38d8e 100644
> >> --- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> >> +++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> >> @@ -25,6 +25,8 @@ SRC_URI = "
> http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
> >>             file://CVE-2022-2869.patch \
> >>             file://CVE-2022-2867.patch \
> >>             file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
> >> +
>  file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
> >> +           file://CVE-2022-2953.patch \
> >>             "
> >>
> >>  SRC_URI[sha256sum] =
> "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
> >> --
> >> 2.25.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#172667):
> https://lists.openembedded.org/g/openembedded-core/message/172667
> >> Mute This Topic: https://lists.openembedded.org/mt/94799048/7032091
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skulkarni@mvista.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

--00000000000040ff1b05ed071a3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Zheng,<div><br></div><div>Can you please clear my =
confusion, if possible.</div><div><br></div><div>Thanks,</div><div>Shubham<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Nov 7, 2022 at 7:49 PM Steve Sakoman &lt;<a href=3D"mailto:ste=
ve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Zheng,<br>
<br>
Could you respond to Shubham&#39;s question on your patch?<br>
<br>
Thanks,<br>
<br>
Steve<br>
<br>
On Sun, Nov 6, 2022 at 11:10 PM Shubham Kulkarni &lt;<a href=3D"mailto:skul=
karni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello, I am new to this community and trying to understand the CVE pat=
ch fixing process. Kindly correct me if I am wrong with my understanding.<b=
r>
&gt;<br>
&gt; So, this patch is fixing the code present in the file tools/tiffcrop.c=
 . I can see this patch is having combined changes from following commits:<=
br>
&gt;<br>
&gt; 1] <a href=3D"https://gitlab.com/libtiff/libtiff/-/commit/e319508" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/libtiff/libtiff/-/comm=
it/e319508</a> - tiffcrop: Fix issue #330 and some more from 320 to 349<br>
&gt; 2] <a href=3D"https://gitlab.com/libtiff/libtiff/-/commit/8fe3735" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/libtiff/libtiff/-/comm=
it/8fe3735</a>=C2=A0 - According to Richard Nolde #401 (comment 877637400)<=
br>
&gt; 3] <a href=3D"https://gitlab.com/libtiff/libtiff/-/commit/bad48e9" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/libtiff/libtiff/-/comm=
it/bad48e9</a> - tiffcrop -S option: Make decision simpler.<br>
&gt;<br>
&gt; Debian website for this CVE (<a href=3D"https://security-tracker.debia=
n.org/tracker/CVE-2022-2953" rel=3D"noreferrer" target=3D"_blank">https://s=
ecurity-tracker.debian.org/tracker/CVE-2022-2953</a>) suggests commits &quo=
t;2]&quot; &amp; &quot;3]&quot; as a fix. And both &quot;2]&quot; &amp; &qu=
ot;3]&quot; fixes the code introduced by commit &quot;1]&quot;. So, can we =
say that the vulnerability was introduced by commit &quot;1]&quot; , and so=
lved by &quot;2]&quot; &amp; &quot;3]&quot; ?<br>
&gt;<br>
&gt; If yes, then as per my understanding, there is no need of fixing, as v=
ulnerability itself is not present in current code and it&#39;s Not Affecte=
d by the CVE. But this patch is introducing the vulnerability (&quot;1]&quo=
t;) and on top of it, fixing the same (&quot;2]&quot; &amp; &quot;3]&quot;)=
. Is it required Or can we just say that this version of code/tiff package =
is not affected by this CVE?<br>
&gt; Please rectify my understanding.<br>
&gt;<br>
&gt; Thanks in Advance,<br>
&gt; Shubham<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Nov 4, 2022 at 8:31 AM Steve Sakoman &lt;<a href=3D"mailto:ste=
ve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Zheng Qiu &lt;<a href=3D"mailto:zheng.qiu@windriver.com" tar=
get=3D"_blank">zheng.qiu@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; While this does not happen with the tiff 4.3.0 release, it does ha=
ppen with<br>
&gt;&gt; the series of patches we have, so backport the two simple changes =
that<br>
&gt;&gt; restrict the tiffcrop options to avoid the vulnerability.<br>
&gt;&gt;<br>
&gt;&gt; CVE-2022-2953.patch was taken from upstream, and a small typo was =
fixed<br>
&gt;&gt; for the CVE number. The other patch is included in tiff 4.4.0 but =
not<br>
&gt;&gt; 4.3.0, so add it as well.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@w=
indriver.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Zheng Qiu &lt;<a href=3D"mailto:zheng.qiu@windriver=
.com" target=3D"_blank">zheng.qiu@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...ue-330-and-some-more-from-320-to-349.patch | 609 ++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../libtiff/tiff/CVE-2022-2953.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 87 +++<br>
&gt;&gt;=C2=A0 meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0=
.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a> |=C2=A0 =C2=A02=
 +<br>
&gt;&gt;=C2=A0 3 files changed, 698 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001=
-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-=
2022-2953.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fi=
x-issue-330-and-some-more-from-320-to-349.patch b/meta/recipes-multimedia/l=
ibtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch=
<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..07acf5eb90<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue=
-330-and-some-more-from-320-to-349.patch<br>
&gt;&gt; @@ -0,0 +1,609 @@<br>
&gt;&gt; +From e319508023580e2f70e6e626f745b5b2a1707313 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Su Laus &lt;<a href=3D"mailto:sulau@freenet.de" target=3D"_=
blank">sulau@freenet.de</a>&gt;<br>
&gt;&gt; +Date: Tue, 10 May 2022 20:03:17 +0000<br>
&gt;&gt; +Subject: [PATCH] tiffcrop: Fix issue #330 and some more from 320 =
to 349<br>
&gt;&gt; +Upstream-Status: Backport<br>
&gt;&gt; +Signed-off-by: Zheng Qiu &lt;<a href=3D"mailto:zheng.qiu@windrive=
r.com" target=3D"_blank">zheng.qiu@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + tools/tiffcrop.c | 282 +++++++++++++++++++++++++++++++++++------=
------<br>
&gt;&gt; + 1 file changed, 210 insertions(+), 72 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c<br>
&gt;&gt; +index 77cf6ed1..791ec5e7 100644<br>
&gt;&gt; +--- a/tools/tiffcrop.c<br>
&gt;&gt; ++++ b/tools/tiffcrop.c<br>
&gt;&gt; +@@ -63,20 +63,24 @@<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
nits when sectioning image into columns x rows<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
sing the -S cols:rows option.<br>
&gt;&gt; +=C2=A0 * -X #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Horizontal =
dimension of region to extract expressed in current<br>
&gt;&gt; +- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 units<=
br>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 units,=
 relative to the specified origin reference &#39;edge&#39; left (default fo=
r X) or right.<br>
&gt;&gt; +=C2=A0 * -Y #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vertical di=
mension of region to extract expressed in current<br>
&gt;&gt; +- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 units<=
br>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 units,=
 relative to the specified origin reference &#39;edge&#39; top (default for=
 Y) or bottom.<br>
&gt;&gt; +=C2=A0 * -O orient=C2=A0 =C2=A0 =C2=A0 Orientation for output ima=
ge, portrait, landscape, auto<br>
&gt;&gt; +=C2=A0 * -P page=C2=A0 =C2=A0 =C2=A0 =C2=A0 Page size for output =
image segments, eg letter, legal, tabloid,<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
tc.<br>
&gt;&gt; +=C2=A0 * -S cols:rows=C2=A0 =C2=A0Divide the image into equal siz=
ed segments using cols across<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
nd rows down<br>
&gt;&gt; +- * -E t|l|r|b=C2=A0 =C2=A0 =C2=A0Edge to use as origin<br>
&gt;&gt; ++ * -E t|l|r|b=C2=A0 =C2=A0 =C2=A0Edge to use as origin (i.e. &#3=
9;side&#39; of the image not &#39;corner&#39;)<br>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 top=C2=A0 =C2=A0 =3D width from left, zones from top to bottom (default)<b=
r>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bottom =3D width from left, zones from bottom to top<br>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 left=C2=A0 =C2=A0=3D zones from left to right, length from top<br>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 right=C2=A0 =3D zones from right to left, length from top<br>
&gt;&gt; +=C2=A0 * -m #,#,#,#=C2=A0 =C2=A0 =C2=A0Margins from edges for sel=
ection: top, left, bottom, right<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
commas separated)<br>
&gt;&gt; +=C2=A0 * -Z #:#,#:#=C2=A0 =C2=A0 =C2=A0Zones of the image designa=
ted as zone X of Y,<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
g 1:3 would be first of three equal portions measured<br>
&gt;&gt; +- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from r=
eference edge<br>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from r=
eference edge (i.e. &#39;side&#39; not corner)<br>
&gt;&gt; +=C2=A0 * -N odd|even|#,#-#,#|last<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
elect sequences and/or ranges of images within file<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
o process. The words odd or even may be used to specify<br>
&gt;&gt; +@@ -103,10 +107,13 @@<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
elects which functions dump data, with higher numbers selecting<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l=
ower level, scanline level routines. Debug reports a limited set<br>
&gt;&gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o=
f messages to monitor progress without enabling dump logs.<br>
&gt;&gt; ++ *<br>
&gt;&gt; ++ * Note:=C2=A0 =C2=A0 The (-X|-Y), -Z and -z options are mutuall=
y exclusive.<br>
&gt;&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In no case should the optio=
ns be applied to a given selection successively.<br>
&gt;&gt; +=C2=A0 */<br>
&gt;&gt; +<br>
&gt;&gt; +-static=C2=A0 =C2=A0char tiffcrop_version_id[] =3D &quot;2.4.1&qu=
ot;;<br>
&gt;&gt; +-static=C2=A0 =C2=A0char tiffcrop_rev_date[] =3D &quot;03-03-2010=
&quot;;<br>
&gt;&gt; ++static=C2=A0 =C2=A0char tiffcrop_version_id[] =3D &quot;2.5&quot=
;;<br>
&gt;&gt; ++static=C2=A0 =C2=A0char tiffcrop_rev_date[] =3D &quot;02-09-2022=
&quot;;<br>
&gt;&gt; +<br>
&gt;&gt; + #include &quot;tif_config.h&quot;<br>
&gt;&gt; + #include &quot;libport.h&quot;<br>
&gt;&gt; +@@ -774,6 +781,9 @@ static const char usage_info[] =3D<br>
&gt;&gt; + &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The four d=
ebug/dump options are independent, though it makes little sense to\n&quot;<=
br>
&gt;&gt; + &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specify a =
dump file without specifying a detail level.\n&quot;<br>
&gt;&gt; + &quot;\n&quot;<br>
&gt;&gt; ++&quot;Note:=C2=A0 =C2=A0 =C2=A0 =C2=A0 The (-X|-Y), -Z and -z op=
tions are mutually exclusive.\n&quot;<br>
&gt;&gt; ++&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In no case=
 should the options be applied to a given selection successively.\n&quot;<b=
r>
&gt;&gt; ++&quot;\n&quot;<br>
&gt;&gt; + ;<br>
&gt;&gt; +<br>
&gt;&gt; + /* This function could be modified to pass starting sample offse=
t<br>
&gt;&gt; +@@ -2121,6 +2131,15 @@ void=C2=A0 process_command_opts (int argc,=
 char *argv[], char *mp, char *mode, uint32<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*NOTREACH=
ED*/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 /*-- Check for not allowed combinations (e.g. -X, =
-Y and -Z and -z are mutually exclusive) --*/<br>
&gt;&gt; ++=C2=A0 =C2=A0 char XY, Z, R;<br>
&gt;&gt; ++=C2=A0 =C2=A0 XY =3D ((crop_data-&gt;crop_mode &amp; CROP_WIDTH)=
 || (crop_data-&gt;crop_mode &amp; CROP_LENGTH));<br>
&gt;&gt; ++=C2=A0 =C2=A0 Z =3D (crop_data-&gt;crop_mode &amp; CROP_ZONES);<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 R =3D (crop_data-&gt;crop_mode &amp; CROP_REGIONS)=
;<br>
&gt;&gt; ++=C2=A0 =C2=A0 if ((XY &amp;&amp; Z) || (XY &amp;&amp; R) || (Z &=
amp;&amp; R)) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;tiffcrop input error=
&quot;, &quot;The crop options(-X|-Y), -Z and -z are mutually exclusive.-&g=
t;Exit&quot;);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0}=C2=A0 /* end process_command_opts */<br>
&gt;&gt; +<br>
&gt;&gt; + /* Start a new output file if one has not been previously opened=
 or<br>
&gt;&gt; +@@ -2746,7 +2765,7 @@ extractContigSamplesBytes (uint8_t *in, uin=
t8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsample_t count, uint32_t start, uint32_=
t end)<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int i, bytes_per_sample, sindex;<br>
&gt;&gt; +-=C2=A0 uint32_t col, dst_rowsize, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, dst_rowsize, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t src_byte /*, src_bit */;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t *src =3D in;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t *dst =3D out;<br>
&gt;&gt; +@@ -2757,6 +2776,10 @@ extractContigSamplesBytes (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamplesBytes&qu=
ot;,<br>
&gt;&gt; +@@ -2769,6 +2792,9 @@ extractContigSamplesBytes (uint8_t *in, uin=
t8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0dst_rowsize =3D (bps * (end - start) * count) / 8;<b=
r>
&gt;&gt; +<br>
&gt;&gt; +@@ -2812,7 +2838,7 @@ extractContigSamples8bits (uint8_t *in, uin=
t8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsample_t count, uint32_t start, uint32_=
t end)<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 buff1 =3D 0, buff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t *src =3D in;<br>
&gt;&gt; +@@ -2824,6 +2850,10 @@ extractContigSamples8bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamples8bits&qu=
ot;,<br>
&gt;&gt; +@@ -2836,7 +2866,10 @@ extractContigSamples8bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +-<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0maskbits =3D=C2=A0 (uint8_t)-1 &gt;&gt; (8 - bps);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0buff1 =3D buff2 =3D 0;<br>
&gt;&gt; +@@ -2889,7 +2922,7 @@ extractContigSamples16bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsample_t count, uint32_t start, u=
int32_t end)<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint16_t maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint16_t buff1 =3D 0, buff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 bytebuff =3D 0;<br>
&gt;&gt; +@@ -2902,6 +2935,10 @@ extractContigSamples16bits (uint8_t *in, u=
int8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamples16bits&q=
uot;,<br>
&gt;&gt; +@@ -2914,6 +2951,9 @@ extractContigSamples16bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0maskbits =3D (uint16_t)-1 &gt;&gt; (16 - bps);<br>
&gt;&gt; +@@ -2978,7 +3018,7 @@ extractContigSamples24bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsample_t count, uint32_t start, u=
int32_t end)<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t buff1 =3D 0, buff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 bytebuff1 =3D 0, bytebuff2 =3D 0;<br>
&gt;&gt; +@@ -2991,6 +3031,10 @@ extractContigSamples24bits (uint8_t *in, u=
int8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamples24bits&q=
uot;,<br>
&gt;&gt; +@@ -3003,6 +3047,9 @@ extractContigSamples24bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0maskbits =3D=C2=A0 (uint32_t)-1 &gt;&gt; (32 - bps);=
<br>
&gt;&gt; +@@ -3087,7 +3134,7 @@ extractContigSamples32bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsample_t count, uint32_t start, u=
int32_t end)<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0 /*, =
shift_width =3D 0 */;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t longbuff1 =3D 0, longbuff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint64_t maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint64_t buff1 =3D 0, buff2 =3D 0, buff3 =3D 0;<br>
&gt;&gt; +@@ -3102,6 +3149,10 @@ extractContigSamples32bits (uint8_t *in, u=
int8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamples32bits&q=
uot;,<br>
&gt;&gt; +@@ -3114,6 +3165,9 @@ extractContigSamples32bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0/* shift_width =3D ((bps + 7) / 8) + 1; */<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D 0;<br>
&gt;&gt; +@@ -3193,7 +3247,7 @@ extractContigSamplesShifted8bits (uint8_t *=
in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int shift)<br=
>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 buff1 =3D 0, buff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t *src =3D in;<br>
&gt;&gt; +@@ -3205,6 +3259,10 @@ extractContigSamplesShifted8bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamplesShifted8=
bits&quot;,<br>
&gt;&gt; +@@ -3217,6 +3275,9 @@ extractContigSamplesShifted8bits (uint8_t *=
in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D shift;<br>
&gt;&gt; +=C2=A0 =C2=A0maskbits =3D=C2=A0 (uint8_t)-1 &gt;&gt; (8 - bps);<b=
r>
&gt;&gt; +@@ -3273,7 +3334,7 @@ extractContigSamplesShifted16bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int shift)<b=
r>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint16_t maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint16_t buff1 =3D 0, buff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 bytebuff =3D 0;<br>
&gt;&gt; +@@ -3286,6 +3347,10 @@ extractContigSamplesShifted16bits (uint8_t=
 *in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamplesShifted1=
6bits&quot;,<br>
&gt;&gt; +@@ -3298,6 +3363,9 @@ extractContigSamplesShifted16bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D shift;<br>
&gt;&gt; +=C2=A0 =C2=A0maskbits =3D (uint16_t)-1 &gt;&gt; (16 - bps);<br>
&gt;&gt; +@@ -3363,7 +3431,7 @@ extractContigSamplesShifted24bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int shift)<b=
r>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t buff1 =3D 0, buff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint8_t=C2=A0 bytebuff1 =3D 0, bytebuff2 =3D 0;<br>
&gt;&gt; +@@ -3376,6 +3444,16 @@ extractContigSamplesShifted24bits (uint8_t=
 *in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 /*--- Remark, which is true for all those functions extra=
ctCongigSamplesXXX() --<br>
&gt;&gt; ++=C2=A0 *=C2=A0 The mitigation of the start/end test does not all=
ways make sense, because the function is often called with e.g.:<br>
&gt;&gt; ++=C2=A0 *=C2=A0 start =3D 31; end =3D 32; cols =3D 32=C2=A0 to ex=
tract the last column in a 32x32 sample image.<br>
&gt;&gt; ++=C2=A0 *=C2=A0 If then, a worng parameter (e.g. cols =3D 10) is =
provided, the mitigated settings would be start=3D0; end=3D1.<br>
&gt;&gt; ++=C2=A0 *=C2=A0 Therefore, an error message and no copy action mi=
ght be the better reaction to wrong parameter configurations.<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamplesShifted2=
4bits&quot;,<br>
&gt;&gt; +@@ -3388,6 +3466,9 @@ extractContigSamplesShifted24bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D shift;<br>
&gt;&gt; +=C2=A0 =C2=A0maskbits =3D=C2=A0 (uint32_t)-1 &gt;&gt; (32 - bps);=
<br>
&gt;&gt; +@@ -3449,7 +3530,7 @@ extractContigSamplesShifted24bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0buff2 =3D (buff2 &lt;&lt; 8);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0bytebuff2 =3D bytebuff1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0ready_bits -=3D 8;<br>
&gt;&gt; +-=C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0return (0);<br>
&gt;&gt; +=C2=A0 =C2=A0} /* end extractContigSamplesShifted24bits */<br>
&gt;&gt; +@@ -3461,7 +3542,7 @@ extractContigSamplesShifted32bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int shift)<b=
r>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 ready_bits =3D 0, sindex =3D 0 /*, =
shift_width =3D 0 */;<br>
&gt;&gt; +-=C2=A0 uint32_t col, src_byte, src_bit, bit_offset;<br>
&gt;&gt; ++=C2=A0 uint32_t col, src_byte, src_bit, bit_offset, numcols;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t longbuff1 =3D 0, longbuff2 =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint64_t maskbits =3D 0, matchbits =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint64_t buff1 =3D 0, buff2 =3D 0, buff3 =3D 0;<br>
&gt;&gt; +@@ -3476,6 +3557,10 @@ extractContigSamplesShifted32bits (uint8_t=
 *in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 /* Number of extracted columns shall be kept as (end-star=
t + 1). Otherwise buffer-overflow might occur.<br>
&gt;&gt; ++=C2=A0 =C2=A0* &#39;start&#39; and &#39;col&#39; count from 0 to=
 (cols-1)=C2=A0 but &#39;end&#39; is to be set one after the index of the l=
ast column to be copied!<br>
&gt;&gt; ++=C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 numcols =3D abs(end - start);<br>
&gt;&gt; +=C2=A0 =C2=A0if ((start &gt; end) || (start &gt; cols))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0TIFFError (&quot;extractContigSamplesShifted3=
2bits&quot;,<br>
&gt;&gt; +@@ -3488,6 +3573,9 @@ extractContigSamplesShifted32bits (uint8_t =
*in, uint8_t *out, uint32_t cols,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Inv=
alid end column value %&quot;PRIu32&quot; ignored&quot;, end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0end =3D cols;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 if (abs(end - start) &gt; numcols) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 end =3D start + numcols;<br>
&gt;&gt; ++=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0/* shift_width =3D ((bps + 7) / 8) + 1; */<br>
&gt;&gt; +=C2=A0 =C2=A0ready_bits =3D shift;<br>
&gt;&gt; +@@ -5429,7 +5517,7 @@ getCropOffsets(struct image_data *image, st=
ruct crop_mask *crop, struct dump_opt<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0struct offset offsets;<br>
&gt;&gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 i;<br>
&gt;&gt; +-=C2=A0 int32_t=C2=A0 test;<br>
&gt;&gt; ++=C2=A0 uint32_t uaux;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t seg, total, need_buff =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t buffsize;<br>
&gt;&gt; +=C2=A0 =C2=A0uint32_t zwidth, zlength;<br>
&gt;&gt; +@@ -5510,8 +5598,13 @@ getCropOffsets(struct image_data *image, s=
truct crop_mask *crop, struct dump_opt<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0seg =3D crop-&gt;zonelist[j].position;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0total =3D crop-&gt;zonelist[j].total;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 /* check for not allowed zone cases like 0:0; 4:3;=
 etc. and skip that input */<br>
&gt;&gt; ++=C2=A0 =C2=A0 /* check for not allowed zone cases like 0:0; 4:3;=
 or negative ones etc. and skip that input */<br>
&gt;&gt; ++=C2=A0 =C2=A0 if (crop-&gt;zonelist[j].position &lt; 0 || crop-&=
gt;zonelist[j].total &lt; 0) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;getCropOffsets&quot;=
, &quot;Negative crop zone values %d:%d are not allowed, thus skipped.&quot=
;, crop-&gt;zonelist[j].position, crop-&gt;zonelist[j].total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (seg =3D=3D 0 || total =3D=3D 0 || seg &gt=
; total) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;getCropOffsets&quot;=
, &quot;Crop zone %d:%d is out of specification, thus skipped.&quot;, seg, =
total);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -5524,17 +5617,23 @@ getCropOffsets(struct image_data *image, =
struct crop_mask *crop, struct dump_opt<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;regionlist[i].=
x1 =3D offsets.startx +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint32_t)(of=
fsets.crop_width * 1.0 * (seg - 1) / total);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test =3D (int32_t)offse=
ts.startx +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
int32_t)(offsets.crop_width * 1.0 * seg / total);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test &lt; 1 )<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionl=
ist[i].x2 =3D 0;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test &gt; (int32_t)=
(image-&gt;width - 1))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FAULT: IMHO in the o=
ld code here, the calculation of x2 was based on wrong assumtions. The whol=
e image was assumed and &#39;endy&#39; and &#39;starty&#39; are not respect=
ed anymore!*/<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* NEW PROPOSED Code: A=
ssumption: offsets are within image with top left corner as origin (0,0) an=
d &#39;start&#39; &lt;=3D &#39;end&#39;. */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;regionlist=
[i].x1 &gt; offsets.endx) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt=
;regionlist[i].x1 =3D offsets.endx;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (crop-&gt;reg=
ionlist[i].x1 &gt;=3D image-&gt;width) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].x1 =3D image-&gt;width - 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].=
x2 =3D offsets.startx + (uint32_t)(offsets.crop_width * 1.0 * seg / total);=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;regionlist=
[i].x2 &gt; 0) crop-&gt;regionlist[i].x2 =3D crop-&gt;regionlist[i].x2 - 1;=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;regionlist=
[i].x2 &lt; crop-&gt;regionlist[i].x1) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].x2 =3D crop-&gt;regionlist[i].x1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (crop-&gt;reg=
ionlist[i].x2 &gt; offsets.endx) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].x2 =3D offsets.endx;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (crop-&gt;reg=
ionlist[i].x2 &gt;=3D image-&gt;width) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;=
regionlist[i].x2 =3D image-&gt;width - 1;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionl=
ist[i].x2 =3D test - 1;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zwidth =3D crop-&gt;reg=
ionlist[i].x2 - crop-&gt;regionlist[i].x1=C2=A0 + 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This is passed to extractCr=
opZone or extractCompositeZones */<br>
&gt;&gt; +@@ -5549,22 +5648,27 @@ getCropOffsets(struct image_data *image, =
struct crop_mask *crop, struct dump_opt<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;regionlist[i].x1 =3D =
offsets.startx;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;regionlist[i].=
x2 =3D offsets.endx;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test =3D offsets.endy -=
 (uint32_t)(offsets.crop_length * 1.0 * seg / total);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test &lt; 1 )<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].=
y1 =3D 0;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].=
y1 =3D test + 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FAULT: IMHO in the o=
ld code here, the calculation of y1/y2 was based on wrong assumtions. The w=
hole image was assumed and &#39;endy&#39; and &#39;starty&#39; are not resp=
ected anymore!*/<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* NEW PROPOSED Code: A=
ssumption: offsets are within image with top left corner as origin (0,0) an=
d &#39;start&#39; &lt;=3D &#39;end&#39;. */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uaux =3D (uint32_t)(off=
sets.crop_length * 1.0 * seg / total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (uaux &lt;=3D offset=
s.endy + 1) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y1 =3D offsets.endy - uaux + 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y1 =3D 0;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;regionlist=
[i].y1 &lt; offsets.starty) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y1 =3D offsets.starty;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test =3D offsets.endy -=
 (offsets.crop_length * 1.0 * (seg - 1) / total);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test &lt; 1 )<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionl=
ist[i].y2 =3D 0;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test &gt; (i=
nt32_t)(image-&gt;length - 1))<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y2 =3D image-&gt;length - 1;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y2 =3D test;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uaux =3D (uint32_t)(off=
sets.crop_length * 1.0 * (seg - 1) / total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (uaux &lt;=3D offset=
s.endy) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y2 =3D offsets.endy - uaux;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y2 =3D 0;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;regionlist=
[i].y2 &lt; offsets.starty) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y2 =3D offsets.starty;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zlength =3D crop-&gt;re=
gionlist[i].y2 - crop-&gt;regionlist[i].y1 + 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This is passed to extractCr=
opZone or extractCompositeZones */<br>
&gt;&gt; +@@ -5575,32 +5679,42 @@ getCropOffsets(struct image_data *image, =
struct crop_mask *crop, struct dump_opt<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;combined_width=
 =3D (uint32_t)zwidth;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case EDGE_RIGHT: /* zones from right t=
o left, length from top */<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zlength =3D offsets.cro=
p_length;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].y1 =3D =
offsets.starty;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].=
y2 =3D offsets.endy;<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].=
x1 =3D offsets.startx +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint32_t)(offsets.=
crop_width * (total - seg) * 1.0 / total);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test =3D offsets.startx=
 +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (offsets=
.crop_width * (total - seg + 1) * 1.0 / total);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test &lt; 1 )<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionl=
ist[i].x2 =3D 0;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test &gt; (int32_t)=
(image-&gt;width - 1))<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].x2 =3D image-&gt;width - 1;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].x2 =3D test - 1;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zwidth =3D crop-&gt;reg=
ionlist[i].x2 - crop-&gt;regionlist[i].x1=C2=A0 + 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zlength =
=3D offsets.crop_length;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt=
;regionlist[i].y1 =3D offsets.starty;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt=
;regionlist[i].y2 =3D offsets.endy;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt=
;regionlist[i].x1 =3D offsets.startx +<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (uint32_t)(offsets.crop_width * (total - seg) * 1.0 / =
total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FAULT: IMHO from here on, =
the calculation of y2 are based on wrong assumtions. The whole image is ass=
umed and &#39;endy&#39; and &#39;starty&#39; are not respected anymore!*/<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* NEW PROPOSED Code: Assumpt=
ion: offsets are within image with top left corner as origin (0,0) and &#39=
;start&#39; &lt;=3D &#39;end&#39;. */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uaux =3D (uint32_t)(offsets.c=
rop_width * 1.0 * seg / total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uaux &lt;=3D offsets.endx=
 + 1) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;region=
list[i].x1 =3D offsets.endx - uaux + 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;region=
list[i].x1 =3D 0;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (crop-&gt;regionlist[i].x1=
 &lt; offsets.startx) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;region=
list[i].x1 =3D offsets.startx;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is passed to extractCr=
opZone or extractCompositeZones */<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;combined_lengt=
h =3D (uint32_t)zlength;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;exp_mode =
=3D=3D COMPOSITE_IMAGES)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;combine=
d_width +=3D (uint32_t)zwidth;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;combine=
d_width =3D (uint32_t)zwidth;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uaux =3D (uint32_t)(offsets.c=
rop_width * 1.0 * (seg - 1) / total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uaux &lt;=3D offsets.endx=
) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;region=
list[i].x2 =3D offsets.endx - uaux;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;region=
list[i].x2 =3D 0;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (crop-&gt;regionlist[i].x2=
 &lt; offsets.startx) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;region=
list[i].x2 =3D offsets.startx;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zwidth =3D crop-&gt;regionlis=
t[i].x2 - crop-&gt;regionlist[i].x1 + 1;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This =
is passed to extractCropZone or extractCompositeZones */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt=
;combined_length =3D (uint32_t)zlength;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (crop=
-&gt;exp_mode =3D=3D COMPOSITE_IMAGES)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 crop-&gt;combined_width +=3D (uint32_t)zwidth;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 crop-&gt;combined_width =3D (uint32_t)zwidth;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case EDGE_TOP: /* width from left, zon=
es from top to bottom */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zwidth =3D offsets.crop=
_width;<br>
&gt;&gt; +@@ -5608,6 +5722,14 @@ getCropOffsets(struct image_data *image, s=
truct crop_mask *crop, struct dump_opt<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;regionlist[i].=
x2 =3D offsets.endx;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;regionlist[i].=
y1 =3D offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) / =
total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;regionlist=
[i].y1 &gt; offsets.endy) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y1 =3D offsets.endy;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (crop-&gt;reg=
ionlist[i].y1 &gt;=3D image-&gt;length) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;=
regionlist[i].y1 =3D image-&gt;length - 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FAULT: IMHO from her=
e on, the calculation of y2 are based on wrong assumtions. The whole image =
is assumed and &#39;endy&#39; and &#39;starty&#39; are not respected anymor=
e!*/<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* OLD Code:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test =3D offsets.starty=
 + (uint32_t)(offsets.crop_length * 1.0 * seg / total);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (test &lt; 1 )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;regionl=
ist[i].y2 =3D 0;<br>
&gt;&gt; +@@ -5618,6 +5740,18 @@ getCropOffsets(struct image_data *image, s=
truct crop_mask *crop, struct dump_opt<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;regionl=
ist[i].y2 =3D test - 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 NEW PROPOSED Code: Assumption: offsets are within image with top left corn=
er as origin (0,0) and &#39;start&#39; &lt;=3D &#39;end&#39;. */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cr=
op-&gt;regionlist[i].y2 =3D offsets.starty + (uint32_t)(offsets.crop_length=
 * 1.0 * seg / total);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;regionlist=
[i].y2 &gt; 0)crop-&gt;regionlist[i].y2 =3D crop-&gt;regionlist[i].y2 - 1;<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (crop-&gt;regionlist[i].y2 &lt; crop-&gt;regionlist[i].y1) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].y2 =3D crop-&gt;regionlis=
t[i].y1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} =
else if (crop-&gt;regionlist[i].y2 &gt; offsets.endy) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].y2 =3D offsets.endy;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} =
else if (crop-&gt;regionlist[i].y2 &gt;=3D image-&gt;length) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;regionlist[i].y2 =3D image-&gt;length -=
 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zlength =3D crop-&gt;re=
gionlist[i].y2 - crop-&gt;regionlist[i].y1 + 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This is passed to extractCr=
opZone or extractCompositeZones */<br>
&gt;&gt; +@@ -7551,7 +7685,8 @@ processCropSelections(struct image_data *im=
age, struct crop_mask *crop,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0total_width =3D total_length =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; crop-&gt;selections; i++=
)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 cropsize =3D crop-&gt;bufftotal;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cropsize =3D crop-&gt;bufftotal;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0crop_buff =3D seg_buffs[i].buffer;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!crop_buff)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop_buff =3D (unsigned char *)=
limitMalloc(cropsize);<br>
&gt;&gt; +@@ -7640,6 +7775,9 @@ processCropSelections(struct image_data *im=
age, struct crop_mask *crop,<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (crop-&gt;crop_mode &amp; CROP_ROTA=
TE) /* rotate should be last as it can reallocate the buffer */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* rotateImage() changes imag=
e-&gt;width, -&gt;length, -&gt;xres and -&gt;yres, what it schouldn&#39;t d=
o here, when more than one section is processed.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ToDo: Therefore rotat=
eImage() and its usage has to be reworked (e.g. like mirrorImage()) !!<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rotateImage(crop-&gt;rotation, ima=
ge, &amp;crop-&gt;regionlist[i].width,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;crop-&gt;regionlist[i].length, &amp;crop_buff))<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +@@ -7655,8 +7793,8 @@ processCropSelections(struct image_data *im=
age, struct crop_mask *crop,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seg_buffs[i].size =3D (((crop-&=
gt;regionlist[i].width * image-&gt;bps + 7 ) / 8)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * image-&gt;spp) * crop-&g=
t;regionlist[i].length;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +-=C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }=C2=A0 /* for crop-&gt;selections loop */<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 /* Separated Images (else case) */<br>
&gt;&gt; +=C2=A0 =C2=A0return (0);<br>
&gt;&gt; +=C2=A0 =C2=A0} /* end processCropSelections */<br>
&gt;&gt; +<br>
&gt;&gt; +--<br>
&gt;&gt; +2.33.0<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.pa=
tch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..3a3a915688<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch<br>
&gt;&gt; @@ -0,0 +1,87 @@<br>
&gt;&gt; +CVE: CVE-2022-2953<br>
&gt;&gt; +Upstream-Status: Backport<br>
&gt;&gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.=
com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;&gt; +Signed-off-by: Zheng Qiu &lt;<a href=3D"mailto:zheng.qiu@windrive=
r.com" target=3D"_blank">zheng.qiu@windriver.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Su_Laus &lt;<a href=3D"mailto:sulau@freenet.de" target=3D"_=
blank">sulau@freenet.de</a>&gt;<br>
&gt;&gt; +Date: Mon, 15 Aug 2022 22:11:03 +0200<br>
&gt;&gt; +Subject: [PATCH] =3D?UTF-8?q?According=3D20to=3D20Richard=3D20Nol=
de=3D20<a href=3D"https://gitl?=3D" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitl?=3D</a><br>
&gt;&gt; + =3D?UTF-8?q?<a href=3D"http://ab.com/libtiff/libtiff/-/issues/40=
1#note=3D5F877637400=3D20the=3D20ti?=3D" rel=3D"noreferrer" target=3D"_blan=
k">ab.com/libtiff/libtiff/-/issues/401#note=3D5F877637400=3D20the=3D20ti?=
=3D</a><br>
&gt;&gt; + =3D?UTF-8?q?ffcrop=3D20option=3D20=3DE2=3D80=3D9E-S=3DE2=3D80=3D=
9C=3D20is=3D20also=3D20mutually?=3D<br>
&gt;&gt; + =3D?UTF-8?q?=3D20exclusive=3D20to=3D20the=3D20other=3D20crop=3D2=
0options=3D20(-X|-Y),=3D20-?=3D<br>
&gt;&gt; + =3D?UTF-8?q?Z=3D20and=3D20-z.?=3D<br>
&gt;&gt; +MIME-Version: 1.0<br>
&gt;&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt;&gt; +Content-Transfer-Encoding: 8bit<br>
&gt;&gt; +<br>
&gt;&gt; +This is now checked and ends tiffcrop if those arguments are not =
mutually exclusive.<br>
&gt;&gt; +<br>
&gt;&gt; +This MR will fix the following tiffcrop issues: #349, #414, #422,=
 #423, #424<br>
&gt;&gt; +---<br>
&gt;&gt; + tools/tiffcrop.c | 31 ++++++++++++++++---------------<br>
&gt;&gt; + 1 file changed, 16 insertions(+), 15 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c<br>
&gt;&gt; +index 90286a5e..c3b758ec 100644<br>
&gt;&gt; +--- a/tools/tiffcrop.c<br>
&gt;&gt; ++++ b/tools/tiffcrop.c<br>
&gt;&gt; +@@ -173,12 +173,12 @@ static=C2=A0 =C2=A0char tiffcrop_rev_date[]=
 =3D &quot;02-09-2022&quot;;<br>
&gt;&gt; + #define ROTATECW_270 32<br>
&gt;&gt; + #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)<b=
r>
&gt;&gt; +<br>
&gt;&gt; +-#define CROP_NONE=C2=A0 =C2=A0 =C2=A00<br>
&gt;&gt; +-#define CROP_MARGINS=C2=A0 1<br>
&gt;&gt; +-#define CROP_WIDTH=C2=A0 =C2=A0 2<br>
&gt;&gt; +-#define CROP_LENGTH=C2=A0 =C2=A04<br>
&gt;&gt; +-#define CROP_ZONES=C2=A0 =C2=A0 8<br>
&gt;&gt; +-#define CROP_REGIONS 16<br>
&gt;&gt; ++#define CROP_NONE=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0/* &qu=
ot;-S&quot; -&gt; Page_MODE_ROWSCOLS and page-&gt;rows/-&gt;cols !=3D 0 */<=
br>
&gt;&gt; ++#define CROP_MARGINS=C2=A0 1=C2=A0 =C2=A0 =C2=A0/* &quot;-m&quot=
; */<br>
&gt;&gt; ++#define CROP_WIDTH=C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0/* &quot;-X=
&quot; */<br>
&gt;&gt; ++#define CROP_LENGTH=C2=A0 =C2=A04=C2=A0 =C2=A0 =C2=A0/* &quot;-Y=
&quot; */<br>
&gt;&gt; ++#define CROP_ZONES=C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=A0/* &quot;-Z=
&quot; */<br>
&gt;&gt; ++#define CROP_REGIONS 16=C2=A0 =C2=A0 =C2=A0/* &quot;-z&quot; */<=
br>
&gt;&gt; + #define CROP_ROTATE=C2=A0 32<br>
&gt;&gt; + #define CROP_MIRROR=C2=A0 64<br>
&gt;&gt; + #define CROP_INVERT 128<br>
&gt;&gt; +@@ -316,7 +316,7 @@ struct crop_mask {<br>
&gt;&gt; + #define PAGE_MODE_RESOLUTION=C2=A0 =C2=A01<br>
&gt;&gt; + #define PAGE_MODE_PAPERSIZE=C2=A0 =C2=A0 2<br>
&gt;&gt; + #define PAGE_MODE_MARGINS=C2=A0 =C2=A0 =C2=A0 4<br>
&gt;&gt; +-#define PAGE_MODE_ROWSCOLS=C2=A0 =C2=A0 =C2=A08<br>
&gt;&gt; ++#define PAGE_MODE_ROWSCOLS=C2=A0 =C2=A0 =C2=A08=C2=A0 =C2=A0 /* =
for -S option */<br>
&gt;&gt; +<br>
&gt;&gt; + #define INVERT_DATA_ONLY=C2=A0 =C2=A0 =C2=A0 10<br>
&gt;&gt; + #define INVERT_DATA_AND_TAG=C2=A0 =C2=A011<br>
&gt;&gt; +@@ -781,7 +781,7 @@ static const char usage_info[] =3D<br>
&gt;&gt; + &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The four d=
ebug/dump options are independent, though it makes little sense to\n&quot;<=
br>
&gt;&gt; + &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specify a =
dump file without specifying a detail level.\n&quot;<br>
&gt;&gt; + &quot;\n&quot;<br>
&gt;&gt; +-&quot;Note:=C2=A0 =C2=A0 =C2=A0 =C2=A0 The (-X|-Y), -Z and -z op=
tions are mutually exclusive.\n&quot;<br>
&gt;&gt; ++&quot;Note:=C2=A0 =C2=A0 =C2=A0 =C2=A0 The (-X|-Y), -Z, -z and -=
S options are mutually exclusive.\n&quot;<br>
&gt;&gt; + &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In no case=
 should the options be applied to a given selection successively.\n&quot;<b=
r>
&gt;&gt; + &quot;\n&quot;<br>
&gt;&gt; + ;<br>
&gt;&gt; +@@ -2131,13 +2131,14 @@ void=C2=A0 process_command_opts (int argc=
, char *argv[], char *mp, char *mode, uint32<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*NOTREACH=
ED*/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +-=C2=A0 =C2=A0 /*-- Check for not allowed combinations (e.g. -X, =
-Y and -Z and -z are mutually exclusive) --*/<br>
&gt;&gt; +-=C2=A0 =C2=A0 char XY, Z, R;<br>
&gt;&gt; ++=C2=A0 =C2=A0 /*-- Check for not allowed combinations (e.g. -X, =
-Y and -Z, -z and -S are mutually exclusive) --*/<br>
&gt;&gt; ++=C2=A0 =C2=A0 char XY, Z, R, S;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0XY =3D ((crop_data-&gt;crop_mode &amp; CROP_W=
IDTH) || (crop_data-&gt;crop_mode &amp; CROP_LENGTH));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0Z =3D (crop_data-&gt;crop_mode &amp; CROP_ZON=
ES);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0R =3D (crop_data-&gt;crop_mode &amp; CROP_REG=
IONS);<br>
&gt;&gt; +-=C2=A0 =C2=A0 if ((XY &amp;&amp; Z) || (XY &amp;&amp; R) || (Z &=
amp;&amp; R)) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;tiffcrop input error=
&quot;, &quot;The crop options(-X|-Y), -Z and -z are mutually exclusive.-&g=
t;Exit&quot;);<br>
&gt;&gt; ++=C2=A0 =C2=A0 S =3D (page-&gt;mode &amp; PAGE_MODE_ROWSCOLS);<br=
>
&gt;&gt; ++=C2=A0 =C2=A0 if ((XY &amp;&amp; Z) || (XY &amp;&amp; R) || (XY =
&amp;&amp; S) || (Z &amp;&amp; R) || (Z &amp;&amp; S) || (R &amp;&amp; S)) =
{<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;tiffcrop input error=
&quot;, &quot;The crop options(-X|-Y), -Z, -z and -S are mutually exclusive=
.-&gt;Exit&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0}=C2=A0 /* end process_command_opts */<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/libtiff/<a href=3D"http://tif=
f_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a> b/meta/r=
ecipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0.bb" rel=3D"noreferre=
r" target=3D"_blank">tiff_4.3.0.bb</a><br>
&gt;&gt; index f84057c46b..29a2c38d8e 100644<br>
&gt;&gt; --- a/meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0=
.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0=
.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a><br>
&gt;&gt; @@ -25,6 +25,8 @@ SRC_URI =3D &quot;<a href=3D"http://download.osg=
eo.org/libtiff/tiff-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-286=
9.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-286=
7.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://b258ed69a485=
a9cfb299d9f060eb2a46c54e5903.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tiffcrop-Fix=
-issue-330-and-some-more-from-320-to-349.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-2953.pat=
ch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;0e46e5acb087ce7d1ac53cf4f56a09b=
221537fc86dfc5daaad1c2e89e1b37ac8&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#172667): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/172667" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/172667</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9479=
9048/7032091" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/94799048/7032091</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:skulkarni@mvista.=
com" target=3D"_blank">skulkarni@mvista.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--00000000000040ff1b05ed071a3d--

