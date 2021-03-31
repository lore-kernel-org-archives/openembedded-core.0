Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.1012.1617217139579582998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 11:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EOrQ3Cx+;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id j25so15238347pfe.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fo8m0D/0UNd6eNiSzOM1sHXbdBR3UFjign1orvc28rI=;
        b=EOrQ3Cx+mvVppG/q3LaslQAAucOeyp9iI4etmVHIjTLmLN0Cqa3r9L+yf2tXWF6t2p
         59+AtXi/ENuQiiCvPNh8qx+xl6FzfoDmcKLOUw3b6pUue8JYIVBcDyo+AQdDCfyklR3P
         M4ixMtSamUSLz8ZhvAX7TzlCd+CAmeA9FjZGqgKGeAORq+Zd6BANNedcwsZlKHqaSrbv
         ESRf+dX/C3T/YRKTNaRgf+UyAF+kh3CNt9Jix4h022rxTU6wBB0OXk3e4nZ8RipDLSfs
         Lciyrq30HCQhukecxUM8b5FqOnXXNXG6XBo6w1uzYllSeecLuFavmsVDtYKPmVPpgQ5l
         aXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Fo8m0D/0UNd6eNiSzOM1sHXbdBR3UFjign1orvc28rI=;
        b=t6/l65QXmIMoCNJ7eQ0zRV3LiP0wS6vXl9EFGYi31qchDpQ5c4XWeZ3otJ2dcIeArz
         PpUPRgTOH5qQ0srOHs3ozbuqWML/QAecrDRHwmVxqz/14/01Or4O4UZR3lxMwO70HgDs
         4BT2YJsvKHS2UDmMgvKTDsDQk2PzbU2LoOWZxQxe9ySjYO1kVdNshzfpNq+gaLXRNxDy
         +NNkTriP3kbq2en8YSBRXY5wG4Dro6schY375nY/GM3qnl7y0QryUA8ygVVVFoPqgLNr
         RyrnikufvNdfFdt7SszScdmxm55JDcxumn+Vkx0OY9xdXrklvApGWo8SPR04dn9UUcJq
         ks8g==
X-Gm-Message-State: AOAM5327+jRA0Lx5HawiHO36pV9v0z0LC9ZwuyX5/GdKE3+3+OnZpxBr
	hZlNe9sI+ABrY4Lm9u2APlRBl9z3XDDR7w==
X-Google-Smtp-Source: ABdhPJwmo2YGU2pLZAekULkIAV0w9guB1bpgpQy9kqHVH6Q1mYjFr6rq51JooIiST7Ma4Rf+DoTYRw==
X-Received: by 2002:a63:570b:: with SMTP id l11mr4470446pgb.193.1617217138733;
        Wed, 31 Mar 2021 11:58:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9042:8df6:cee8:da6a? ([2601:646:9200:a0f0:9042:8df6:cee8:da6a])
        by smtp.gmail.com with ESMTPSA id i7sm3170533pfq.184.2021.03.31.11.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 11:58:58 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] mesa: update 21.0.0 -> 21.0.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210331122254.121192-1-alex.kanavin@gmail.com>
 <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com>
 <d4b500da-5aec-075e-4632-8a65852b1600@gmail.com>
 <CA+chaQfYEmLSZa6iDSQcq_LhG+tF==+MQDdd60iZnLaLJ-vz9w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <090c5eb0-9949-0535-0d4d-d750d40716a6@gmail.com>
Date: Wed, 31 Mar 2021 11:58:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfYEmLSZa6iDSQcq_LhG+tF==+MQDdd60iZnLaLJ-vz9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/31/21 11:50 AM, Martin Jansa wrote:
> FWIW: I don't use mesa-gl at all, I've noticed it only in git grep 
> DRIDRIVERS when looking why swrast was still enabled in our normal mesa 
> (and it was because of our own bbappend).

It also in meta-raspberrypi which will need update if this patch works 
out ok.

