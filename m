Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB586010B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jan 2018 20:05:31 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id h137so11060050lfe.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jan 2018 12:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nIf5+5MzrOgRxWdq6JLuKEmCnY2p46VfP6O2a46uK6g=;
	b=DcFz8HAyxGCTBoNfacFGGUt8V6A6+pNwmnnLfX+MXW/4q+MsZfaSQZdbpx6qbd1X5t
	EOQbyBErkqVVKaSL50RTVWknw8U27H/oUid7SVp5PtPapeVgxv3nfa4XEC/pl5VzVyHZ
	D39p6foIHSGaZG5kktaiZUqg2Q8WkDl459iQ897wmkcvnZDL61rX/5v0zm6xqOeO6mcl
	POH1l1SiK6YUizq+TfiE/r5dPQBrRyR+xex77CgpoNX+PWMUxyrDor0GWAFkxhAzJmup
	wz1+GvYf+epnggIoX2ny3U+wI8V77bZh+jsqvfxpqe7WOpHKkqR+HMFoYhwTbTX1lmQE
	jB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nIf5+5MzrOgRxWdq6JLuKEmCnY2p46VfP6O2a46uK6g=;
	b=DR0BT+beVpjiAXBGNGfFGffUuDgntDcR0c3w+zc0OjvTBLwcJSd4a7XcHOVKU0g590
	j7onbnH7YU8+skO9qJYPIB+brkVXCfjirgH1n9W4ZVxhImSohLeJAKulSI5SMZIgyzfi
	MjUrA5TibjxvWs8DjaCg8mhRrcXaf9lHPqO3DnrB2+C5je5izUbNE/EkPKTCkHAxFrU4
	eBQT6/RFEr3XwfdbhcRryPw9g3Wv5m9K46/GOqI2IJpTA7kVHI9fh9eDksdro1gvfmn3
	HHMtyjcnxJ2lv6os5WVL7K7O6HkXA23VcTBRI+ceUZRN/iOzkls8L9GcxOXOEa0HaIbD
	BM3Q==
X-Gm-Message-State: AKwxytdMsavBHthPhwIqeGXkgn4WDktQP2xTDbFJ2MkmABpRerfjW/u7
	bKYTn1iBXptprPvyOohofOLX+s3EHILCndyKUCU=
X-Google-Smtp-Source: ACJfBos6JN4wA1xPAejJbAvI0bGEprjV8QdwCY88qQjLxBlRv5MwQMwzR6dQi4caTa07Woait5fD1Gbbbfb06VieEvM=
X-Received: by 10.25.208.146 with SMTP id h140mr15033065lfg.29.1515960332511; 
	Sun, 14 Jan 2018 12:05:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.79.23 with HTTP; Sun, 14 Jan 2018 12:05:31 -0800 (PST)
In-Reply-To: <649D7563-3FDB-40A1-A166-7DFA9E706B0D@googlemail.com>
References: <649D7563-3FDB-40A1-A166-7DFA9E706B0D@googlemail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 14 Jan 2018 15:05:31 -0500
Message-ID: <CAHUNapSJdG4XAsL=EFcE1RnogJsDk8mzcFeor7PsjGQP4dhhhg@mail.gmail.com>
To: Mathias Rudnik <rudnik.mathias@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error do_compile libepoxy
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
X-List-Received-Date: Sun, 14 Jan 2018 20:05:32 -0000
Content-Type: multipart/alternative; boundary="001a1140097c1cf0760562c205e9"

--001a1140097c1cf0760562c205e9
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 11, 2018 at 2:18 PM, Mathias Rudnik <
rudnik.mathias@googlemail.com> wrote:

