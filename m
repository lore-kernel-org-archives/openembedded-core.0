Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.9906.1588262014941740721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 08:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qXhJasGr;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id b11so7561895wrs.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=pFQgMOPOZ0cf4pYbyDTduAVBuGs1/5wVywuS5maBZ/M=;
        b=qXhJasGrS+Qc6qyJy70g+9YDZFr7kiXvvUpsQwvt45D5w2LSCi7/Wp/5UOyT1mfHM2
         N722PqzwCiO4aRFW9qY+WVgNvvFoaSOUMTowuzlXTskQET+juf7B2fc0EFi2WdYW5UEo
         Wg0h5+bn1XJaFfOgULX38imqRyimwhqFhQ8HsJgTrX7b/L4K7z7idnFnCh6rsIJDlXiS
         rwX7BqKvsthP2NlxvDMqKNlDCCw4XtFShor/0K9gKI/ltG3TZN3JaN4MuR2OzeEPOelO
         IbhHrDWP0ogFDvPQ7W4hgVVO3wZkBwUWUfMVQutonR8iDgoXJRyFVuonKE2a3vFgrRpN
         ARcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=pFQgMOPOZ0cf4pYbyDTduAVBuGs1/5wVywuS5maBZ/M=;
        b=lOgPmiU0ZkaHGJJnIBWO70ZJ/dqajJqLJlH7P8zxeoQ1fto+6g4HFGGZtv4FxgtR9v
         4vng4gFzkrUapaHShRJTGyKvm3ZeOrxWzk4wGpI8KVK/C3A1462hkcR497HVX3yUE73g
         nTftNVvH4BF8V9g4+rQR/YuyWBBl5mxCAX49dXAxA6j7gshRGfqUxPRQqwbDTCmst8tH
         tLXTjEzYRKErI5+/weQOXT0JNXgYEJvuf14BogG0sH6POd1gsLtMHCXWbhwjSLyrnPYQ
         IfwrB+rghZFyll20Zmri4kMET4U8hNaMLy9kDqQqHJ0Z8iMLU4Ci/qV57OUx66qSb+O/
         FgvQ==
X-Gm-Message-State: AGi0PuZ13x088e9pqvoK89C5FjkuHAEHCismXSokcshsuRyw6P4Ypwaa
	fxlklk3vt9xstIXu2+R9EMxvoa9Ky1rcrshHX/oPrQ==
X-Google-Smtp-Source: APiQypLq1AouEjdTn8fJXJX1lVqZ5y00ELYBdcun4fpA57WLoTan30SBbxS2FUDRaFeX8NKWhUBDkktAgGCrEZ5W2IY=
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr3650617wrs.230.1588262013050;
 Thu, 30 Apr 2020 08:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588175775.git.steve@sakoman.com> <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
 <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com> <160A69FC1635E57D.20868@lists.openembedded.org>
In-Reply-To: <160A69FC1635E57D.20868@lists.openembedded.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 30 Apr 2020 05:53:21 -1000
Message-ID: <CAGDS+nn9dTG9hG2p3v_J7Pf55pD-1vxx6xUOGTBTeeK2s+bQbw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/16] bzip2/pbzip2: Correct license information
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 29, 2020 at 12:12 PM Steve Sakoman via
lists.openembedded.org <sakoman=gmail.com@lists.openembedded.org>
wrote:

> > The corresponding update to the busybox recipe should be merged too.
>
> Thanks, I'm picking that one up in the next batch.

In fact, I'm going to move this patch to my next set and group all the
bzip license changes and fixes together.

Steve

> > > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > > index 8e9b779e67..d58f553a49 100644
> > > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > > @@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
> > >  LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
> > >  HOMEPAGE = "https://sourceware.org/bzip2/"
> > >  SECTION = "console/utils"
> > > -LICENSE = "bzip2"
> > > +LICENSE = "bzip2-1.0.6"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
> > >
> > >  SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> > > diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > > index 1275cc0097..d7450c73c1 100644
> > > --- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > > +++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > > @@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
> > >  newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
> > >  HOMEPAGE = "http://compression.ca/pbzip2/"
> > >  SECTION = "console/utils"
> > > -LICENSE = "BSD-4-Clause"
> > > +LICENSE = "bzip-1.0.6"
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
> > >
> > >  DEPENDS = "bzip2"
> > > --
> > > 2.17.1
> > >
> > >
> >
> 
