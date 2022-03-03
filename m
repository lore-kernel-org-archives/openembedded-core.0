Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28D6C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 10:43:46 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9303.1646304225314705709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BuXdsHC5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id n14so7137906wrq.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=b1M+DKFsQEUDwAzwDp2j2u6e1xIWP+U6wFWrVUWt3a4=;
        b=BuXdsHC5hrR8C5oy/VLQS7Mesoe+a7KuyDOABGhcoUKXpWWjHWwCzeUZPE7+apX0vR
         xEzEKKrUdoLvmtmeJuBOb6E8vqSqME0jH/5KYsWSjco8fSEuAgPk3p70xJHlE7TMp01d
         kNT65aUSPt5kHvnjHvBXSxz1eoPU7jZfcyKi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=b1M+DKFsQEUDwAzwDp2j2u6e1xIWP+U6wFWrVUWt3a4=;
        b=gYMjN2jiXwVILAf1APytjk5ChKARnxJxPvNMiYUbfYT5RUDYTdyR6iuOnExOCYe6mU
         qJn2AnZvSS+wnkQMnrGYNzdhCfJvsUNf6lwYk0CAkkogcGhsCM4LFbuJpucgk4pnArQ3
         BmtJhIkHDpZmGLf383r3dCgke8XRSVmbVOM/pk1y2Rodf3lYfHm1kwBeLJKGZ13YKV4z
         UFqTO96O1Qbk37zLXVLT8kZu6nROfX23afEn/vHMIB7EtpijCGziem2ylouvxcaC+fI3
         90x55nclvkwd5egDNuldl0pstQnoA1z0bxSU9Wm4lUjg1hOamJpu+TJlvj1kgU48Anlf
         AnbA==
X-Gm-Message-State: AOAM531BMtQP8xH4RdNSTQfepLVqSwYI8n7FrQEd/Xu1L/N8txVJ5ZBj
	5yAPFqY+5lP/LG1pW7n2R9NloA==
X-Google-Smtp-Source: 
 ABdhPJxzWcvi7Pvd/lBjjfcGH8GJu+O/452K4YCfsge9nrkVBibiqdvain4FeOQMb1FjGkhweNtfrQ==
X-Received: by 2002:a05:6000:c8:b0:1ef:7e4a:e3a1 with SMTP id
 q8-20020a05600000c800b001ef7e4ae3a1mr19537351wrx.452.1646304223710;
        Thu, 03 Mar 2022 02:43:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1?
 ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 a15-20020a05600c348f00b00388c399b896sm1378485wmq.32.2022.03.03.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 02:43:43 -0800 (PST)
Message-ID: 
 <49dbf7f4492322649e7876c110e94de4f82bcf77.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libsndfile1: bump to version
 1.0.31
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2022 10:43:28 +0000
In-Reply-To: 
 <CA+U=DsrXewjnaWp2DQM8u=V9AS49vGKcdt17b5kyZ8eth_8LOQ@mail.gmail.com>
References: <20220224153034.5140-1-ardeleanalex@gmail.com>
	 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
	 <12d5c909469e4ced0ab136d0ca5f00cbe45567c7.camel@linuxfoundation.org>
	 <CA+U=DsrXewjnaWp2DQM8u=V9AS49vGKcdt17b5kyZ8eth_8LOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 10:43:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162646

