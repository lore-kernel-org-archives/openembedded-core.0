Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD3C7E226
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 19:39:28 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j53so21956439qta.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rQob1EOUgY4d8oxAG32zb6Z2VeWshvrcboimJRaiQww=;
	b=b5Xcdt6DS3SdLVCzYFMtpiXNZ89XZRMBrFwhGvPJvtv9XikMdFD4crdMAvhmNSiRk3
	C2klBjRkgXpbHoSsacWx4Py4SjYTw7Pi7wooT3E4jqru37Rig3mwT0q1mYKcLOwkr3y+
	sbtQdFG1X6qfAlR9wkZAmElZEv2mLK/9nZGZ4dXxQvuLz0ZFE08SmPnNjBP49ALsySqV
	IGU8OokRpc8xF4E1xH7BTsrkfQjRTaS8Z6UYJgJ6wjyzHcJ5NnDoDZOAOhGK/bPTBjks
	QW6TN8LZOSmEUiAXmxOfW7BVLcZuFTgqSryamwvZDZLHxJeMcqdAaoJKsJfe8CnMAIpl
	RSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rQob1EOUgY4d8oxAG32zb6Z2VeWshvrcboimJRaiQww=;
	b=o/j4mQ4/tRuchNjGFq3Tiy6jbAhga5VA8JLLlfJ68g9zTyxgRlvIlSuG3EIfNcY6vV
	URh95SuvSJWRc1Ra+xoDvvtyLZcgFu9Slvi+WQ0uaMbmTFK4aMUkQA0TdlUPz4cblkq1
	BbzmO9B3HnREJJSY/OLzU3wltUJr/m1W9sqQ5wY0y2s4TFJ26nYFnN54MNcv/fWAj0KR
	ORKkLPzmAVDgtGpy9xFPuzEZYieKGdrVWRDZJTsYKp/d1NySOJhYYAW2LrsdfqG9aKku
	FCvs4C7IQTMsRth1KAMi9pIj1cs8sBnLxyZJ6V3ahGrXuMstdR0EjsySRkjQ9j1sQkhq
	o/eg==
X-Gm-Message-State: APjAAAWLj5PhPF9NhVRnFlHURbXYormRep8pUhkuSDDeXXdmlVS8nWbG
	ipE3WcZo6BuTv+6GFJTC12snC8sA8RldN/KUoCmSESyL
X-Google-Smtp-Source: APXvYqynBt4Fk1QdWN16nB+X6X8+RO+yfExB1HgTpCxlyJt2Sd6+krKRAncbZzWVVLZm3SRRMyjprnuvdK+Q30nYZa4=
X-Received: by 2002:ac8:8b2:: with SMTP id v47mr35815256qth.80.1558467569726; 
	Tue, 21 May 2019 12:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <6fb3f28f-fa50-ba0e-34ff-a3a0787b8518@denx.de>
In-Reply-To: <6fb3f28f-fa50-ba0e-34ff-a3a0787b8518@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 12:39:19 -0700
Message-ID: <CAMKF1spaSFHd4sw6DrW8_FPFmLY695xhG6DojwwkNabA8wCn_A@mail.gmail.com>
To: Parthiban Nallathambi <pn@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fedora 30: Yocto support
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
X-List-Received-Date: Tue, 21 May 2019 19:39:29 -0000
Content-Type: multipart/alternative; boundary="000000000000e3399d05896b0101"

--000000000000e3399d05896b0101
Content-Type: text/plain; charset="UTF-8"

I think this could be related to f30 using gcc9
I would suggest that you disable uninative for a while

On Tue, May 21, 2019 at 2:03 AM Parthiban Nallathambi <pn@denx.de> wrote:

