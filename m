Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B779C71B9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 17:28:36 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id w127so2321145pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HUGG9IIfSsrPT4GroOvt5NwmaQ45xoLX1GJ/zPstFRw=;
	b=qdaeARzJwXSnjAlUpSQX6CezXJbDqck+A4DQ8MyRmGBZT+ry1+nhzDYT1rQHp3waKi
	XrL7BoAD5B1gPrVdZ/ZIi5/RKbQsbR0GGwxMMSgVHOYcsrANvHe6CZN82TC0sU90IeRV
	sq0LiAk0ds9Z5SLLuM1Lsq8JzTfu9ortvqppRkV6uJ3OUQb2eoUgRtvdd/Z1ZLzP0QnK
	kaEKRIT00Y7HKf54qi4hK3SNHRioP1kbO8+TefPGbNhosvL3GamuUcR3nD1BnBI+2PsG
	/Vyqdm0fuaUmq+nitK1PbCDk1VsbKaWulg76RbEcEHe9ifS107QXmLCxnKa5MYMwY5+f
	y0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HUGG9IIfSsrPT4GroOvt5NwmaQ45xoLX1GJ/zPstFRw=;
	b=lKWal/XM77KQ0YHvtThQNRerXrSJVKBOea2Oaan1s1IyTZJMAqpCKCThnce27Fu8wJ
	fAYu81cY8iS1DnDQ9r7yAclwerUzkshtAkFnCX+6ZG8t2YVPeMupa6IzrNPnLzk7lQML
	dBNMYw55E5j8AVGD1LdcRXCKBtQQvwYlVRNdZRdooEoqtAfGak9UaDqUOrep8l9ZV9LT
	L/QpLMEMzAhQAs6d4eQYZ/O/jGpsoQy8p+RkhMVygk0/pfuWodVqz10D2yt4upyMjPwI
	tQMw22PMW1441EdgCAnn8HuNWvr+UP0pVNHVlbhSbCJRF95q5Qt49Smre+gyxexwmLf5
	q7mA==
X-Gm-Message-State: AHYfb5iAQ7ocA736TyzuwTVmInt1Sj9N++dIcj2tV+NYC/b2D6Nxo6hl
	+LE/Ws35is96qJeYOQl6SX4qVjt2+Q==
X-Received: by 10.101.86.12 with SMTP id l12mr1449965pgs.123.1503422918528;
	Tue, 22 Aug 2017 10:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20170821205721.20086-1-Martin.Jansa@gmail.com>
	<20170821205721.20086-2-Martin.Jansa@gmail.com>
	<CAMKF1spVbAz9h4Z0SWJ9BEh0-03g1ZAi18Z22AztYXfnMLOffw@mail.gmail.com>
	<CA+chaQf=yHdsWXEZyDFQ9KsHDvpYY24G8ACGkd4Q3oBOdFVgZw@mail.gmail.com>
In-Reply-To: <CA+chaQf=yHdsWXEZyDFQ9KsHDvpYY24G8ACGkd4Q3oBOdFVgZw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2017 17:28:27 +0000
Message-ID: <CAMKF1sqVnnd2kUUX05aGGbRG2AdZU6iNE1Mw3jmkreU49Xk=kw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] grub2: fix build with gcc-7
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
X-List-Received-Date: Tue, 22 Aug 2017 17:28:37 -0000
Content-Type: multipart/alternative; boundary="089e0823821401967405575aed4f"

--089e0823821401967405575aed4f
Content-Type: text/plain; charset="UTF-8"

I have sent few patches to meta oe to fix similar issues earlier found with
clang I think changes to code to define the macros in compliant way are
better and upstreamable

