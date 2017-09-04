Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA6071A50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 19:29:43 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id j141so735552ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q9pFPXocTSL9SaNBj0by4m2ifwgghLDnC63DDRgT6aU=;
	b=q0qtO7FgTO27Y3UACfjscvVOUk99eKSIFHg1zARlcn8xlNrBrUYcpS4iPma1Iob5Ub
	wB8G8Ff1VALL5p042lg3kSITe4JILpQrxf98j74yNg2A+Q8CNqV2l07hRCwVnrEgWiCu
	SrpalJVbBgVTDZJJfezT65tT0AvE7YxRW+TczyMg9m2K4JV256bcu4TiJW9hyR2COg2V
	dhXYbpWZDluNzR+9EkCwyyUP6vdAcNpFk/nrmorDgXLq1F/s94GcyDrpsYbBqjADffFd
	vVLJA3QwTepENbT7wunYMUYVEk48WixhSZmx1///ra6NTod/Z1MF7Rn+0Ddg8E814YNB
	7bLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q9pFPXocTSL9SaNBj0by4m2ifwgghLDnC63DDRgT6aU=;
	b=Aam8wyKoBX+DUxOIWrnLAm6cYEVlNe+N9EWGuEurh6JShI3at40e6cAqi7cllc968H
	XeHt/RbHWsA77rwu02TrzLpIf3EPiT2momYYgxvDVFAgpjJK2QwVTx15tttFV9Jr6+Ik
	EVJ4GjOWn1dcd25hB/NRbUKW5GJuW2Y05Bv3xRcStzMJciuSdYYm+RCR5uJF8BB41JJL
	YKCyy83YQSjL3uMw3kzBK8yK98CH/Kxvt1wWlf4HWhmN819TrPWrGvdz+sm7KpefaOgA
	NIByWPI9DPQZbLpzstdgmh9cAOSLRVmMVIDCPINYq3bxtI2S/voTq4y2QPJCXgS2miiP
	T7Ww==
X-Gm-Message-State: AHPjjUjtz+bh/I4PQhoBqVr/loRw0Eo8XdX/l0Mp6bkB46hhDcLHws2w
	HlMJWsF/LjT8qncqCS/PbSyJx5aycpMY
X-Google-Smtp-Source: ADKCNb46EjSJveRfLao+YW+PW8tVIh+3yK2N9e77nCXZU/tNgBKcjt0WKLYNcCtrX83zOeHIPrm5GgriIk5uaw0rWTQ=
X-Received: by 10.36.108.137 with SMTP id w131mr1727460itb.42.1504553385386;
	Mon, 04 Sep 2017 12:29:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Mon, 4 Sep 2017 12:29:24 -0700 (PDT)
In-Reply-To: <CAP9ODKoTRR0e-7MrkN=u5rt928y=Weh2VV_wwdqBSzpV0rK7zA@mail.gmail.com>
References: <20170903192536.491-1-otavio@ossystems.com.br>
	<CAJTo0LbPBn=TmjGb6ozkVjsMdF8H+MaYF32DhZi8Evs7N=n5sA@mail.gmail.com>
	<CAP9ODKoTRR0e-7MrkN=u5rt928y=Weh2VV_wwdqBSzpV0rK7zA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Sep 2017 20:29:24 +0100
Message-ID: <CAJTo0LaUnzQ8jpgHnGw0M+HscQ=u8EY=tABLQrgvDAoyFq6WAA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Mon, 04 Sep 2017 19:29:44 -0000
Content-Type: multipart/alternative; boundary="001a113f651e15072a05586222d2"

--001a113f651e15072a05586222d2
Content-Type: text/plain; charset="UTF-8"

On 4 September 2017 at 18:46, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Mon, Sep 4, 2017 at 7:09 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 3 September 2017 at 20:25, Otavio Salvador <otavio@ossystems.com.br>
> > wrote:
> >>
> >> This is the Golang dependency management tool under development; it is
> >> ready for production use and intended to be merged onto Golang
> >> 1.10. Until that, projects are starting to use it and making it
> >> available on OE-Core reduces the Golang integration work for new
> >> recipes.
> >
> >
> > ERROR: go-dep-0.3.0-r0 do_package: QA Issue: go-dep: Files/directories
> were
> > installed but not shipped in any package:
> >   /usr/lib64/x86_64-poky-linux/go/bin/dep
> > Please set FILES such that these items are packaged. Alternatively if
> they
> > are unneeded, avoid installing them or delete them within do_install.
> > go-dep: 1 installed and not shipped files. [installed-vs-shipped]
>
> I know and this is an issue with our Go toolchain support. It fails
> when we are building for same architecture than our build host.
>

(CCing Khem)

Sounds like a serious problem.  Presumably different tooling is used to
build go-hellworld, as that doesn't have the same problem?

Do we need a bug for this?  How critical is it to fix before 2.4?

Ross

--001a113f651e15072a05586222d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 September 2017 at 18:46, Otavio Salvador <span dir=3D=
"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bl=
ank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D=
"gmail-">On Mon, Sep 4, 2017 at 7:09 AM, Burton, Ross &lt;<a href=3D"mailto=
:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 3 September 2017 at 20:25, Otavio Salvador &lt;<a href=3D"mailto:ot=
avio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This is the Golang dependency management tool under development; i=
t is<br>
&gt;&gt; ready for production use and intended to be merged onto Golang<br>
&gt;&gt; 1.10. Until that, projects are starting to use it and making it<br=
>
&gt;&gt; available on OE-Core reduces the Golang integration work for new<b=
r>
&gt;&gt; recipes.<br>
&gt;<br>
&gt;<br>
&gt; ERROR: go-dep-0.3.0-r0 do_package: QA Issue: go-dep: Files/directories=
 were<br>
&gt; installed but not shipped in any package:<br>
&gt;=C2=A0 =C2=A0/usr/lib64/x86_64-poky-linux/<wbr>go/bin/dep<br>
&gt; Please set FILES such that these items are packaged. Alternatively if =
they<br>
&gt; are unneeded, avoid installing them or delete them within do_install.<=
br>
&gt; go-dep: 1 installed and not shipped files. [installed-vs-shipped]<br>
<br>
</span>I know and this is an issue with our Go toolchain support. It fails<=
br>
when we are building for same architecture than our build host.<br></blockq=
uote><div><br></div><div>(CCing Khem)</div><div><br></div><div>Sounds like =
a serious problem.=C2=A0 Presumably different tooling is used to build go-h=
ellworld, as that doesn&#39;t have the same problem?</div><div><br></div><d=
iv>Do we need a bug for this?=C2=A0 How critical is it to fix before 2.4?</=
div><div><br></div><div>Ross</div></div></div></div>

--001a113f651e15072a05586222d2--
