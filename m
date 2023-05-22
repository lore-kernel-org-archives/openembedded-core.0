Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC33C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 05:40:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.15633.1684733997220004139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 May 2023 22:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=X4EJH5vX;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30a95ec7744so37812f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 May 2023 22:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684733995; x=1687325995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gfyU4m6bXYToMRvqpNspEtyAPiT8W9iwGy6GsRjR4eU=;
        b=X4EJH5vX8Bd8mUaju5XH/g5wjuVntYlxMcdb8ilt6T7QN90NpaKIo4wWOwuThXKTNC
         PovxKIbf7XGyg0hgIlee/YBi0Ioo7ADGbvIYIx000hFd4960nxHdDI26iDBTsWCbGLxo
         mVMLdDxZ0vTGUTdkxcArFIRmAdrh32RLk8sutRxqxYbLVqCv4jFwqlvrvg69jh2B0362
         p+rjTKUio7p59tLQCw+AOdn3LKrSH9sU7Mq9rHJFl9McHjT0Vspy+xozmpJuQ/gaXozX
         L0Y2EVJaElnDjPmoum2RkdeKbn4or3x5TWG9RP90MxkbP2aEPI05Y7osE3+iElKpRd6a
         PLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684733995; x=1687325995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfyU4m6bXYToMRvqpNspEtyAPiT8W9iwGy6GsRjR4eU=;
        b=Vg9mpLDRinheXwJUqE3KIsnGf+BPn3FHvEUQEt5Q48QVt+0uK8Db+kIDZjBhdBm6vZ
         gcw9FkFO+zrv+Jh1PMXGjzX83EfMCfBjmMbVzIlbSw9E4FrE/GvEbh4QH/LlLVJV1Dos
         fvOmIk+A1Yk1oYoGvFb4zFL4CyIhNZdRjSJmCA4rAnEWfEzuJuDuAgu250tRfiNH8bCf
         0V94njpbXuS6mQih8DYHG6XslI9g/plLqKaxJ/2/Z2M6du5LD4ppMX640VSPIv70DiKi
         GYtA9iSMa7xWVy7k/jgnFQFW4pH+7x84kXgIcGDDQ1chGTOrwWAW80whPH6wJq+Soej9
         uezQ==
X-Gm-Message-State: AC+VfDxJ/Oq4EmRc5AuSn7JesTBz1p6LW+g21FgRlx2G2tCpq47By+0V
	UdhqzlnrGW5g+SWbkMjBQLzn5XD102/5ttB68FU=
X-Google-Smtp-Source: ACHHUZ5IYJFtdyPHYQwXDhwoOcmdZL6OfU73iaL0iSZGLHRIAUzC3KpaP3Jz9HTACfdkpt1taSrQ5yEXPFOtW8alB44=
X-Received: by 2002:adf:f28d:0:b0:307:82e3:70cd with SMTP id
 k13-20020adff28d000000b0030782e370cdmr6960298wro.14.1684733995228; Sun, 21
 May 2023 22:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <b09094a7-c22b-a151-6119-0e957b188563@windriver.com>
In-Reply-To: <b09094a7-c22b-a151-6119-0e957b188563@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 May 2023 07:39:44 +0200
Message-ID: <CA+chaQcDp7X9QZOdDu21QJFyVDWJ8hSkDSiY1x70L=a1mneg=g@mail.gmail.com>
Subject: Re: [OE-core] cmake-native build failure on fedora38
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: richard.purdie@linuxfoundation.org, Khem Raj <raj.khem@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000053a16105fc41b3e5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 05:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181581

--00000000000053a16105fc41b3e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I've built my own uninative tarballs with khem's gcc-13 reviews and
it's working fine for me since March and I'm using the same for kirkstone
builds now which were just missing small fixes for llvm, nodejs, abseil-cpp
to build my LuneOS images with gcc-13 on host (all 3 fixes sent to ML last
week).

On Mon, May 22, 2023 at 7:32=E2=80=AFAM Changqing Li <changqing.li@eng.wind=
river.com>
wrote:

