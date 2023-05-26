Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15200C77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 19:11:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.2314.1685128256474516755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 12:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oNy2Kg/K;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30aa76048fbso719167f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 12:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685128255; x=1687720255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8I3BBAwiQpvAtBaugxV90pwcRLLuqCXOoqUpEX84U2g=;
        b=oNy2Kg/KKHYI9BFNRHEKtG3sdGe2bLhbtdlg8NW8sz4xMbc4HBLH0Ry8T1Lp7ENYbz
         dgsziqyxbLX6eaqOJhhjh4bZ7I1fa8aYOW74FHhVSh9Uaxu0hmjxj00BLDAtRtAn6rgI
         huaX7JzDz9vRIHQjwO6UgSEbOOeQ3YSppVQRRnbuuPOdlq1rNBdrjm3Cg7qJGlcYVrnQ
         zyYn/V3FwwAWBQiNYknpnCU+t8lvTPzHBgjtjirP0ij7e/yD6tb8Oj6mq3lKM15zPbz7
         n/InOn8vLqQBBhLLyO/Lmg+4FVObcuckWo2D4GR58eAV6BMjctO/Fq/VFjn+qrYOLdZL
         LSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685128255; x=1687720255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8I3BBAwiQpvAtBaugxV90pwcRLLuqCXOoqUpEX84U2g=;
        b=cUaUHIq76UrtjCNNusMFqnUti1SlWYnO0BpVHy0MwM87P77UXZ+O56MOFT8lluZsqZ
         AJvRwCEi55QjNBTBoAcxQa9kkGX7YYqrh5SL6RwupBBezgzwvjrFpTFxPHuDmTpWz+CF
         d40vuK5wl4fCe4+to8hnXXBh/PxGITg/IIKfbZcHwEuDu3IP6FlKCNW8/naqNWTI3rn7
         2jXtwW1RdJzUtKq0EXSntS1Is8VM9GYdt/srriNMQlW9cSxl9WxSgk7rSA8VQvimFWzq
         ubtNQPY/Y/w9vM4KrqrY3ZmNlEYYguxdo9n2tgDsYftl/Jal6tVnChJK8CgyOUUoMeSC
         bHmA==
X-Gm-Message-State: AC+VfDzqdDEKye6sNjTgVF+Ge+5mDCsaKa54BKAhyeCP2JFy1NxPICMk
	NTB2g+HLVc9JmVKvwsshsluxgaPuWK424UL49GE=
X-Google-Smtp-Source: ACHHUZ4G0HBGmFFC7gIvZNg+xCFmOwX8XvXllWw9eNzJyJoN7rDiToBOFP9VUVsK5eG7r3pR5Cs56kOD2z/Owgl8Qyw=
X-Received: by 2002:a5d:538f:0:b0:306:37a2:6e56 with SMTP id
 d15-20020a5d538f000000b0030637a26e56mr2438645wrv.5.1685128254470; Fri, 26 May
 2023 12:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <b09094a7-c22b-a151-6119-0e957b188563@windriver.com> <176160A5101A4DA8.15175@lists.openembedded.org>
In-Reply-To: <176160A5101A4DA8.15175@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 May 2023 21:10:43 +0200
Message-ID: <CA+chaQcc8jUWvuM_vAL-+=geRSjNNK+d0j27QKZ=PWsN7VWUMQ@mail.gmail.com>
Subject: Re: [OE-core] cmake-native build failure on fedora38
To: Martin.Jansa@gmail.com
Cc: Changqing Li <changqing.li@eng.windriver.com>, richard.purdie@linuxfoundation.org, 
	Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000002401805fc9d7f83"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 19:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181779

--00000000000002401805fc9d7f83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've recently upgraded by gentoo host to gcc-13.1.1_p20230520 and the just
merged gcc-13.1.0 in oe-core isn't new enough for uninative again.

