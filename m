Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 331E66EB0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 17:21:18 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id j5so23508729qaq.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/6PGHVPIqcygjAtYeT40IwrsAJuwCtmL2ecGvdP8fOU=;
	b=DE/EMrsfviai28qg05EWmjf9TIDgXFszPCTK7Nb9iZlrPhHAS2uo+u1oh7Y6/Uw1bo
	PDKoyna4OuFXt/2ibjdf2LLQTf3Rpeyygrw8/eS7LWbTGAYTX/8BvzgJ7GSpcftdhkMW
	HjUe7LoTqWoOnWI6N0iM6IN8oEHaqETqqZj9OPuKJJ6fzWY2juI8Lr3B4GVvBCW80Zev
	thpdmvXtcnee0RdZwCvzqngzuN4/yBb+0BeG4qZZFj4HepuMajm5qLvjENzF7+5oxc3w
	R8jUvk3cGuKZcCmOQqtqr6M6T7bHsxfVHg9H8lvJonYfgSe9OYQdTba9fSOWkjQAZpmo
	E6Bg==
X-Received: by 10.140.31.75 with SMTP id e69mr11734179qge.76.1392744078929;
	Tue, 18 Feb 2014 09:21:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 09:20:58 -0800 (PST)
In-Reply-To: <CAMKF1sox1wFEdRx2tdox_fAqVx_VGZwz_OEU=+02wzRaAcYP6Q@mail.gmail.com>
References: <1392742198-23333-1-git-send-email-diego.sueiro@gmail.com>
	<CAMKF1sox1wFEdRx2tdox_fAqVx_VGZwz_OEU=+02wzRaAcYP6Q@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 14:20:58 -0300
Message-ID: <CAMCfZKFvNrOBenvt-KmOpzLjVdAf=qGDxJb-AB3h=Zvfix1iqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain-qt[e]: add qt4[-embedded]-staticdev
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
X-List-Received-Date: Tue, 18 Feb 2014 17:21:19 -0000
Content-Type: multipart/alternative; boundary=001a113a96ca16901004f2b180b5

--001a113a96ca16901004f2b180b5
Content-Type: text/plain; charset=ISO-8859-1

Khem,
On Tue, Feb 18, 2014 at 1:53 PM, Khem Raj <raj.khem@gmail.com> wrote:

> hmmm you just want this 1 static library not all. So lets first
> package the .a into a package of its own and then include that instead
>
libQtUiTools[E].a is the only file in the package.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br


/*long live rock 'n roll*/

--001a113a96ca16901004f2b180b5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Khem,<br><div class=3D"gmail_qu=
ote">On Tue, Feb 18, 2014 at 1:53 PM, Khem Raj <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":47g" style=3D"overflow:hidden">hmmm you just w=
ant this 1 static library not all. So lets first<br>


package the .a into a package of its own and then include that instead</div=
></blockquote></div><span style=3D"color:rgb(80,0,80);font-family:arial,san=
s-serif;font-size:13px">libQtUiTools[E].a is the only file in the package.<=
/span><br>

<br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></d=
iv>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=
=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarcados.com.br</=
a><br>

<br><br>/*long live rock &#39;n roll*/</div></div>
</div></div>

--001a113a96ca16901004f2b180b5--
