Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D05A71AB4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:18:03 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h19so3451376pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FbkBv1TfU9N4EG5As6JCM0HaNlKtaktNTZq6Uc3VnyQ=;
	b=os747KjUu0SMFDNQaECBV4Bwnynz0lHHxXLDB6jOpiL4j4OOa7pbL+zRIl0Fy+VteA
	8YWIGwQMlXD0jQ6g9Fw+l0Lt/ipGQ5A8WoiLKDTP5j9ejJpI5cqh3BsWZzNo22yKwmjc
	ZPeaBfFJ8B2KVU0n0xzQqMgXOWQWTNP3YjiiVu8bvHWixtKjvmCnb0upyQ5syfwVWz1W
	GflawY/GeRImYHNIh8WgfT5ctX7rU5C27xwqyKZ/I92w1r29d2xa1Dn8AEjJML0DgkXX
	N5V6PiFvwFulALMK1uNSL6EHysbS0ztXW3g4MgXWfoVbKiUoI1s1llkQ7OCp4zmkxqtl
	409g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FbkBv1TfU9N4EG5As6JCM0HaNlKtaktNTZq6Uc3VnyQ=;
	b=OTdj/eDqjf0GBDsbPH15dCBq5MksXiW2X3SbMhRFOnEoPqAxrSNI4zEhqyxsgtHc5Z
	RdwPSxj6D9qeHSt3cpi5psuJIJgD9La76t005SNnC85PEvAFxevR5TDZmGqbjulqPYa6
	ANXH6pkmEhpU3x4Q0HfSNAvTAoyjZ0Avyvn9DFANVeFiwmmHU96JLzQ2Cp2s+6L9l40f
	yuXbFJlit+9xQ1ZvdXMDE3wLdORzDGP24rHBDGJ6LMuyfM1+H/9ZqRXDjp+ykYthlWoy
	js7QVzTi2vrjlsI72fSzQiZGWTT+++oyhPHMvrGsVt6pCuIi76jUf/xvvE2UUe8ITqk/
	0Z4w==
X-Gm-Message-State: APf1xPB9lQYzb7dB5o82pRQJKLRKB+sc9tFuFuIPi1B9FZChhGcHoyM1
	CqySjy+iwk8RPSwCuvpl9VrqfFJTP0ofCalj+oc=
X-Google-Smtp-Source: AG47ELtxNEsTzGJahUJiehI0u60MqCjZuqkQ21ehrKpKuYOm/L3eYJ++q+S5cvqgz1bgP6L9z/c+7TRGCBgj0cdhUZA=
X-Received: by 10.101.97.175 with SMTP id i15mr5115442pgv.55.1520014684407;
	Fri, 02 Mar 2018 10:18:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Fri, 2 Mar 2018 10:17:33 -0800 (PST)
In-Reply-To: <CADkTA4N-3yhfgrPD6H1dDv7TuuXLUR35mwNOyAEf_GGdW88_TQ@mail.gmail.com>
References: <20180221031249.43075-1-raj.khem@gmail.com>
	<40f962d3-b902-3ed0-33e6-a9c00e88e93a@linux.intel.com>
	<CAJTo0LZ_ppyEQSEn=Ga5d-r3PxD=1-O47r=q=sCmupGWpRRjCA@mail.gmail.com>
	<CADkTA4N-3yhfgrPD6H1dDv7TuuXLUR35mwNOyAEf_GGdW88_TQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Mar 2018 10:17:33 -0800
Message-ID: <CAMKF1sqmCCjhjRnOVEuOaPMWBt0jTWoHMQVsp_KS+ezE+ucM7A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Fri, 02 Mar 2018 18:18:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 1, 2018 at 8:47 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Thu, Mar 1, 2018 at 11:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Filed a bug for this:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12577
>
> Thank goodness this was discussed on the list. While trying to test my
> new kernel-devsrc package
> against musl, I was running into this same error for at-spi2-core, and
> I was at a loss to explain it.
>
> I've tried reverting the binutils update locally in the hopes I'll get
> a working build.
>

I am able to reproduce it as well.  I am trying to narrow it down further
seems a regression in ld thus far.

> Bruce
>
>>
>> On 1 March 2018 at 09:43, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>>
>>> On 02/21/2018 05:12 AM, Khem Raj wrote:
>>>>
>>>> Additionally cherry-pick
>>>>
>>>> 5ffeba4a09 Revert "PowerPC PLT speculative execution barriers"
>>>> b01452b1d4 [PR22764][LD][AARCH64]Allow R_AARCH64_ABS16 and
>>>> R_AARCH64_ABS32 against absolution symbol or undefine symbol in shared
>>>> object.
>>>> a985e9b9de Import patch from mainline to remove PROVODE qualifiers around
>>>> definitions of __CTOR_LIST__ and __DTOR_LIST__ in PE linker scripts.
>>>> eec4607fc5 Add support for DWARF-4 line number tables.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>>
>>>> - Backport fixes for aarch64 relocs
>>>> - ppc plt fix, dwarf-4 line number support and linker script fix for
>>>> removing PROVODE
>>>>
>>>> Changes in v3:
>>>> - None
>>>
>>>
>>> I did some bisection and unfortunately this cases breakage when musl,
>>> systemd and gobject introspection are all enabled:
>>>
>>> | i586-poky-linux-musl-libtool: link: i586-poky-linux-musl-gcc -m32
>>> -march=i586 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>> -Wformat-security -Werror=format-security
>>> --sysroot=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot
>>> -o
>>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/.libs/Avahi-0.6
>>> -O2 -pipe -g -feliminate-unused-debug-types
>>> -fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0=/usr/src/debug/avahi/0.7-r0
>>> -fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot-native=
>>> -fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot=
>>> -std=c99 -Wall -W -Wextra -pedantic -pipe -Wformat -Wold-style-definition
>>> -Wdeclaration-after-statement -Wfloat-equal -Wmissing-declarations
>>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>>> -Wmissing-noreturn -Wshadow -Wendif-labels -Wpointer-arith
>>> -Wbad-function-cast -Wcast-qual -Wcast-align -Wwrite-strings
>>> -fdiagnostics-show-option -Wno-cast-qual -fno-strict-aliasing
>>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/Avahi-0.6.o
>>> -Wl,--export-dynamic -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>> -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now
>>> -Wl,--export-dynamic  -L. ./.libs/libavahi-gobject.so
>>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-client/.libs/libavahi-client.so
>>> -ldbus-1 -ldl
>>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-glib/.libs/libavahi-glib.so
>>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-common/.libs/libavahi-common.so
>>> -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -pthread
>>> | Error relocating
>>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0:
>>> __start_BUS_ERROR_MAP: symbol not found
>>> | Error relocating
>>> /home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0:
>>> __stop_BUS_ERROR_MAP: symbol not found
>>>
>>>
>>>
>>> Alex
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