This new snapshot started to use ABI from GCC-13.2.0 (as
https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html says:
GCC 13.2.0: GLIBCXX_3.4.32, CXXABI_1.3.14) and now e.g. ninja-native fails
to build with:
|
/OE/build/poky/build/tmp/work/x86_64-linux/ninja-native/1.11.1-r0/git/./con=
figure.py:26:
DeprecationWarning: 'pipes' is deprecated and slated fo
r removal in Python 3.13
|   import pipes
| re2c:
/OE/build/poky/build/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.=
so.6:
version `GLIBCXX_3.4.32' not found (required by re2c)
| bootstrapping ninja...
| Traceback (most recent call last):
|   File
"/OE/build/poky/build/tmp/work/x86_64-linux/ninja-native/1.11.1-r0/git/./co=
nfigure.py",
line 480, in <module>
|     if has_re2c():
|        ^^^^^^^^^^
|   File
"/OE/build/poky/build/tmp/work/x86_64-linux/ninja-native/1.11.1-r0/git/./co=
nfigure.py",
line 477, in has_re2c
|     return int(proc.communicate()[0], 10) >=3D 1103
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| ValueError: invalid literal for int() with base 10: b''

So make sure to keep your host gcc older than that or prepare your own
uninative tarball with gcc recipes upgraded even more.

On Mon, May 22, 2023 at 7:39=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> FWIW: I've built my own uninative tarballs with khem's gcc-13 reviews and
> it's working fine for me since March and I'm using the same for kirkstone
> builds now which were just missing small fixes for llvm, nodejs, abseil-c=
pp
> to build my LuneOS images with gcc-13 on host (all 3 fixes sent to ML las=
t
> week).
>
> On Mon, May 22, 2023 at 7:32=E2=80=AFAM Changqing Li <
> changqing.li@eng.windriver.com> wrote:
>
>> Hi, Richard, Khem
>>
>> With uninative enabled, I build cmake-native failed on host fedora38.
>>
>> Host fedora38 have gcc 13, and uninative tarball with libstdc++ from gcc
>> 12, which will have runtime error when run the compiled apps. There shou=
ld
>> be some incompatibility.
>>
>> I noticed that Khem had an patch in mail list to upgrade oe-core gcc to
>> 13,  we need to update gcc to 13 and then update the uninative tarball t=
o
>> fix this failure.
>>
>> Can I know is there any plan about upgrade gcc to 13,  and will the
>> uninative tarball be rebuilt after gcc is upgraded?  Thanks.
>>
>>
>> Here is the failure:
>>
>> $ g++ -g -isystem/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-=
r0/recipe-sysroot-native/usr/include -O2 -pipe
>> -L/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysro=
ot-native/usr/lib
>> -L/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysro=
ot-native/lib
>> -Wl,--enable-new-dtags    -Wl,-rpath-link,/build/tmp-glibc/work/x86_64-l=
inux/cmake-native/3.25.2-r0/recipe-sysroot-native/usr/lib
>> -Wl,-rpath-link,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r=
0/recipe-sysroot-native/lib
>> -Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/rec=
ipe-sysroot-native/usr/lib
>> -Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/rec=
ipe-sysroot-native/lib
>>  -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/build/tmp-g=
libc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>> -std=3Dgnu++17 cmake_bootstrap_7352_test.cxx -o cmake_bootstrap_7352_tes=
t
>> $ gdb ./cmake_bootstrap_7352_test
>> GNU gdb (GDB) Fedora Linux 13.1-3.fc38
>> Copyright (C) 2023 Free Software Foundation, Inc.
>> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.=
html>This is free software: you are free to change and redistribute it.
>> There is NO WARRANTY, to the extent permitted by law.
>> Type "show copying" and "show warranty" for details.
>> This GDB was configured as "x86_64-redhat-linux-gnu".
>> Type "show configuration" for configuration details.
>> For bug reporting instructions, please see:
>> <https://www.gnu.org/software/gdb/bugs/>.Find the GDB manual and other d=
ocumentation resources online at:
>>     <http://www.gnu.org/software/gdb/documentation/>.
>> For help, type "help".
>> Type "apropos word" to search for commands related to "word"...
>> Reading symbols from ./cmake_bootstrap_7352_test...
>> (gdb) r
>> Starting program: /build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2=
-r0/cmake_bootstrap_7352_test
>> warning: Error disabling address space randomization: Operation not perm=
itted
>>
>> This GDB supports auto-downloading debuginfo from the following URLs:
>>   <https://debuginfod.fedoraproject.org/>Enable debuginfod for this sess=
ion? (y or [n]) y
>> Debuginfod has been enabled.
>> To make this setting permanent, add 'set debuginfod enabled on' to .gdbi=
nit.
>> Downloading separate debug info for system-supplied DSO at 0x7ffeaaffe00=
0
>> Downloading separate debug info for /build/tmp-glibc/sysroots-uninative/=
x86_64-linux/usr/lib/libstdc++.so.6
>> Missing separate debuginfo for /build/tmp-glibc/sysroots-uninative/x86_6=
4-linux/usr/lib/libstdc++.so.6
>> Try: dnf --enablerepo=3D'*debug*' install /usr/lib/debug/.build-id/7b/ff=
8bdd19faf549fb41f33504fa23bd0ae23ce8.debug
>> Downloading separate debug info for /build/tmp-glibc/sysroots-uninative/=
x86_64-linux/lib/libgcc_s.so.1
>> Missing separate debuginfo for /build/tmp-glibc/sysroots-uninative/x86_6=
4-linux/lib/libgcc_s.so.1
>> Try: dnf --enablerepo=3D'*debug*' install /usr/lib/debug/.build-id/6e/9a=
3111b316bb6ec90cc2fff7af5a494d7e7589.debug
>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/lib64/libthread_db.so.1".
>>
>> Program received signal SIGSEGV, Segmentation fault.
>> (gdb) info s
>> #0  0x00007f5facbf9e6a in std::basic_ostream<char, std::char_traits<char=
> >::sentry::sentry(std::basic_ostream<char, std::char_traits<char> >&)
>>     () from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/lib=
stdc++.so.6
>> #1  0x00007f5facbfa81c in std::basic_ostream<char, std::char_traits<char=
> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostrea=
m<char, std::char_traits<char> >&, char const*, long) ()
>>    from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc=
++.so.6
>> #2  0x00000000004012ca in std::operator<< <std::char_traits<char> > (__s=
=3D0x402010 "debug2", __out=3D...) at /usr/include/c++/13/ostream:667
>> #3  check_cxx14 () at cmake_bootstrap_7352_test.cxx:25
>> #4  0x0000000000401120 in main () at cmake_bootstrap_7352_test.cxx:79
>> (gdb) info sharedlibrary
>> From                To                  Syms Read   Shared Object Librar=
y
>> 0x00007f5facce7000  0x00007f5facd0c145  Yes (*)     /build/tmp-glibc/sys=
roots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>> 0x00007f5facb67320  0x00007f5facc63692  Yes (*)     /build/tmp-glibc/sys=
roots-uninative/x86_64-linux/usr/lib/libstdc++.so.6
>> 0x00007f5fac9f73a0  0x00007f5faca682f8  Yes         /build/tmp-glibc/sys=
roots-uninative/x86_64-linux/lib/libm.so.6
>> 0x00007f5fac9cd660  0x00007f5fac9e3bd5  Yes (*)     /build/tmp-glibc/sys=
roots-uninative/x86_64-linux/lib/libgcc_s.so.1
>> 0x00007f5fac80d780  0x00007f5fac95affd  Yes         /build/tmp-glibc/sys=
roots-uninative/x86_64-linux/lib/libc.so.6
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181581):
> https://lists.openembedded.org/g/openembedded-core/message/181581
> Mute This Topic: https://lists.openembedded.org/mt/99059205/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000002401805fc9d7f83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve recently upgraded by gentoo host to gcc-13.1.1_p2=
0230520 and the just merged gcc-13.1.0 in oe-core isn&#39;t new enough for =
uninative again.<br><div><br></div><div>This new snapshot started to use AB=
I from GCC-13.2.0 (as <a href=3D"https://gcc.gnu.org/onlinedocs/libstdc++/m=
anual/abi.html">https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html</a=
> says:</div><div>GCC 13.2.0: GLIBCXX_3.4.32, CXXABI_1.3.14) and now e.g. n=
inja-native fails to build with:</div><div>| /OE/build/poky/build/tmp/work/=
x86_64-linux/ninja-native/1.11.1-r0/git/./configure.py:26: DeprecationWarni=
ng: &#39;pipes&#39; is deprecated and slated fo<br>r removal in Python 3.13=
<br>| =C2=A0 import pipes<br>| re2c: /OE/build/poky/build/tmp/sysroots-unin=
ative/x86_64-linux/usr/lib/libstdc++.so.6: version `GLIBCXX_3.4.32&#39; not=
 found (required by re2c)<br>| bootstrapping ninja...<br>| Traceback (most =
recent call last):<br>| =C2=A0 File &quot;/OE/build/poky/build/tmp/work/x86=
_64-linux/ninja-native/1.11.1-r0/git/./configure.py&quot;, line 480, in &lt=
;module&gt;<br>| =C2=A0 =C2=A0 if has_re2c():<br>| =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^^^^^^^^^^<br>| =C2=A0 File &quot;/OE/build/poky/build/tmp/work/x86_64-l=
inux/ninja-native/1.11.1-r0/git/./configure.py&quot;, line 477, in has_re2c=
<br>| =C2=A0 =C2=A0 return int(proc.communicate()[0], 10) &gt;=3D 1103<br>|=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br=
>| ValueError: invalid literal for int() with base 10: b&#39;&#39;<br></div=
><div><br></div><div>So make sure to keep your host gcc older than that or =
prepare your own uninative tarball with gcc recipes upgraded even more.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, May 22, 2023 at 7:39=E2=80=AFAM Martin Jansa via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">FWIW: I&#39;ve built my own uninative tarballs with =
khem&#39;s gcc-13 reviews and it&#39;s working fine for me since March and =
I&#39;m using the same for kirkstone builds now which were just missing sma=
ll fixes for llvm, nodejs, abseil-cpp to build my LuneOS images with gcc-13=
 on host (all 3 fixes sent to ML last week).</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 22, 2023 at 7:32=E2=
