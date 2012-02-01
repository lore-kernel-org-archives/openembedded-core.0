Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RserE-0008KL-Ai
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 19:24:36 +0100
Received: by lbol12 with SMTP id l12so222135lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ArEbO9lA+tgjXXR9j0R+NZSHgZ/wGde9BjuG3WYR5rU=;
	b=PIExS/FMWM49nkYRCyLA7HayaekSMdM92smziWdBHIoia6i41C54oLe7uyivLPW+Rf
	1GMDilNDlTPm7OUVgD2kLiKA5heCQUbb0ZHgSilru/bMQLHh53IHy6ohqrK4LTRPRhiy
	Pc9XdB7UgimfEWw4gsfu65wR07dENfcax7LWY=
MIME-Version: 1.0
Received: by 10.112.36.34 with SMTP id n2mr4650792lbj.24.1328120201160; Wed,
	01 Feb 2012 10:16:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Wed, 1 Feb 2012 10:16:41 -0800 (PST)
In-Reply-To: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
References: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
Date: Wed, 1 Feb 2012 16:16:41 -0200
X-Google-Sender-Auth: Hbsd7cc3OYw_fFjtIT7zuYC8BVQ
Message-ID: <CAP9ODKrepZz_XWj_qBddMP0tX3mNCTdcxCLSBTJXyoPWBC3fcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: accessing variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 18:24:36 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe34eccf28e404b7eb147f

--e0cb4efe34eccf28e404b7eb147f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 16:15, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> another stupid question from my side:
>
> do
>
> bb.data.getVar('foo', d, 1)
>
> and
>
> d.getVar('foo', 1)
>
> access the same data?
>

It does but the later is supported on recent bitbake versions only.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe34eccf28e404b7eb147f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 1, 2012 at 16:15, Andreas M=FCller <=
span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnit=
zeltony@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
another stupid question from my side:<br>
<br>
do<br>
<br>
bb.data.getVar(&#39;foo&#39;, d, 1)<br>
<br>
and<br>
<br>
d.getVar(&#39;foo&#39;, 1)<br>
<br>
access the same data?<br></blockquote><div><br></div><div>It does but the l=
ater is supported on recent bitbake versions only.</div><div>=A0</div></div=
>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e0cb4efe34eccf28e404b7eb147f--
