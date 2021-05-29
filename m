Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.22911.1622308589134141840
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 10:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gDrSvRn3;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id m8-20020a17090a4148b029015fc5d36343so4291969pjg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lvwtDNeTpGger+UjkxYG8/ebSpmesWzNmvHsIKjHKbI=;
        b=gDrSvRn3GwVA4hvHSmMPzbFB7bpXegexBo5gPvj20BVMD7clp5/Dd9Zy9ewiXb0D1A
         io8+GQ4+hZOHn9Sr9svaVvjYmISJQKGPcHcGRfbniHuJV38TBvi2Pu9KGYrtUZq+n8zC
         FXe6l4jxf3CjOyLp6iBdd5yctZNQM+gHet+QsSfiVI6S6LFAbBcLtANZSM9zPvfBilRl
         Pi6YgQWhhM6mrrrdx9PRo+3qS2QvYJGs/4wAr9KXhBnNfI2/X2lbhJo+Y3glWLptAjxl
         RWRGYa6a7uUV1oWjLIGwUHS0+j3bYVa+NDMPGqFHbumLvl66m0sQyAW8xh0mFlVelxjT
         vabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lvwtDNeTpGger+UjkxYG8/ebSpmesWzNmvHsIKjHKbI=;
        b=gxe5xw54120kP4ZG/vYAlGxb4nZEnSOHy/NdjB7LqYYS4tVZEuCZ7BfpQF1efvWVz8
         CPPZPEhX4Zl+2UQ6lUDmrrsMypwmdfA3meiTM8f9xmj9j+gxyCrfP6c7DJtQVLNfFaZn
         W7et5BLaN3oe4g4gpBnfDONmmKushFB2sQL/9j4AQcPUGnXrjkpg3C9ycpmwxace108I
         5DeBXOylBV4LOgJx2eGUazFpF69ha5M3ijFMJDOTIrNTVnJytgeGn1fGpbSUXnR/KPUB
         fCJsBNeGluTfetExSWwdA5kQ0FfLevS26c23NxMP+Xw4eE7SD1uoY5rcPRwuYgk5nxoh
         zVBQ==
X-Gm-Message-State: AOAM533QM+D+f++XKj+MGVRkrVOkgEQxVWO5WuBPhAN4F4YL/nCPLoYv
	+J5GdQHjcezEJMB3GkJ+qxjITcKWnpBu/w==
X-Google-Smtp-Source: ABdhPJxlvuMtbQTIHJ/3w1sBfnu/GulW5kou6hFvYUpXAZJERZjbxwIYq9OjDc0R9vadyNxVCsLrXA==
X-Received: by 2002:a17:902:f543:b029:f3:bfca:21b4 with SMTP id h3-20020a170902f543b02900f3bfca21b4mr13194967plf.6.1622308587991;
        Sat, 29 May 2021 10:16:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:69a6:1b71:6b06:2b49? ([2601:646:9200:a0f0:69a6:1b71:6b06:2b49])
        by smtp.gmail.com with ESMTPSA id k9sm7404495pgq.27.2021.05.29.10.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 May 2021 10:16:27 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20210524152106.4160032-1-raj.khem@gmail.com>
 <CAAnfSTvgOiJ5hvG41fTqW3XD73bBB5nJOG7FaySPzspcGOj1bg@mail.gmail.com>
 <CAMKF1soOUcqa6huRjbn5QgP0hkBaFafS2PkgWHbVazW4R0NRnQ@mail.gmail.com>
 <1682A83F9B9CCAC9.4904@lists.openembedded.org>
 <1682ACF8BD246772.22476@lists.openembedded.org>
 <CA+chaQcM29+vxUJnydStiWLTKbTkOW=2z70eNESGM4_boEG=ww@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH v2] gcc: Update to latest on release/gcc-11 branch
