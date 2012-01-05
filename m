Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RiqmL-0007Da-0f
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:07:01 +0100
Received: by eaal1 with SMTP id l1so498435eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=/FsJ7JVFVEz9iT+0DVaHqnFeffLyr9KyXzkZYP9aEVY=;
	b=iaZqsRcU/7b4LSA3wEPk0syBM1utWFEQ9wYpgaG8XoRvZBNW1ArWFnyzBN2h96zi5w
	jVSvFgszIz8is7FZaaIev3GdPpe+QzDewn7xKG8zn5uIHOn7ouUsXr9IKcOZJBFKOqNx
	mcdDu3OcSJHfotBifBkaO86tlcdSWYGvfwRSA=
MIME-Version: 1.0
Received: by 10.205.136.205 with SMTP id il13mr1090264bkc.37.1325782776878;
	Thu, 05 Jan 2012 08:59:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Thu, 5 Jan 2012 08:59:36 -0800 (PST)
In-Reply-To: <1325697179.20759.38.camel@ted>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<595333f997b8f8f2ecfbb361ad8a7ccfb33a993e.1325101674.git.otavio@ossystems.com.br>
	<1325697179.20759.38.camel@ted>
Date: Thu, 5 Jan 2012 14:59:36 -0200
X-Google-Sender-Auth: mprjTXYirk1p0NmFQPfye4S7dBc
Message-ID: <CAP9ODKrDPSWzJ9oNrpfNqRB2mhO82LCgDOGPxuWbhRVXo--Pqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/16] udev: ensure /dev/pts and /dev/shm does exists
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
X-List-Received-Date: Thu, 05 Jan 2012 17:07:01 -0000
Content-Type: multipart/alternative; boundary=000e0cdfd24a77160504b5cadb0d

--000e0cdfd24a77160504b5cadb0d
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 4, 2012 at 15:12, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Please put an if [ -e ] around these since its a couple of exec calls we
> could do without if they already exist...
>

Done locally, will send it soon.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfd24a77160504b5cadb0d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jan 4, 2012 at 15:12, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"im">Please put an if [ -e ] around these since its a couple o=
f exec calls we</div>
could do without if they already exist...<br></blockquote><div><br></div><d=
iv>Done locally, will send it soon.</div><div>=A0</div></div>-- <br>Otavio =
Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Sys=
tems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank=
">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" ta=
rget=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfd24a77160504b5cadb0d--
