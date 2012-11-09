Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TWy8S-0001GY-G6
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Nov 2012 00:37:16 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2845876pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2012 15:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VayBhR2N7i5MnpibGD9oaEOjz2IQFYs1gSHoLI5bZBo=;
	b=PtLx8IC1Pik5axuY/bmkbp4uSqRjyjzaHkyqVVvS5lK+XRvu60vVn0F4hHyNmynXc3
	GTYBoQoMaL+Sv46LUeQrQOfykAJrVrbiyOqxwq6w2RtUWdjepzCI3VhmOxIMDuHGSoHt
	feZJ/2B1owGrme1xc+ORZKQK5xV1l5/wkdCiqB0H/9zq3d0s1e2ngd3Ombj1Y6oMT5Bt
	Bh5yzOycoAbxOlUKuBxQ7MjHO7E6/u3Qs3w0O3vIHbYxaUoowZ57iuuEucmC2rwvNkzL
	wdxAzDsYZQABSspr29DtazUgNOetrsPr0e6ea01RSw414Q7ybi27Q8KoUNJ9CeBsC+Fd
	gsJQ==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr38550338pbc.24.1352503406452; Fri,
	09 Nov 2012 15:23:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 9 Nov 2012 15:23:26 -0800 (PST)
In-Reply-To: <1352501827.9083.21.camel@ted>
References: <cover.1352455397.git.ross.burton@intel.com>
	<154a30032b03a9ce269752adbf5bbec85205720e.1352455397.git.ross.burton@intel.com>
	<CAP9ODKor1L_sv0hLi_-FTCY383fyE0NguXEeMp1U0=KcPQrk1A@mail.gmail.com>
	<1352501827.9083.21.camel@ted>
Date: Fri, 9 Nov 2012 21:23:26 -0200
X-Google-Sender-Auth: h_nevNB47ZELV-PaI9VIpjR2D_Y
Message-ID: <CAP9ODKpa0gkf5ZQGVemLYRNKVKA4cWbV4v1E_SZwAs9RuMd61A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] meta: remove redundant _FOR_BUILD variables
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
X-List-Received-Date: Fri, 09 Nov 2012 23:37:16 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c99c19605104ce183d0e

--e89a8ff1c99c19605104ce183d0e
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 9, 2012 at 8:57 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2012-11-09 at 20:32 -0200, Otavio Salvador wrote:
> > On Fri, Nov 9, 2012 at 8:09 AM, Ross Burton <ross.burton@intel.com>
> > wrote:
> >         Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> >
> > Please bump PR. Even it might not change the end result we need to
> > force a rebuild as we did change the meta-data and we risk having a
> > subtle bug somewhere.
>
> This patch set adds a number of exports to autotools.bbclass. In doing
> so, the sstate checksums will change for pretty much everything and
> hence pretty much everything will rebuild. Using PR specifically to
> force a rebuild is therefore unnecessary.
>

If it rebuilds it might get a different binary package and for preserve the
upgrade path PR bumps are need, aren't they?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c99c19605104ce183d0e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Nov 9, 2012 at 8:57 PM, Richard =
Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>=
 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Fri, 2012-11-09 at 20:3=
2 -0200, Otavio Salvador wrote:<br>
&gt; On Fri, Nov 9, 2012 at 8:09 AM, Ross Burton &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.=
burton@intel.com">ross.burton@intel.com</a>&gt;<br>
<br>
&gt;<br>
&gt; Please bump PR. Even it might not change the end result we need to<br>
&gt; force a rebuild as we did change the meta-data and we risk having a<br=
>
&gt; subtle bug somewhere.<br>
<br>
</div>This patch set adds a number of exports to autotools.bbclass. In doin=
g<br>
so, the sstate checksums will change for pretty much everything and<br>
hence pretty much everything will rebuild. Using PR specifically to<br>
force a rebuild is therefore unnecessary.<br></blockquote><div><br></div><d=
iv>If it rebuilds it might get a different binary package and for preserve =
the upgrade path PR bumps are need, aren&#39;t they?</div><div>=A0</div>
</div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.=
br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.=
ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c99c19605104ce183d0e--
