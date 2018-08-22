Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4FA1792A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:33:50 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p10-v6so1463887ljg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h2Yub5D9dj3KZol6gsw8qt7VgWMm49+Wh7jJOysXjIY=;
	b=pVGFYhHG1fcwvRd9ZLfmuWPa7vfGbKzhSh8ah8lYBaOnbQVBqViD/A5p+1xMNJW4Ec
	oOPT1KSXczgzFdYGekk1D5wA4+fcxlsdJcUmbyq5EE8J7xz9MnW9UOAgXrH0AGryfyim
	M7faDZBeYrfT3NRStg5n8z2JLzeNdaYM19Gk7OwFmHaFvumcfCHykj2aazyu7dtsSY1v
	uRqxEqQ32K1qNuVGCYVG1bUj98qD3TFwXMBXGKGb6VncMydXwnmsTsEOm779KaRblHMB
	g/yCt1mi+l9yMABl1nLKFOdrukb0TLMcOlkQH52rwMXV27wLstKJB/K2YUdynElHFX+U
	QClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h2Yub5D9dj3KZol6gsw8qt7VgWMm49+Wh7jJOysXjIY=;
	b=RyWWPtdkCcot+ZHnT6Q7RqgsDkHDoYpVl4iJw9Y+seL5Xo1XrWWZZaMWc+BLIvLHaS
	ZvEV+wyqHE3S0NFSR2HSrfg4d1FxwUoqs5erGl4m445TjWtudD5RhhdoXlZooZo1s16v
	T6fvJz+JJoJOxgUc4w7++9wILKCdrmGZfKau+mBjLXApEaCqkLwiAfgGfqyvgoCQe7Oy
	b9qofdlXSg055KI6kjO059drDffweCX/aHEAhG0ZlHgjmv8dZZBlZS7ZmwS6bNKpdHY0
	gbnHyN6TL3YhQuE/VkX1zS7nVEgEYJ+ouPV8FSBQwAWkRE/jdPIEs6jv4kqKK1E5k3ML
	WdhQ==
X-Gm-Message-State: AOUpUlEpe9Hr6QjFrOUbnUmTc9HNYWs+yL/oyWXnkbxk3jOSLvtXtiID
	h5RCxd5i2U+JJAn8H0CxMnZEZHS4lFY2WuaxB7U=
X-Google-Smtp-Source: AA+uWPz9Mwmko7PJfbfhFsh3ZiMQ0Vk2pXGs8LCcNzb0PYTkorAL+MvSsVlCGhppCW2SE2of21X977HN2ULfWjvGeKw=
X-Received: by 2002:a2e:8514:: with SMTP id
	j20-v6mr13265191lji.10.1534944831260; 
	Wed, 22 Aug 2018 06:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
	<CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
	<e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
	<CAPybu_1NAf_p0zfZSPTAbweKYunAyGL_6tLwhao-Kw6be3FX9w@mail.gmail.com>
In-Reply-To: <CAPybu_1NAf_p0zfZSPTAbweKYunAyGL_6tLwhao-Kw6be3FX9w@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 15:33:34 +0200
Message-ID: <CAPybu_0oQ2sjiVTMqXXbvTs+3dagLn8Wps5-AxYhqtjKz-9M6w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 13:33:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hello
On Wed, Aug 22, 2018 at 3:28 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> On Wed, Aug 22, 2018 at 3:21 PM <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2018-08-22 at 15:13 +0200, Ricardo Ribalda Delgado wrote:
> > > > Here I see:
> > > >
> > > > $ MACHINE=qemux86-64 bitbake glibc -e | grep ^RTLDLIST=
> > > > RTLDLIST="/lib/ld-linux-x86-64.so.2"
> > >
> > > The output of RTLDLIST that I shared was from
> > > root@qt5122:~# cat /usr/bin/ldd | grep ^RTLD
> > > RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> > > /libx32/ld-linux-x32.so.2"
> > >
> > > If I run your command
> > >
> > > pokyuser@c10753884d1a:/workdir/build$ bitbake glibc -e | grep
> > > ^RTLDLIST=
> > > RTLDLIST=""
> > >
> > > If we look at log.do_compile we can see how the the value from ldd is
> > > rewritten:
> > >
> > > LC_ALL=C sed -e 's%@RTLD@%/lib/ld-linux-x86-64.so.2%g' -e
> > > 's%@VERSION@%2.27%g' -e 's|@PKGVERSION@|(GNU libc) |g' -e
> > > 's|@REPORT_BUGS_TO@|<http://www.gnu.org/software/libc/bugs.html>|g'
> > > -e
> > > 's%@BASH@%/bin/bash%g' -e 's%@TEXTDOMAINDIR@%/usr/share/locale%g' <
> > > ldd.bash.in | LC_ALL=C sed -f
> > > ../sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed >
> > > /workdir/build/tmp/work/dbfp4-poky-linux/glibc/2.27-r0/build-x86_64-
> > > poky-linux/elf/ldd.new
> > >
> > > cat git/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> > > /LD_TRACE_LOADED_OBJECTS=1/a\
> > > add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
> > > s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-
> > > x32\)\(\.so\.[0-9.]*\)[
> > > ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_
> > >
> > > which basically converts
> > > /lib/ld-linux-x86-64.so.2
> > >  into:
> > >  /lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2 /libx32/ld-linux-
> > > x32.so.2
> > >
> > > I agree that this bug is too obvious for not being noticed for a long
> > > time. At least I use ldd a lot when thing fails ;)
> >
> > If you look at glibc_2.28.bb, it rewrites RTLDLIST if the value passed
> > in is not empty. Yours is empty, the question is therefore why.
> >
> > Can you add -C10 to the command and see the variable history, here its:
> >
> > # $RTLDLIST [2 operations]
> > #   set /media/build3/poky/meta/recipes-core/glibc/glibc-ld.inc:46
> > #     "${@glibc_dl_info(d)['lddrewrite']}"
> > #   override[class-nativesdk]:set /media/build3/poky/meta/recipes-core/glibc/glibc-ld.inc:47
> > #     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
> > # pre-expansion value:
> > #   "${@glibc_dl_info(d)['lddrewrite']}"
> > RTLDLIST="/lib/ld-linux-x86-64.so.2"
> >
>
>
> # $RTLDLIST [2 operations]
> #   set /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:46
> #     "${@glibc_dl_info(d)['lddrewrite']}"
> #   override[class-nativesdk]:set
> /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:47
> #     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64',
> 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
> # pre-expansion value:
> #   "${@glibc_dl_info(d)['lddrewrite']}"
> RTLDLIST=""
> #
>
> # $RTLDLIST_class-nativesdk
> #   set /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:47
> #     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64',
> 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
> RTLDLIST_class-nativesdk="/lib/ld-linux-x86-64.so.2"
>
>
> I have just upgraded my work build to 19.0.1 / 2.5.1 Let me build ldd
> again to see if the problem still persists

19.0.1 gives the same results as 19.0.0


RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
/libx32/ld-linux-x32.so.


> > Cheers,
> >
> > Richard
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

