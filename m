Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tgbkz-0000XX-Q3
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 14:44:53 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3922853pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 05:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=pQc3Gr+kyzdml2ocNH3kLTpoUN4xjgoIU/chf+XzcJE=;
	b=oc35nQWk8nMeXDrYnpo8fOVlWQn2j1sd6RxAzPozG3Wa1qtGYeLZ2BdzaL1BgNekzg
	oV4sroDER1dfKBUFjw7mtvGhLXeMLkZGx5/z6LD3x8oIX1Lxhy1Qc+AIgze8g7fPbJ3E
	SQne3Xlmt5Hw9iklDp56SQtBIw43ofkSD/Jaz9EX6jEjGWkzCWVRS5YL1gALFItIIvlD
	Fj7JsAG7P++FxfZIGTyoZn595yu7404p3lK3jeq8T+YC5igttXK9MZuXzRIZB/gMDmiu
	i10cBpCQ6RdrbQ7rToI0SGbT7BqmNy5+Z+JJ+NRoHeQhNI79NE9JlHu7ekm4q+NhwXaY
	OJKw==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr6264393pbc.24.1354800627710; Thu,
	06 Dec 2012 05:30:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 6 Dec 2012 05:30:27 -0800 (PST)
In-Reply-To: <0d97e14c48d2368ad4801994416eba990654254d.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<0d97e14c48d2368ad4801994416eba990654254d.1354641032.git.mark.hatle@windriver.com>
Date: Thu, 6 Dec 2012 11:30:27 -0200
X-Google-Sender-Auth: LNxGY7HpK7tsx0UqtfRchsLvw_8
Message-ID: <CAP9ODKonXjjUYEGCuDqXiNF4vpROi4DbAZjygdNbFHDQh3+V_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/22] pkgconfig: Add a manual dependency of pkgconfig(pkg-config)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 13:44:54 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c99c27fc3304d02f1ae8

--e89a8ff1c99c27fc3304d02f1ae8
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 4, 2012 at 3:14 PM, Mark Hatle <mark.hatle@windriver.com> wrote:

> The libtelepathy-glib-dev package contains a .pc file that has a requires
> of pkgconfig(pkg-config) > 0.21 in it.  In order to satisfy this
> requirement
> we add a manual RPROVIDE to the pkgconfig package.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>

Have this been tested using ipk and deb packages?

I don't know if the format used, of rprovides, is supported by them (or
abstracted by bitbake).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c99c27fc3304d02f1ae8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 4, 2012 at 3:14 PM, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:m=
ark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The libtelepathy-glib-dev package contains a=
 .pc file that has a requires<br>
of pkgconfig(pkg-config) &gt; 0.21 in it. =A0In order to satisfy this requi=
rement<br>
we add a manual RPROVIDE to the pkgconfig package.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">m=
ark.hatle@windriver.com</a>&gt;<br></blockquote><div><br></div><div>Have th=
is been tested using ipk and deb packages?</div><div><br></div><div>I don&#=
39;t know if the format used, of rprovides, is supported by them (or abstra=
cted by bitbake).</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--e89a8ff1c99c27fc3304d02f1ae8--
