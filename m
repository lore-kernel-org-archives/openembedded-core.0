Return-Path: <ardeleanalex@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D13BC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 10:54:41 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.9520.1646304876139483874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=St42drW4;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: ardeleanalex@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id t14so4197155pgr.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mD325DtK28MR+pqmHLCe9u9QSvxss2ESqBxPX5RxSRw=;
        b=St42drW4lzxd0wVKr5XQNUgbZMWrihni8+9CFrKTYLKCVVQJS/p1jqRdt4iESZBMoy
         4WTGwhg+t7G7YUjQ0TO6wLQbR5fFXrYtytY7JbVJCz4XdSfvcuFSKp4c7nxXEk7/TdmS
         Mla9hNZoVQU2HzcvOiSMb3G/+WR8bga5jrLyMeaK6cIWMRLLitQjX32rVTaEy0chgj9T
         0JtrIDRWAWcgUdg9aH33OW1SLGBwUPAuvHI4FFB8FHZrHIKqVjFKzonX+Q9Q4mjODZ8n
         Hq0UT5rcs4N5DKKlTjCQFfY7HBw6WMCl9Qw2c2b7Z9dvK0oFMNrO81iYX7xcM+ISDtqb
         HzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mD325DtK28MR+pqmHLCe9u9QSvxss2ESqBxPX5RxSRw=;
        b=ZrJRSfek+S8Zq1Lmni+weLPFQ4pG3uwF2OPMp4LB6uTha5zOkgXV5r9qKN8EyaXFYr
         jZBmfMsUbfpHReVoLrWPIy40MnRI/gjpZg+ro4rMRpNKIfgP8t+cxTSGsQAhOsRMeLZ9
         y7RcwBcJAuA+IUbpw0M/The2qAc8BuIpJ3F/jjLRw98I6DlLDgMxt1lkKFRp3YX58vo6
         AC0tFuqSPy5MeEV7NhE+cB8iFeJ6+WVUVp5WsEK8nxwp9hQBcTCunRy0RL7MnTO4S5F8
         hAzpdsd/MboNqak/aTWv/KpC6BuUL6LL7Sqh2Ef+ME6nHImfY6eo+WCayP0povqJ4htn
         vqbw==
X-Gm-Message-State: AOAM532lrKwHgclhzlglGpbjM9zttI60Q056wHCWUST0pRcNkX1dr26c
	sEkEs5CnFG3iTLIqYf5J6HOspVqQ/cfc8nWoh+Q=
X-Google-Smtp-Source: 
 ABdhPJy4mytbeFAbbSRSqCTlz9rw5d38LrpykLVYk+PbQ7s+1Kb8eKEEIeH4a4tidcghqdu9KqGSTmzzkimi433eT/8=
X-Received: by 2002:a63:788c:0:b0:374:87b6:a9d2 with SMTP id
 t134-20020a63788c000000b0037487b6a9d2mr29612351pgc.303.1646304875575; Thu, 03
 Mar 2022 02:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20220224153034.5140-1-ardeleanalex@gmail.com>
 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
 <12d5c909469e4ced0ab136d0ca5f00cbe45567c7.camel@linuxfoundation.org>
 <CA+U=DsrXewjnaWp2DQM8u=V9AS49vGKcdt17b5kyZ8eth_8LOQ@mail.gmail.com>
 <49dbf7f4492322649e7876c110e94de4f82bcf77.camel@linuxfoundation.org>
In-Reply-To: 
 <49dbf7f4492322649e7876c110e94de4f82bcf77.camel@linuxfoundation.org>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 3 Mar 2022 12:54:24 +0200
Message-ID: 
 <CA+U=Dsr74n=NT7w-TrrpQwv0_9iHQYnGNCU8BobebjKQ5sbJXg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libsndfile1: bump to version 1.0.31
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 10:54:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162647

