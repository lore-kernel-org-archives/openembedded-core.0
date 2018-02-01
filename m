Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 836C7784D2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 11:39:36 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id l17so18866017ioc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 03:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uWN5N9AVC5UTQ+7xDwIU3C7PI1qglruwbVpL1r3yqiU=;
	b=adsOACRij2Nin6JaPMp7yayk+7SxbvM0e67LGeOl6rtWF96pUofuWl+6Y3uRlfW7GS
	eXziy9pw9s4eMymeeEhRaoW0rmvgbyJFSOxuhW2sQfQCzXvCtP0zWVK8WozszFYCRfJy
	DhtEElSOBeh4MeA6zI1eY/omGCM/MJ38Vf4/sbeIdK+Ny4LSJbsFxMN3uYt9z+QEfXvc
	QCHOgS2+cmIhnDwFCbXiCnke5t7HFqlbyCTp9wDKI4BBxAD7tGo7Gaybx1M9teeklsXp
	VdLSwJWfsC3BaYkgHHBhO0cDcl0qdCjdEbblf9SFkNT64Tq5TOH1vVkfUZ2jGlklE9um
	5eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uWN5N9AVC5UTQ+7xDwIU3C7PI1qglruwbVpL1r3yqiU=;
	b=URa5Xidec7rLgZtpkLPDA6JF5PQu7iMdZO6Xy2VGoJ4Pu3UBOIuAbIEOZUtCwM8r7D
	e2VRFPMTzNXpCvKXyYeLGtnayccaQeFo0ecXI3k7pIc8zNujb/T4jWc6A06fKzu9LuDN
	rm3BAaPmS93M+xvHFVxBXWwockj5VBzen14ZFP1BjreseA9CzsiG5BI61Ifbyc0xxSo4
	VT7+v/dkr5KFrfAtr0RjP46V7p/mT/gov9a+XBkXrAEtAHdweNhxObC0pqaY5oBofGno
	2TSr/pwB3CHUtGKTAuSG0MTZHI9QOZtScAjSDxyaBde/6GbVFu2VcnrBoa9C5ho4Hwlp
	hpUw==
X-Gm-Message-State: AKwxytcgbkfQKqhzNgFUIkkaq/03km61eZ6iBiG5iBdtNiLYaHvMls4K
	z6vQCPdBUyUDW/ao0+mJKx3RzSaI5jhN3t0PQaTbXYDB
X-Google-Smtp-Source: AH8x226WGYd4jZfh6PCvePB/BLN3DkVqvhghNL59dniJqRJUx2sG5dmN4EF9pSs6jjQf1HJjz/Dw5sku/NpmVpzLuUs=
X-Received: by 10.107.186.86 with SMTP id k83mr37515809iof.208.1517485177555; 
	Thu, 01 Feb 2018 03:39:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 03:39:17 -0800 (PST)
In-Reply-To: <cd674a9b-40ab-6433-c0ad-0566d4c4faa0@pr.hu>
References: <20180201102819.14994-1-otavio@ossystems.com.br>
	<cd674a9b-40ab-6433-c0ad-0566d4c4faa0@pr.hu>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 11:39:17 +0000
Message-ID: <CAJTo0LZXJHu-8uDU=yhtiECPeGKYz6YL2t-PsnACAX+zBv5ViA@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: Duplicate package names, was Re: [PATCH v1] glide: Add 0.13.1 version
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
X-List-Received-Date: Thu, 01 Feb 2018 11:39:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c076a70f5e4310564250c37"

--94eb2c076a70f5e4310564250c37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 1 February 2018 at 11:32, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@pr.hu> wrote:

> Of course, this package should not be confused with the old
> 3D library from Voodoo Graphics.
>

I'm pretty sure that this conflict is unlikely to cause problems in the
real world. :)


> The node modules that are built with the help of "inherit npm"
> may want to use a "node-" prefix in their names but it would not
> work as is because npm.bbclass is using ${PN}.
>
> I have a patch against npm.bbclass that I am testing at the moment
> but it may be necessary to talk about this issue in general.
>

Yes, that's definitely the best solution.  For reference, pypi.bbclass does
this:

def pypi_package(d):
    bpn =3D d.getVar('BPN')
    if bpn.startswith('python-'):
        return bpn[7:]
    elif bpn.startswith('python3-'):
        return bpn[8:]
    return bpn

PYPI_PACKAGE ?=3D "${@pypi_package(d)}"

Ross

--94eb2c076a70f5e4310564250c37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 February 2018 at 11:32, B=C3=B6sz=C3=B6rm=C3=A9nyi Zo=
lt=C3=A1n <span dir=3D"ltr">&lt;<a href=3D"mailto:zboszor@pr.hu" target=3D"=
_blank">zboszor@pr.hu</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex">Of course, this package should n=
ot be confused with the old<br>
3D library from Voodoo Graphics.<br></blockquote><div><br></div><div>I&#39;=
m pretty sure that this conflict is unlikely to cause problems in the real =
world. :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bord=
er-left-color:rgb(204,204,204);padding-left:1ex">The node modules that are =
built with the help of &quot;inherit npm&quot;<br>
may want to use a &quot;node-&quot; prefix in their names but it would not<=
br>
work as is because npm.bbclass is using ${PN}.<br>
<br>
I have a patch against npm.bbclass that I am testing at the moment<br>
but it may be necessary to talk about this issue in general.<br></blockquot=
e><div><br></div><div>Yes, that&#39;s definitely the best solution.=C2=A0 F=
or reference, pypi.bbclass does this:</div><div><br></div><div><div>def pyp=
i_package(d):</div><div>=C2=A0 =C2=A0 bpn =3D d.getVar(&#39;BPN&#39;)</div>=
<div>=C2=A0 =C2=A0 if bpn.startswith(&#39;python-&#39;):</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return bpn[7:]</div><div>=C2=A0 =C2=A0 elif bpn.starts=
with(&#39;python3-&#39;):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bpn[=
8:]</div><div>=C2=A0 =C2=A0 return bpn</div></div><div><br></div><div>PYPI_=
PACKAGE ?=3D &quot;${@pypi_package(d)}&quot;<br></div><div><br></div><div>R=
oss</div></div></div></div>

--94eb2c076a70f5e4310564250c37--
