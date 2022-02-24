Return-Path: <ardeleanalex@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C396FC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:23:05 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.11700.1645716184829978583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EF+SyhDe;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: ardeleanalex@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so1566936pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbEj/H1ycEXR7BWkWNOwBcohA6lcGqk04fxPfD8RSRg=;
        b=EF+SyhDekSeBBzVmjGki7qBCljzXYY1ucLeelKmUIdBrsaFHbGIIdnwmKINkF3Y1Jx
         m9glu5r/oVVpI/ZzbYvQ+U4BdnqOvINVLXNfbDlENYlpm5i5Y9h+x7NCIGx7NvcJRZNE
         Bfvj3mfpNIR9+fzQtUPzr94zcNU+4C/83ofQjtT3xEF+VKTRyJg235EQwGD+KyRMhwhF
         +rcXXXcRuWBtOXLC8XVQ2V6dN27X4wak8tLLBuh8yTy9LIj1HMWsC13/rshOmIMQfjTz
         ZonwFNbC531fl0c7V5fjrUW+uexFC0Zue6pn1t5wtTzwj5Q52jL55Ulssh9mfIcJfWLs
         fbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbEj/H1ycEXR7BWkWNOwBcohA6lcGqk04fxPfD8RSRg=;
        b=iMdLITZWIYLQ++IdToWhvkAWhfxoK+/7tqWd7Q9NN7axZnzQPa56VbPTkalQv6MKZI
         aGx1h7DYeMgGRAmBD6wTAhmiblWYPHOqX9SciX4E50Ox72pR9LQQd9K9x6sesxnNDn9O
         ywyV5MqlKQkQm9B6CDAIeL+wq4tlqqIP4Hga1tTDQZekii3yLZ3Uv968y7oBtVjqagq2
         Xof8EO7QQwcsGlS0rVbuNXZuTql2h80KPNIaCf9gciC4yn2E5JlqdDHKY20ignRwS6rD
         c3CtVJ6lVTw/7jLeQ4QlqA6RT5CJau+4xSoxheq2Yhgp2jCWFyFEd9lumJQrct6K6l5U
         HWew==
X-Gm-Message-State: AOAM532/iVPGYGfCKArwlXDNG7IyHHugcbcTkU3xipmnoMWQmomaxzKi
	S8h+ChlxNVMpW629WJsqmAyvh4pRwJ6V4qqLNEQ=
X-Google-Smtp-Source: 
 ABdhPJyrjgSuRcd5Z+Mc+e7LbxCWGAqruO86Wh7yoaYzLnZENR9eLMhdo6/4YBwVRLV96jx8rVNPImol8SqWLFC0hQo=
X-Received: by 2002:a17:903:286:b0:150:a30:1518 with SMTP id
 j6-20020a170903028600b001500a301518mr3167240plr.166.1645716184205; Thu, 24
 Feb 2022 07:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20220224125927.32821-1-ardeleanalex@gmail.com>
 <21f4c04019c2ef890b0c2a3cc726d90bacfa4ad6.camel@linuxfoundation.org>
In-Reply-To: 
 <21f4c04019c2ef890b0c2a3cc726d90bacfa4ad6.camel@linuxfoundation.org>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 24 Feb 2022 17:22:52 +0200
Message-ID: 
 <CA+U=DsrhCp8pJR7wVXBYaTyZzRmr-iB67ukRiCMC5XbU0ut7og@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] libsndfile1: bump to version 1.0.31
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:23:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162322

On Thu, Feb 24, 2022 at 5:05 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-02-24 at 14:59 +0200, Alexandru Ardelean wrote:
> > diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> > deleted file mode 100644
> > index b8e703d084..0000000000
> > --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -SUMMARY = "Audio format Conversion library"
> > -DESCRIPTION = "Library for reading and writing files containing sampled \
> > -sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
> > -one standard library interface."
> > -HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
> > -AUTHOR = "Erik de Castro Lopo"
> > -DEPENDS = "flac libogg libvorbis"
> > -SECTION = "libs/multimedia"
> > -LICENSE = "LGPL-2.1-only"
> > -
> > -SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
> > -           file://CVE-2017-6892.patch \
> > -           file://CVE-2017-8361-8365.patch \
> > -           file://CVE-2017-8362.patch \
> > -           file://CVE-2017-8363.patch \
> > -           file://CVE-2017-14634.patch \
> > -           file://CVE-2018-13139.patch \
> > -           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
> > -           file://CVE-2018-19432.patch \
> > -           file://CVE-2017-12562.patch \
> > -           file://CVE-2018-19758.patch \
> > -           file://CVE-2019-3832.patch \
> > -          "
> > -
> > -SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
> > -SRC_URI[sha256sum] = "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
> > -
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
> > -
> > -CVE_PRODUCT = "libsndfile"
> > -
> > -S = "${WORKDIR}/libsndfile-${PV}"
> > -
> > -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
> > -PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> > -PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
> > -
> > -inherit autotools lib_package pkgconfig multilib_header
> > -
> > -do_install:append() {
> > -    oe_multilib_header sndfile.h
> > -}
> > -
> > -# This can't be replicated and is just a memory leak.
> > -# https://github.com/erikd/libsndfile/issues/398
> > -CVE_CHECK_IGNORE += "CVE-2018-13419"
> > diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
> > new file mode 100644
> > index 0000000000..c70c2f32a5
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
> > @@ -0,0 +1,31 @@
> > +SUMMARY = "Audio format Conversion library"
> > +DESCRIPTION = "Library for reading and writing files containing sampled \
> > +sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
> > +one standard library interface."
> > +HOMEPAGE = "https://libsndfile.github.io/libsndfile/"
> > +AUTHOR = "Erik de Castro Lopo"
> > +DEPENDS = "flac libogg libvorbis"
> > +SECTION = "libs/multimedia"
> > +LICENSE = "LGPL-2.1-only"
> > +
> > +SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
> > +          "
> > +
> > +SRC_URI[md5sum] = "3f3b2a86a032f064ef922a2c8c191f7b"
> > +SRC_URI[sha256sum] = "a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b40bf77e751cc02163"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
> > +
> > +CVE_PRODUCT = "libsndfile"
> > +
> > +S = "${WORKDIR}/libsndfile-${PV}"
> > +
> > +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
> > +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> > +PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
> > +
> > +inherit autotools lib_package pkgconfig multilib_header
> > +
> > +do_install_append() {
> > +    oe_multilib_header sndfile.h
> > +}
>
> Thanks for this, I was a little surprised the do_install:append became a
> do_install_append which doesn't work with current bitbake?

Oops.
Apologies.
I tested this on a dunfell-23.0.4 and it worked, and I assumed that
the colon was one of my not-so-famous vim typos.

That's the current system that I have around to test (also on a board).

>
> Generating the patches with -M should help make these kinds of differences
> clearer too. It does look like we've missed out on a few versions of this.

Hmmm, ok.
Will see about the -M when doing a V2.

Thanks
Alex

>
> Cheers,
>
> Richard
>
>

