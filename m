Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB121E784A4
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 11:29:20 +0000 (UTC)
Received: from mailrelay6-3.pub.mailoutpod2-cph3.one.com (mailrelay6-3.pub.mailoutpod2-cph3.one.com [46.30.212.37])
 by mx.groups.io with SMTP id smtpd.web10.79034.1696245135251058548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 04:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@krinvent.dk header.s=rsa1 header.b=pLskHOcm;
 dkim=pass header.i=@krinvent.dk header.s=ed1 header.b=gP2L0slB;
 spf=none, err=permanent DNS error (domain: krinvent.dk, ip: 46.30.212.37, mailfrom: kasper@krinvent.dk)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=krinvent.dk; s=rsa1;
	h=content-type:subject:reply-to:cc:from:to:message-id:mime-version:date:
	 references:in-reply-to:from;
	bh=1q/rM5Qd2S7/CKirQdvDbZ7xywvXppOurhlpvB/lfcw=;
	b=pLskHOcm/VcOU0S+PafZp0uABzu55uYVZ5FfBW8IuSWm0DbUTRkUqQTUMnU3XaHRPJiOxnuFezWFT
	 oky9pQ/56xVIPCycRpp6WVAdffacu6ILs562dTflf65IO3B/6FjEVMIb0UetkfPxeRqD1wSYfVG43A
	 QWuyT/OxkOd2+I2cMVcrE4ZtaVV+q11SYwrqfaRucdBI4lo3uQGHWLdvzQEdoyVkHwcv4deMdIetsp
	 t40uHY5jPOSwSqxLh3u7ICzshtNF0PojLTjYb2s2SbdhiYRxDEL07bzHpX+xioiGwfsrrPLnxWXaiu
	 EI94P5dV4HX/Bgo+2CD9wZxlUayphvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=krinvent.dk; s=ed1;
	h=content-type:subject:reply-to:cc:from:to:message-id:mime-version:date:
	 references:in-reply-to:from;
	bh=1q/rM5Qd2S7/CKirQdvDbZ7xywvXppOurhlpvB/lfcw=;
	b=gP2L0slBmCbYDBqYYF5nft7AGzMqthsa9S251+XMQD2boYR4nGnlSITdDirx0ZW+lrsI8LMYN5zLu
	 anQujElDQ==
X-HalOne-ID: 890ade28-6114-11ee-81c9-3bd3f69e9082
Received: from onecom-webmail-backend-production-787464fbc7-g5j7j (service.pub.live1-k8s-cph3.one.com [46.30.212.67])
	by mailrelay6 (Halon) with ESMTPSA
	id 890ade28-6114-11ee-81c9-3bd3f69e9082;
	Mon, 02 Oct 2023 11:12:12 +0000 (UTC)
X-Originating-IP: 87.104.84.103
User-Agent: One.com webmail 45.0.15
In-Reply-To: <CANNYZj9mQZuFDUCVVZDMpm0zPVFwDTW-w55i6NRpCwSja6aNjw@mail.gmail.com>
References: <20230928081035.604380-1-sean@geanix.com>
 <20230928081035.604380-2-sean@geanix.com>
 <CANNYZj9mQZuFDUCVVZDMpm0zPVFwDTW-w55i6NRpCwSja6aNjw@mail.gmail.com>
Date: Mon, 02 Oct 2023 13:12:11 +0200
MIME-Version: 1.0
Message-ID: <1696245131835.6.23594@webmail-backend-production-787464fbc7-86bhw>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Kasper" <kasper@krinvent.dk>
Cc: "Sean Nyekjaer" <sean@geanix.com>,
 <openembedded-core@lists.openembedded.org>
Reply-To: <kasper@krinvent.dk>
Subject: Re: [OE-core][RFC 2/2] rust-cross-canadian: set CARGO_TARGET_<triple>_RUNNER for nativesdk
Content-Type: multipart/alternative;
 boundary="----------23592-1696245131835-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 11:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188601

------------23592-1696245131835-1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Alexander

I am in the same team as Sean, and we really like the way it is solved in R=
ust/Cargo.
However, we have the issue also for C++, and as you state there is no obvio=
us solution.
We are using cmaake for our C+++ projects and are discussing if a solution =
is to try to make
a cmake toolchain file for the oesdk environment as well.
If you have any experience/input it would be highly appreciated.

Br
Kasper

On September 28, 2023 at 2:47:27 pm +02:00, Alexander Kanavin <alex.kanavin=
@gmail.com> wrote:

> This seems like a good change (being able to easily run items built
> with c/c++ tolchains in yocto SDKs is a problem no one has
> satisfactorily resolved, and it's nice that rust got this right), but
> can you expand the test in meta/lib/oeqa/sdk/cases/rust.py to cover
> possible target options such as this one?
>=20
> Alex
>=20
> On Thu, 28 Sept 2023 at 10:10, Sean Nyekjaer <<sean@geanix.com>> wrote:
>=20
> >=20
> > This will enable us to build and run rust programs on the sdk host.
> >=20
> > % cargo run --target x86_64-oesdk-linux-gnu -vv
> > Fresh hello v0.1.0 (~/development/hello)
> > Finished dev [unoptimized + debuginfo] target(s) in 0.02s
> > Running `/usr/local/sdk/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64=
.so.2 target/x86_64-oesdk-linux-gnu/debug/hello`
> > Hello, world
> >=20
> > Signed-off-by: Sean Nyekjaer <<sean@geanix.com>>
> > ---
> > meta/recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
> > 1 file changed, 3 insertions(+)
> >=20
> > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/=
recipes-devtools/rust/rust-cross-canadian.inc
> > index d25646237c..5b89216658 100644
> > --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> > +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> > @@ -55,9 +55,12 @@ do_install () {
> > RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
> >=20
> > RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper=
:]' | sed 's/-/_/g'`
> > + RUST_HOST_TRIPLE=3D`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]=
' | sed 's/-/_/g'`
> > + SDKARCH=3D`echo ${SDK_ARCH} | sed 's/_/-/g'`
> >=20
> > cat <<- EOF > "${RUST_ENV_SETUP_SH}"
> > export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=3D\$OE=
CORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D\$OECORE_TARGET_SYSROOT"
> > + export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYS=
ROOT/lib/ld-linux-${SDKARCH}.so.2"
> > export RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS=
}/rustlib"
> > EOF
> >=20
> > --
> > 2.42.0
> >=20
> >=20
> >=20
> >


------------23592-1696245131835-1
Content-Type: multipart/related; boundary="----------23592-1696245131835-2"

------------23592-1696245131835-2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div>Hi Alexander <br></div><div><br></div><div>I am in the same team as Se=
an, and we really like the way it is solved in Rust/Cargo. <br></div><div>H=
owever, we have the issue also for C++, and as you state there is no obviou=
s solution.<br></div><div>We are using cmaake for our C+++ projects and are=
 discussing if a solution is to try to make <br></div><div>a cmake toolchai=
n file for the oesdk environment as well. <br></div><div>If you have any ex=
perience/input it would be highly appreciated.<br></div><div><br></div><div=
>Br <br></div><div>Kasper <br></div><div><br></div><div>On September 28, 20=
23 at 2:47:27 pm +02:00, Alexander Kanavin &lt;alex.kanavin@gmail.com> wrot=
e:<br></div><blockquote type=3D"cite"><div class=3D"oneComWebmail-mail"><di=
v class=3D"oneComWebmail-body"><div>This seems like a good change (being ab=
le to easily run items built<br></div><div>with c/c++ tolchains in yocto SD=
Ks is a problem no one has<br></div><div>satisfactorily resolved, and it's =
nice that rust got this right), but<br></div><div>can you expand the test i=
n meta/lib/oeqa/sdk/cases/rust.py to cover<br></div><div>possible target op=
tions such as this one?<br></div><div><br></div><div>Alex<br></div><div><br=
></div><div>On Thu, 28 Sept 2023 at 10:10, Sean Nyekjaer &lt;<a href=3D"mai=
lto:sean@geanix.com">sean@geanix.com</a>> wrote:<br></div><blockquote><div>=
<br></div><div>This will enable us to build and run rust programs on the sd=
k host.<br></div><div><br></div><div>% cargo run --target x86_64-oesdk-linu=
x-gnu -vv<br></div><div>Fresh hello v0.1.0 (~/development/hello)<br></div><=
div>Finished dev [unoptimized + debuginfo] target(s) in 0.02s<br></div><div=
>Running `/usr/local/sdk/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so=
.2 target/x86_64-oesdk-linux-gnu/debug/hello`<br></div><div>Hello, world<br=
></div><div><br></div><div>Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mail=
to:sean@geanix.com">sean@geanix.com</a>><br></div><div>---<br></div><div>me=
ta/recipes-devtools/rust/rust-cross-canadian.inc | 3 +++<br></div><div>1 fi=
le changed, 3 insertions(+)<br></div><div><br></div><div>diff --git a/meta/=
recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/=
rust-cross-canadian.inc<br></div><div>index d25646237c..5b89216658 100644<b=
r></div><div>--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc<br></=
div><div>+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc<br></div>=
<div>@@ -55,9 +55,12 @@ do_install () {<br></div><div>RUST_ENV_SETUP_SH=3D"=
${ENV_SETUP_DIR}/rust.sh"<br></div><div><br></div><div>RUST_TARGET_TRIPLE=
=3D`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`<b=
r></div><div>+    RUST_HOST_TRIPLE=3D`echo ${RUST_HOST_SYS} | tr '[:lower:]=
' '[:upper:]' | sed 's/-/_/g'`<br></div><div>+    SDKARCH=3D`echo ${SDK_ARC=
H} | sed 's/_/-/g'`<br></div><div><br></div><div>cat &lt;&lt;- EOF > "${RUS=
T_ENV_SETUP_SH}"<br></div><div>export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RU=
STFLAGS=3D"--sysroot=3D\$OECORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=
=3D\$OECORE_TARGET_SYSROOT"<br></div><div>+       export CARGO_TARGET_${RUS=
T_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSROOT/lib/ld-linux-${SDKARCH}.so=
.2"<br></div><div>export RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/li=
b/${TARGET_SYS}/rustlib"<br></div><div>EOF<br></div><div><br></div><div>--<=
br></div><div>2.42.0<br></div><div><br></div><div><br></div><div><br></div>=
</blockquote></div></div></blockquote><div><br></div>

------------23592-1696245131835-2--

------------23592-1696245131835-1--