On Thu, Mar 3, 2022 at 12:43 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-03-01 at 16:30 +0200, Alexandru Ardelean wrote:
> > On Tue, Mar 1, 2022 at 4:23 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2022-02-28 at 12:32 +0200, Alexandru Ardelean wrote:
> > > > On Thu, Feb 24, 2022 at 5:30 PM Alexandru Ardelean
> > > > <ardeleanalex@gmail.com> wrote:
> > > > >
> > > > > It seems that the homepage has moved (for a while now) from
> > > > >   http://www.mega-nerd.com/libsndfile/
> > > > > to
> > > > >   https://libsndfile.github.io/libsndfile/
> > > > >
> > > > > On Github, the development group seems to include Erik de Castro Lopo (the
> > > > > original author of libsndfile1).
> > > > > Link: https://github.com/orgs/libsndfile/people
> > > > >
> > > > > All backported CVE patches are in version 1.0.31 (I've checked).
> > > > >
> > > > > The supported format page [1], mentions that Ogg/Opus is supported since
> > > > > 1.0.29, however that isn't currently added in this patch. And it may
> > > > > require libopus.
> > > > > And mp3 is supported at around version 1.1.0, but that version is in beta.
> > > > >
> > > > > This change focuses solely on updating to 1.0.31 and removing all
> > > > > backported patches.
> > > > >
> > > > > [1] https://libsndfile.github.io/libsndfile/formats.html
> > > >
> > > > Bah...
> > > >
> > > > No luck with V2 either.
> > > > This would require some patch to allow build without libopus support.
> > > > Since there is no libopus available, it will not include support for
> > > > libvorbis, libflac.
> > > > i.e. libsndfile will build, but will say:
> > > >
> > > > configure: WARNING: *** One or more of the external libraries (ie
> > > > libflac, libogg and
> > > > configure: WARNING: *** libvorbis) is either missing (possibly only
> > > > the development
> > > > configure: WARNING: *** headers) or is of an unsupported version.
> > > > configure: WARNING: ***
> > > > configure: WARNING: *** Unfortunately, for ease of maintenance, the
> > > > external libs
> > > > configure: WARNING: *** are an all or nothing affair.
> > > >
> > > >
> > > > Seems I forgot to check these extra configurations.
> > > >
> > > > Please disregard the V2 and apologies for the noise.
> > > >
> > > > I may try again with a V3, but let's see.
> > >
> > >
> > > Unfortunately we merged this as it passed the automated testing and there was no
> > > other review feedback.
> >
> > Oh.
> > Now I feel a bit worse.
> >
>
> It is just the way things sometimes work out. I am pleased you spotted the
> issue.
>
> > > https://git.yoctoproject.org/poky/commit/?id=fd2c86b06963345683ac5dc4f47f9da8e0c8c69d
> > >
> > > It does make me worry about tests here and means we'll have to find some way to
> > > fix this.
> >
> > The silent nature of this build issue, suggests a few things to move forward:
> >
> > 1. Propose a patch upstream to cause a build failure if this
> > configuration isn't complete (i.e. all Xiph libs are enabled or not)
> >     It's their right to have this all Xiph libs or no Xiph libs support matrix.
> > 2. For Yocto, we could add libopus, in the meantime OR
> >     Patch-out libopus in the build
>
> I had a look at patching out opus in the build and it didn't seem too difficult,
> the patch below seemed to work:
>
> Index: libsndfile-1.0.31/configure.ac
> ===================================================================
> --- libsndfile-1.0.31.orig/configure.ac
> +++ libsndfile-1.0.31/configure.ac
> @@ -361,13 +361,13 @@ AS_IF([test -n "$PKG_CONFIG"], [
>                                 enable_external_libs=yes
>                         ])
>
> -                       AS_IF([test "x$ac_cv_flac$ac_cv_ogg$ac_cv_vorbis$ac_cv_vorbisenc$ac_cv_opus" = "xyesyesyesyesyes"], [
> +                       AS_IF([test "x$ac_cv_flac$ac_cv_ogg$ac_cv_vorbis$ac_cv_vorbisenc" = "xyesyesyesyes"], [
>                                         HAVE_EXTERNAL_XIPH_LIBS=1
>                                         enable_external_libs=yes
>
> -                                       EXTERNAL_XIPH_CFLAGS="$FLAC_CFLAGS $VORBIS_CFLAGS $VORBISENC_CFLAGS $SPEEX_CFLAGS $OPUS_CFLAGS $OGG_CFLAGS "
> -                                       EXTERNAL_XIPH_LIBS="$FLAC_LIBS $VORBIS_LIBS $VORBISENC_LIBS $SPEEX_LIBS $OPUS_LIBS $OGG_LIBS "
> -                                       EXTERNAL_XIPH_REQUIRE="flac ogg vorbis vorbisenc opus"
> +                                       EXTERNAL_XIPH_CFLAGS="$FLAC_CFLAGS $VORBIS_CFLAGS $VORBISENC_CFLAGS $SPEEX_CFLAGS $OGG_CFLAGS "
> +                                       EXTERNAL_XIPH_LIBS="$FLAC_LIBS $VORBIS_LIBS $VORBISENC_LIBS $SPEEX_LIBS $OGG_LIBS "
> +                                       EXTERNAL_XIPH_REQUIRE="flac ogg vorbis vorbisenc"
>
>                                         if test x$ac_cv_speex = "xyes" ; then
>                                                 EXTERNAL_XIPH_REQUIRE="$EXTERNAL_XIPH_REQUIRE speex"
> @@ -716,7 +716,7 @@ AC_MSG_RESULT([
>
>      Experimental code : ................... ${enable_experimental:-no}
>      Using ALSA in example programs : ...... ${enable_alsa:-no}
> -    External FLAC/Ogg/Vorbis/Opus : ....... ${enable_external_libs:-no}
> +    External FLAC/Ogg/Vorbis : ....... ${enable_external_libs:-no}
>      Building Octave interface : ........... ${OCTAVE_BUILD}
>
>    Tools :
> Index: libsndfile-1.0.31/src/ogg_opus.c
> ===================================================================
> --- libsndfile-1.0.31.orig/src/ogg_opus.c
> +++ libsndfile-1.0.31/src/ogg_opus.c
> @@ -159,7 +159,7 @@
>  #include "sfendian.h"
>  #include "common.h"
>
> -#if HAVE_EXTERNAL_XIPH_LIBS
> +#if 0
>
>  #include <ogg/ogg.h>
>  #include <opus/opus.h>
>
> so I'm tempted to merge something like this. It isn't as bad as I expected to patch.

It didn't look [to me] like it would be too bad to me either.
I wasn't sure what the decision would have been (from OE), to
[1]patch-out libopus? or to [2]add libopus? or [3]revert?
But your patch suggests [1] is preferred for now.

Did you get a chance to test it?
I can run a test on my system with it.
But it may take me 1-2 days.

In the meantime, I was a bit busy with this:
https://github.com/libsndfile/libsndfile/pull/812

It kind of seems that libsndfile people are talking about maybe
splitting up their configuration.
Let's see. That will be in a future release anyway.

>
> Cheers,
>
> Richard
>
>
>

