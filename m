Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6B267DF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:44:35 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id s19so7642452otq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t/TGBnbsjWHgb4Un8lbj39XLZY3GuSEwIowV+tF+xIM=;
	b=pVIYznbTWhP1/ZWF6mNpxZntcQzMJVz1ZXqZhix/x4G4vulJtsG7SEQbWZ5FjH95sg
	hAr98ag/l1HRIhioa5RdDQbjPIafzuxQ2qA0IDKsV1AOoSSyAiddcK6T7I5wSLo58Q/B
	FOtPoJVEAo8pSflj9b92DBIFaXc6FG0cxBeXklH2ZQ9IaJijJmHNkP79Dml8kfjtwGXy
	AKPNiVZCWEeuk9uEK9JTvIav1n9yEfuPCQIL4jvVELFViXXia7Oi15sgIFsQQJq3oQLk
	jQMwF46CM0JoLD7XAkHd56knv10FBMRYmKmF7eC+M1/GIRhwHDXyPZ5zRLSmm8Xlarbo
	HYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t/TGBnbsjWHgb4Un8lbj39XLZY3GuSEwIowV+tF+xIM=;
	b=rfh5ygTfZIKraWhHgYjJUNqR2zPfhlFQQNBYlyvhSoimpjX1yT4qkBBJf24dXJ4gT0
	A1qgWYje72Vq+/9vN7sSMJ9g6O0xrw5r++q1SWoZj4sAN5gc5b/kcpCqartDql9BH5ZC
	GaRht6UqtMIn9Fvb1hMPA7HNeRopVW0TgDvkEqICk/QZD5lX93fGK1jvMnqPmtD5yG5x
	05kN2aNs1ItI38kQ3g9YA39H0lXh6iyPdOle2mSA3gxHXUuD069pGNhSbNBl0xpS4szv
	VrVve4C5KJppwQVFDVrmityxC7iqsn7euItrpmF5ibKE9vx6ook/eWI6b+1veLBt1Css
	XG9g==
X-Gm-Message-State: APjAAAWutcnhNl9bVp24/xUSUesYH3ef2tLZTFWjd4NTsW/yuyBlA40l
	C/S0PPZ6OTWobk15E5mD8njayP9EpocjUqdav0qxUQ==
X-Google-Smtp-Source: APXvYqxNBe7s6+kAKaGqQwD4Mf4pXkWvlIvYVgsQYvAkOn/IJGOC0jTE1BMrUrUVSzciMHe2qQzfXIIXq6Fl1e364Rg=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr9524072otn.167.1558118676792; 
	Fri, 17 May 2019 11:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-17-alex.kanavin@gmail.com>
	<c581181a21a04db892a1e2239c6201ec@XBOX04.axis.com>
In-Reply-To: <c581181a21a04db892a1e2239c6201ec@XBOX04.axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 May 2019 20:44:25 +0200
Message-ID: <CANNYZj8+31---HM6wvB+68EHKZj+rRSE3P3UErNi11-n=w1qqQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/37] libpcre2: upgrade 10.32 -> 10.33
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
X-List-Received-Date: Fri, 17 May 2019 18:44:36 -0000
Content-Type: text/plain; charset="UTF-8"

Haha yes. Will resend in a second.

Alex

On Fri, 17 May 2019 at 20:28, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 17 maj 2019 20:12
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 17/37] libpcre2: upgrade 10.32 -> 10.33
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../{libpcre2_10.32.bb => libpcre2_10.33.bb}  | 46 +++++++++++++++++--
> >  1 file changed, 43 insertions(+), 3 deletions(-)
> >  rename meta/recipes-support/libpcre/{libpcre2_10.32.bb =>
> > libpcre2_10.33.bb} (61%)
> >
> > diff --git a/meta/recipes-support/libpcre/libpcre2_10.32.bb
> > b/meta/recipes-support/libpcre/libpcre2_10.33.bb
> > similarity index 61%
> > rename from meta/recipes-support/libpcre/libpcre2_10.32.bb
> > rename to meta/recipes-support/libpcre/libpcre2_10.33.bb
> > index 3a0aa53029f..604f81a8f33 100644
> > --- a/meta/recipes-support/libpcre/libpcre2_10.32.bb
> > +++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
> > @@ -1,3 +1,43 @@
>
> A bit too much automation here I guess. ;)
> Replace the below with an appropriate:
>
> License-Update: Copyright years updated
>
> in the commit message.
>
> > +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> > +# The following is the difference between the old and the new license text.
> > +# Please update the LICENSE value if needed, and summarize the changes in
> > +# the commit message via 'License-Update:' tag.
> > +# (example: 'License-Update: copyright years updated.')
> > +#
> > +# The changes:
> > +#
> > +# --- LICENCE
> > +# +++ LICENCE
> > +# @@ -26,7 +26,7 @@
> > +#  University of Cambridge Computing Service,
> > +#  Cambridge, England.
> > +#
> > +# -Copyright (c) 1997-2018 University of Cambridge
> > +# +Copyright (c) 1997-2019 University of Cambridge
> > +#  All rights reserved.
> > +#
> > +#
> > +# @@ -37,7 +37,7 @@
> > +#  Email local part: hzmester
> > +#  Email domain:     freemail.hu
> > +#
> > +# -Copyright(c) 2010-2018 Zoltan Herczeg
> > +# +Copyright(c) 2010-2019 Zoltan Herczeg
> > +#  All rights reserved.
> > +#
> > +#
> > +# @@ -48,7 +48,7 @@
> > +#  Email local part: hzmester
> > +#  Email domain:     freemail.hu
> > +#
> > +# -Copyright(c) 2009-2018 Zoltan Herczeg
> > +# +Copyright(c) 2009-2019 Zoltan Herczeg
> > +#  All rights reserved.
> > +#
> > +#
> > +#
> > +#
> > +
> >  DESCRIPTION = "There are two major versions of the PCRE library. The \
> >  newest version is PCRE2, which is a re-working of the original PCRE \
> >  library to provide an entirely new API. The original, very widely \
> > @@ -8,14 +48,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
> >  HOMEPAGE = "http://www.pcre.org"
> >  SECTION = "devel"
> >  LICENSE = "BSD"
> > -LIC_FILES_CHKSUM = "file://LICENCE;md5=cf66d307bf03bae65d413eb7a8e603a0"
> > +LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
> >
> >  SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
> >             file://pcre-cross.patch \
> >  "
> >
> > -SRC_URI[md5sum] = "8a096287153fb994970df3570e90fcb5"
> > -SRC_URI[sha256sum] = "f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e"
> > +SRC_URI[md5sum] = "80b355f2dce909a2e2424f5c79eddb44"
> > +SRC_URI[sha256sum] = "35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa"
> >
> >  CVE_PRODUCT = "pcre2"
> >
> > --
> > 2.17.1
>
> //Peter
>

