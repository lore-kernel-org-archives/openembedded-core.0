Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF04C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 17:05:24 +0000 (UTC)
Subject: Re: [PATCH v2] rust: Merge all rustc-source patches into rust-source.inc
To: openembedded-core@lists.openembedded.org
From: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.146.125)
X-Originating-Platform: Windows Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Jan 2023 09:05:22 -0800
References: <CAO5Uq5TRYjO+pUmoMur4O_jwZYJT1xuYk1iHkpMXjU2nofXYzw@mail.gmail.com>
In-Reply-To: <CAO5Uq5TRYjO+pUmoMur4O_jwZYJT1xuYk1iHkpMXjU2nofXYzw@mail.gmail.com>
Message-ID: <17348.1674061522006889046@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nV0AalmHG4TGX632NEkn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 17:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176109

--nV0AalmHG4TGX632NEkn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Without 'binutils' the required linker 'x86_64-poky-linux-ld' will not be a=
dded to the image (getting error - cannot find 'ld').
And, 'g++' also a required package along with 'gcc'. When removed 'g++' som=
e required libs are missing. See below error.

root@qemux86-64:~/hello# cargo run
Compiling hello v0.1.0 (/home/root/hello)
error: linking with `x86_64-poky-linux-gcc` failed: exit status: 1
|
=3D note: "x86_64-poky-linux-gcc" "/tmp/rustcZTUudY/symbols.o" "/home/root/=
hello/target/debug/deps/hello-366ba9a14b055dd9.1rbu6cyq0fbr2z03.rcgu.o" "/h=
ome/root/hello/target/debug/deps/hello-366ba9a1"
=3D note: /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-lin=
ux/bin/ld: cannot find Scrt1.o: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find crti.o: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find crtbeginS.o: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find -lgcc_s: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find -lutil: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find -lrt: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find -lpthread: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find -lm: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find -ldl: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find -lc: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find crtendS.o: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld:=
 cannot find crtn.o: No such file or directory
collect2: error: ld returned 1 exit status

error: could not compile `hello` due to previous error

--nV0AalmHG4TGX632NEkn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Without 'binutils' the required linker 'x86_64-poky-linux-ld' will not be a=
dded to the image (getting error - cannot find 'ld').<br />And, 'g++' also =
a required package along with 'gcc'. When removed 'g++' some required libs =
are missing. See below error.<br /><br />
<div><em>root@qemux86-64:~/hello# cargo run</em></div>
<div><em>&nbsp; &nbsp;Compiling hello v0.1.0 (/home/root/hello)</em></div>
<div><em>error: linking with `x86_64-poky-linux-gcc` failed: exit status: 1=
</em></div>
<div><em>&nbsp; |</em></div>
<div><em>&nbsp; =3D note: "x86_64-poky-linux-gcc" "/tmp/rustcZTUudY/symbols=
.o" "/home/root/hello/target/debug/deps/hello-366ba9a14b055dd9.1rbu6cyq0fbr=
2z03.rcgu.o" "/home/root/hello/target/debug/deps/hello-366ba9a1"</em></div>
<div><em>&nbsp; =3D note: /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../..=
/x86_64-poky-linux/bin/ld: cannot find Scrt1.o: No such file or directory</=
em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crti.o: No such fi=
le or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtbeginS.o: No su=
ch file or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lgcc_s: No such f=
ile or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lutil: No such fi=
le or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lrt: No such file=
 or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lpthread: No such=
 file or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lm: No such file =
or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -ldl: No such file=
 or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lc: No such file =
or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtendS.o: No such=
 file or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /usr/lib/gcc/x86_64-poky-linux/=
12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtn.o: No such fi=
le or directory</em></div>
<div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; collect2: error: ld returned 1 =
exit status</em></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><em>error: could not compile `hello` due to previous error</em></div>
<div>&nbsp;</div>

--nV0AalmHG4TGX632NEkn--