=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing.li@eng.windriver.com"=
 target=3D"_blank">changqing.li@eng.windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <p>Hi, Richard, Khem</p>
    <p>With uninative enabled, I build cmake-native failed on host
      fedora38.=C2=A0 <br>
    </p>
    <p>Host fedora38 have gcc 13, and uninative tarball with libstdc++
      from gcc 12, which will have runtime error when run the compiled
      apps. There should be some incompatibility. <br>
    </p>
    <p>I noticed that Khem had an patch in mail list to upgrade oe-core
      gcc to 13,=C2=A0 we need to update gcc to 13 and then update the
      uninative tarball to fix this failure.<br>
    </p>
    <p>Can I know is there any plan about upgrade gcc to 13,=C2=A0 and will
      the uninative tarball be rebuilt after gcc is upgraded?=C2=A0 Thanks.=
<br>
    </p>
    <p></p>
    <p><br>
    </p>
    <p>Here is the failure:<br>
    </p>
    <pre>$ g++ -g -isystem/build/tmp-glibc/work/x86_64-linux/cmake-<span>na=
tive</span>/3.25.2-r0/recipe-sysroot-<span>native</span>/usr/include -O2 -p=
ipe=20
-L/build/tmp-glibc/work/x86_64-linux/cmake-<span>native</span>/3.25.2-r0/re=
cipe-sysroot-<span>native</span>/usr/lib=20
-L/build/tmp-glibc/work/x86_64-linux/cmake-<span>native</span>/3.25.2-r0/re=
cipe-sysroot-<span>native</span>/lib =20
-Wl,--enable-<span>new</span>-dtags    -Wl,-rpath-link,/build/tmp-glibc/wor=
k/x86_64-linux/cmake-<span>native</span>/3.25.2-r0/recipe-sysroot-<span>nat=
ive</span>/usr/lib =20
-Wl,-rpath-link,/build/tmp-glibc/work/x86_64-linux/cmake-<span>native</span=
>/3.25.2-r0/recipe-sysroot-<span>native</span>/lib=20
-Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-<span>native</span>/3.2=
5.2-r0/recipe-sysroot-<span>native</span>/usr/lib
-Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-<span>native</span>/3.2=
5.2-r0/recipe-sysroot-<span>native</span>/lib
 -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/build/tmp-glib=
