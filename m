Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RbBF6-0002Fn-GJ
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 14:21:00 +0100
Received: by eaal1 with SMTP id l1so1859290eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 05:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=eTNxvcWO3kOeuXi81ednfbOkoqWd5z9k4Pk5JFiwy7Y=;
	b=h3Yi5F2br7KvDK/FcsfP7ltCqfgjfK7IBmf2FNTXAqdw7zYw0spc5GrWsYM9H7VSzu
	Hpi/R7zu+08JMeCPOwuGuCD9S5BQbA73aSLnOAN3PKVhihDKIuEZyAGkub6PtgPn6PJJ
	TJuzlapuR6SSaD6pGD40ki999mB0zXvYObsVU=
MIME-Version: 1.0
Received: by 10.205.122.68 with SMTP id gf4mr964144bkc.5.1323954842701; Thu,
	15 Dec 2011 05:14:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Thu, 15 Dec 2011 05:14:02 -0800 (PST)
In-Reply-To: <1323954698.24417.211.camel@phil-desktop>
References: <1323954515-15604-1-git-send-email-otavio@ossystems.com.br>
	<1323954698.24417.211.camel@phil-desktop>
Date: Thu, 15 Dec 2011 11:14:02 -0200
X-Google-Sender-Auth: z5rX9xHGerO-0pxEDYHwbznqae8
Message-ID: <CAP9ODKp-444E+GJO+sqTqu2tvZv-VpwAd+jQ2MyzD7_r3yEufQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: bump epoch to fix upgrade path in meta-oe
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
X-List-Received-Date: Thu, 15 Dec 2011 13:21:00 -0000
Content-Type: multipart/alternative; boundary=000e0cdf7124190ffe04b4214272

--000e0cdf7124190ffe04b4214272
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 15, 2011 at 11:11, Phil Blundell <philb@gnu.org> wrote:

> On Thu, 2011-12-15 at 13:08 +0000, Otavio Salvador wrote:
> > There was a 'dropbear-systemd' binary package on meta-oe versioned as
> > 'v1' and it has been merged on dropbear's bbappend; to fix the upgrade
> > path for the dropbear-systemd package on meta-oe we need to bump epoch
> > and to avoid messing it up this needs to go into OE-Core.
>
> If it's just a single output binary at issue then setting PKGE for that
> one package would be less disruptive.  I must admit I don't fully
> understand why this needs to be in oe-core at all though: what exactly
> is the "messing up" that would happen otherwise?
>

I didn't know about PKGE; this works for this case :-D

Richard, please ignore this patch!

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdf7124190ffe04b4214272
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 15, 2011 at 11:11, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Thu, 2011-12-15 at 13:08 +0000, Otavio Salvador wrote:=
<br>
&gt; There was a &#39;dropbear-systemd&#39; binary package on meta-oe versi=
oned as<br>
&gt; &#39;v1&#39; and it has been merged on dropbear&#39;s bbappend; to fix=
 the upgrade<br>
&gt; path for the dropbear-systemd package on meta-oe we need to bump epoch=
<br>
&gt; and to avoid messing it up this needs to go into OE-Core.<br>
<br>
</div>If it&#39;s just a single output binary at issue then setting PKGE fo=
r that<br>
one package would be less disruptive. =A0I must admit I don&#39;t fully<br>
understand why this needs to be in oe-core at all though: what exactly<br>
is the &quot;messing up&quot; that would happen otherwise?<br></blockquote>=
<div><br></div><div>I didn&#39;t know about PKGE; this works for this case =
:-D</div><div><br></div><div>Richard, please ignore this patch!</div><div>
=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdf7124190ffe04b4214272--