> 
> But I agree that it's sad that it's OK to break Ross's recipe, when auh 
> says there is an update available, but it's Ross's responsibility now to 
> fix the follow-up breakage from that upgrade.
> 
> Thanks for the patch Khem!
> 
> On Wed, Mar 31, 2021 at 7:13 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 3/31/21 6:05 AM, Martin Jansa wrote:
>      > Are you going to fix meta-gl issue with swrast still in DRIDRIVERS
>      > reported on previous upgrade?
>      >
>      > https://lists.openembedded.org/g/openembedded-core/message/149775
>     <https://lists.openembedded.org/g/openembedded-core/message/149775>
>      >
>     <https://lists.openembedded.org/g/openembedded-core/message/149775
>     <https://lists.openembedded.org/g/openembedded-core/message/149775>>
>      >
>      > https://lists.openembedded.org/g/openembedded-core/message/149779
>     <https://lists.openembedded.org/g/openembedded-core/message/149779>
>      >
>     <https://lists.openembedded.org/g/openembedded-core/message/149779
>     <https://lists.openembedded.org/g/openembedded-core/message/149779>>
>      > I don't know what exactly AB builds, but it's easy to reproduce
>     locally,
>      > something like:
>      > DISTRO_FEATURES_remove = "x11"
>      > PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
>      > PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
>      > bitbake mesa-gl
>      > should be enough to see build failure.
> 
>     it is a build regression. mesa and mesa-gl should be updated in sync
>     and
>     especially if you reported the fallout and if it went unaddressed is
>     sad.
> 
>     Could you try a patch somethiing like this and see if it helps.
> 
>     diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>     b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>     index e50782be1c..fc8b4f7504 100644
>     --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>     +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>     @@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri
>     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
>        PACKAGECONFIG_class-target = "opengl dri
>     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
> 
>        # When NOT using X11, we need to make sure we have swrast available.
>     -DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
>     '',
>     ',swrast', d)}"
>     +GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES',
>     'x11',
>     '', ',swrast', d)}"
> 
>      >
>      > On Wed, Mar 31, 2021 at 2:44 PM Alexander Kanavin
>      > <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>
>     <mailto:alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>> wrote:
>      >
>      >     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>
>      >     <mailto:alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>>
>      >     ---
>      >       .../mesa/{mesa-gl_21.0.0.bb <http://mesa-gl_21.0.0.bb>
>     <http://mesa-gl_21.0.0.bb <http://mesa-gl_21.0.0.bb>> =>
>      > mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>
>     <http://mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>>}               | 0
>      >       meta/recipes-graphics/mesa/mesa.inc                       
>           | 2 +-
>      >       meta/recipes-graphics/mesa/{mesa_21.0.0.bb
>     <http://mesa_21.0.0.bb> <http://mesa_21.0.0.bb <http://mesa_21.0.0.bb>>
>      >     => mesa_21.0.1.bb <http://mesa_21.0.1.bb>
>     <http://mesa_21.0.1.bb <http://mesa_21.0.1.bb>>}   | 0
>      >       3 files changed, 1 insertion(+), 1 deletion(-)
>      >       rename meta/recipes-graphics/mesa/{mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>      >     <http://mesa-gl_21.0.0.bb <http://mesa-gl_21.0.0.bb>> =>
>     mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>
>      >     <http://mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>>} (100%)
>      >       rename meta/recipes-graphics/mesa/{mesa_21.0.0.bb
>     <http://mesa_21.0.0.bb>
>      >     <http://mesa_21.0.0.bb <http://mesa_21.0.0.bb>> =>
>     mesa_21.0.1.bb <http://mesa_21.0.1.bb> <http://mesa_21.0.1.bb
>     <http://mesa_21.0.1.bb>>}
>      >     (100%)
>      >
>      >     diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>      >     <http://mesa-gl_21.0.0.bb <http://mesa-gl_21.0.0.bb>>
>      >     b/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
>     <http://mesa-gl_21.0.1.bb>
>      >     <http://mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>>
>      >     similarity index 100%
>      >     rename from meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>     <http://mesa-gl_21.0.0.bb>
>      >     <http://mesa-gl_21.0.0.bb <http://mesa-gl_21.0.0.bb>>
>      >     rename to meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
>     <http://mesa-gl_21.0.1.bb>
>      >     <http://mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>>
>      >     diff --git a/meta/recipes-graphics/mesa/mesa.inc
>      >     b/meta/recipes-graphics/mesa/mesa.inc
>      >     index e9b72ce063..a40dad2b81 100644
>      >     --- a/meta/recipes-graphics/mesa/mesa.inc
>      >     +++ b/meta/recipes-graphics/mesa/mesa.inc
>      >     @@ -21,7 +21,7 @@ SRC_URI =
>      >     "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>     <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz>
>      >     <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz
>     <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz>> \
>      >
>      >   
>       file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>      >                  "
>      >
>      >     -SRC_URI[sha256sum] =
>      >   
>       "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
>      >     +SRC_URI[sha256sum] =
>      >   
>       "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
>      >
>      >       UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>      >
>      >     diff --git a/meta/recipes-graphics/mesa/mesa_21.0.0.bb
>     <http://mesa_21.0.0.bb>
>      >     <http://mesa_21.0.0.bb <http://mesa_21.0.0.bb>>
>     b/meta/recipes-graphics/mesa/mesa_21.0.1.bb <http://mesa_21.0.1.bb>
>      >     <http://mesa_21.0.1.bb <http://mesa_21.0.1.bb>>
>      >     similarity index 100%
>      >     rename from meta/recipes-graphics/mesa/mesa_21.0.0.bb
>     <http://mesa_21.0.0.bb>
>      >     <http://mesa_21.0.0.bb <http://mesa_21.0.0.bb>>
>      >     rename to meta/recipes-graphics/mesa/mesa_21.0.1.bb
>     <http://mesa_21.0.1.bb>
>      >     <http://mesa_21.0.1.bb <http://mesa_21.0.1.bb>>
>      >     --
>      >     2.29.2
>      >
>      >
>      >
>      >
>      >
>      >
>      > 
>      >
> 
