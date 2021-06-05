Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.13822.1622909361859159711
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 09:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VjDSYFAR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id g204so7118599wmf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=X+7Qw2PyPn8HdJpslm4Ut+AomnnicpTincn0ez2xexY=;
        b=VjDSYFARqmulzFPk37hGbk19Jr0BXXMfdZ3RRm4I0LBAJuZaO4Sdw/NvFKh/VkDP7w
         aLuacUSuCvpHRgOa7Sr3NsRM1T/yY7M3anDmZ4o4SnJCAIv/OU1L0VZApvzDlsLziSAe
         ebRGtH0wqgD9j01gFWUq9dXD7bhZg/7YD5xf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=X+7Qw2PyPn8HdJpslm4Ut+AomnnicpTincn0ez2xexY=;
        b=oU9d3oJzqjNzzGCkvUUFuZeG1u2bm30dTZIUmUnkC/4V6Zj7gzXGMiwa66n2deKUtW
         7nUHK36tqMz+KxbSn5cA6S16pP71Ugr91UMPW1a2RtEicIeor4HjGL5TkLh4VZUVSreM
         /zkTqFyB4Q8w8iG9LTkzAcduISulGWF/0f+8BWHaEXCL74HgHIQPSaD9AiAds6PifK9j
         N+kTgMdrFpS6khluh3IWU6/b9V/KWio3UlI4hLlHPr/sENEMTJ+fVDHawwUUikvoVfkE
         JniGYOr234ZCHs7EMZ56ccrRCtqlTOKNTKjj0OPW2mFAx4eZfCKBsUsK+gs+lnKncgK5
         EfxA==
X-Gm-Message-State: AOAM5325W0AWTV1IewPTlXXUn2s2qZV7+tAcnUj2Z6opI+Mgd7UIAjTQ
	Abfm3XOm7FTVC9QHizCL19llQw==
X-Google-Smtp-Source: ABdhPJy0Y4wv2THCDZAFzsE3122sbYDZQxcRh2f284u9kJZSgUo43PznnzALSNb/QXsJpKEY4EQPrg==
X-Received: by 2002:a05:600c:3789:: with SMTP id o9mr8913441wmr.78.1622909360076;
        Sat, 05 Jun 2021 09:09:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5b89:f6cd:8040:62ea? ([2001:8b0:aba:5f3c:5b89:f6cd:8040:62ea])
        by smtp.gmail.com with ESMTPSA id u14sm11530093wmc.41.2021.06.05.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 09:09:19 -0700 (PDT)
Message-ID: <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>,  openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Sat, 05 Jun 2021 17:09:16 +0100
In-Reply-To: <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-4-alex.kanavin@gmail.com>
	 <1685B658849E960A.4717@lists.openembedded.org>
	 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
	 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-06-05 at 08:32 -0700, Khem Raj wrote:
> 
> On 6/5/21 8:13 AM, Richard Purdie wrote:
> > On Sat, 2021-06-05 at 15:35 +0100, Richard Purdie via lists.openembedded.org wrote:
> > > On Fri, 2021-06-04 at 11:14 +0200, Alexander Kanavin wrote:
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >   .../cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb}    | 0
> > > >   meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
> > > >   .../recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} | 0
> > > >   3 files changed, 1 insertion(+), 1 deletion(-)
> > > >   rename meta/recipes-devtools/cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb} (100%)
> > > >   rename meta/recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} (100%)
> > > > 
> > > > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
> > > > rename to meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
> > > > diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> > > > index be43760628..0987c01c87 100644
> > > > --- a/meta/recipes-devtools/cmake/cmake.inc
> > > > +++ b/meta/recipes-devtools/cmake/cmake.inc
> > > > @@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
> > > >              file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
> > > >   "
> > > >   
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > -SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
> > > > +SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
> > > >   
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > >   UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> > > >   
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > diff --git a/meta/recipes-devtools/cmake/cmake_3.20.2.bb b/meta/recipes-devtools/cmake/cmake_3.20.3.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/cmake/cmake_3.20.2.bb
> > > > rename to meta/recipes-devtools/cmake/cmake_3.20.3.bb
> > > 
> > > Seems there is some intermittent issue that the cmake upgrade brings in:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/3509/steps/13/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3513/steps/12/logs/stdio
> > > 
> > > yet the latter passed in:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3514
> > 
> > Re-ran it on centos8 and it failed:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3515
> > 
> > so this looks to be centos8 specific.
> > 
> 
> CMake Error at cmake_install.cmake:46 (file):
>    file INSTALL cannot set modification time on
>  
> 
> 
> 
> 
> 
> 
> 
> "/home/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/assimppcyyuhv8/install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake":
>    Invalid argument.
> make: *** [Makefile:74: install] Error 1
> No python package in the SDK
> 
> I wonder if its some parallel install race. Can we try disabling 
> parallelism during install for the assimp build during test and see if 
> that helps.

I've just realised this is also happening with master in a-quick:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1441

all centos8 failures.

Michael: Did something change on those machines during maint on Friday
that could be triggering ths?

Cheers,

Richard


