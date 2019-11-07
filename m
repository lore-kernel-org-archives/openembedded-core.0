Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 341A17D25F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 00:55:16 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id i19so520023qki.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 16:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nLTTG16+wXyXy2oaxjGA0M6Dotxz7YkDDMAbCSHhpFI=;
	b=WUq5YPhSiqyT75shjtJIMKKc5vCkJMHSe7wANHClc7/TbVHA+7CXuYgB+7CAwEUksw
	vCOJQicmp9oOO/BpA158IweuFWkuWt8iGNvIPhK7wkgTEssAgiDIRhJHxEwhKRCtqJQ7
	sQeH9AQCRH0KS3+OItXQUForjo3OmqvxaDfJ00wEUTcp19y7vCrfTWfIY3sz3d4suphK
	THKKlrf9qTtPAo56JmBRLCvmpxGyDKXJxTo6uDvH5tOM7uIk8ABVcM1ZPqFOCKpr6kIy
	UDND1vp1Jcsd+OQrqstM8lietutzU/Bo+I6f34e1sq+k2XfzW2+R+u3wXY465WmS1C46
	fQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nLTTG16+wXyXy2oaxjGA0M6Dotxz7YkDDMAbCSHhpFI=;
	b=opm7LhLZVAUF5LiFiaAlHw6TGkr1NPD9YnCP7iBLD7EfrCTV4a+o3ZFoR6zdLAPyOr
	NjuOb/vw/+AVnlMZTiBtlGa18RtMS/C5CHV02fslyJTOfxvKjzHkydyPlWHn5CjSL2Wg
	XZVe8gWMvwW3gvKuOJdH50+zjbWpvnpVUZLvRWx+jtARa7DZXFoVQ4o109OOtlHnRXtd
	9+b0pDtfih5XGHlBwueZgYD7g/54scaNZ5sjHdkW2s7Gao4eqNDSh5qhNEXI7HeQzOBv
	4e9o4NJUuyttEOszddiEqB+Hma8Htua6R45cWTffWPWLdtXj0jPjDXteHRp4ZBCKhfIy
	4zug==
X-Gm-Message-State: APjAAAUAJXTqqAGxjaNe03tTMhkH5KfhT/x62HZCCG7a8xchwS1YiQor
	FsduI6hrqihWkudemGwFihHu/20jm4YnIv/9qE2+dqYZ
X-Google-Smtp-Source: APXvYqyR/5bnerx2P6ww4+Jvi7iOYcJVCXa4cgUceudtuBbwGMNcnfZDiJzsZlPQKwIZchaRl7zNqWuZQdhrx5IwZhY=
X-Received: by 2002:a37:4bc2:: with SMTP id y185mr283256qka.474.1573088116571; 
	Wed, 06 Nov 2019 16:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<e37b5da9acc8a0f7562a9dacf649bc28e6a41f9d.camel@wdc.com>
In-Reply-To: <e37b5da9acc8a0f7562a9dacf649bc28e6a41f9d.camel@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2019 16:55:05 -0800
Message-ID: <CAMKF1soRzN+thjSsMsz2F0_cxTGkS+cpKAYwiAYs4d3YFhjh7g@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"bunk@stusta.de" <bunk@stusta.de>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Thu, 07 Nov 2019 00:55:16 -0000
Content-Type: multipart/alternative; boundary="0000000000006382de0596b71e1d"

--0000000000006382de0596b71e1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2019 at 4:48 PM Alistair Francis <Alistair.Francis@wdc.com>
wrote:

> On Thu, 2019-11-07 at 00:12 +0200, Adrian Bunk wrote:
> > On Wed, Nov 06, 2019 at 10:18:18AM -0800, Alistair Francis wrote:
> > > ...
> > > +TUNE_CCARGS_riscv64 .=3D "${@bb.utils.contains('TUNE_FEATURES',
> > > 'riscv64-f', ' -mabi=3Dlp64d', ' -mabi=3Dlp64', d)}"
> > > +TUNE_CCARGS_riscv32 .=3D "${@bb.utils.contains('TUNE_FEATURES',
> > > 'riscv32-f', ' -mabi=3Dilp32f', ' -mabi=3Dilp32', d)}"
> > > ...
> >
> > That looks wrong, what would you put in TUNE_FEATURES
> > for -mabi=3Dlp64f when -mabi=3Dlp64d is called riscv64-f?
>
> I am just going to add riscv32nf and riscv64nf. This will specify
> -mabi=3Dilp32 and -mabi=3Dlp64 accordingly. I won't change the default
> riscv32 and riscv64. We can then deal with the single and double float
> at a later point.
>
> >
> > Also note that this is only the floating point calling convention,
> > whether the compiler emits floating point instructions is defined
> > by -march.
>
> -march is another can of worms that I was trying to avoid. I don't have
> a good way of handling the ISA strings at the moment without some crazy
> number of tune options.