On Tue, Aug 22, 2017 at 10:21 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> Nothing special on my build host, just gcc 7.1 from gentoo. But the option
> was introduced probably only in gcc-7, on 5.4.0 used in Ubuntu 16.04 it's
> also missing:
>
> OE qemux86@ ~/oe/world/shr-core $ gcc --help=warnings | grep
> expansion-to-defined
> OE qemux86@ ~/oe/world/shr-core $ gcc --version
> gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
> Copyright (C) 2015 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>
> OE @ ~ $ gcc --help=warnings | grep expansion-to-defined
>   -Wexpansion-to-defined      Warn if "defined" is used outside #if.
> OE @ ~ $ gcc --version
> gcc (Gentoo 7.1.0-r1 p1.1) 7.1.0
> Copyright (C) 2017 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>
> OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/grub-efi/2.02-r0 $
> recipe-sysroot-native/usr/bin/i586-oe-linux/i586-oe-linux-gcc
> --help=warnings | grep expansion-to-defined
>   -Wexpansion-to-defined      Warn if "defined" is used outside #if.
> OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/grub-efi/2.02-r0 $
> recipe-sysroot-native/usr/bin/i586-oe-linux/i586-oe-linux-gcc --version
> i586-oe-linux-gcc (GCC) 7.2.0
> Copyright (C) 2017 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>
> Applying the flags based on `gcc --version` output also doesn't seem good
> way forward and we don't have gcc-native recipes.
>
> We can probably use gcc pragma to disable this warning (which IIRC doesn't
> test if the disabled warning is supported or not), but that might be a bit
> complicated as this file is generated in configure. I'll check it.
>
> The target grub-efi build doesn't fail probably because target gcc doesn't
> define _FORTIFY_SOURCE
>
> I've tried to compare native and target build and it's reproducible e.g.
> with this command:
>
> gcc  -DHAVE_CONFIG_H -I. -I../grub-2.02  -Wall -W -DGRUB_UTIL=1
> -D_FILE_OFFSET_BITS=64 -I./include -DGRUB_FILE=\"grub-core/lib/crypto.c\"
> -I. -I../grub-2.02 -I. -I../grub-2.02 -I../grub-2.02/include -I./include
> -I../grub-2.02/grub-core/lib/libgcrypt-grub/src/  -I./grub-core/gnulib
> -I../grub-2.02/grub-core/gnulib -D_FILE_OFFSET_BITS=64 -fno-builtin-gettext
> -Wall -W -Wshadow -Wpointer-arith -Wundef -Wchar-subscripts -Wcomment
> -Wdeprecated-declarations -Wdisabled-optimization -Wdiv-by-zero
> -Wfloat-equal -Wformat-extra-args -Wformat-security -Wformat-y2k -Wimplicit
> -Wimplicit-function-declaration -Wimplicit-int -Wmain -Wmissing-braces
> -Wmissing-format-attribute -Wmultichar -Wparentheses -Wreturn-type
> -Wsequence-point -Wshadow -Wsign-compare -Wswitch -Wtrigraphs
> -Wunknown-pragmas -Wunused -Wunused-function -Wunused-label
> -Wunused-parameter -Wunused-value  -Wunused-variable -Wwrite-strings
> -Wnested-externs -Wstrict-prototypes -Wcast-align  -Wextra -Wattributes
> -Wendif-labels -Winit-self -Wint-to-pointer-cast -Winvalid-pch
> -Wmissing-field-initializers -Wnonnull -Woverflow -Wvla
> -Wpointer-to-int-cast -Wstrict-aliasing -Wvariadic-macros
> -Wvolatile-register-var -Wpointer-sign -Wmissing-include-dirs
> -Wmissing-prototypes -Wmissing-declarations -Wformat=2 -Werror  -Wno-undef
> -Wno-sign-compare -Wno-unused -Wno-unused-parameter -Wno-redundant-decls
> -Wno-unreachable-code -Wno-conversion -Wno-error=trampolines -c -o
> grub-core/lib/libgrubkern_a-crypto.o `test -f 'grub-core/lib/crypto.c' ||
> echo '../grub-2.02/'`grub-core/lib/crypto.c
>
> After adding -dM -E and comparing the output between target and native I
> can see that my native gcc defines _FORTIFY_SOURCE as:
> #define _FORTIFY_SOURCE ((defined __OPTIMIZE__ && __OPTIMIZE__ > 0) ? 2 :
> 0)
>
> while target build doesn't.
>
> Just to confirm it's caused by this I've added the same line:
> #define _FORTIFY_SOURCE ((defined __OPTIMIZE__ && __OPTIMIZE__ > 0) ? 2 :
> 0)
> at the top of grub-2.02/grub-core/lib/crypto.c and the target build fails
> the same.
>
> And the  _FORTIFY_SOURCE in native gcc comes from gentoo gcc patches, this
> one:
>
> https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo/src/patchsets/gcc/7.1.0/gentoo/10_all_default-fortify-source.patch?view=markup
>
> PATCHv2 with #pragma coming soon.
>
>
>
> On Tue, Aug 22, 2017 at 1:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Aug 21, 2017 at 1:57 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > * build with gcc-7 fails with:
>> >   | ./config-util.h:1504:48: error: this use of "defined" may not be
>>  portable [-Werror=expansion-to-defined]
>> >   |              || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
>> >   |
>>                                             ^~~~~~~~~~~~~~~
>> >   and we're not building on Apple or BSD, so we should be able
>> >   to just ignoreit until it's resolved properly in some newer gnulib
>> >   and imported from gnulib to grub-2
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta/recipes-bsp/grub/grub-efi_2.02.bb | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb
>> b/meta/recipes-bsp/grub/grub-efi_2.02.bb
>> > index b949bebced..45f4c1ed34 100644
>> > --- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
>> > +++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
>> > @@ -36,6 +36,12 @@ EXTRA_OECONF += "--enable-efiemu=no"
>> >  # and many other places in the grub code when compiled with some
>> native gcc compilers (specifically, gentoo)
>> >  CFLAGS_append_class-native = " -Wno-error=trampolines"
>> >
>> > +# this comes from gnulib and it's used only for Apple and BSD, so we
>> can ignore it
>> > +# ./config-util.h:1504:48: error: this use of "defined" may not be
>> portable [-Werror=expansion-to-defined]
>> > +#             || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
>> > +#                                                ^~~~~~~~~~~~~~~
>> > +CFLAGS_append_class-native = " -Wno-error=expansion-to-defined"
>> > +
>>
>> This workaround seems reasonable but I wonder why it fails on build host
>> for you. how is your build hosts toolchain configured to generate this
>> warning. Since you mentioned gcc7 then why doesnt it fail for OE
>> targets
>> in same way.
>>
>> An upstreamable fix would be to break this define into another #if ..
>> #else macros and define the new macro to 1 or 0 depending upon the
>> conditions
>> being tested.
>>
>> >  do_install_class-native() {
>> >         install -d ${D}${bindir}
>> >         install -m 755 grub-mkimage ${D}${bindir}
>> > --
>> > 2.14.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--089e0823821401967405575aed4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I have sent few patches to meta oe to fix similar is=
sues earlier found with clang I think changes to code to define the macros =
in compliant way are better and upstreamable</div><br><div class=3D"gmail_q=
uote"><div>On Tue, Aug 22, 2017 at 10:21 AM Martin Jansa &lt;<a href=3D"mai=
lto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>Nothing special on my build host, just =
gcc 7.1 from gentoo. But the option was introduced probably only in gcc-7, =
on 5.4.0 used in Ubuntu 16.04 it&#39;s also missing:<div><br></div><div><di=
v>OE qemux86@ ~/oe/world/shr-core $ gcc --help=3Dwarnings | grep expansion-=
to-defined</div><div>OE qemux86@ ~/oe/world/shr-core $ gcc --version</div><=
div>gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609</div><div>Copyright =
(C) 2015 Free Software Foundation, Inc.</div><div>This is free software; se=
e the source for copying conditions.=C2=A0 There is NO</div><div>warranty; =
not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.</div></di=
v><div><br></div><div><div>OE @ ~ $ gcc --help=3Dwarnings | grep expansion-=
to-defined</div><div>=C2=A0 -Wexpansion-to-defined =C2=A0 =C2=A0 =C2=A0Warn=
 if &quot;defined&quot; is used outside #if.</div><div>OE @ ~ $ gcc --versi=
on</div><div>gcc (Gentoo 7.1.0-r1 p1.1) 7.1.0</div><div>Copyright (C) 2017 =
Free Software Foundation, Inc.</div><div>This is free software; see the sou=
rce for copying conditions.=C2=A0 There is NO</div><div>warranty; not even =
for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.</div></div><div><b=
r></div><div><div>OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/grub-ef=
i/2.02-r0 $ recipe-sysroot-native/usr/bin/i586-oe-linux/i586-oe-linux-gcc -=
-help=3Dwarnings | grep expansion-to-defined</div><div>=C2=A0 -Wexpansion-t=
o-defined =C2=A0 =C2=A0 =C2=A0Warn if &quot;defined&quot; is used outside #=
if.</div><div>OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/grub-efi/2.=
02-r0 $ recipe-sysroot-native/usr/bin/i586-oe-linux/i586-oe-linux-gcc --ver=
sion</div><div>i586-oe-linux-gcc (GCC) 7.2.0</div><div>Copyright (C) 2017 F=
ree Software Foundation, Inc.</div><div>This is free software; see the sour=
ce for copying conditions.=C2=A0 There is NO</div><div>warranty; not even f=
or MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.</div></div><div><br=
></div><div>Applying the flags based on `gcc --version` output also doesn&#=
39;t seem good way forward and we don&#39;t have gcc-native recipes.<br></d=
iv><div><br></div><div>We can probably use gcc pragma to disable this warni=
ng (which IIRC doesn&#39;t test if the disabled warning is supported or not=
), but that might be a bit complicated as this file is generated in configu=
re. I&#39;ll check it.</div><div><br></div><div>The target grub-efi build d=
oesn&#39;t fail probably because target gcc doesn&#39;t define _FORTIFY_SOU=
RCE</div><div><br></div><div>I&#39;ve tried to compare native and target bu=
ild and it&#39;s reproducible e.g. with this command:</div><div><br></div><=
div><div>gcc =C2=A0-DHAVE_CONFIG_H -I. -I../grub-2.02 =C2=A0-Wall -W -DGRUB=
_UTIL=3D1 -D_FILE_OFFSET_BITS=3D64 -I./include -DGRUB_FILE=3D\&quot;grub-co=
re/lib/crypto.c\&quot; -I. -I../grub-2.02 -I. -I../grub-2.02 -I../grub-2.02=
/include -I./include -I../grub-2.02/grub-core/lib/libgcrypt-grub/src/ =C2=
=A0-I./grub-core/gnulib -I../grub-2.02/grub-core/gnulib -D_FILE_OFFSET_BITS=
=3D64 -fno-builtin-gettext -Wall -W -Wshadow -Wpointer-arith -Wundef -Wchar=
-subscripts -Wcomment -Wdeprecated-declarations -Wdisabled-optimization -Wd=
iv-by-zero -Wfloat-equal -Wformat-extra-args -Wformat-security -Wformat-y2k=
 -Wimplicit -Wimplicit-function-declaration -Wimplicit-int -Wmain -Wmissing=
-braces -Wmissing-format-attribute -Wmultichar -Wparentheses -Wreturn-type =
-Wsequence-point -Wshadow -Wsign-compare -Wswitch -Wtrigraphs -Wunknown-pra=
gmas -Wunused -Wunused-function -Wunused-label -Wunused-parameter -Wunused-=
value =C2=A0-Wunused-variable -Wwrite-strings -Wnested-externs -Wstrict-pro=
totypes -Wcast-align =C2=A0-Wextra -Wattributes -Wendif-labels -Winit-self =
-Wint-to-pointer-cast -Winvalid-pch -Wmissing-field-initializers -Wnonnull =
-Woverflow -Wvla -Wpointer-to-int-cast -Wstrict-aliasing -Wvariadic-macros =
-Wvolatile-register-var -Wpointer-sign -Wmissing-include-dirs -Wmissing-pro=
totypes -Wmissing-declarations -Wformat=3D2 -Werror =C2=A0-Wno-undef -Wno-s=
ign-compare -Wno-unused -Wno-unused-parameter -Wno-redundant-decls -Wno-unr=
eachable-code -Wno-conversion -Wno-error=3Dtrampolines -c -o grub-core/lib/=
libgrubkern_a-crypto.o `test -f &#39;grub-core/lib/crypto.c&#39; || echo &#=
39;../grub-2.02/&#39;`grub-core/lib/crypto.c</div></div><div><br></div><div=
>After adding -dM -E and comparing the output between target and native I c=
an see that my native gcc defines _FORTIFY_SOURCE as:</div><div>#define _FO=
RTIFY_SOURCE ((defined __OPTIMIZE__ &amp;&amp; __OPTIMIZE__ &gt; 0) ? 2 : 0=
)<br></div><div><br></div><div>while target build doesn&#39;t.</div><div><b=
r></div><div>Just to confirm it&#39;s caused by this I&#39;ve added the sam=
e line:</div><div>#define _FORTIFY_SOURCE ((defined __OPTIMIZE__ &amp;&amp;=
 __OPTIMIZE__ &gt; 0) ? 2 : 0)<br></div><div>at the top of grub-2.02/grub-c=
