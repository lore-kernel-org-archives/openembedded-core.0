Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0E73B60F80
	for <openembedded-core@openembedded.org>;
	Sat,  8 Feb 2020 18:10:37 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g15so1677145vsf.1
	for <openembedded-core@openembedded.org>;
	Sat, 08 Feb 2020 10:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nh55cmJZedSdYq7j4nE9FDTYzlyID90KFl63RA/aGyM=;
	b=VHkFgohEhtRNtC5UARJ1aoaP8gWtX1sHnXG0ScJuBZ7RurBJMPJHSld6bcNL1cPAye
	QWyptl3PjHCw3hpCPUnyZNLaNEACItGPaK8D0gkDqEZhMTmSjxjTDhJ4+Idw5GOg5NBl
	quwheIl8ZaPvSbXfvCDiUOxlLOOBKs3vfoZuHuX/2OqiTY3Cj8Vkn1HRf0zznuBiT+ni
	nGJ1ibf9RiMLfISBQXJITodnyVj9U8Xe+1NFjWhjQx4szbsGJlWR0jjtjQEyoOORgfUi
	pQPPbDIk213YQaUK4LFdMSuOAsveRQW4wXqEyMYk5Ehxdzu9xmuBax7ZO2+/yuh3N2+n
	dPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nh55cmJZedSdYq7j4nE9FDTYzlyID90KFl63RA/aGyM=;
	b=FLrjrj6+focVU4EoAlHJC2OHdFk8nTTipLwt62wwb77FzJ25frI9YS4G/UpiAase9D
	o2EsnXjKZ93eEDhP4sNFClyL8C6ylIeVbYh31w5vWgLwR5Y6jf6VbLZMOoZStabnOlIs
	6bcWB7541IR4uSkJtaG/Ho4p4uS9a8zjR2pExNy/ymyn5cwmEdPdOIYFND8ouUk+DgUP
	3LsT3oRBmVTMk1SYQSSyP4nK4UKGBygtlBCuAdAt/b45XafYsMM1Bfgrbutus6c8SDlm
	yGedXbGcEbmbBx3qhMWhCgu6Ar7afc9YHlzjk2kfAnX74jBTrLvUWqX+k0nfSXleAPCP
	ix5Q==
X-Gm-Message-State: APjAAAUQt5Y/zyAfV6qiD9O1CrcaiwrnHsDq6jh4KPQM/ErqyHjGyH4Q
	ID1i0zQ7wJnVZBC7/rSHmPeCdIs1pDyxgQT9uw4SheDv
X-Google-Smtp-Source: APXvYqwdFtfUSRNkuAzPJdKxUFug2F5HrtjeQJ5aW91L+IuIiMbL54SUHpZktqOSRmTzCmLU5w1+IalPDRvNzxAMBQk=
X-Received: by 2002:a67:7987:: with SMTP id u129mr2381071vsc.83.1581185438623; 
	Sat, 08 Feb 2020 10:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20200204184113.16070-1-alistair.francis@wdc.com>
	<bd2c5b87416b5d77d7b1405666a6a333be2fb135.camel@linuxfoundation.org>
In-Reply-To: <bd2c5b87416b5d77d7b1405666a6a333be2fb135.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 8 Feb 2020 19:10:27 +0100
Message-ID: <CANNYZj-PpRueMjDaoJy86xpe_iEA6rePRTfiVaD-ECcpQ6MbQg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 4.2.0
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
X-List-Received-Date: Sat, 08 Feb 2020 18:10:38 -0000
Content-Type: multipart/alternative; boundary="00000000000064b09b059e146cab"

--00000000000064b09b059e146cab
Content-Type: text/plain; charset="UTF-8"

I think this backport should address the problem:
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a88c40f02ace88f09b2a85a64831b277b2ebc88c

Alex

On Sat, 8 Feb 2020 at 08:45, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-02-04 at 10:41 -0800, Alistair Francis wrote:
> > While we are upgrading let's refresh patches and remove the outdated
> > patches.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> I think this stopped qemu running on the autobuilder, we saw many
> versions of:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1538
>
> Failed to run qemu: qemu: can't parse 'vga' parameter: Invalid argument
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000064b09b059e146cab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this backport should address the problem:</di=
v><div><a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Da88=
c40f02ace88f09b2a85a64831b277b2ebc88c">https://git.qemu.org/?p=3Dqemu.git;a=
=3Dcommitdiff;h=3Da88c40f02ace88f09b2a85a64831b277b2ebc88c</a></div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, 8 Feb 2020 at 08:45, Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, 2020-02-04 at 10:41 -0800, Alistair Francis wrote:<br>
&gt; While we are upgrading let&#39;s refresh patches and remove the outdat=
ed<br>
&gt; patches.<br>
&gt; <br>
&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis=
@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
I think this stopped qemu running on the autobuilder, we saw many<br>
versions of:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/50/build=
s/1538" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/1538</a><br>
<br>
Failed to run qemu: qemu: can&#39;t parse &#39;vga&#39; parameter: Invalid =
argument<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000064b09b059e146cab--
