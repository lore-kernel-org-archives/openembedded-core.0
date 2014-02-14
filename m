Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4E46C6EFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 09:58:05 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id w8so17658752qac.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YvQxFfScelUQHISAo5rkdOFDbVh8Pq1bk96OOC5hK1g=;
	b=gSvSeovBG6UXsb4hoo7k/u0tW3EnGwANRuth366D99FzqNbbwpj8jhOwa6nbAbtA4n
	oF/Ueflmw+wIvBk8ruxeCX2dej5XS4IjPplikP7gbxEAmABw+WxCQun8p8rpokXpLdiC
	Ri0ra0lP+B53ypkd7Swv8WlZ01kpBe7ZadVL+c1NAVXkcdTHzoczZykBJnSSO4/Yr2N2
	80GtB1aNu5YaABZmIs3BJEOzbaY8XDCNkhdXaNKkluM+HI4GYo1uMYTQge1fHv/jmd6P
	7nSwMZhXfHLNvQDxMX2yA21Nc6aA8SbfigU15IKLa97jLsKNaB2OCtMUGOIAylHhJene
	zw8A==
X-Received: by 10.229.188.193 with SMTP id db1mr11256318qcb.0.1392371885870;
	Fri, 14 Feb 2014 01:58:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Fri, 14 Feb 2014 01:57:45 -0800 (PST)
In-Reply-To: <1392334278.14081.26.camel@ted>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
	<1392334278.14081.26.camel@ted>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 14 Feb 2014 07:57:45 -0200
Message-ID: <CAMCfZKEJJdCgCdhHHa_944+adDA2h6sBR9b9nwL=gTpy+dUPJQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Fri, 14 Feb 2014 09:58:05 -0000
Content-Type: multipart/alternative; boundary=001a11343fbca7307b04f25ad728

--001a11343fbca7307b04f25ad728
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 13, 2014 at 9:31 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Well, if you build static binaries you need the staticdev packages. By
> default we assume people tend to use dynamic libraries and the SDK is
> therefore setup that way.
>

Richard,
Looking at qt4-embedded build results it just produces the static library
for QtUiToolsE and file ./lib/libQtUiToolsE.prl point to a static library.

As soon as I'm not a Qt expert, I don't know if its possible to generate a
shared library for uitools. And googling for it I couldn't found
any helpful information.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a11343fbca7307b04f25ad728
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Feb 13, 2014 at 9:31 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":3z8" style=3D"overflow:hidden">Well, if you bu=
ild static binaries you need the staticdev packages. By<br>


default we assume people tend to use dynamic libraries and the SDK is<br>
therefore setup that way.</div></blockquote></div><br>Richard,</div><div cl=
ass=3D"gmail_extra" style>Looking at qt4-embedded build results it just pro=
duces the static library for=A0QtUiToolsE and file=A0./lib/libQtUiToolsE.pr=
l point to a static library.</div>

<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>As soon as I&#39;m not a Qt expert, I don&#39;t know if its possible to ge=
nerate a shared library for uitools. And googling for it I couldn&#39;t fou=
nd any=A0helpful=A0information.</div>

<div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><div>Reg=
ards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do=
 Embarcados<br><a href=3D"http://www.embarcados.com.br" target=3D"_blank">w=
ww.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11343fbca7307b04f25ad728--