c/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2  =20
-std=3Dgnu++17 cmake_bootstrap_7352_test.cxx -o cmake_bootstrap_7352_test
$ gdb ./cmake_bootstrap_7352_test
GNU gdb (GDB) Fedora Linux 13.1-3.fc38
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;http:<span>//<a href=3D"http=
://gnu.org/licenses/gpl.html" target=3D"_blank">gnu.org/licenses/gpl.html</=
a>&gt;
</span>This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type <span>&quot;show copying&quot;</span> and <span>&quot;show warranty&qu=
ot;</span> <span>for</span> details.
This GDB was configured as <span>&quot;x86_64-redhat-linux-gnu&quot;</span>=
.
Type <span>&quot;show configuration&quot;</span> <span>for</span> configura=
tion details.
For bug reporting instructions, please see:
&lt;https:<span>//<a href=3D"http://www.gnu.org/software/gdb/bugs/" target=
=3D"_blank">www.gnu.org/software/gdb/bugs/</a>&gt;.
</span>Find the GDB manual and other documentation resources online at:
    &lt;http:<span>//<a href=3D"http://www.gnu.org/software/gdb/documentati=
on/" target=3D"_blank">www.gnu.org/software/gdb/documentation/</a>&gt;.
</span>
For help, type <span>&quot;help&quot;</span>.
Type <span>&quot;apropos word&quot;</span> to search <span>for</span> comma=
nds related to <span>&quot;word&quot;</span>...
Reading symbols from ./cmake_bootstrap_7352_test...
(gdb) r
Starting program: /build/tmp-glibc/work/x86_64-linux/cmake-<span>native</sp=
an>/3.25.2-r0/cmake_bootstrap_7352_test=20
warning: Error disabling address space randomization: Operation not permitt=
ed