> Hello,
>
> I am trying to build libepoxy but the do_compile tasks breaks.
> I found following error messages in the logs:
>
> arm-poky-linux-gnueabi-gcc -march=armv6 -mfpu=vfp -mfloat-abi=hard
> -mtune=arm1176jzf-s -mfpu=vfp --sysroot=/hdd_gold1/mathias/
> git/poky/rpi-build/tmp/work/arm1176jzfshf-vfp-poky-linux-
> gnueabi/libepoxy/1.4.3-r0/recipe-sysroot '-Itest/egl_common@sta' '-Itest'
> '-Iinclude/epoxy' '-I../libepoxy-1.4.3/test' '-Iinclude'
> '-I../libepoxy-1.4.3/include' '-Isrc' '-I../libepoxy-1.4.3/src'
> '-fdiagnostics-color=always' '-pipe' '-D_FILE_OFFSET_BITS=64' '-Wall'
> '-Winvalid-pch' '-std=gnu99' '-O2' '-g' '-O2' '-g'
> '-feliminate-unused-debug-types' '-fdebug-prefix-map=/hdd_
> gold1/mathias/git/poky/rpi-build/tmp/work/arm1176jzfshf-
> vfp-poky-linux-gnueabi/libepoxy/1.4.3-r0=/usr/src/debug/libepoxy/1.4.3-r0'
> '-fdebug-prefix-map=/hdd_gold1/mathias/git/poky/rpi-
> build/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueabi/
> libepoxy/1.4.3-r0/recipe-sysroot-native=' '-fdebug-prefix-map=/hdd_
> gold1/mathias/git/poky/rpi-build/tmp/work/arm1176jzfshf-
> vfp-poky-linux-gnueabi/libepoxy/1.4.3-r0/recipe-sysroot=' '-lEGL' '-fPIC'
> '
>  -Wpointer-arith' '-Wmissing-declarations' '-Wformat=2'
> '-Wstrict-prototypes' '-Wmissing-prototypes' '-Wnested-externs'
> '-Wbad-function-cast' '-Wold-style-definition' '-Wdeclaration-after-statement'
> '-Wunused' '-Wuninitialized' '-Wshadow' '-Wmissing-noreturn'
> '-Wmissing-format-attribute' '-Wredundant-decls' '-Wlogical-op'
> '-Werror=implicit' '-Werror=nonnull' '-Werror=init-self' '-Werror=main'
> '-Werror=missing-braces' '-Werror=sequence-point' '-Werror=return-type'
> '-Werror=trigraphs' '-Werror=array-bounds' '-Werror=write-strings'
> '-Werror=address' '-Werror=int-to-pointer-cast'
> '-Werror=pointer-to-int-cast' '-fno-strict-aliasing' '-Wno-int-conversion'
> '-MMD' '-MQ' 'test/egl_common@sta/egl_common.c.o' '-MF'
> 'test/egl_common@sta/egl_common.c.o.d' -o 'test/egl_common@sta/egl_common.c.o'
> -c ../libepoxy-1.4.3/test/egl_common.c
> ../libepoxy-1.4.3/test/egl_common.c: In function
> 'get_egl_display_or_skip':
> ../libepoxy-1.4.3/test/egl_common.c:36:5: error: unknown type name
> 'Display'; did you mean 'EGLDisplay'?
>      Display *dpy = XOpenDisplay(NULL);
>      ^~~~~~~
>      EGLDisplay
> ../libepoxy-1.4.3/test/egl_common.c:36:20: error: implicit declaration of
> function 'XOpenDisplay'; did you mean 'eglGetDisplay'?
> [-Werror=implicit-function-declaration]
>      Display *dpy = XOpenDisplay(NULL);
>                     ^~~~~~~~~~~~
>                     eglGetDisplay
> ../libepoxy-1.4.3/test/egl_common.c:36:20: warning: nested extern
> declaration of 'XOpenDisplay' [-Wnested-externs]
> cc1: some warnings being treated as errors
>
> Does anybody know what i am doing wrong?
>


I've been seeing the same failure for the last 10 days or so on my nightly
rpi3-32 builds.

A quick, superficial, glance at the problem looks like a code issue; I'm
guessing a missing "#include <X11/Xlib.h>". If I find some time I'll take a
stab at it.