ore/lib/crypto.c and the target build fails the same.</div><div><br></div><=
div>And the =C2=A0_FORTIFY_SOURCE in native gcc comes from gentoo gcc patch=
es, this one:</div><div><a href=3D"https://sources.gentoo.org/cgi-bin/viewv=
c.cgi/gentoo/src/patchsets/gcc/7.1.0/gentoo/10_all_default-fortify-source.p=
atch?view=3Dmarkup" target=3D"_blank">https://sources.gentoo.org/cgi-bin/vi=
ewvc.cgi/gentoo/src/patchsets/gcc/7.1.0/gentoo/10_all_default-fortify-sourc=
e.patch?view=3Dmarkup</a><br></div><div><br></div><div>PATCHv2 with #pragma=
 coming soon.</div><div><br></div><div><br></div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Tue, Aug 22, 2017 at 1:52 AM, Khem=
 Raj <span>&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 class=3D"m_4829099699774669584HOEnZb"><div class=3D"m_4829099699774669584h=
5">On Mon, Aug 21, 2017 at 1:57 PM, Martin Jansa &lt;<a href=3D"mailto:mart=
in.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:=
<br>
&gt; * build with gcc-7 fails with:<br>
&gt;=C2=A0 =C2=A0| ./config-util.h:1504:48: error: this use of &quot;define=
d&quot; may not be=C2=A0 =C2=A0portable [-Werror=3Dexpansion-to-defined]<br=
>
&gt;=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (defi=
ned _FORTIFY_SOURCE &amp;&amp; 0 &lt; _FORTIFY_SOURCE \<br>
&gt;=C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0and we&#39;re not building on Apple or BSD, so we should b=
e able<br>
&gt;=C2=A0 =C2=A0to just ignoreit until it&#39;s resolved properly in some =
newer gnulib<br>
&gt;=C2=A0 =C2=A0and imported from gnulib to grub-2<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.02.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.02.bb</a> | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.02.bb"=
 rel=3D"noreferrer" target=3D"_blank">grub-efi_2.02.bb</a> b/meta/recipes-b=
sp/grub/<a href=3D"http://grub-efi_2.02.bb" rel=3D"noreferrer" target=3D"_b=
lank">grub-efi_2.02.bb</a><br>
&gt; index b949bebced..45f4c1ed34 100644<br>
&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.02.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.02.bb</a><br>
&gt; +++ b/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.02.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.02.bb</a><br>
&gt; @@ -36,6 +36,12 @@ EXTRA_OECONF +=3D &quot;--enable-efiemu=3Dno&quot;<=
br>
&gt;=C2=A0 # and many other places in the grub code when compiled with some=
 native gcc compilers (specifically, gentoo)<br>
&gt;=C2=A0 CFLAGS_append_class-native =3D &quot; -Wno-error=3Dtrampolines&q=
uot;<br>
&gt;<br>
&gt; +# this comes from gnulib and it&#39;s used only for Apple and BSD, so=
 we can ignore it<br>
&gt; +# ./config-util.h:1504:48: error: this use of &quot;defined&quot; may=
 not be portable [-Werror=3Dexpansion-to-defined]<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (defined _FORTIFY=
_SOURCE &amp;&amp; 0 &lt; _FORTIFY_SOURCE \<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~<br>
&gt; +CFLAGS_append_class-native =3D &quot; -Wno-error=3Dexpansion-to-defin=
ed&quot;<br>
&gt; +<br>
<br>
</div></div>This workaround seems reasonable but I wonder why it fails on b=
uild host<br>
for you. how is your build hosts toolchain configured to generate this<br>
warning. Since you mentioned gcc7 then why doesnt it fail for OE<br>
targets<br>
in same way.<br>
<br>
An upstreamable fix would be to break this define into another #if ..<br>
#else macros and define the new macro to 1 or 0 depending upon the<br>
conditions<br>
being tested.<br>
<div class=3D"m_4829099699774669584HOEnZb"><div class=3D"m_4829099699774669=
584h5"><br>
&gt;=C2=A0 do_install_class-native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 grub-mkimage ${D}${bin=
dir}<br>
&gt; --<br>
&gt; 2.14.1<br>
&gt;<br>
</div></div><span class=3D"m_4829099699774669584HOEnZb"><font color=3D"#888=
888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>
</blockquote></div></div>

--089e0823821401967405575aed4f--