This GDB supports auto-downloading debuginfo from the following URLs:
  &lt;https:<span>//<a href=3D"http://debuginfod.fedoraproject.org/" target=
=3D"_blank">debuginfod.fedoraproject.org/</a>&gt;
</span>Enable debuginfod <span>for</span> <span>this</span> session? (y or =
[n]) y
Debuginfod has been enabled.
To make <span>this</span> setting permanent, add <span>&#39;set debuginfod =
enabled on&#39;</span> to .gdbinit.
Downloading separate debug info <span>for</span> system-supplied DSO at 0x7=
ffeaaffe000
Downloading separate debug info <span>for</span> /build/tmp-glibc/sysroots-=
uninative/x86_64-linux/usr/lib/libstdc++.so.6                          =20
Missing separate debuginfo <span>for</span> /build/tmp-glibc/sysroots-unina=
tive/x86_64-linux/usr/lib/libstdc++.so.6                               =20
Try: dnf --enablerepo=3D<span>&#39;*debug*&#39;</span> install /usr/lib/deb=
ug/.build-id/7b/ff8bdd19faf549fb41f33504fa23bd0ae23ce8.debug
Downloading separate debug info <span>for</span> /build/tmp-glibc/sysroots-=
uninative/x86_64-linux/lib/libgcc_s.so.1
Missing separate debuginfo <span>for</span> /build/tmp-glibc/sysroots-unina=
tive/x86_64-linux/lib/libgcc_s.so.1                                    =20
Try: dnf --enablerepo=3D<span>&#39;*debug*&#39;</span> install /usr/lib/deb=
ug/.build-id/6e/9a3111b316bb6ec90cc2fff7af5a494d7e7589.debug
[<span>Thread</span> debugging using libthread_db enabled]
Using host libthread_db library <span>&quot;/lib64/libthread_db.so.1&quot;<=
/span>.

Program received signal SIGSEGV, Segmentation fault.
(gdb) info s
#0  0x00007f5facbf9e6a in std::basic_ostream&lt;<span>char</span>, std::cha=
r_traits&lt;<span>char</span>&gt; &gt;::sentry::sentry(std::basic_ostream&l=
t;<span>char</span>, std::char_traits&lt;<span>char</span>&gt; &gt;&amp;)
    () from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstd=
c++.so.6
#1  0x00007f5facbfa81c in std::basic_ostream&lt;<span>char</span>, std::cha=
r_traits&lt;<span>char</span>&gt; &gt;&amp; std::__ostream_insert&lt;<span>=
char</span>, std::char_traits&lt;<span>char</span>&gt; &gt;(std::basic_ostr=
eam&lt;<span>char</span>, std::char_traits&lt;<span>char</span>&gt; &gt;&am=
p;, <span>char</span> <span>const</span>*, <span>long</span>) ()
   from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.=
so.6
#2  0x00000000004012ca in std::<span>operator</span>&lt;&lt; &lt;std::char_=
traits&lt;<span>char</span>&gt; &gt; (__s=3D0x402010 <span>&quot;debug2&quo=
t;</span>, __out=3D...) at /usr/include/c++/13/ostream:667
#3  check_cxx14 () at cmake_bootstrap_7352_test.cxx:25
#4  0x0000000000401120 in main () at cmake_bootstrap_7352_test.cxx:79
(gdb) info sharedlibrary
From                To                  Syms Read   Shared <span>Object</sp=
an> Library
0x00007f5facce7000  0x00007f5facd0c145  Yes (*)     /build/tmp-glibc/sysroo=
ts-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
0x00007f5facb67320  0x00007f5facc63692  Yes (*)     /build/tmp-glibc/sysroo=
ts-uninative/x86_64-linux/usr/lib/libstdc++.so.6
0x00007f5fac9f73a0  0x00007f5faca682f8  Yes         /build/tmp-glibc/sysroo=
ts-uninative/x86_64-linux/lib/libm.so.6
0x00007f5fac9cd660  0x00007f5fac9e3bd5  Yes (*)     /build/tmp-glibc/sysroo=
ts-uninative/x86_64-linux/lib/libgcc_s.so.1
0x00007f5fac80d780  0x00007f5fac95affd  Yes         /build/tmp-glibc/sysroo=
ts-uninative/x86_64-linux/lib/libc.so.6</pre>
  </div>

<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181581): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181581" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181581</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99059205/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99059205/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000002401805fc9d7f83--

