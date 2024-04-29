Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0FCC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 07:43:36 +0000 (UTC)
Subject: Re: [PATCH V3] rust-cross-canadian: Fix file conflicts for arm and aarch64
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Apr 2024 00:43:35 -0700
References: <PH7PR11MB6449E0F570031C6CFD50D6A48D4A2@PH7PR11MB6449.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6449E0F570031C6CFD50D6A48D4A2@PH7PR11MB6449.namprd11.prod.outlook.com>
Message-ID: <24153.1714376615480679773@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dTxjhTx7f38UHPahcZMT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 07:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198733

--dTxjhTx7f38UHPahcZMT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

I copied the Rust compiler binaries generated for both armv7at2hf-neon-poky=
mllib32-linux-gnueabi and cortexa57-poky-linux into a QEMU environment and =
executed a simple "Hello, World!" program using these binaries. Below are t=
he steps I followed:

/ala-lpggp31/dhemraj/master/15061/poky/build/tmp/work/armv7at2hf-neon-pokym=
llib32-linux-gnueabi/lib32-rust/1.74.1/image/usr/bin > scp -r rustc root@19=
2.168.7.6:/arm32/
rustc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0100% =
=C2=A0 13KB =C2=A0 2.2MB/s =C2=A0 00:00

root@qemuarm64:/arm32# cat hello.rs
fn main() {
println!("Hello, World!");
}

root@qemuarm64:/arm32# ./rustc hello.rs
root@qemuarm64:/arm32# ./hello
Hello, World!

---------------------------------------------------------------------------=
---------------------------------------------
/ala-lpggp31/dhemraj/master/15061/poky/build/tmp/work/cortexa57-poky-linux/=
rust/1.74.1/rustc-1.74.1-src/build/aarch64-poky-linux-gnu/stage2/bin > scp =
=C2=A0rustc root@192.168.7.6:/arm64
rustc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 100% =C2=A0 74KB =C2=A0 4.6MB/s =C2=A0 00:00

root@qemuarm64:/arm64# ls
rustc
root@qemuarm64:/arm64# vi hello.rs
root@qemuarm64:/arm64# cat hello.rs
fn main() {
println!("Hello, World!");
}
root@qemuarm64:/arm64# ./rustc hello.rs
root@qemuarm64:/arm64# ./hello
Hello, World!

--dTxjhTx7f38UHPahcZMT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,<br /><br />I copied the Rust compiler binaries generated for both=
 armv7at2hf-neon-pokymllib32-linux-gnueabi and cortexa57-poky-linux into a =
QEMU environment and executed a simple "Hello, World!" program using these =
binaries. Below are the steps I followed:<br />&nbsp;<br />/ala-lpggp31/dhe=
mraj/master/15061/poky/build/tmp/work/armv7at2hf-neon-pokymllib32-linux-gnu=
eabi/lib32-rust/1.74.1/image/usr/bin &gt; scp -r rustc root@192.168.7.6:/ar=
m32/<br />rustc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;100% &nbsp; 13KB &nbsp; 2.2MB/s &nbsp; 00:00<br /><br />root@qemuarm64=
:/arm32# cat hello.rs<br />fn main() {<br />&nbsp; &nbsp; println!("Hello, =
World!");<br />}<br /><br />root@qemuarm64:/arm32# ./rustc hello.rs<br />ro=
ot@qemuarm64:/arm32# ./hello<br />Hello, World!<br /><br />----------------=
---------------------------------------------------------------------------=
-----------------------------<br />&nbsp;/ala-lpggp31/dhemraj/master/15061/=
poky/build/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build=
/aarch64-poky-linux-gnu/stage2/bin &gt; scp &nbsp;rustc root@192.168.7.6:/a=
rm64<br />rustc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 100% &nbsp; 74KB &nbsp; 4.6MB/s &nbsp; 00:00<br /><br />ro=
ot@qemuarm64:/arm64# ls<br />rustc<br />root@qemuarm64:/arm64# vi hello.rs<=
br />root@qemuarm64:/arm64# cat hello.rs<br />fn main() {<br />&nbsp; &nbsp=
; println!("Hello, World!");<br />}<br />root@qemuarm64:/arm64# ./rustc hel=
lo.rs<br />root@qemuarm64:/arm64# ./hello<br />Hello, World!

--dTxjhTx7f38UHPahcZMT--