> Hello All,
>
> I am trying to compile yocto for my Raspberry PI 0 under Fedora 30. But
> the compilation fails with GLIBC dependency. Please find the logs below.
>
> Any hints/clues to fix this would be helpful. Thanks.
>
> **Logs:**
> |
> /work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/build/Bootstrap.cmk/cmake:
>
> /work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6:
> version `GLIBCXX_3.4.26' not found (required by
>
> /work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/build/Bootstrap.cmk/cmake)
> | ---------------------------------------------
> | Error when bootstrapping CMake:
> | Problem while running initial CMake
> | ---------------------------------------------
> | WARNING:
> /work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/temp/run.do_configure.3874946:1
>
> exit 11 from
> '/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/cmake-3.14.1/configure
>
> --verbose
> --prefix=/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/recipe-sysroot-native/usr
>
> --parallel=8 --
> -DCMAKE_LIBRARY_PATH=/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/recipe-sysroot-native/usr/lib
>
> -DBUILD_CursesDialog=1 -DCMAKE_USE_SYSTEM_LIBRARIES=1
> -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0
> -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0
> -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0
> -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 -DHAVE_SYS_ACL_H=0'
> | ERROR: Function failed: do_configure (log file is located at
>
> /work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/temp/log.do_configure.3874946)
> ERROR: Task
> (/work/rpi/poky/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb:do_configure)
>
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1367 tasks of which 710 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /work/rpi/poky/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb:
> do_configure
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> **GLIBC Version details**:
> $ l
>
> /work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25
> -rwxr-xr-x 1 pn pn 1.5M Mar 18 13:47
>
> /work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25
> $
> $ file
> /work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25
>
>
> /work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25:
>
> ELF 64-bit LSB shared object, x86-64, version 1 (GNU/Linux), dynamically
> linked, BuildID[sha1]=d0e848faaac570e8ceca884083b6e09e23cb9e2b, stripped
> $
> $
> $ ldd
> /work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25
>
>
>          linux-vdso.so.1 (0x00007fffc3901000)
>          libm.so.6 => /lib64/libm.so.6 (0x00007f341ea84000)
>          libc.so.6 => /lib64/libc.so.6 (0x00007f341e8be000)
>          /lib64/ld-linux-x86-64.so.2 (0x00007f341edad000)
>          libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f341e8a4000)
> $ strings
> /work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25
>
> | grep GLIBC
> GLIBCXX_3.4
> GLIBCXX_3.4.1
> GLIBCXX_3.4.2
> GLIBCXX_3.4.3
> GLIBCXX_3.4.4
> GLIBCXX_3.4.5
> GLIBCXX_3.4.6
> GLIBCXX_3.4.7
> GLIBCXX_3.4.8
> GLIBCXX_3.4.9
> GLIBCXX_3.4.10
> GLIBCXX_3.4.11
> GLIBCXX_3.4.12
> GLIBCXX_3.4.13
> GLIBCXX_3.4.14
> GLIBCXX_3.4.15
> GLIBCXX_3.4.16
> GLIBCXX_3.4.17
> GLIBCXX_3.4.18
> GLIBCXX_3.4.19
> GLIBCXX_3.4.20
> GLIBCXX_3.4.21
> GLIBCXX_3.4.22
> GLIBCXX_3.4.23
> GLIBCXX_3.4.24
> GLIBCXX_3.4.25
> GLIBC_2.2.5
> GLIBC_2.3
> GLIBC_2.14
> GLIBC_2.18
> GLIBC_2.16
> GLIBC_2.17
> GLIBC_2.3.2
> GLIBCXX_DEBUG_MESSAGE_LENGTH
> $ l /usr/lib/libstdc++.so.6*
> lrwxrwxrwx 1 root root   19 May  3 16:11 /usr/lib/libstdc++.so.6 ->
> libstdc++.so.6.0.26
> -rwxr-xr-x 1 root root 2.0M May  3 16:18 /usr/lib/libstdc++.so.6.0.26
>
> --
> Thanks,
> Parthiban N
>
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e3399d05896b0101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think this could be related to f30 using gcc9=C2=
=A0</div></div><div dir=3D"auto">I would suggest that you disable uninative=
 for a while=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, May 21, 2019 at 2:03 AM Parthiban Nallathamb=
i &lt;<a href=3D"mailto:pn@denx.de">pn@denx.de</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hello All,<br>
<br>
I am trying to compile yocto for my Raspberry PI 0 under Fedora 30. But<br>
the compilation fails with GLIBC dependency. Please find the logs below.<br=
>
<br>
Any hints/clues to fix this would be helpful. Thanks.<br>
<br>
**Logs:**<br>
| <br>
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/build/Bootstrap=
.cmk/cmake: <br>
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6: =
<br>
version `GLIBCXX_3.4.26&#39; not found (required by <br>
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/build/Bootstrap=
.cmk/cmake)<br>
| ---------------------------------------------<br>
| Error when bootstrapping CMake:<br>
| Problem while running initial CMake<br>
| ---------------------------------------------<br>
| WARNING: <br>
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/temp/run.do_con=
figure.3874946:1 <br>
exit 11 from <br>
&#39;/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/cmake-3.14=
.1/configure <br>
--verbose <br>
--prefix=3D/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/reci=
pe-sysroot-native/usr <br>
--parallel=3D8 -- <br>
-DCMAKE_LIBRARY_PATH=3D/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.=
14.1-r0/recipe-sysroot-native/usr/lib <br>
-DBUILD_CursesDialog=3D1 -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 <br>
-DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 <br>
-DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 <br>
-DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D=
0 <br>
-DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 -DHAVE_SYS_ACL_H=3D0&#39;<br>
| ERROR: Function failed: do_configure (log file is located at <br>
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/temp/log.do_con=
figure.3874946)<br>
ERROR: Task <br>
(/work/rpi/poky/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb:do_confi=
gure) <br>
failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 1367 tasks of which 710 didn&#39;t need to b=
e <br>
rerun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
<br>
/work/rpi/poky/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb:do_config=
ure<br>
Summary: There was 1 WARNING message shown.<br>
Summary: There was 1 ERROR message shown, returning a non-zero exit code.<b=
r>
<br>
**GLIBC Version details**:<br>
$ l <br>
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0=
.25<br>
-rwxr-xr-x 1 pn pn 1.5M Mar 18 13:47 <br>
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0=
.25<br>
$<br>
$ file <br>
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0=
.25 <br>
<br>
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0=
.25: <br>
ELF 64-bit LSB shared object, x86-64, version 1 (GNU/Linux), dynamically <b=
r>
linked, BuildID[sha1]=3Dd0e848faaac570e8ceca884083b6e09e23cb9e2b, stripped<=
br>
$<br>
$<br>
$ ldd <br>
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0=
.25 <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-vdso.so.1 (0x00007fffc3901000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libm.so.6 =3D&gt; /lib64/libm.so.6 (0x000=
07f341ea84000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc.so.6 =3D&gt; /lib64/libc.so.6 (0x000=
07f341e8be000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/lib64/ld-linux-x86-64.so.2 (0x00007f341e=
dad000)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgcc_s.so.1 =3D&gt; /lib64/libgcc_s.so.=
1 (0x00007f341e8a4000)<br>
$ strings <br>
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0=
.25 <br>
| grep GLIBC<br>
GLIBCXX_3.4<br>
GLIBCXX_3.4.1<br>
GLIBCXX_3.4.2<br>
GLIBCXX_3.4.3<br>
GLIBCXX_3.4.4<br>
GLIBCXX_3.4.5<br>
GLIBCXX_3.4.6<br>
GLIBCXX_3.4.7<br>
GLIBCXX_3.4.8<br>
GLIBCXX_3.4.9<br>
GLIBCXX_3.4.10<br>
GLIBCXX_3.4.11<br>
GLIBCXX_3.4.12<br>
GLIBCXX_3.4.13<br>
GLIBCXX_3.4.14<br>
GLIBCXX_3.4.15<br>
GLIBCXX_3.4.16<br>
GLIBCXX_3.4.17<br>
GLIBCXX_3.4.18<br>
GLIBCXX_3.4.19<br>
GLIBCXX_3.4.20<br>
GLIBCXX_3.4.21<br>
GLIBCXX_3.4.22<br>
GLIBCXX_3.4.23<br>
GLIBCXX_3.4.24<br>
GLIBCXX_3.4.25<br>
GLIBC_2.2.5<br>
GLIBC_2.3<br>
GLIBC_2.14<br>
GLIBC_2.18<br>
GLIBC_2.16<br>
GLIBC_2.17<br>
GLIBC_2.3.2<br>
GLIBCXX_DEBUG_MESSAGE_LENGTH<br>
$ l /usr/lib/libstdc++.so.6*<br>
lrwxrwxrwx 1 root root=C2=A0 =C2=A019 May=C2=A0 3 16:11 /usr/lib/libstdc++.=
so.6 -&gt; <br>
libstdc++.so.6.0.26<br>
-rwxr-xr-x 1 root root 2.0M May=C2=A0 3 16:18 /usr/lib/libstdc++.so.6.0.26<=
br>
<br>
-- <br>
Thanks,<br>
Parthiban N<br>
<br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director: Wolf=
gang Denk<br>
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<br>
Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: <a href=3D"mailt=
o:pn@denx.de" target=3D"_blank">pn@denx.de</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000e3399d05896b0101--
