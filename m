Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4D161AD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 06:17:51 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id tb18so8677476obb.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 23:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=wpi1tK99t96QUH9rFU2yjSIPyRrKSgSBVdQ8C6Bmwn0=;
	b=qQ5i4oPF8q9hDZBj2r78arsibHRhSHo/+4Y6Qaos5F9JBOKduV1URnozOnrrAd2RVo
	7uudaTeASjXK47BdUDFGCcl9dIU/d/hykhiJrON0fNLoF3P+KlqPAudU7PoAt+ELanvU
	6Kwwn2WTl/3Sr3QV4x7TnO0nOTOoWj07PdNKsN1hodeHP+JGuen9fq+xWQe529FT1ss8
	uQxM4BzYaBD0dgvVLMZUtj90GkQXMZHGWAcy2ZguXNQfJWcpe2lmRjMWOylbxXDvnnF2
	zALPpI5q6zhJLjhcG+IqqthghJYK8fJQt2EaCOI/sGzWsrktDkatuRHkZr81FfRutCZo
	Dlqw==
MIME-Version: 1.0
X-Received: by 10.60.144.99 with SMTP id sl3mr20569697oeb.0.1369721871882;
	Mon, 27 May 2013 23:17:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 27 May 2013 23:17:51 -0700 (PDT)
In-Reply-To: <4f4edbf9838c30a32a61d1284b86c9eacb30b1d1.1369719531.git.Qi.Chen@windriver.com>
References: <cover.1369719531.git.Qi.Chen@windriver.com>
	<4f4edbf9838c30a32a61d1284b86c9eacb30b1d1.1369719531.git.Qi.Chen@windriver.com>
Date: Tue, 28 May 2013 03:17:51 -0300
X-Google-Sender-Auth: UdRc-rFMoTGj6yRoiJPSLpI4I5Q
Message-ID: <CAP9ODKq79WMuL8K+E7oE__p3Y2Q_1-8TrtEtHM7L+cWFYP6r4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] busybox: enable login/password commands by default
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
X-List-Received-Date: Tue, 28 May 2013 06:17:52 -0000
Content-Type: multipart/alternative; boundary=047d7b3a831c9dac7504ddc1396c

--047d7b3a831c9dac7504ddc1396c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 28, 2013 at 2:39 AM, <Qi.Chen@windriver.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> As we switch to using busybox as the default login manager, we here
> modify the defconfig file of busybox to enable the commands that
> were previously provided by tinylogin.
>
> These commands are: addgroup, adduser, delgroup, deluser, login, su,
> getty, sulogin, passwd and vlock.
>
> [YOCTO #4207]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

This patch needs to be applied before packagegroup one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b3a831c9dac7504ddc1396c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 28, 2013 at 2:39 AM,  <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
<br>
As we switch to using busybox as the default login manager, we here<br>
modify the defconfig file of busybox to enable the commands that<br>
were previously provided by tinylogin.<br>
<br>
These commands are: addgroup, adduser, delgroup, deluser, login, su,<br>
getty, sulogin, passwd and vlock.<br>
<br>
[YOCTO #4207]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br></blockquote><div><br></div><div style>This patch=
 needs to be applied before packagegroup one.=A0</div></div><div><br></div>
-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blan=
k">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projeto=
s.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><=
br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b3a831c9dac7504ddc1396c--