We need to handle that but I think that should be in meta-riscv since I
think for Linux we should just stick to rv64gc ABI and something cross
distro agreed upon abi for riscv32 and bare metal is another story that=E2=
=80=99s
where probably we need to address the ABIs

>
>
> >
> > It would be good if this would start with a plan how to handle
> > all possible combination of RISC-V ISA extensions, ideally better
> > than the arm mess.
>
> Agreed. I am just going to change this to add a no float option as that
> fixes a large number of 32-bit link failures (seen in U-Boot, OpenSBI
> and SDKs) and we can re-evaluate a longer term march fix.


This is fine to start with for now


>
> Alistair
>
> >
> > cu
> > Adrian
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006382de0596b71e1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 6, 2019 at 4:48 PM Alistair Francis &lt;<a href=
=3D"mailto:Alistair.Francis@wdc.com">Alistair.Francis@wdc.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Thu, 2019-11-07 at 00:12 +0200=
, Adrian Bunk wrote:<br>
&gt; On Wed, Nov 06, 2019 at 10:18:18AM -0800, Alistair Francis wrote:<br>
&gt; &gt; ...<br>
&gt; &gt; +TUNE_CCARGS_riscv64 .=3D &quot;${@bb.utils.contains(&#39;TUNE_FE=
ATURES&#39;,<br>
&gt; &gt; &#39;riscv64-f&#39;, &#39; -mabi=3Dlp64d&#39;, &#39; -mabi=3Dlp64=
&#39;, d)}&quot;<br>
&gt; &gt; +TUNE_CCARGS_riscv32 .=3D &quot;${@bb.utils.contains(&#39;TUNE_FE=
ATURES&#39;,<br>
&gt; &gt; &#39;riscv32-f&#39;, &#39; -mabi=3Dilp32f&#39;, &#39; -mabi=3Dilp=
32&#39;, d)}&quot;<br>
&gt; &gt; ...<br>
&gt; <br>
&gt; That looks wrong, what would you put in TUNE_FEATURES<br>
&gt; for -mabi=3Dlp64f when -mabi=3Dlp64d is called riscv64-f?<br>
<br>
I am just going to add riscv32nf and riscv64nf. This will specify<br>
-mabi=3Dilp32 and -mabi=3Dlp64 accordingly. I won&#39;t change the default<=
br>
riscv32 and riscv64. We can then deal with the single and double float<br>
at a later point.<br>
<br>
&gt; <br>
&gt; Also note that this is only the floating point calling convention,<br>
&gt; whether the compiler emits floating point instructions is defined<br>
&gt; by -march.<br>
<br>
-march is another can of worms that I was trying to avoid. I don&#39;t have=
<br>
a good way of handling the ISA strings at the moment without some crazy<br>
number of tune options.</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">We need to handle that but I think that should be in meta-riscv sinc=
e I think for Linux we should just stick to rv64gc ABI and something cross =
distro agreed upon abi for riscv32 and bare metal is another story that=E2=
=80=99s where probably we need to address the ABIs=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><br>
<br>
&gt; <br>
&gt; It would be good if this would start with a plan how to handle<br>
&gt; all possible combination of RISC-V ISA extensions, ideally better<br>
&gt; than the arm mess.<br>
<br>
Agreed. I am just going to change this to add a no float option as that<br>
fixes a large number of 32-bit link failures (seen in U-Boot, OpenSBI<br>
and SDKs) and we can re-evaluate a longer term march fix.</blockquote><div =
dir=3D"auto"><br></div><div dir=3D"auto">This is fine to start with for now=
</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Alistair<br>
<br>
&gt; <br>
&gt; cu<br>
&gt; Adrian<br>
&gt; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000006382de0596b71e1d--
