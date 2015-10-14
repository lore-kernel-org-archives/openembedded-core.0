Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 153B876E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 17:44:36 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so84577593igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 10:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=QK8ZCoyv3K08EiF1aGThuzRVk2ICPWo11/rfI0pTgD8=;
	b=Anvk3b1LHHzF+A/rhJ/8a82VICmjYy8+sEF/qv2lrfEjNGEEQeUdOgvp+4lUV4FzS5
	jFzlgM7CVGf3bWJHw10kojkD9KAtL5WB8Defeke4pfqfu6fon+jPsG3DOsGz1nycFI6N
	6HdeDIpAnfGVwEifYJlwRr/kpTdOFZCBXK7ewNqiWJ3qtSwDDaLOZCsqbUYIH4AI4TEC
	8XArok9nkjuAlDmZ/HQ7PTh/tqoJ0tBQz5yNY0Xvob5ucn5h2ioDpYpXwL25JWPgbSN+
	2bIltEqVbq/Tva2lkxgX7hBEQs0xbysN55agMAKYljhfNIh8ZIw+oE8oIXhCfTymjnnw
	0kow==
X-Gm-Message-State: ALoCoQnjODI8VdMoKKAO+8PvDHXZa9U5YrpRu0+iP1i6i2dQAuyXUKvY9Qn/yvEQ1X01tMC6+/LI
X-Received: by 10.50.66.197 with SMTP id h5mr25560346igt.82.1444844677069;
	Wed, 14 Oct 2015 10:44:37 -0700 (PDT)
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com.
	[209.85.213.179])
	by smtp.gmail.com with ESMTPSA id q10sm9487524igh.4.2015.10.14.10.44.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 10:44:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbif5 with SMTP id if5so26295739igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 10:44:35 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr5877043igt.5.1444844675020; Wed,
	14 Oct 2015 10:44:35 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 14 Oct 2015 10:44:34 -0700 (PDT)
In-Reply-To: <CAP9ODKofedBS83=fKmPk_GyfV09UTUPRDxcCPgy7dAtozjsSUg@mail.gmail.com>
References: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
	<CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
	<CAHiDW_G10f50vzvQGWvnCc=2ztB0QLLTNrxDMLB-K9p6Wd=KUw@mail.gmail.com>
	<CAP9ODKofedBS83=fKmPk_GyfV09UTUPRDxcCPgy7dAtozjsSUg@mail.gmail.com>
Date: Wed, 14 Oct 2015 14:44:34 -0300
Message-ID: <CAP9ODKo6AW5TYN640O86cPXj94_P48nETaNpU1f9OJRVKj+iiQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error due GTK+3 new rdepends on libgl
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
X-List-Received-Date: Wed, 14 Oct 2015 17:44:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 14, 2015 at 9:54 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Oct 14, 2015 at 4:31 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>> On 14 October 2015 at 00:42, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>>
>>> On 13 October 2015 at 22:32, Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> wrote:
>>>>
>>>> This includes a forced rdepends on libgl and I see no reason for this.
>>>
>>>
>>> Mainly because gtk3-demo will link to libGL.so on startup.
>>>
>>> It would be interesting to see what happens on platforms where libgl.so
>>> isn't available if you remove the dependency.  If GTK+ handles that
>>> gracefully then we can make the rdepends conditional on DISTRO_FEATURES.
>>
>>
>> If dlopening libGL.so.1 fails, gtk3-demo will not run. I'm sure it's
>> possible to patch it to fail gracefully (after all GL is only needed for one
>> demo out of many) and I would guess upstream would take that as well, but
>> for now I just did the minimum required to get the current dependencies
>> correct in the recipe.
>
> In worse case, it would be a RRECOMMENDS. Anyway fixing it seems the
> best way to handle this IMO.

This also breaks the generation of images using Wayland but no X11.
This fails with mesa:

configure:
        prefix:          /usr
        exec_prefix:     /usr
        libdir:          /usr/lib
        includedir:      /usr/include
        OpenGL:          yes (ES1: yes ES2: yes)
        OSMesa:          no
        DRI platform:    drm
        DRI drivers:     swrast
        DRI driver dir:  ${libdir}/dri
        GLX:             no
        EGL:             yes
        EGL platforms:   drm wayland
        EGL drivers:     builtin:egl_dri2
        llvm:            no
        Gallium:         no
        Shared libs:     yes
        Static libs:     no
        Shared-glapi:    yes
        CFLAGS:          -O2 -pipe -g -feliminate-unused-debug-types
-fno-omit-frame-pointer -Wall -std=c99
-Werror=implicit-function-declaration -Werror=missing-prototypes
-fno-strict-aliasing -fno-builtin-memcmp
        CXXFLAGS:        -O2 -pipe -g -feliminate-unused-debug-types
-fno-omit-frame-pointer -fvisibility-inlines-hidden -Wall
-fno-strict-aliasing -fno-builtin-memcmp
        Macros:          -D_GNU_SOURCE -DNDEBUG -DHAVE_XLOCALE_H
-DHAVE_SYS_SYSCTL_H -DHAVE_STRTOF -DHAVE_DLOPEN -DHAVE_POSIX_MEMALIGN
-DHAVE_LIBDRM -DHAVE_LIBUDEV -DHAVE_ALIAS -DHAVE_MINCORE
-DMESA_EGL_NO_X11_HEADERS
        PYTHON2:         python2
        Run 'make' to build Mesa

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

