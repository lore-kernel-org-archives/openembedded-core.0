Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 117BB782F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 16:39:10 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id w1so81791171qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5P+EwRySpQnTH3dBBmZgItLDgWg9+kUZUu/gimL8vN0=;
	b=h2Bzc0SFkaR3Umx7loWdl68BavocIxgQ0rb4xz0vejde1Cgp0WBZpgOl4A8rvu4vqe
	WFCsrRD/x3/1+nbfCKjnRknKsPtj8/agUSScx2R6zdNomLchSJZ+GhykHUcnpPJ8Ky/H
	maUQxQF7vOMfF/AGvLBO1tAMF7WtpmKK3vNejVypuxSidh1Dz8l33C4BkqPtuG1VnfV2
	KRchYiAx3EDdjIeOfSqXUS4m/QVLRxrK54n7NWprjvJo2qtRfAHK5JdL63FctQUiiQXG
	v086mVxJyaSYksSbZ4vwg0faihtKbPb5R3IgB5VibHhrplUCvZfqh2yhk8Xm4cCinUKu
	lwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5P+EwRySpQnTH3dBBmZgItLDgWg9+kUZUu/gimL8vN0=;
	b=DG0M3DQmx1sxzpcyhFnhDBk/8LDbPbOBTnD/5K/fzOY8fIQxwv7yZlmGzXAgL4Omwd
	IEDREfxaOArxHuOyzTV7pqoT0HgoCv5kTD/mdVZTrbSLOCB3BHv9rKMdDJ89IpuOU8by
	vJ7wdbjMkB9hPFgNZFDObRrVqIaa5n34tZtS2/2OUY4jZNyHHPJXaSnuvw2XZnm4Q3/4
	afNl8UuzYxq/p6WFslWTWSmR93KRmfdq0rYDyuuYq5Y43yARZtRi3hFqaoVS7VdPk7gs
	l9OEyQOUUjvo0LAEi/zck7CA47hjLamYn81ov2JIxPDf5PRxMZEEeXAum9SEVLGxg+vU
	zz8g==
X-Gm-Message-State: AODbwcDJziaHlVZPqXhvS8Zm+nABKt4Fbq7qYBNb/RJbLPcBSqfQFrkm
	5hCTInn8f0vQxMWdYGygLxsMLWKRzwsT
X-Received: by 10.200.62.25 with SMTP id z25mr39049604qtf.139.1497026351906;
	Fri, 09 Jun 2017 09:39:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 09:38:51 -0700 (PDT)
In-Reply-To: <d3fa5353a75efd6bc2253bc09974b763112e8b5a.1497001417.git.dengke.du@windriver.com>
References: <cover.1497001417.git.dengke.du@windriver.com>
	<d3fa5353a75efd6bc2253bc09974b763112e8b5a.1497001417.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 17:38:51 +0100
Message-ID: <CAJTo0LZM6ZCxYHY9Jy=mObo29DKrUJChm-fCr=Fk0HPPSa+6Vg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] archiver.bbclass: add task do_prepare_recipe_sysroot before do_configure
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
X-List-Received-Date: Fri, 09 Jun 2017 16:39:11 -0000
Content-Type: multipart/alternative; boundary="f403045ee67eecdc280551899b60"

--f403045ee67eecdc280551899b60
Content-Type: text/plain; charset="UTF-8"

On 9 June 2017 at 10:45, Dengke Du <dengke.du@windriver.com> wrote:

> When recipe inherit archiver.bbclass and enable:
>
>     ARCHIVER_MODE[src] = "configured"
>
> output errors:
>
>     automake: command not found
>

I think oe-core aa2240657b015d46e9ba4bcb6264709a82313d83 fixes this
already, can you verify?

Ross

--f403045ee67eecdc280551899b60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2017 at 10:45, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto:=
dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex"><div id=3D"gmail-:4rc" class=3D"gmail-a3s=
 gmail-aXjCH gmail-m15c8c3f3160b262c">When recipe inherit archiver.bbclass =
and enable:<br>
<br>
=C2=A0 =C2=A0 ARCHIVER_MODE[src] =3D &quot;configured&quot;<br>
<br>
output errors:<br>
<br>
=C2=A0 =C2=A0 automake: command not found</div></blockquote></div><br>I thi=
nk oe-core=C2=A0aa2240657b015d46e9ba4bcb6264709a82313d83 fixes this already=
, can you verify?</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--f403045ee67eecdc280551899b60--
