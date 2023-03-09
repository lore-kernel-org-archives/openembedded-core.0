Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5258C678D5
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 02:22:17 +0000 (UTC)
Subject: Re: [PATCH] rust: added missing runtime dependencies to run rust on target
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.146.86)
X-Originating-Platform: Windows Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 08 Mar 2023 18:22:17 -0800
References: <CANNYZj83YFEQ6ZnzfL1Wh4EeM2BtGA+kooTcmsjUp7vDRuA9Qw@mail.gmail.com>
In-Reply-To: <CANNYZj83YFEQ6ZnzfL1Wh4EeM2BtGA+kooTcmsjUp7vDRuA9Qw@mail.gmail.com>
Message-ID: <8800.1678328537518991798@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="A7H31GbJzhUjBRS8tWYp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 02:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178207

--A7H31GbJzhUjBRS8tWYp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

All the 3 ' gcc g++ binutil ' are required to run rust on target.

>=20
> Without binutils getting error 'cannot find ld ' and
>=20

without g++ getting below error:

>=20
> root@qemux86-64:~# rustc -o hello main.rs
> error: linking with `x86_64-poky-linux-gcc` failed: exit status: 1
> |
> =3D note: "x86_64-poky-linux-gcc" "/tmp/rustcuD3OmE/symbols.o"
> "hello.main.cbe1d0af-cgu.0.rcgu.o" "hello.main.cbe1d0af-cgu.1.rcgu.o"
> "hello.main.cbe1d0af-cgu.2.rcgu.o" "hello.main.cbe1d0af
> =3D note:
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find Scrt1.o: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find crti.o: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find crtbeginS.o: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find -lgcc_s: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find -lutil: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find -lrt: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find -lpthread: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find -lm: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find -ldl: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find -lc: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find crtendS.o: No such file or directory
> /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/l=
d:
> cannot find crtn.o: No such file or directory
> collect2: error: ld returned 1 exit status
> error: aborting due to previous error
>=20

I tried the given dependencies ' gcc gcc-symlinks binutils ${LIBC_DEPENDENC=
IES} libgcc-dev ' to avoid g++ but that giving below QA error:

>=20
> NOTE: Executing Tasks
> ERROR: rust-1.67.1-r0 do_package_qa: QA Issue: rust rdepends on glibc-dbg
> [debug-deps]
> ERROR: rust-1.67.1-r0 do_package_qa: QA Issue: rust rdepends on glibc-dev
> [dev-deps]
> ERROR: rust-1.67.1-r0 do_package_qa: QA Issue: rust rdepends on libgcc-de=
v
> [dev-deps]
> ERROR: rust-1.67.1-r0 do_package_qa: Fatal QA errors were found, failing
> task.
>

--A7H31GbJzhUjBRS8tWYp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>All the 3 '<em>gcc g++ binutil</em>' are required to run rust on targe=
t.</div>
<blockquote>
<div>Without binutils getting error 'cannot find <em>ld</em>' and</div>
</blockquote>
<div>without g++ getting below error:</div>
<blockquote>
<div><span style=3D"white-space: pre;"> </span>root@qemux86-64:~# rustc -o =
hello main.rs</div>
<div><span style=3D"white-space: pre;"> </span>error: linking with `x86_64-=
poky-linux-gcc` failed: exit status: 1</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; |</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; =3D note: "x86_64-pok=
y-linux-gcc" "/tmp/rustcuD3OmE/symbols.o" "hello.main.cbe1d0af-cgu.0.rcgu.o=
" "hello.main.cbe1d0af-cgu.1.rcgu.o" "hello.main.cbe1d0af-cgu.2.rcgu.o" "he=
llo.main.cbe1d0af</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; =3D note: /usr/lib/gc=
c/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot fin=
d Scrt1.o: No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crti.o: =
No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtbegin=
S.o: No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lgcc_s:=
 No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lutil: =
No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lrt: No=
 such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lpthrea=
d: No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lm: No =
such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -ldl: No=
 such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lc: No =
such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtendS.=
o: No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; /usr/lib/gcc/x86_64-p=
oky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtn.o: =
No such file or directory</div>
<div><span style=3D"white-space: pre;"> </span>&nbsp; collect2: error: ld r=
eturned 1 exit status</div>
<div><span style=3D"white-space: pre;"> </span>error: aborting due to previ=
ous error</div>
</blockquote>
<div>I tried the given dependencies '<em>gcc gcc-symlinks binutils ${LIBC_D=
EPENDENCIES} libgcc-dev</em>' to avoid <em>g++</em> but that giving below Q=
A error:</div>
<blockquote>
<div><span style=3D"white-space: pre;"> </span>NOTE: Executing Tasks</div>
<div><span style=3D"white-space: pre;"> </span>ERROR: rust-1.67.1-r0 do_pac=
kage_qa: QA Issue: rust rdepends on glibc-dbg [debug-deps]</div>
<div><span style=3D"white-space: pre;"> </span>ERROR: rust-1.67.1-r0 do_pac=
kage_qa: QA Issue: rust rdepends on glibc-dev [dev-deps]</div>
<div><span style=3D"white-space: pre;"> </span>ERROR: rust-1.67.1-r0 do_pac=
kage_qa: QA Issue: rust rdepends on libgcc-dev [dev-deps]</div>
<div><span style=3D"white-space: pre;"> </span>ERROR: rust-1.67.1-r0 do_pac=
kage_qa: Fatal QA errors were found, failing task.</div>
</blockquote>

--A7H31GbJzhUjBRS8tWYp--

