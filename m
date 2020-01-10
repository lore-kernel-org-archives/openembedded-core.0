Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2B1B7FCEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 15:23:01 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v3so2478724ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=JLXE1DMtriIddyg4CDJzwJDyCf7u1b+pDmEQOK2QkXI=;
	b=WK95PVEsEACy2iADAd1Lr1JepZUhDTjT32d5nhckMYR537zgWrRno7AM+BJwuO+KTD
	KDD9Yx5sDSCoDT6gWT3xDtxH6rUaJbabdhqJeA63+nbdvzG4Jk+uFMAIXGP77T/CBg9d
	aAbSqUqnGABq4Vm6ZK9i5ovpoIt8iPI3AiUmDVvjpw1ehMdggAitcaoihILELeaxGFjr
	BlexgI1aqgNthgffdFk4liFAmNBmDIHaQ1cQ7rA7LVRiCKRmXBWCYFHCRVma4rJ0NcVg
	oVxPH4ThqmeLvD358hOd6bflUrwsm4ZNtorixLUr+utkneP1He4vJ2x+jHhttCq2NTCa
	HviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=JLXE1DMtriIddyg4CDJzwJDyCf7u1b+pDmEQOK2QkXI=;
	b=fT23LMUPK/8DgC4pAejHyQybcdnE5rhq8oESFFhZoHeF3AkQDSJu5pZ83iGmihkQfn
	+nBu1qemCe48jHus6irFi0N3fAhCxAfjvGwXTOPk+PFu/v0szIRVmaXc/QnIS21+Zohe
	i4W3FM8YDev6UpC6aZcTXKHeU8UlEesus70CajyTMrTjvz1ODGEh+RsfIjz3ADvJPvGt
	rVipnUjuS951ZN2jyfEcepduabKGnERSPrgB+Sqw93ULWgns9sSj0N2JaTKOJDZd3lmj
	/TfZcbxuIBoqwSt8nGoofbgE7CFp4p58AGSGQtgmQ0MsST8/RrLoo9ofFPXIapo38hH2
	Z6lA==
X-Gm-Message-State: APjAAAWrYUZHPjKHTGAKJh6mCCS31kh1wLwTrP/SGKcCstUBVBwzyoDm
	JsfDdeEBcKOyW/yl9gySztBriasb
X-Google-Smtp-Source: APXvYqxN0GJbuMoh/6uHoLIgZyx1VodY23/Z9RZdeZSu18ISooMg2yo5d418+ngoXtLGoUmeFEelfg==
X-Received: by 2002:a6b:dd02:: with SMTP id f2mr2900658ioc.304.1578669782168; 
	Fri, 10 Jan 2020 07:23:02 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id n17sm754410ile.68.2020.01.10.07.23.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 10 Jan 2020 07:23:01 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <20191205222617.31872-1-pkj@axis.com>
Message-ID: <df22f3c3-1f02-4ea6-3881-8ecca3ee655b@gmail.com>
Date: Fri, 10 Jan 2020 09:23:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191205222617.31872-1-pkj@axis.com>
Subject: Re: [master][zeus][PATCH] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Fri, 10 Jan 2020 15:23:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/5/19 4:26 PM, Peter Kjellerstedt wrote:
> Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
> part of the code licensed as GPL-3.0, and which is normally packaged
> separately in cairo-perf-utils). By disabling this, we can adapt the
> licenses for cairo-dbg and cairo-src so that they do not include
> "GPLv3+" when trace is disabled and thus they can be used also when,
> e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.

Thanks for this, it fixes a build error I was experiencing. However, 
when I apply this patch locally for testing, I get QA errors saying that 
the "/usr/bin" and "/usr/lib/cairo" directories aren't part of any 
package. It looks like these directories are empty when trace is 
disabled and should be removed in do_install ?


>
> The "trace" PACKAGECONFIG is enabled by default for backwards
> compatibility.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   meta/recipes-graphics/cairo/cairo_1.16.0.bb | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index e3de3f6164..36a7b3c180 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -17,6 +17,10 @@ LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
>   LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
>   LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
>   LICENSE_${PN}-perf-utils = "GPLv3+"
> +# Adapt the licenses for cairo-dbg and cairo-src depending on whether
> +# cairo-trace is being built.
> +LICENSE_${PN}-dbg = "(MPL-1.1 | LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '', d)}"
> +LICENSE_${PN}-src = "(MPL-1.1 | LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '', d)}"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>   
> @@ -40,7 +44,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>   
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
> +                   trace"
>   
>   PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>   PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> @@ -49,6 +54,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
>   PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
>   PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
>   PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> +PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
>   
>   EXTRA_OECONF += " \
>       ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \

