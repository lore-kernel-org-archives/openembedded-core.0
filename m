Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ3ZA-0001BW-BH
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 17:44:56 +0100
Received: by bkbzt4 with SMTP id zt4so3185217bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 08:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2hWPLAZsQIEs3nARXx0FTsq22YOj1k77b8VI0jbu3m4=;
	b=qwf6anmgqzzFp5pSk19GGnvkJO34A+w+g+DDaXWuxySLUXj4w3Z+wNUq/SbUukYcvX
	mm5c3GYkjadQVAg+e+BJBRJOIq51tn9mETvEIx4MvpP5FRQGCUoU1lFvM7iOgJft8Tm2
	BlLTtHnNVvJf1v2Fm0fbfZVtKmaft/vdPqORM=
MIME-Version: 1.0
Received: by 10.204.150.9 with SMTP id w9mr4292816bkv.65.1323448680084; Fri,
	09 Dec 2011 08:38:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 08:38:00 -0800 (PST)
In-Reply-To: <1323440295.5309.164.camel@ted>
References: <1323427912-10122-1-git-send-email-otavio@ossystems.com.br>
	<1323440295.5309.164.camel@ted>
Date: Fri, 9 Dec 2011 14:38:00 -0200
X-Google-Sender-Auth: 4ALt4_hD37B5iqrHrafmA5pBNKs
Message-ID: <CAP9ODKpvAYr7e+9bS4Uyq8F_nsVdjoBchZPttqbcJGsoZDfCiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: update to 0.78
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
X-List-Received-Date: Fri, 09 Dec 2011 16:44:56 -0000
Content-Type: multipart/alternative; boundary=000e0ce0d9c674761c04b3ab68b8

--000e0ce0d9c674761c04b3ab68b8
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 12:18, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This patch appears to:
>
> a) Remove multilib support from the recipe
>

Fixed.


> b) Drop the git version of the recipe (no mention of this above?)
>

I moved it to another commit.


> c) Add a pointless rdepends = d.getVar( "RDEPENDS_%s" % package)
>

Fixed.


> d) Remove the dnsproxy, dhclient and test options
>

Fixed.


> e) Add the tools, fake and ntpd options
>

Fixed.


> f) Reorder variables in the file so as to make the diff unreadable and
>   hard to review
>

This was indeed done and I am sorry but it does seems more easy to follow
now.


> g) Change the contents of the ${PN}-scripts package
>




> h) Add tools and tests packages
>


> i) Add a dependeny on ntp
>

Fixed.


> j) Uses bitbake master funtionality (d.expand()) which will break on
> older versions of bitbake (we need to increase the bitbake minimum
> version)
>

Fixed adding a commit that bumps it.


> k) Drops the python scripts dependency
>

Fixed.


> So all things considered, this kind of change is a nightmare to review
> in this form and the commit message only covers half the changes it
> makes. We need to do better than this...


Not easy to accomplish as the difference between meta-oe and oe-core on
this was huge. It could have been  done better, sure ... and a v2 patch
will come shortly.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce0d9c674761c04b3ab68b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 12:18, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" ta=
rget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">

<div>This patch appears to:</div>
<br>
a) Remove multilib support from the recipe<br></blockquote><div><br></div><=
div>Fixed.</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
b) Drop the git version of the recipe (no mention of this above?)<br></bloc=
kquote><div><br></div><div>I moved it to another commit.</div><div>=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">


c) Add a pointless rdepends =3D d.getVar( &quot;RDEPENDS_%s&quot; % package=
)<br></blockquote><div><br></div><div>Fixed.</div><div>=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">


d) Remove the dnsproxy, dhclient and test options<br></blockquote><div><br>=
</div><div>Fixed.</div><div>=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
e) Add the tools, fake and ntpd options<br></blockquote><div><br></div><div=
>Fixed.</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
f) Reorder variables in the file so as to make the diff unreadable and<br>
 =A0 hard to review<br></blockquote><div><br></div><div>This was indeed don=
e and I am sorry but it does seems more easy to follow now.</div><div>=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">


g) Change the contents of the ${PN}-scripts package<br></blockquote><div><b=
r></div><div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
h) Add tools and tests packages<br></blockquote><div>=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
i) Add a dependeny on ntp<br></blockquote><div><br></div><div>Fixed.</div><=
div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
j) Uses bitbake master funtionality (d.expand()) which will break on<br>
older versions of bitbake (we need to increase the bitbake minimum<br>
version)<br></blockquote><div><br></div><div>Fixed adding a commit that bum=
ps it.</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
k) Drops the python scripts dependency<br></blockquote><div><br></div><div>=
Fixed.</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
So all things considered, this kind of change is a nightmare to review<br>
in this form and the commit message only covers half the changes it<br>
makes. We need to do better than this...</blockquote><div><br></div><div>No=
t easy to accomplish as the difference between meta-oe and oe-core on this =
was huge. It could have been =A0done better, sure ... and a v2 patch will c=
ome shortly.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>

Mobile: <a href=3D"tel:%2B55%2053%209981-7854" value=3D"+555399817854" targ=
et=3D"_blank">+55 53 9981-7854</a>=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"=
http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.ossyste=
ms.com.br</a><br><br>


--000e0ce0d9c674761c04b3ab68b8--