Message-ID: <9444ad2b-78e6-9aa8-4007-bf92188f5ba6@gmail.com>
Date: Sat, 29 May 2021 10:16:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CA+chaQcM29+vxUJnydStiWLTKbTkOW=2z70eNESGM4_boEG=ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 5/29/21 6:09 AM, Martin Jansa wrote:
> It's not directly caused by this upgrade, but it revealed interesting 
> issue in incremental builds.
> 
> This is just to document some reproducible cases of "random build issues 
> which magically disappeared after -c clean".
> 
> Building in the same TMPDIR with this gcc upgrade resulted in syslinux 
> and libvpx failing with couple errors like:
> 
> make[4]: Leaving directory 
> '/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/tools'
> make[4]: *** No rule to make target 
> '/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stdarg.h', 
> needed by 'zlib/adler32.o'.  Stop.
> make[4]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory 
> '/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/lib'
> make[3]: *** 
> [/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/Makefile:7: 
> lib] Error 2
> make[3]: Leaving directory 
> '/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32'
> make[2]: *** 
> [/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/Makefile:347: 
> install] Error 2
> make[2]: Leaving directory 
> '/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios'
> make[1]: *** 
> [/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/Makefile:257: 
> bios] Error 2
> make[1]: Leaving directory 
> '/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2'
> make: *** [Makefile:102: install] Error 2
> ERROR: oe_runmake failed
> 
> Rebuilding from scratch fixes the issue and the 11.1.0 directory was 
> referenced in many *.o.d files:
> 
> --- 
> 6.04-pre2-r1-broken/syslinux-6.04-pre2/bios/com32/libupload/.upload_srec.o.d 
>         2021-05-24 09:56:57.390268171 +0200
> +++ 
> 6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/libupload/.upload_srec.o.d   
>      2021-05-29 14:12:45.670506782 +0200
> @@ -7,7 +7,7 @@
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/bitsize32/stddef.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdio.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdarg.h 
> \
> - 
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stdarg.h 
> \
> + 
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stdarg.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/inttypes.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdint.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/bitsize/stdint.h 
> \
> 
> I don't see any easy way how to force them to be regenerated when gcc 
> was upgraded.
> 
> syslinux uses plain Makefiles and do_configure tries to clean with;
> oe_runmake firmware="bios" clean
> 
> Similarly libvpx doesn't use autotools bbclass, but calls configure/make 
> manually so also doesn't take advantage of separate B directory and 
> removing it before re-executing do_configure.
> 
> -- 1.8.2-r0-broken/git/vpx_scale/generic/vpx_scale.c.d 2021-05-24 
> 09:29:44.916405487 +0200
> +++ 1.8.2-r0/git/vpx_scale/generic/vpx_scale.c.d        2021-05-29 
> 14:12:39.234539166 +0200
> @@ -10,7 +10,7 @@
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/long-double-64.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/gnu/stubs.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/gnu/stubs-64.h 
> \
> - 
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stddef.h 
> \
> + 
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stddef.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/waitflags.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/waitstatus.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/floatn.h 
> \
> @@ -49,7 +49,7 @@
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/stdlib-float.h 
> \
>    vpx/vpx_integer.h \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/inttypes.h 
> \
> - 
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stdint.h 
> \
> + 
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stdint.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/stdint.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/wchar.h 
> \
>    
> /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/stdint-uintn.h 
> \
> 
> Any ideas how to detect and prevent this kind of issues in some generic 
> way so that we don't need to explicitly fix the recipes? 
> Bumping tmp-glibc/abi_version on every minor gcc upgrade also seems a 
> bit overkill (as gcc upgrades might not be the only source of these kind 
> of issues anyway).

This is in the packages which try to generate and use dependency 
tracking. This kind of automatic dependency tracking relies on compiler 
to compute this information but only after compile has happened so it 
slows down the build too. autotools has it tooled during configure if 
--enable-dependency-tracking is passed then it will check and update 
these dependencies in incremental compile, So for one set of recipes 
which use autotools we can enable this option, although it has build 
time penalty, how much I don't know.

for other build systems also there must be similar tools

Although, I would say that having a knob to trigger world rebuilds is 
perhaps a fine approach for such changes, since we will  spend time 
everytime otherwise.

> 
> Regards,
> 
> On Wed, May 26, 2021 at 7:10 PM Martin Jansa via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <Martin.Jansa=gmail.com@lists.openembedded.org 
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     On Wed, May 26, 2021 at 5:43 PM Martin Jansa via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <Martin.Jansa=gmail.com@lists.openembedded.org
>     <mailto:gmail.com@lists.openembedded.org>> wrote
> 
>         I'm seeing different error with gcc-sanitizers and this new
>         revision:
> 
>         work-shared/gcc-11.1.0-r0/gcc-11.1.0/libsanitizer/lsan/lsan_common_linux.cpp:164:25:
>         error: invalid conversion from 'void (*)(void*)' to 'void*
>         (*)(void*)' [-fpermissive]
> 
>         will double-check if it was introduced by this upgrade or
>         something else in oe-core master update today and also if there
>         is a fix in even newer gcc already.
> 
> 
>     Sorry for noise, this line of code comes from our local patch and
>     the upgrade just started triggering this issue in it.
> 
>     
> 
