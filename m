Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZOuO-0003qT-MN
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 17:36:49 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so566583pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 08:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=cvMHUH27it30ID60nbyXTW0X36ic+T9+pq4ANGEK8jw=;
	b=r3AawQuKl5iLZ8lZoGvWboHdGw5vDZShK0gboN+cMBs/nIA4ZrW+UoEa6rJjWMN3uc
	7UiaXdBVUvIKxwv5vgH7l0rfTvcAxKQ/Jo4t5Vl1Zzfc9J879jgVSlkIA7FLlSEkgKsx
	75Razxz6Q1OPM23xeCTgn2kLz0Lx8ca0t+1XiTgFwlGpu2lMTrxguRClXnZ7IiBLkbmv
	w5CimnmIRZC1x5BR/BTbRbJQfM7O4t37MzxC8KCImoW9eUBSAwq8apYtcUuEnQhH3Zm7
	MVrBHhTdkTUPA8AEGwMKIzeimByJRl6KWEFoRRyWNWsQbMAjmYMQq2H2cWugxYHDVgkS
	4p5g==
MIME-Version: 1.0
Received: by 10.66.76.73 with SMTP id i9mr14243860paw.17.1353082969680; Fri,
	16 Nov 2012 08:22:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 16 Nov 2012 08:22:49 -0800 (PST)
In-Reply-To: <1353082360.3709.108.camel@ted>
References: <1353079960.3709.93.camel@ted>
	<CAP9ODKrfu8CMJ+ZWqkwQUCP+56WU_4sLf0Js9j_fYYGfDr7a0w@mail.gmail.com>
	<1353082360.3709.108.camel@ted>
Date: Fri, 16 Nov 2012 14:22:49 -0200
X-Google-Sender-Auth: KxxbtRmOTFI63Mt8SUTk3B-8n8s
Message-ID: <CAP9ODKoL-=qQ0gSBiHdWnU9OZB4p2ruPraRCkYXLMYX1cAfgCw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Implement a setscene dependency validation routine to allow skipping of some sstate installation
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
X-List-Received-Date: Fri, 16 Nov 2012 16:36:49 -0000
Content-Type: multipart/alternative; boundary=f46d042f9f90c26b3704ce9f2df0

--f46d042f9f90c26b3704ce9f2df0
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 2:12 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2012-11-16 at 13:58 -0200, Otavio Salvador wrote:
> > On Fri, Nov 16, 2012 at 1:32 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         This is a first attempt at logic to determine when a sstate
> >         dependency needs
> >         to be installed and when it does not. Its a start at the logic
> >         and errs on the
> >
> > s/errs/errors/
>
> It is actually meant to be errs :)
>
> >         +        # do_package_write_* and do_package doesn't need
> >         do_package
> >         +        if taskdependees[task][1] == "do_package" and
> >         taskdependees[dep][1] in ['do_package',
> >         'do_package_write_deb', 'do_package_write_ipk',
> >         'do_package_write_rpm']:
> >         +            continue
> >
> > I understand why you does this but it would be better if we had a
> > central place to have the do_package_write_$pkg recorded or when
> > adding new type this could be forgotten.
>
> Its a nice idea but I can't see any practical way to do this at the
> moment.
>

We might hava a variable that provide all package backends names? Like:

PACKAGE_BACKENDS = "ipk deb rpm"

?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f9f90c26b3704ce9f2df0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 2:12 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Fri, 2012-11-16 at 13:58 -0200, Otavio Salvador wrote:=
<br>
&gt; On Fri, Nov 16, 2012 at 1:32 PM, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 This is a first attempt at logic to determine when a s=
state<br>
&gt; =A0 =A0 =A0 =A0 dependency needs<br>
&gt; =A0 =A0 =A0 =A0 to be installed and when it does not. Its a start at t=
he logic<br>
&gt; =A0 =A0 =A0 =A0 and errs on the<br>
&gt;<br>
&gt; s/errs/errors/<br>
<br>
</div>It is actually meant to be errs :)<br>
<div class=3D"im"><br>
&gt; =A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0# do_package_write_* and do_package d=
oesn&#39;t need<br>
&gt; =A0 =A0 =A0 =A0 do_package<br>
&gt; =A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0if taskdependees[task][1] =3D=3D &quo=
t;do_package&quot; and<br>
&gt; =A0 =A0 =A0 =A0 taskdependees[dep][1] in [&#39;do_package&#39;,<br>
&gt; =A0 =A0 =A0 =A0 &#39;do_package_write_deb&#39;, &#39;do_package_write_=
ipk&#39;,<br>
&gt; =A0 =A0 =A0 =A0 &#39;do_package_write_rpm&#39;]:<br>
&gt; =A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0continue<br>
&gt;<br>
&gt; I understand why you does this but it would be better if we had a<br>
&gt; central place to have the do_package_write_$pkg recorded or when<br>
&gt; adding new type this could be forgotten.<br>
<br>
</div>Its a nice idea but I can&#39;t see any practical way to do this at t=
he<br>
moment.<br></blockquote><div><br></div><div>We might hava a variable that p=
rovide all package backends names? Like:</div><div><br></div><div>PACKAGE_B=
ACKENDS =3D &quot;ipk deb rpm&quot;</div><div><br></div><div>?</div><div>
=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d042f9f90c26b3704ce9f2df0--
