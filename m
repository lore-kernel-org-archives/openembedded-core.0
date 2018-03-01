Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 00E9B7889F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 16:44:25 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id n128so8699311ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wzVgHEt3QaO3ceVqv3PakqRLAV9g2ij67G+8tH5x7hE=;
	b=jJndGQmwD2frpZ52qaBj5iQsJI5S61wfJLQBo2C9sJESlY5b/GTSYtHBwOwt7eYIuc
	WAaSdY73vd4/LMopG+pJK9y7/GD7kumkNJLAIg9KcnHbD0Z+li24ddoB7G0Il150FQJ7
	KumM3m7kbVEqLkL4MbQME49suAP3rrtG7cwYXr0L6pZW8csiEc4V1EgoqmoPpEjE1k3B
	GcwIRNRed2/yR0FEo+S8FEvu5rWXNvekPPnJ+sbohoFuiSENbcx8X3qoEqdTpBJt/nSE
	WcXtlJHimgap4deIn8DFdb/kxMAybNbt6SrNEqsYKkmavjzCwmJIjoUR+XYEjrBAIXxS
	o8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wzVgHEt3QaO3ceVqv3PakqRLAV9g2ij67G+8tH5x7hE=;
	b=JF9RbhgM4rcuPoqEaOyZdAca0I7RbvPvpxccY5RIj3orfOOaYEadO/VZhBjtHiwCZR
	GpcSuHyUwPykmrV5mqGFeQoa+yZaH2GCgxsJDPLLzFU9cAZInVUqRZrOd1Xh6TJm9z54
	RbLaPKKd7MbEJ0fFcjR6NNHAfzGpWpfSlKLguDW6tBG2IA7mFhWIzObtjRFYcZtFsCCL
	wHo1N7xSAutgTRxlZHvdYbESGZVRTqDDRqkgiltCx380YtvM/1XK+FC+nFpWVx2y5Hy1
	pPe3DJlYyZRquRyAcQAFi0HSyO1vJwbQySr1acwSg6xpZ13DydsZAVt9v9tF815SdaNc
	Xwrw==
X-Gm-Message-State: APf1xPAn33sRpAzYD/pa6QMU33hsHqLFbPt3uonBG2leOHOlBjrZXek0
	Jg1rplIi/mL4oAbmvXsIlkeiK69YvrXy2PqsNX+xQQ==
X-Google-Smtp-Source: AG47ELt3lLeDjW4ZXl4o1HplUgCrv9UdzRLkBcgXV6jw31mgnXraMy/NvN+wm/6gSbZpvV6HMEeSNV8lbYRGVdOrPXw=
X-Received: by 10.36.66.195 with SMTP id i186mr3522656itb.45.1519922667089;
	Thu, 01 Mar 2018 08:44:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 08:44:06 -0800 (PST)
In-Reply-To: <40f962d3-b902-3ed0-33e6-a9c00e88e93a@linux.intel.com>
References: <20180221031249.43075-1-raj.khem@gmail.com>
	<40f962d3-b902-3ed0-33e6-a9c00e88e93a@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 16:44:06 +0000
Message-ID: <CAJTo0LZ_ppyEQSEn=Ga5d-r3PxD=1-O47r=q=sCmupGWpRRjCA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
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
X-List-Received-Date: Thu, 01 Mar 2018 16:44:26 -0000
Content-Type: multipart/alternative; boundary="001a113b8804a88bd205665c9221"

--001a113b8804a88bd205665c9221
Content-Type: text/plain; charset="UTF-8"

Filed a bug for this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12577