> Hi, Richard, Khem
>
> With uninative enabled, I build cmake-native failed on host fedora38.
>
> Host fedora38 have gcc 13, and uninative tarball with libstdc++ from gcc
> 12, which will have runtime error when run the compiled apps. There shoul=
d
> be some incompatibility.
>
> I noticed that Khem had an patch in mail list to upgrade oe-core gcc to
> 13,  we need to update gcc to 13 and then update the uninative tarball to
> fix this failure.
>
> Can I know is there any plan about upgrade gcc to 13,  and will the
> uninative tarball be rebuilt after gcc is upgraded?  Thanks.
>
>
> Here is the failure:
>
> $ g++ -g -isystem/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r=
0/recipe-sysroot-native/usr/include -O2 -pipe
> -L/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroo=
t-native/usr/lib
> -L/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroo=
t-native/lib
> -Wl,--enable-new-dtags    -Wl,-rpath-link,/build/tmp-glibc/work/x86_64-li=
nux/cmake-native/3.25.2-r0/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0=
/recipe-sysroot-native/lib
> -Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/reci=
pe-sysroot-native/usr/lib
> -Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/reci=
pe-sysroot-native/lib
>  -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/build/tmp-gl=
ibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> -std=3Dgnu++17 cmake_bootstrap_7352_test.cxx -o cmake_bootstrap_7352_test
> $ gdb ./cmake_bootstrap_7352_test
> GNU gdb (GDB) Fedora Linux 13.1-3.fc38
> Copyright (C) 2023 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml>This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> Type "show copying" and "show warranty" for details.
> This GDB was configured as "x86_64-redhat-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <https://www.gnu.org/software/gdb/bugs/>.Find the GDB manual and other do=
cumentation resources online at:
>     <http://www.gnu.org/software/gdb/documentation/>.
> For help, type "help".
> Type "apropos word" to search for commands related to "word"...
> Reading symbols from ./cmake_bootstrap_7352_test...
> (gdb) r
> Starting program: /build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-=
r0/cmake_bootstrap_7352_test
> warning: Error disabling address space randomization: Operation not permi=
tted
>
> This GDB supports auto-downloading debuginfo from the following URLs:
>   <https://debuginfod.fedoraproject.org/>Enable debuginfod for this sessi=
on? (y or [n]) y
> Debuginfod has been enabled.
> To make this setting permanent, add 'set debuginfod enabled on' to .gdbin=
it.
> Downloading separate debug info for system-supplied DSO at 0x7ffeaaffe000
> Downloading separate debug info for /build/tmp-glibc/sysroots-uninative/x=
86_64-linux/usr/lib/libstdc++.so.6
> Missing separate debuginfo for /build/tmp-glibc/sysroots-uninative/x86_64=
-linux/usr/lib/libstdc++.so.6
> Try: dnf --enablerepo=3D'*debug*' install /usr/lib/debug/.build-id/7b/ff8=
bdd19faf549fb41f33504fa23bd0ae23ce8.debug
> Downloading separate debug info for /build/tmp-glibc/sysroots-uninative/x=
86_64-linux/lib/libgcc_s.so.1
> Missing separate debuginfo for /build/tmp-glibc/sysroots-uninative/x86_64=
-linux/lib/libgcc_s.so.1
> Try: dnf --enablerepo=3D'*debug*' install /usr/lib/debug/.build-id/6e/9a3=
111b316bb6ec90cc2fff7af5a494d7e7589.debug
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
>
> Program received signal SIGSEGV, Segmentation fault.
> (gdb) info s
> #0  0x00007f5facbf9e6a in std::basic_ostream<char, std::char_traits<char>=
 >::sentry::sentry(std::basic_ostream<char, std::char_traits<char> >&)
>     () from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libs=
tdc++.so.6
> #1  0x00007f5facbfa81c in std::basic_ostream<char, std::char_traits<char>=
 >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream=
<char, std::char_traits<char> >&, char const*, long) ()
>    from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc+=
+.so.6
> #2  0x00000000004012ca in std::operator<< <std::char_traits<char> > (__s=
=3D0x402010 "debug2", __out=3D...) at /usr/include/c++/13/ostream:667
> #3  check_cxx14 () at cmake_bootstrap_7352_test.cxx:25
> #4  0x0000000000401120 in main () at cmake_bootstrap_7352_test.cxx:79
> (gdb) info sharedlibrary
> From                To                  Syms Read   Shared Object Library
> 0x00007f5facce7000  0x00007f5facd0c145  Yes (*)     /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> 0x00007f5facb67320  0x00007f5facc63692  Yes (*)     /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/usr/lib/libstdc++.so.6
> 0x00007f5fac9f73a0  0x00007f5faca682f8  Yes         /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/libm.so.6
> 0x00007f5fac9cd660  0x00007f5fac9e3bd5  Yes (*)     /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/libgcc_s.so.1
> 0x00007f5fac80d780  0x00007f5fac95affd  Yes         /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/libc.so.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181580):
> https://lists.openembedded.org/g/openembedded-core/message/181580
> Mute This Topic: https://lists.openembedded.org/mt/99059205/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000053a16105fc41b3e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I&#39;ve built my own uninative tarballs with khem&#=
39;s gcc-13 reviews and it&#39;s working fine for me since March and I&#39;=
m using the same for kirkstone builds now which were just missing small fix=
es for llvm, nodejs, abseil-cpp to build my LuneOS images with gcc-13 on ho=
st (all 3 fixes sent to ML last week).</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 22, 2023 at 7:32=E2=80=AF=
AM Changqing Li &lt;<a href=3D"mailto:changqing.li@eng.windriver.com">chang=
qing.li@eng.windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">

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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181580): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181580" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181580</a><br>
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

--00000000000053a16105fc41b3e5--

