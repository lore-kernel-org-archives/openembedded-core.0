Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 86C46609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 13:14:06 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id t59so1949030yho.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=UXPpFeTUBNGS3FxTEihCoy5mZp4/p3+34I5ra2kfSUw=;
	b=xOLepTjpkELnNqeS/gGIv8t7WDWmCfz+gRKu6H31PYlb5ywzmrj8579So0wcdtFRc2
	dNzEtjlYmKNsG1/ieAxswsbcEZQ/EVeVQQ8noHWe2E37Lvfsrq9+qdGDl0jCFpqsvaN+
	hLGylFvSVaIQYUf7j8P7XiMcmkEv31ua2aXKaGgewFN13+sQCCQYNvsXDGSdz4DTvMCa
	dhivZrBWT6WNJTaKSI4PjvOYqKbYa93F8RdpXXT8eOpo20EoBz5Uj8OpW96qgPKRuYOA
	oE2/UyJK+K0UEnPkYWryn1oOYI2eArkbNDio4xNnAUVxD2aTKU3Nh3gnNanb+wph2tts
	cgWA==
MIME-Version: 1.0
X-Received: by 10.236.47.166 with SMTP id t26mr551369yhb.104.1411391647200;
	Mon, 22 Sep 2014 06:14:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 22 Sep 2014 06:14:07 -0700 (PDT)
In-Reply-To: <20140920000507.GA27494@linux.intel.com>
References: <20140919224401.GA24684@linux.intel.com>
	<CAJTo0La4Etb61dwdMdikLJpByAhFE6OM1-bAHAZPyk12Nok9uw@mail.gmail.com>
	<20140920000507.GA27494@linux.intel.com>
Date: Mon, 22 Sep 2014 10:14:07 -0300
X-Google-Sender-Auth: 4Fu_Cq1wEtOd8pZayracEXXBHVg
Message-ID: <CAP9ODKpEha=h2MPim-DoyX9ETHdtAygo5Wf8i=q04Q2PNCx19Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: todd.e.brandt@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Phoronix Test Suite package
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
X-List-Received-Date: Mon, 22 Sep 2014 13:14:11 -0000
Content-Type: multipart/alternative; boundary=001a11c1d3d8c5cd320503a73959

--001a11c1d3d8c5cd320503a73959
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 19, 2014 at 9:05 PM, Todd E Brandt <
todd.e.brandt@linux.intel.com> wrote:

> On Sat, Sep 20, 2014 at 12:03:43AM +0100, Burton, Ross wrote:
> > On 19 September 2014 23:44, Todd E Brandt <todd.e.brandt@linux.intel.com>
> wrote:
> > > This is the package recipe for the phoronix test suite v5.2.1. The
> > > tool is for benchmarking and testing of the system.
> >
> > +RDEPENDS_${PN} = "php-cli"
> >
> > Surely phoronix has more dependencies than just php...  Or is this
> > just the runner and it talks to slave?  Honestly have no idea how the
> > phoronix test suite is structured.
>
> it's designed to be a minimal install with only php as the dependency. It
> uses
> the network to download test definitions and to upload test results.
>

So it will work successfully with just PHP?

I'd like to have the other runtime dependencies mapped with PACKAGECONFIG
features so it is easy to use.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c1d3d8c5cd320503a73959
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Sep 19, 2014 at 9:05 PM, Todd E Brandt <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:todd.e.brandt@linux.intel.com" target=3D"_blank">todd.e.bra=
ndt@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Sat, Sep 20, 2014 at 12:03:43AM +0100, Burton, Ross wr=
ote:<br>
&gt; On 19 September 2014 23:44, Todd E Brandt &lt;<a href=3D"mailto:todd.e=
.brandt@linux.intel.com">todd.e.brandt@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt; This is the package recipe for the phoronix test suite v5.2.1. Th=
e<br>
&gt; &gt; tool is for benchmarking and testing of the system.<br>
&gt;<br>
&gt; +RDEPENDS_${PN} =3D &quot;php-cli&quot;<br>
&gt;<br>
&gt; Surely phoronix has more dependencies than just php...=C2=A0 Or is thi=
s<br>
&gt; just the runner and it talks to slave?=C2=A0 Honestly have no idea how=
 the<br>
&gt; phoronix test suite is structured.<br>
<br>
</span>it&#39;s designed to be a minimal install with only php as the depen=
dency. It uses<br>
the network to download test definitions and to upload test results.<br></b=
lockquote><div><br></div><div>So it will work successfully with just PHP?</=
div><div><br></div><div>I&#39;d like to have the other runtime dependencies=
 mapped with PACKAGECONFIG features so it is easy to use.=C2=A0</div></div>=
<div><br></div>-- <br>Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems=
<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.os=
systems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossyst=
ems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br><span>Mob=
ile: +55 (53) 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: <s=
pan id=3D"gc-number-35" class=3D"gc-cs-link" title=3D"Call with Google Voic=
e">+1 (347) 903-9750</span></span><br>
</div></div>

--001a11c1d3d8c5cd320503a73959--
