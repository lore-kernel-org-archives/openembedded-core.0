Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9E34E731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 10:53:11 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id f189so190338423oig.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vfewzj0ylwN87zO2LJJZRKf/JH2DegrHjZ6MvVKGT8I=;
	b=JbcQYqCKf/QT2DULU/07dQDw950/U3A3bO0Quxn9tSzI/iaS2C0Hneorx2xkU+S9q2
	MrSnNsFBfkZkw2UVBr0l87FR2v34FbO0damtZrjO7iHUbZ3d8FfbBj9KZ0PiBSJZJ+b/
	kV4EfqjSmRQhvtEqCW5rBziezzP59APLq8f0Xc/YEVcWN/88jHG/FkfK2Ci1qzBgxfmg
	KnTcLLf8qUnFChWVJe37sVMVdFo6MujHAxXmJEFxYlL/Q+Y91JMh0sH2cBv/16vE0nP6
	4DrxjwGzmNloHSkO1tayHdw+Mmk5KMwwkaYGuvKxRNlnZ4bdn4Zp/QCOhaxnyI/kJDAL
	GkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vfewzj0ylwN87zO2LJJZRKf/JH2DegrHjZ6MvVKGT8I=;
	b=FI+b6SxeEMfd05itC6hx5HPrD9YNvLY31O3MpRe59xxIjNAaHz4BOvUWOKo63Bj3Z8
	WquQgcUo5VBDVUA6XdzHaAn8aoqlAg4eYWejfn1Nv2e1aDb42yTVGxhr8AyCZyot0INR
	t252+zkMcVtXvRU5Svo/1Il0V82GsijHKyzIlus+XbH4Hnx8j+C9aGUkX5IJIjEPjBiu
	qLl1+kehOaVc7bszarkdMg4EYUYQJZaAIZjfeJOM7+6tpErzaDGyXX2kCNZa5pcMl9y5
	9pXAuaHBVvOVSJaZ+II70HnI/89ik1zf2/15XR4+kVmvajBEsc1N4utV6ZprDanMTjZr
	E7qw==
X-Gm-Message-State: AEkoouufCFOQxypoYtJEBpBXKb+ED91Z40AWaDKM4yMXpWYZMiutjeQiBsUDuj5BKmrrvsG5Ffp35OobNc7KgHTO
X-Received: by 10.157.54.162 with SMTP id h31mr16384015otc.97.1471949591618;
	Tue, 23 Aug 2016 03:53:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 23 Aug 2016 03:52:41 -0700 (PDT)
In-Reply-To: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
References: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 23 Aug 2016 13:52:41 +0300
Message-ID: <CAHiDW_EN1ZpGUZuP+zJDOtUqnpP+fgtFzMYc=7ZsnJA-eJZXfA@mail.gmail.com>
To: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
Cc: Mubin Sayyed <mubinusm@xilinx.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] [master] [PATCH 0/3] Added cpu benchmarks
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
X-List-Received-Date: Tue, 23 Aug 2016 10:53:13 -0000
Content-Type: multipart/alternative; boundary=001a113e2a30895138053abaf877

--001a113e2a30895138053abaf877
Content-Type: text/plain; charset=UTF-8

On 23 August 2016 at 12:47, Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
wrote:

> Added recipes for cpu benchmarks dhrystone,whetstone and linpack.
>
> Mubin Sayyed (3):
>   benchmarks:Added recipe for whetstone benchmarks
>   benchmarks:Added recipe for dhrystone
>   benchmarks:Added recipe for linpack
>
>  .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22
> ++++++++++++++++++++++
>  meta-oe/recipes-benchmark/linpack/linpack_1.0.bb   | 22
> ++++++++++++++++++++++
>  .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22
> ++++++++++++++++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
>  create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
>  create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
>

Hi,

Please send meta-oe patches to openembedded-devel@lists.openembedded.org.

Thanks,
  Jussi


--
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113e2a30895138053abaf877
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 August 2016 at 12:47, Mubin Sayyed <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mubin.usman.sayyed@xilinx.com" target=3D"_blank">mubin.usman.sayyed@xilin=
x.com</a><wbr>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Added recipes for cpu benchmarks dhrystone,whetstone and linpack=
.<br>
<br>
Mubin Sayyed (3):<br>
=C2=A0 benchmarks:Added recipe for whetstone benchmarks<br>
=C2=A0 benchmarks:Added recipe for dhrystone<br>
=C2=A0 benchmarks:Added recipe for linpack<br>
<br>
=C2=A0.../recipes-benchmark/dhrysto<wbr>ne/<a href=3D"http://dhrystone_2.1.=
bb" rel=3D"noreferrer" target=3D"_blank">dhrystone_2.1.bb</a>=C2=A0 =C2=A0|=
 22 ++++++++++++++++++++++<br>
=C2=A0meta-oe/recipes-benchmark/lin<wbr>pack/<a href=3D"http://linpack_1.0.=
bb" rel=3D"noreferrer" target=3D"_blank">linpack_1.0.bb</a>=C2=A0 =C2=A0| 2=
2 ++++++++++++++++++++++<br>
=C2=A0.../recipes-benchmark/whetsto<wbr>ne/<a href=3D"http://whetstone_1.0.=
bb" rel=3D"noreferrer" target=3D"_blank">whetstone_1.0.bb</a>=C2=A0 =C2=A0|=
 22 ++++++++++++++++++++++<br>
=C2=A03 files changed, 66 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/dhry<wbr>stone/<a href=
=3D"http://dhrystone_2.1.bb" rel=3D"noreferrer" target=3D"_blank">dhrystone=
_2.1.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/linp<wbr>ack/<a href=3D"=
http://linpack_1.0.bb" rel=3D"noreferrer" target=3D"_blank">linpack_1.0.bb<=
/a><br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/whet<wbr>stone/<a href=
=3D"http://whetstone_1.0.bb" rel=3D"noreferrer" target=3D"_blank">whetstone=
_1.0.bb</a><br></blockquote><div>=C2=A0</div><div>Hi,</div><div><br></div><=
div>Please send meta-oe patches to=C2=A0<span style=3D"font-size:12.8px"><a=
 href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-dev=
el@lists.openembedded.org</a>.</span></div><div><span style=3D"font-size:12=
.8px"><br></span></div><div><span style=3D"font-size:12.8px">Thanks,</span>=
</div><div><span style=3D"font-size:12.8px">=C2=A0 Jussi</span></div><div><=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span><font color=3D"#888888">
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113e2a30895138053abaf877--
