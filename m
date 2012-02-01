Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsebL-0002VD-BY
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 19:08:11 +0100
Received: by lbol12 with SMTP id l12so219052lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=+PLHJJzuqJ8+RSrKxkHzfnSWWRv2ihCigcthFXCBs3Y=;
	b=nAdVb2OZwC55SJlPCALyOXoUW4zE6aNUnPAM60kwtDHOiXOCHVO7Ffc+gN+UZtmRZV
	Tux293Dom/YCzCM+Vc9FyD/cw0Kcc7GwiCBQGsygrqEAeThzuGy9r0CTncfYJlOmk+i7
	uYW6moj7AC8a640YMc/aTG4qalrPCxkDn4qWU=
MIME-Version: 1.0
Received: by 10.112.36.34 with SMTP id n2mr4636625lbj.24.1328119216176; Wed,
	01 Feb 2012 10:00:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Wed, 1 Feb 2012 10:00:16 -0800 (PST)
In-Reply-To: <1328102349.13744.68.camel@ted>
References: <cover.1327975625.git.otavio@ossystems.com.br>
	<d2dc84fee222915fee201ac867c00fda16b80284.1327975625.git.otavio@ossystems.com.br>
	<1328102349.13744.68.camel@ted>
Date: Wed, 1 Feb 2012 16:00:16 -0200
X-Google-Sender-Auth: HnTSbWaMBBwZE60MPd1MDeIutB0
Message-ID: <CAP9ODKrf8o6j3uhRNOP-qesqj6uDsd3HY2O6EudKWwTz0Qe5Bw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] classes/gitpkgv.bbclass: import from Meta-OE
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
X-List-Received-Date: Wed, 01 Feb 2012 18:08:11 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe34ec197e6a04b7eada83

--e0cb4efe34ec197e6a04b7eada83
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 1, 2012 at 11:19, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> As discussed on IRC, I think some of the code here should really be
> integrated into the bitbake git fetcher to ensure we have a
> clean/consistent API for fetcher functionality. The interface I'm
> thinking about would be similar to SRCPV:
>
> SRCPV = "${@bb.fetch2.get_srcrev(d)}"
>
> with a new fetcher call being added such as get_simplified_srcrev(d).
> Switching between the simplified revision and the description could be
> governed by a variable setting similar to some of the existing variables
> that control fetcher behaviour.
>

I fully agree that having some of the code here ought to be in bitbake git
fetcher but I'd like to work on this after this code has been merge onto
OE-Core mostly because this will blocker on newer bitbake version
requirement and some layers are using it but now depending on meta-oe just
because of this class.


> There has been substantial work done to improve the fetcher APIs and
> clean up the various corner cases and this would seem a logical
> continuation of that, in keeping with the objectives of OE-Core.


Can this be merged and afterwareds I refactor it moving part of this code
onto bitbake? I am not used to bitbake code and I don't have enough time to
learn it in following week or so.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe34ec197e6a04b7eada83
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 1, 2012 at 11:19, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"im">As discussed on IRC, I think some of the code here should=
 really be</div>
integrated into the bitbake git fetcher to ensure we have a<br>
clean/consistent API for fetcher functionality. The interface I&#39;m<br>
thinking about would be similar to SRCPV:<br>
<br>
SRCPV =3D &quot;${@bb.fetch2.get_srcrev(d)}&quot;<br>
<br>
with a new fetcher call being added such as get_simplified_srcrev(d).<br>
Switching between the simplified revision and the description could be<br>
governed by a variable setting similar to some of the existing variables<br=
>
that control fetcher behaviour.<br></blockquote><div><br></div><div>I fully=
 agree that having some of the code here ought to be in bitbake git fetcher=
 but I&#39;d like to work on this after this code has been merge onto OE-Co=
re mostly because this will blocker on newer bitbake version requirement an=
d some layers are using it but now depending on meta-oe just because of thi=
s class.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
There has been substantial work done to improve the fetcher APIs and<br>
clean up the various corner cases and this would seem a logical<br>
continuation of that, in keeping with the objectives of OE-Core.</blockquot=
e><div><br></div><div>Can this be merged and afterwareds I refactor it movi=
ng part of this code onto bitbake? I am not used to bitbake code and I don&=
#39;t have enough time to learn it in following week or so.</div>
<div><br></div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e0cb4efe34ec197e6a04b7eada83--