On 1 March 2018 at 09:43, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 02/21/2018 05:12 AM, Khem Raj wrote:
>
>> Additionally cherry-pick
>>
>> 5ffeba4a09 Revert "PowerPC PLT speculative execution barriers"
>> b01452b1d4 [PR22764][LD][AARCH64]Allow R_AARCH64_ABS16 and
>> R_AARCH64_ABS32 against absolution symbol or undefine symbol in shared
>> object.
>> a985e9b9de Import patch from mainline to remove PROVODE qualifiers around
>> definitions of __CTOR_LIST__ and __DTOR_LIST__ in PE linker scripts.
>> eec4607fc5 Add support for DWARF-4 line number tables.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> Changes in v2:
>>
>> - Backport fixes for aarch64 relocs
>> - ppc plt fix, dwarf-4 line number support and linker script fix for
>> removing PROVODE
>>
>> Changes in v3:
>> - None
>>
>
> I did some bisection and unfortunately this cases breakage when musl,
> systemd and gobject introspection are all enabled:
>
> | i586-poky-linux-musl-libtool: link: i586-poky-linux-musl-gcc -m32
> -march=i586 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security --sysroot=/home/ak/development
> /poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot -o
> /home/ak/development/poky/build/tmp/work/i586-poky-linux-
> musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/.libs/Avahi-0.6
> -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/ak/de
> velopment/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.
> 7-r0=/usr/src/debug/avahi/0.7-r0 -fdebug-prefix-map=/home/ak/de
> velopment/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot-native=
> -fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/
> i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot= -std=c99 -Wall -W
> -Wextra -pedantic -pipe -Wformat -Wold-style-definition
> -Wdeclaration-after-statement -Wfloat-equal -Wmissing-declarations
> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
> -Wmissing-noreturn -Wshadow -Wendif-labels -Wpointer-arith
> -Wbad-function-cast -Wcast-qual -Wcast-align -Wwrite-strings
> -fdiagnostics-show-option -Wno-cast-qual -fno-strict-aliasing
> /home/ak/development/poky/build/tmp/work/i586-poky-linux-
> musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/Avahi-0.6.o
> -Wl,--export-dynamic -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now
> -Wl,--export-dynamic  -L. ./.libs/libavahi-gobject.so
> /home/ak/development/poky/build/tmp/work/i586-poky-linux-
> musl/avahi/0.7-r0/build/avahi-client/.libs/libavahi-client.so -ldbus-1
> -ldl /home/ak/development/poky/build/tmp/work/i586-poky-linux-
> musl/avahi/0.7-r0/build/avahi-glib/.libs/libavahi-glib.so
> /home/ak/development/poky/build/tmp/work/i586-poky-linux-
> musl/avahi/0.7-r0/build/avahi-common/.libs/libavahi-common.so -lgio-2.0
> -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -pthread
> | Error relocating /home/ak/development/poky/buil
> d/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0:
> __start_BUS_ERROR_MAP: symbol not found
> | Error relocating /home/ak/development/poky/buil
> d/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0:
> __stop_BUS_ERROR_MAP: symbol not found
>
>
>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113b8804a88bd205665c9221
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Filed a bug for this:=C2=A0<a href=3D"https://bugzilla.yoc=
toproject.org/show_bug.cgi?id=3D12577">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D12577</a></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 1 March 2018 at 09:43, Alexander Kanavin <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank"=
>alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><span class=3D"">On 02/21/2018 05:12 AM, Khem Raj wrote:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Additionally cherry-pick<br>
<br>
5ffeba4a09 Revert &quot;PowerPC PLT speculative execution barriers&quot;<br=
>
b01452b1d4 [PR22764][LD][AARCH64]Allow R_AARCH64_ABS16 and R_AARCH64_ABS32 =
against absolution symbol or undefine symbol in shared object.<br>
a985e9b9de Import patch from mainline to remove PROVODE qualifiers around d=
efinitions of __CTOR_LIST__ and __DTOR_LIST__ in PE linker scripts.<br>
eec4607fc5 Add support for DWARF-4 line number tables.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
Changes in v2:<br>
<br>
- Backport fixes for aarch64 relocs<br>
- ppc plt fix, dwarf-4 line number support and linker script fix for removi=
ng PROVODE<br>
<br>
Changes in v3:<br>
- None<br>
</blockquote>
<br></span>
I did some bisection and unfortunately this cases breakage when musl, syste=
md and gobject introspection are all enabled:<br>
<br>
| i586-poky-linux-musl-libtool: link: i586-poky-linux-musl-gcc -m32 -march=
=3Di586 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-se=
curity -Werror=3Dformat-security --sysroot=3D/home/ak/development<wbr>/poky=
/build/tmp/work/i586-<wbr>poky-linux-musl/avahi/0.7-r0/<wbr>recipe-sysroot =
-o /home/ak/development/poky/buil<wbr>d/tmp/work/i586-poky-linux-<wbr>musl/=
avahi/0.7-r0/build/avahi-<wbr>gobject/tmp-introspectcefd3msq<wbr>/.libs/Ava=
hi-0.6 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/ho=
me/ak/de<wbr>velopment/poky/build/tmp/work/<wbr>i586-poky-linux-musl/avahi/=
0.<wbr>7-r0=3D/usr/src/debug/avahi/0.7-<wbr>r0 -fdebug-prefix-map=3D/home/a=
k/de<wbr>velopment/poky/build/tmp/work/<wbr>i586-poky-linux-musl/avahi/0.<w=
br>7-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/home/ak/de<wbr>velop=
ment/poky/build/tmp/work/<wbr>i586-poky-linux-musl/avahi/0.<wbr>7-r0/recipe=
-sysroot=3D -std=3Dc99 -Wall -W -Wextra -pedantic -pipe -Wformat -Wold-styl=
e-definition -Wdeclaration-after-statement -Wfloat-equal -Wmissing-declarat=
ions -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-n=
oreturn -Wshadow -Wendif-labels -Wpointer-arith -Wbad-function-cast -Wcast-=
qual -Wcast-align -Wwrite-strings -fdiagnostics-show-option -Wno-cast-qual =
-fno-strict-aliasing /home/ak/development/poky/buil<wbr>d/tmp/work/i586-pok=
y-linux-<wbr>musl/avahi/0.7-r0/build/avahi-<wbr>gobject/tmp-introspectcefd3=
msq<wbr>/Avahi-0.6.o -Wl,--export-dynamic -pthread -Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl=
,now -Wl,--export-dynamic=C2=A0 -L. ./.libs/libavahi-gobject.so /home/ak/de=
velopment/poky/buil<wbr>d/tmp/work/i586-poky-linux-<wbr>musl/avahi/0.7-r0/b=
uild/avahi-<wbr>client/.libs/libavahi-client.<wbr>so -ldbus-1 -ldl /home/ak=
/development/poky/buil<wbr>d/tmp/work/i586-poky-linux-<wbr>musl/avahi/0.7-r=
0/build/avahi-<wbr>glib/.libs/libavahi-glib.so /home/ak/development/poky/bu=
il<wbr>d/tmp/work/i586-poky-linux-<wbr>musl/avahi/0.7-r0/build/avahi-<wbr>c=
ommon/.libs/libavahi-common.<wbr>so -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -=
lglib-2.0 -pthread<br>
| Error relocating /home/ak/development/poky/buil<wbr>d/tmp/work/i586-poky-=
linux-<wbr>musl/avahi/0.7-r0/recipe-<wbr>sysroot//lib/libsystemd.so.0: __st=
art_BUS_ERROR_MAP: symbol not found<br>
| Error relocating /home/ak/development/poky/buil<wbr>d/tmp/work/i586-poky-=
linux-<wbr>musl/avahi/0.7-r0/recipe-<wbr>sysroot//lib/libsystemd.so.0: __st=
op_BUS_ERROR_MAP: symbol not found<br>
<br>
<br>
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a113b8804a88bd205665c9221--
