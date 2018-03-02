Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 56D6760616
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 04:47:10 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id y19so11614201lfd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 20:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/A+Byv3laqVzYRJ9tTzF3IRhfTOqXX/l/jirKyXDi0g=;
	b=QhKE/avf0s+GF0p3MR6jfntgA2HodD9nuVSjJCG/RLL01gC87clss9QjGrzRSRUuTg
	cvy8DIIFc7dFHKaXMKd5LMyrNHNx6R/3/bbPN++m7bNmVrKNQFoC1YrJyjPVeZ18SQcb
	snKJyM7trxzvuZeKQ0kSfVej32OHXl1dqeEmui0/aQ44k0w4xc0Uuo7XjcRNrVCMJAxL
	YXrk32qNgfNPRtsJSBU/UvUz4EM86R5+qCZbj2+2dXxXz/j8r+LulfUSU60D5hDBXoaR
	QyKA1MW21r7ZWZ8Kq8VKTfdQmn7PRR9fAJN+1yKahJIB2DKvQvdKG0cNG2AWH0jZkHW1
	Vzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/A+Byv3laqVzYRJ9tTzF3IRhfTOqXX/l/jirKyXDi0g=;
	b=XPePIcsQQFYHe2ZqsROrjdd9u0PGi+5MdvOMWMATOAv7NVttpkAw0gVvvTmxbkYg+0
	Lb9k1XTarY+7n6CVnuw72r/8mYxqmkJ1XicFM5HiAhtWJKfWlwKm08Eejnz1obbudfpD
	u1Du/R960RCvdA8DC5oUcmdSFgiWr9C8boBhEPmoTAU9UN9GUIfkETAQ+iYz8PpVJHXM
	U94prc0dV7SMwYCxHxwcXuSy4WgDPxLoLimQWqVHKuCyuYX3a2oHwC432peGLevaZidV
	YZ7POaR+jKkwsMeFSqiHX5pXvK9oF94x+kWp1ls38VH54MmORQZdMIER51kn1iliE93s
	qlsw==
X-Gm-Message-State: AElRT7GyTVnOGmOkO9j1r83Qx1WfGo+cn7GlXppKHr8BYv78QY0v+S79
	XF6uOb/226JnDcvAX3TYrsWpHgZF9sr1Utw+EMo=
X-Google-Smtp-Source: AG47ELtLxtOWaasyOUfM/hCMWsVwU0tpCCQXt1yOrHh7hLZTR7oFU9FRiFEnKnwKEtjHaW8lhZZpeeNhevAK1v72C5I=
X-Received: by 10.25.92.1 with SMTP id q1mr3113642lfb.126.1519966030867; Thu,
	01 Mar 2018 20:47:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 1 Mar 2018 20:47:10 -0800 (PST)
In-Reply-To: <CAJTo0LZ_ppyEQSEn=Ga5d-r3PxD=1-O47r=q=sCmupGWpRRjCA@mail.gmail.com>
References: <20180221031249.43075-1-raj.khem@gmail.com>
	<40f962d3-b902-3ed0-33e6-a9c00e88e93a@linux.intel.com>
	<CAJTo0LZ_ppyEQSEn=Ga5d-r3PxD=1-O47r=q=sCmupGWpRRjCA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Mar 2018 23:47:10 -0500
Message-ID: <CADkTA4N-3yhfgrPD6H1dDv7TuuXLUR35mwNOyAEf_GGdW88_TQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/2] binutils: Upgrade to 2.30 release
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
X-List-Received-Date: Fri, 02 Mar 2018 04:47:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 1, 2018 at 11:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Filed a bug for this:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12577

Thank goodness this was discussed on the list. While trying to test my
new kernel-devsrc package
against musl, I was running into this same error for at-spi2-core, and
I was at a loss to explain it.

I've tried reverting the binutils update locally in the hopes I'll get
a working build.

Bruce

>
> On 1 March 2018 at 09:43, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>>
>> On 02/21/2018 05:12 AM, Khem Raj wrote:
>>>
>>> Additionally cherry-pick
>>>
>>> 5ffeba4a09 Revert "PowerPC PLT speculative execution barriers"
>>> b01452b1d4 [PR22764][LD][AARCH64]Allow R_AARCH64_ABS16 and
>>> R_AARCH64_ABS32 against absolution symbol or undefine symbol in shared
>>> object.
>>> a985e9b9de Import patch from mainline to remove PROVODE qualifiers around
>>> definitions of __CTOR_LIST__ and __DTOR_LIST__ in PE linker scripts.
>>> eec4607fc5 Add support for DWARF-4 line number tables.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> Changes in v2:
>>>
>>> - Backport fixes for aarch64 relocs
>>> - ppc plt fix, dwarf-4 line number support and linker script fix for
>>> removing PROVODE
>>>
>>> Changes in v3:
>>> - None
>>
>>
>> I did some bisection and unfortunately this cases breakage when musl,
>> systemd and gobject introspection are all enabled:
>>
>> | i586-poky-linux-musl-libtool: link: i586-poky-linux-musl-gcc -m32
>> -march=i586 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>> -Wformat-security -Werror=format-security
>> --sysroot=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot
>> -o
>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/.libs/Avahi-0.6
>> -O2 -pipe -g -feliminate-unused-debug-types
>> -fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0=/usr/src/debug/avahi/0.7-r0
>> -fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot-native=
>> -fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot=
>> -std=c99 -Wall -W -Wextra -pedantic -pipe -Wformat -Wold-style-definition
>> -Wdeclaration-after-statement -Wfloat-equal -Wmissing-declarations
>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>> -Wmissing-noreturn -Wshadow -Wendif-labels -Wpointer-arith
>> -Wbad-function-cast -Wcast-qual -Wcast-align -Wwrite-strings
>> -fdiagnostics-show-option -Wno-cast-qual -fno-strict-aliasing
>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/Avahi-0.6.o
>> -Wl,--export-dynamic -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now
>> -Wl,--export-dynamic  -L. ./.libs/libavahi-gobject.so
>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-client/.libs/libavahi-client.so
>> -ldbus-1 -ldl
>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-glib/.libs/libavahi-glib.so
>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-common/.libs/libavahi-common.so
>> -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -pthread
>> | Error relocating
>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0:
>> __start_BUS_ERROR_MAP: symbol not found
>> | Error relocating
>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0:
>> __stop_BUS_ERROR_MAP: symbol not found
>>
>>
>>
>> Alex
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

