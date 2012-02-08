Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv5SQ-0007mJ-Qp
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 12:13:02 +0100
Received: by eekd41 with SMTP id d41so116954eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 03:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=PgYK6rbj8qgc3XW3syWSLY0/dh0R8Q1Wb2tGH4hZLDs=;
	b=VmQtSvuc6MRSAR91gT/bhSH1TwadpjP5ejafj1IdsziNH1kmiJ/9EGpnL4D1+xwiug
	3xN43YmZmi96ZAi4NxK7LA9bfvcUKetEGMk/bZGiiH5DTpGxFtMC4hxdEzBjIrKp2CtE
	4lj9Qwco8bTHGFEhuFRXZXv8UfEQH4a7KHQ+4=
MIME-Version: 1.0
Received: by 10.213.10.145 with SMTP id p17mr2674340ebp.12.1328699099631; Wed,
	08 Feb 2012 03:04:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 03:04:59 -0800 (PST)
In-Reply-To: <1328698348.29471.13.camel@ted>
References: <cover.1328648562.git.otavio@ossystems.com.br>
	<3aaae21268883e5ebcc5373f99517045613ad102.1328648562.git.otavio@ossystems.com.br>
	<1328698348.29471.13.camel@ted>
Date: Wed, 8 Feb 2012 09:04:59 -0200
X-Google-Sender-Auth: syTmYq7Y2YuA0pbdE6X8nIt9ZxE
Message-ID: <CAP9ODKqTFqH-mgPj3nFrKBXg2LCuZaxWHRQb33NN=k8a2NwQhg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] cross.bbclass: add virtclass handler
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
X-List-Received-Date: Wed, 08 Feb 2012 11:13:03 -0000
Content-Type: multipart/alternative; boundary=0015174c1704d8d1a904b871dde9

--0015174c1704d8d1a904b871dde9
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 08:52, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Can you point me at the recipe you're using this in? I suspect we should
> just remove the map_dependencies() pieces from this class entirely and
> handle dependency issues with the override manually. I think at this
> point all the BBCLASSEXTEND is going to give you is the removal of the
> need to add a separate .bb file with "inherit cross" in it and enable an
> override for your to use. I'm not sure we can write generic dependency
> mapping code that would work for -cross.
>

We use it a lot in the meta-chicken layer (
https://github.com/OSSystems/meta-chicken).

I agree about dropping map_dependencies from it. I will look at it and send
it again.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174c1704d8d1a904b871dde9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 8, 2012 at 08:52, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div id=3D":12q">Can you point me at the recipe you&#39;re using this in? I=
 suspect we should<br>
just remove the map_dependencies() pieces from this class entirely and<br>
handle dependency issues with the override manually. I think at this<br>
point all the BBCLASSEXTEND is going to give you is the removal of the<br>
need to add a separate .bb file with &quot;inherit cross&quot; in it and en=
able an<br>
override for your to use. I&#39;m not sure we can write generic dependency<=
br>
mapping code that would work for -cross.</div></blockquote></div><br>We use=
 it a lot in the meta-chicken layer (<a href=3D"https://github.com/OSSystem=
s/meta-chicken">https://github.com/OSSystems/meta-chicken</a>).<div><br>
</div><div>I agree about dropping map_dependencies from it. I will look at =
it and send it again.<br clear=3D"all"><div><br></div>-- <br>Otavio Salvado=
r=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br=
>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavi=
o@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D=
"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--0015174c1704d8d1a904b871dde9--
