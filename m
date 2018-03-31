Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 63C4B74723
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 21:03:00 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id y46-v6so12458607otd.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GoWDgz0SNgwtKkUqqYgWz3tU4CFQAmM5W4KbKtMx/1A=;
	b=aYDvNk4t+q4GhXXxC2bzCZuKQFB3bc9PqH/U+KXURaur/TFOJrh/7HZi4/JdOycPVq
	FqNI7lbypgVj9kQEiYxaVKB4SvW9+HQ+kILdjUv84+Zv3xQd4b128aWPQ+NRMUihwfJq
	+ye9cOZmJJikFIKTHhb8BI8bbmdpnP2mXGQEWRDITyWnqqrWwCKYHYaaBDhTGkJVEzSV
	428Fa2rdESovR5FgLyhQDaIh5PYjs9BVa0OLTGtWzNxaawibY49f73QWt7cIlnu7PGse
	dp0T+46L/glZ2/5KA5w0wFDTEtr05ExNhXwVMPWg2dSbYkAVWPCvUU6FltSsFaa7uSj1
	vHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GoWDgz0SNgwtKkUqqYgWz3tU4CFQAmM5W4KbKtMx/1A=;
	b=ZYkz7OpblORo6I2Ojfcz683fFNVwLz+MM/iU5yCYRgew/R/XQ2w6O8tZ56ptDi4kja
	ZwAhfv49puhQ6orK+vb7L9NbhMZ5pguAQzQ9d0PoTGutRwViFSgV05CZ4KkSU+ke5C54
	4jRc242lBnwtjS0h0Lf6hYXG0VmF47z8v4vj2x93nETMZverHQfuexaqGWpfXyG61GXC
	j+XERnaji80DNJKNcllkuRyI8Hhk2+oSAJqiLFRbg5y6VIfN+Fe2xguDJ7Fd9A4gSq2a
	FAmecDn02PJvLZqjmLwpcKLS0T21eEEFjoeZtWkc4+QK1xz0DSEJV0HfAaKq3MTVFE+j
	9cuQ==
X-Gm-Message-State: ALQs6tBeu21izrBvFUVE1DDy37wAUIJ5p6E+mFm6xFmMri85tZWdsRcG
	upUP5LKSSFriu97b3fqD8iAheojC/0L5QLlMxJ0=
X-Google-Smtp-Source: AIpwx4+rZXfQvA6X/aJ4IsvSLbniubMS+h25QJ+apcyT5cCUZLsUGaUhdY7Kj18qIubGB7FEUr2+h/I7ISNjAyxwEs8=
X-Received: by 2002:a9d:7083:: with SMTP id
	l3-v6mr2502775otj.375.1522530181961; 
	Sat, 31 Mar 2018 14:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4c83:0:0:0:0:0 with HTTP; Sat, 31 Mar 2018 14:03:01
	-0700 (PDT)
In-Reply-To: <1522501975.11431.208.camel@linuxfoundation.org>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
	<CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
	<20180331000631.5f050451@seebsdell>
	<1522501975.11431.208.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 31 Mar 2018 16:03:01 -0500
