Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RW6Ki-0006dr-5o
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 14:05:48 +0100
Received: by faaa19 with SMTP id a19so1065200faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=q89rhWGw68AqYxBqcI9PATuzA+OYLcSOI6G/pPfUGgI=;
	b=i3OioQNrKKJJVxxx2bReWIjeJlCv6/vTy1FBIhj5fsEcaIq0oXrI8/srJAXaeh6X4q
	ao2jZqSZcIMuBfGGZ91Kn+ZVSaa/h0Qu39O72AdhWpXgrDOeLWnFrOI+eqVB0QdTxjoM
	XJF3Z/y7YPnkxKbOlKQIS9oh51CbLkJNHW468=
MIME-Version: 1.0
Received: by 10.204.12.68 with SMTP id w4mr7133660bkw.31.1322744343962; Thu,
	01 Dec 2011 04:59:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Thu, 1 Dec 2011 04:59:03 -0800 (PST)
In-Reply-To: <1322743071.17484.119.camel@ted>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
Date: Thu, 1 Dec 2011 10:59:03 -0200
X-Google-Sender-Auth: iW2XIsrI0Z0HasF_yC295E9mt-E
Message-ID: <CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 13:05:48 -0000
Content-Type: multipart/alternative; boundary=0003255581c2c0246504b3076a80

--0003255581c2c0246504b3076a80
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 1, 2011 at 10:37, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
> > A while back I've proposed to make .bbappend without corresponding .bb
> > only big fat warning, but not fatal to parse. Now you cannot even build
> > eglibc if there is libdrm bbappend you don't care at all about..
>
> You can do this by setting:
>
> BB_DANGLINGAPPENDS_WARNONLY
>

This is even worse; you end up with a package without the changes done on
the bbappend and as most bbappend files do not change PR, adding it later
won't force a package update.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0003255581c2c0246504b3076a80
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 1, 2011 at 10:37, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex;">
<div class=3D"im">On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:<br=
>
&gt; A while back I&#39;ve proposed to make .bbappend without corresponding=
 .bb<br>
&gt; only big fat warning, but not fatal to parse. Now you cannot even buil=
d<br>
&gt; eglibc if there is libdrm bbappend you don&#39;t care at all about..<b=
r>
<br>
</div>You can do this by setting:<br>
<br>
BB_DANGLINGAPPENDS_WARNONLY<br></blockquote><div><br></div><div>This is eve=
n worse; you end up with a package without the changes done on the bbappend=
 and as most bbappend files do not change PR, adding it later won&#39;t for=
ce a package update.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0003255581c2c0246504b3076a80--