On Tue, 2022-03-01 at 16:30 +0200, Alexandru Ardelean wrote:
> On Tue, Mar 1, 2022 at 4:23 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Mon, 2022-02-28 at 12:32 +0200, Alexandru Ardelean wrote:
> > > On Thu, Feb 24, 2022 at 5:30 PM Alexandru Ardelean
> > > <ardeleanalex@gmail.com> wrote:
> > > > 
> > > > It seems that the homepage has moved (for a while now) from
> > > >   http://www.mega-nerd.com/libsndfile/
> > > > to
> > > >   https://libsndfile.github.io/libsndfile/
> > > > 
> > > > On Github, the development group seems to include Erik de Castro Lopo (the
> > > > original author of libsndfile1).
> > > > Link: https://github.com/orgs/libsndfile/people
> > > > 
> > > > All backported CVE patches are in version 1.0.31 (I've checked).
> > > > 
> > > > The supported format page [1], mentions that Ogg/Opus is supported since
> > > > 1.0.29, however that isn't currently added in this patch. And it may
> > > > require libopus.
> > > > And mp3 is supported at around version 1.1.0, but that version is in beta.
> > > > 
> > > > This change focuses solely on updating to 1.0.31 and removing all
> > > > backported patches.
> > > > 
> > > > [1] https://libsndfile.github.io/libsndfile/formats.html
> > > 
> > > Bah...
> > > 
> > > No luck with V2 either.
> > > This would require some patch to allow build without libopus support.
> > > Since there is no libopus available, it will not include support for
> > > libvorbis, libflac.
> > > i.e. libsndfile will build, but will say:
> > > 
> > > configure: WARNING: *** One or more of the external libraries (ie
> > > libflac, libogg and
> > > configure: WARNING: *** libvorbis) is either missing (possibly only
> > > the development
> > > configure: WARNING: *** headers) or is of an unsupported version.
> > > configure: WARNING: ***
> > > configure: WARNING: *** Unfortunately, for ease of maintenance, the
> > > external libs
> > > configure: WARNING: *** are an all or nothing affair.
> > > 
> > > 
> > > Seems I forgot to check these extra configurations.
> > > 
> > > Please disregard the V2 and apologies for the noise.
> > > 
> > > I may try again with a V3, but let's see.
> > 
> > 
> > Unfortunately we merged this as it passed the automated testing and there was no
> > other review feedback.
> 
> Oh.
> Now I feel a bit worse.
> 

It is just the way things sometimes work out. I am pleased you spotted the
issue.

> > https://git.yoctoproject.org/poky/commit/?id=fd2c86b06963345683ac5dc4f47f9da8e0c8c69d
> > 
> > It does make me worry about tests here and means we'll have to find some way to
> > fix this.
> 
> The silent nature of this build issue, suggests a few things to move forward:
> 
> 1. Propose a patch upstream to cause a build failure if this
> configuration isn't complete (i.e. all Xiph libs are enabled or not)
>     It's their right to have this all Xiph libs or no Xiph libs support matrix.
> 2. For Yocto, we could add libopus, in the meantime OR
>     Patch-out libopus in the build

I had a look at patching out opus in the build and it didn't seem too difficult,
the patch below seemed to work:

Index: libsndfile-1.0.31/configure.ac
===================================================================
--- libsndfile-1.0.31.orig/configure.ac
+++ libsndfile-1.0.31/configure.ac
@@ -361,13 +361,13 @@ AS_IF([test -n "$PKG_CONFIG"], [
 				enable_external_libs=yes
 			])
 
-			AS_IF([test "x$ac_cv_flac$ac_cv_ogg$ac_cv_vorbis$ac_cv_vorbisenc$ac_cv_opus" = "xyesyesyesyesyes"], [
+			AS_IF([test "x$ac_cv_flac$ac_cv_ogg$ac_cv_vorbis$ac_cv_vorbisenc" = "xyesyesyesyes"], [
 					HAVE_EXTERNAL_XIPH_LIBS=1
 					enable_external_libs=yes
 
-					EXTERNAL_XIPH_CFLAGS="$FLAC_CFLAGS $VORBIS_CFLAGS $VORBISENC_CFLAGS $SPEEX_CFLAGS $OPUS_CFLAGS $OGG_CFLAGS "
-					EXTERNAL_XIPH_LIBS="$FLAC_LIBS $VORBIS_LIBS $VORBISENC_LIBS $SPEEX_LIBS $OPUS_LIBS $OGG_LIBS "
-					EXTERNAL_XIPH_REQUIRE="flac ogg vorbis vorbisenc opus"
+					EXTERNAL_XIPH_CFLAGS="$FLAC_CFLAGS $VORBIS_CFLAGS $VORBISENC_CFLAGS $SPEEX_CFLAGS $OGG_CFLAGS "
+					EXTERNAL_XIPH_LIBS="$FLAC_LIBS $VORBIS_LIBS $VORBISENC_LIBS $SPEEX_LIBS $OGG_LIBS "
+					EXTERNAL_XIPH_REQUIRE="flac ogg vorbis vorbisenc"
 
 					if test x$ac_cv_speex = "xyes" ; then
 						EXTERNAL_XIPH_REQUIRE="$EXTERNAL_XIPH_REQUIRE speex"
@@ -716,7 +716,7 @@ AC_MSG_RESULT([
 
     Experimental code : ................... ${enable_experimental:-no}
     Using ALSA in example programs : ...... ${enable_alsa:-no}
-    External FLAC/Ogg/Vorbis/Opus : ....... ${enable_external_libs:-no}
+    External FLAC/Ogg/Vorbis : ....... ${enable_external_libs:-no}
     Building Octave interface : ........... ${OCTAVE_BUILD}
 
   Tools :
Index: libsndfile-1.0.31/src/ogg_opus.c
===================================================================
--- libsndfile-1.0.31.orig/src/ogg_opus.c
+++ libsndfile-1.0.31/src/ogg_opus.c
@@ -159,7 +159,7 @@
 #include "sfendian.h"
 #include "common.h"
 
-#if HAVE_EXTERNAL_XIPH_LIBS
+#if 0
 
 #include <ogg/ogg.h>
 #include <opus/opus.h>

so I'm tempted to merge something like this. It isn't as bad as I expected to patch.

Cheers,

Richard