Message-ID: <CAJdd5GZ8kS3fcB9j1U8bqOjM3wjc6qAizwOw7-E_ry3wOrPGSQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Sat, 31 Mar 2018 21:03:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 31, 2018 at 8:12 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Just to report back, I've tried testing an earlier version of pseudo
> master with the path changes reverted and current master. With both I'm
> seeing librsvg fail during do_install with a segfault (you have to
> remove the 2> /dev/null to see it).
>
> I'm seeing multiple entries in the host's dmesg:
>
> [180364.269879] glib-compile-re[38258]: segfault at 0 ip           (null) sp 00007ffffaafbf78 error 14 in glib-compile-resources[55abc201b000+9000]
> [180376.499904] glib-compile-re[46860]: segfault at 0 ip           (null) sp 00007ffd3b10f2c8 error 14 in glib-compile-resources[55b2cb528000+9000]
> [180376.612404] glib-compile-re[46862]: segfault at 0 ip           (null) sp 00007fff612977f8 error 14 in glib-compile-resources[55ad08797000+9000]
> [180376.726317] glib-compile-re[46864]: segfault at 0 ip           (null) sp 00007ffdce018928 error 14 in glib-compile-resources[5610851ec000+9000]
> [180376.836705] glib-compile-re[46866]: segfault at 0 ip           (null) sp 00007ffc586fdda8 error 14 in glib-compile-resources[562f38dfc000+9000]
> [180603.294668] gdk-pixbuf-quer[51620]: segfault at 0 ip           (null) sp 00007ffce7947fe8 error 14 in gdk-pixbuf-query-loaders.real[55b88bb7f000+2000]
> [185206.227285] gdk-pixbuf-quer[51885]: segfault at 0 ip           (null) sp 00007ffe6393ae28 error 14 in gdk-pixbuf-query-loaders.real[556db9ae3000+2000]
> [186523.735264] gdk-pixbuf-quer[70272]: segfault at 0 ip           (null) sp 00007fff6a855808 error 14 in gdk-pixbuf-query-loaders.real[55ec4e8fd000+2000]
>
> I believe that libglib-2.0 does use syscall() for something and that
> the above programs are calling into it and faulting.
>
> Its likely possible to reproduce this outside of a build by running
> make install from librsvg under pseudo.
>
> If I take master and revert 778abd3686fb7c419e9016fdd9e93819405d52aa fr
> om pseudo, it no longer segfaults.
>
> So something is not working correctly with the intercept sadly.

I had a little time and it was easy for me to reproduce this. It looks
like real_syscall in pseudo is still NULL meaning it wasn't
initialized:

$ coredumpctl gdb -1
...
Core was generated by
`/home/jwatt/Development/poky/build/tmp/work/i586-poky-linux/librsvg/2.40.20-r0/'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x0000000000000000 in ?? ()
(gdb) bt
#0  0x0000000000000000 in ?? ()
#1  0x00007f1c013debfb in syscall (number=140726086677920) at
ports/linux/pseudo_wrappers.c:71
#2  0x00007f1c0071737f in g_once_init_leave ()
   from /home/jwatt/Development/poky/build/tmp/work/i586-poky-linux/librsvg/2.40.20-r0/recipe-sysroot-native/usr/lib/gdk-pixbuf-2.0/../libglib-2.0.so.0
#3  0x00007f1c009c615d in g_value_array_get_type ()
   from /home/jwatt/Development/poky/build/tmp/work/i586-poky-linux/librsvg/2.40.20-r0/recipe-sysroot-native/usr/lib/gdk-pixbuf-2.0/../libgobject-2.0.so.0
#4  0x00007f1c009d7478 in ?? () from
/home/jwatt/Development/poky/build/tmp/work/i586-poky-linux/librsvg/2.40.20-r0/recipe-sysroot-native/usr/lib/gdk-pixbuf-2.0/../libgobject-2.0.so.0
#5  0x00007f1c009c41ac in ?? () from
/home/jwatt/Development/poky/build/tmp/work/i586-poky-linux/librsvg/2.40.20-r0/recipe-sysroot-native/usr/lib/gdk-pixbuf-2.0/../libgobject-2.0.so.0
#6  0x00007f1c01628f8a in ?? () from
/home/jwatt/Development/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
#7  0x00007f1c01629096 in ?? () from
/home/jwatt/Development/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
#8  0x00007f1c0161b06a in ?? () from
/home/jwatt/Development/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
#9  0x0000000000000002 in ?? ()
#10 0x00007ffd58684fd4 in ?? ()
#11 0x00007ffd58685069 in ?? ()
#12 0x0000000000000000 in ?? ()
(gdb) p real_syscall
$1 = (long (*)(long, ...)) 0x0

I'm not very familiar with the internal of how pseudo works, but
adding this to the beginning of the syscall wrapper function in
ports/linux/pseudo_wrappers.c fixed it for me (no idea if this is the
"right" fix):

    if (!pseudo_check_wrappers() || !real_syscall) {
        /* rc was initialized to the "failure" value */
        pseudo_enosys("syscall");
        PROFILE_DONE;
        errno = ENOSYS;
        return -1;
    }

Looks like maybe gdk-pixbuf-query-loaders has the unlucky honour of
being one of the few programs that invokes the pseudo syscall()
wrapper before any other functions that pseudo wraps and the missing
initializer made it explode?

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