--001a1140097c1cf0760562c205e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jan 11, 2018 at 2:18 PM, Mathias Rudnik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rudnik.mathias@googlemail.com" target=3D"_blank">rudnik.mathias@=
googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hello,<br>
<br>
I am trying to build libepoxy but the do_compile tasks breaks.<br>
I found following error messages in the logs:<br>
<br>
arm-poky-linux-gnueabi-gcc -march=3Darmv6 -mfpu=3Dvfp -mfloat-abi=3Dhard -m=
tune=3Darm1176jzf-s -mfpu=3Dvfp --sysroot=3D/hdd_gold1/mathias/<wbr>git/pok=
y/rpi-build/tmp/work/<wbr>arm1176jzfshf-vfp-poky-linux-<wbr>gnueabi/libepox=
y/1.4.3-r0/<wbr>recipe-sysroot &#39;-Itest/egl_common@sta&#39; &#39;-Itest&=
#39; &#39;-Iinclude/epoxy&#39; &#39;-I../libepoxy-1.4.3/test&#39; &#39;-Iin=
clude&#39; &#39;-I../libepoxy-1.4.3/include&#39; &#39;-Isrc&#39; &#39;-I../=
libepoxy-1.4.3/src&#39; &#39;-fdiagnostics-color=3Dalways&#39; &#39;-pipe&#=
39; &#39;-D_FILE_OFFSET_BITS=3D64&#39; &#39;-Wall&#39; &#39;-Winvalid-pch&#=
39; &#39;-std=3Dgnu99&#39; &#39;-O2&#39; &#39;-g&#39; &#39;-O2&#39; &#39;-g=
&#39; &#39;-feliminate-unused-debug-<wbr>types&#39; &#39;-fdebug-prefix-map=
=3D/hdd_<wbr>gold1/mathias/git/poky/rpi-<wbr>build/tmp/work/arm1176jzfshf-<=
wbr>vfp-poky-linux-gnueabi/<wbr>libepoxy/1.4.3-r0=3D/usr/src/<wbr>debug/lib=
epoxy/1.4.3-r0&#39; &#39;-fdebug-prefix-map=3D/hdd_<wbr>gold1/mathias/git/p=
oky/rpi-<wbr>build/tmp/work/arm1176jzfshf-<wbr>vfp-poky-linux-gnueabi/<wbr>=
libepoxy/1.4.3-r0/recipe-<wbr>sysroot-native=3D&#39; &#39;-fdebug-prefix-ma=
p=3D/hdd_<wbr>gold1/mathias/git/poky/rpi-<wbr>build/tmp/work/arm1176jzfshf-=
<wbr>vfp-poky-linux-gnueabi/<wbr>libepoxy/1.4.3-r0/recipe-<wbr>sysroot=3D&#=
39; &#39;-lEGL&#39; &#39;-fPIC&#39; &#39;<br>
=C2=A0-Wpointer-arith&#39; &#39;-Wmissing-declarations&#39; &#39;-Wformat=
=3D2&#39; &#39;-Wstrict-prototypes&#39; &#39;-Wmissing-prototypes&#39; &#39=
;-Wnested-externs&#39; &#39;-Wbad-function-cast&#39; &#39;-Wold-style-defin=
ition&#39; &#39;-Wdeclaration-after-<wbr>statement&#39; &#39;-Wunused&#39; =
&#39;-Wuninitialized&#39; &#39;-Wshadow&#39; &#39;-Wmissing-noreturn&#39; &=
#39;-Wmissing-format-attribute&#39; &#39;-Wredundant-decls&#39; &#39;-Wlogi=
cal-op&#39; &#39;-Werror=3Dimplicit&#39; &#39;-Werror=3Dnonnull&#39; &#39;-=
Werror=3Dinit-self&#39; &#39;-Werror=3Dmain&#39; &#39;-Werror=3Dmissing-bra=
ces&#39; &#39;-Werror=3Dsequence-point&#39; &#39;-Werror=3Dreturn-type&#39;=
 &#39;-Werror=3Dtrigraphs&#39; &#39;-Werror=3Darray-bounds&#39; &#39;-Werro=
r=3Dwrite-strings&#39; &#39;-Werror=3Daddress&#39; &#39;-Werror=3Dint-to-po=
inter-cast&#39; &#39;-Werror=3Dpointer-to-int-cast&#39; &#39;-fno-strict-al=
iasing&#39; &#39;-Wno-int-conversion&#39; &#39;-MMD&#39; &#39;-MQ&#39; &#39=
;test/egl_common@sta/egl_<wbr>common.c.o&#39; &#39;-MF&#39; &#39;test/egl_c=
ommon@sta/egl_<wbr>common.c.o.d&#39; -o &#39;test/egl_common@sta/egl_<wbr>c=
ommon.c.o&#39; -c ../libepoxy-1.4.3/test/egl_<wbr>common.c<br>
../libepoxy-1.4.3/test/egl_<wbr>common.c: In function &#39;get_egl_display_=
or_skip&#39;:<br>
../libepoxy-1.4.3/test/egl_<wbr>common.c:36:5: error: unknown type name &#3=
9;Display&#39;; did you mean &#39;EGLDisplay&#39;?<br>
=C2=A0 =C2=A0 =C2=A0Display *dpy =3D XOpenDisplay(NULL);<br>
=C2=A0 =C2=A0 =C2=A0^~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0EGLDisplay<br>
../libepoxy-1.4.3/test/egl_<wbr>common.c:36:20: error: implicit declaration=
 of function &#39;XOpenDisplay&#39;; did you mean &#39;eglGetDisplay&#39;? =
[-Werror=3Dimplicit-function-<wbr>declaration]<br>
=C2=A0 =C2=A0 =C2=A0Display *dpy =3D XOpenDisplay(NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~=
~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eglGe=
tDisplay<br>
../libepoxy-1.4.3/test/egl_<wbr>common.c:36:20: warning: nested extern decl=
aration of &#39;XOpenDisplay&#39; [-Wnested-externs]<br>
cc1: some warnings being treated as errors<br>
<br>
Does anybody know what i am doing wrong?<br></blockquote><div><br><br><div>=
I&#39;ve been seeing the same failure for the last 10 days or so on my nigh=
tly rpi3-32 builds.<br><br></div><div>A quick, superficial, glance at the p=
roblem looks like a code issue; I&#39;m guessing a missing &quot;#include &=
lt;X11/Xlib.h&gt;&quot;. If I find some time I&#39;ll take a stab at it.<br=
></div></div></div></div></div>

--001a1140097c1cf0760562c205e9--
