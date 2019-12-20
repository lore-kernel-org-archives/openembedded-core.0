Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
	[209.85.222.47])
	by mail.openembedded.org (Postfix) with ESMTP id D0EB77F369
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 11:18:56 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id f7so3091565uaa.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 03:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WKe61sPNiQ3OdlJY71HXA0hCU5fEWLiFmnzhubpdxq8=;
	b=GhCAdRr1vPa0zmEXJSohEH+wh3uTAbwdA2lNY7MeMVBuPN7KzR/hK6VBaLIL/J4Y/o
	I892pm6OT52c49BT1r1xNhW7BHCYBBI/Vdu+6dboCdwpM62DL9AQgrBMibo11aIFql0+
	FK+IoSNrBKNIdDDgxBnApsnhvpgrYhhIfMegoefJCP4tTAJQUMCq/GqTdFibY6OSs7Sp
	3DkN7VNUWVBEm2ccoGYqVqFdMgdU/9WTxoQfbZZZ2eF4S67vX9XivjqyuhQd8D7VbcrD
	Y4NgTlMjpXUU5ll2NwRjs7AaZm7fX6XaM7bs179CtON/LUCjVTsnE+z0OfQGrcwfSthd
	+HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WKe61sPNiQ3OdlJY71HXA0hCU5fEWLiFmnzhubpdxq8=;
	b=NjtF5RE0wFxjvNp2mmSAmzntTIPEPfoLW9pNpvoPm+tfClgtvbT+KzdB7RjHW0OaO0
	h48/IVQn3zd3NmDSKCG6Uxs8myAtL+mMnuz3On8TzXftdjk6otG5uLuFmqybrxX+n+CJ
	z+DpkmkofYOjsTmwKIASXtHTPh1XinCxfA6SqchE4rXfxhFUgjLBVZR+GYGW9LlZyG7K
	iWEjwF2Su1VRur2/ItAg+jzsWkuT46YoRYw3fbEb0SYxaq7ReVV8GHEIZD2gA3KJInBG
	UcTwPpCAS2rBu1P+n7jU7iU6fRUsrx2gefR+5qiU/9rtM6mTsdSrvaBlPVsufywMIPr7
	H6Ow==
X-Gm-Message-State: APjAAAXw6Yi6otOLW+KNqk1oRKFzXWPfv4VkOQ5hytbrJ1WdPEz9isZr
	HumXaTuogF4fdNPjccY6ZRVadrW4cFOpwNtsnas=
X-Google-Smtp-Source: APXvYqxdhXPzmA+fV33efOuzCdDPcO9IGdAPhbMI6O0RYJZ4lDqji7XMSJso5ZsRcHNvNT9aaxBKrMNKtqEjcwFXRGs=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr8534958uap.93.1576840737337;
	Fri, 20 Dec 2019 03:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-7-alex.kanavin@gmail.com>
	<3cd13d50-b437-2438-582a-4c149711a966@intel.com>
In-Reply-To: <3cd13d50-b437-2438-582a-4c149711a966@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Dec 2019 12:18:45 +0100
Message-ID: <CANNYZj-5H08GKeG7=g7Z=3NB9PrK3W6REses0-a+fMdESJ=9VQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/25] nss: update to 3.48
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
X-List-Received-Date: Fri, 20 Dec 2019 11:18:57 -0000
Content-Type: multipart/alternative; boundary="000000000000043657059a20d81b"

--000000000000043657059a20d81b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's getting ridiculous, isn't it? Dropping centos 7 from supported list
can't come soon enough.

(I've seen the discussion on the oe-arch list)

Alex

On Fri, 20 Dec 2019 at 12:00, Ross Burton <ross.burton@intel.com> wrote:

> Breaks on Centos 7:
>
> nsinstall.c: In function =E2=80=98main=E2=80=99:
> nsinstall.c:201:5: warning: implicit declaration of function =E2=80=98get=
opt=E2=80=99
> [-Wimplicit-function-declaration]
>       while ((opt =3D getopt(argc, argv, "C:DdlL:Rm:o:g:t")) !=3D EOF) {
>       ^
> nsinstall.c:203:20: error: =E2=80=98optarg=E2=80=99 undeclared (first use=
 in this function)
>      case 'C': cwd =3D optarg; break;
>                      ^
> nsinstall.c:203:20: note: each undeclared identifier is reported only
> once for each function it appears in
> nsinstall.c:225:13: error: =E2=80=98optind=E2=80=99 undeclared (first use=
 in this function)
>       argc -=3D optind;
>               ^
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000043657059a20d81b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It&#39;s getting ridiculous, isn&#39;t it? Dropping c=
entos 7 from supported list can&#39;t come soon enough.</div><div><br></div=
><div>(I&#39;ve seen the discussion on the oe-arch list)</div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 20 Dec 2019 at 12:00, Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Breaks on Centos 7:<=
br>
<br>
nsinstall.c: In function =E2=80=98main=E2=80=99:<br>
nsinstall.c:201:5: warning: implicit declaration of function =E2=80=98getop=
t=E2=80=99 <br>
[-Wimplicit-function-declaration]<br>
=C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt(argc, argv, &quot;C:DdlL:Rm:o:g=
:t&quot;)) !=3D EOF) {<br>
=C2=A0 =C2=A0 =C2=A0 ^<br>
nsinstall.c:203:20: error: =E2=80=98optarg=E2=80=99 undeclared (first use i=
n this function)<br>
=C2=A0 =C2=A0 =C2=A0case &#39;C&#39;: cwd =3D optarg; break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^<br>
nsinstall.c:203:20: note: each undeclared identifier is reported only <br>
once for each function it appears in<br>
nsinstall.c:225:13: error: =E2=80=98optind=E2=80=99 undeclared (first use i=
n this function)<br>
=C2=A0 =C2=A0 =C2=A0 argc -=3D optind;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
<br>
Ross<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000043657059a20d81b--
