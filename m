Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sa22u-000148-4C
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 11:51:57 +0200
Received: by yhjj56 with SMTP id j56so507230yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MX04zKbS5BJB4qUeYSREir1FhsxPxgWZ+P9gBzqMFf0=;
	b=R8Lbq+fih1WwrU8DY1B68l4yCYhAUMLj2e7Nrbaz3c6F90QMeMJqmIsid72Mb1gnX8
	nDo+7fer3sLOYnZxwYwxFXjvOsqeAyjSvB0dgwCIibAjX40UxVrCzTTAYp8JAYV3/mPh
	cb7QWxmn+8pinlxapootYBVUY8MzRXzPlvZpwkULY13wPXaDtNqpr+96B9FYDoGNU1WL
	gQELSmhpdVR9+NUqedDUsPjCS+/8IFkmFVbuPNIACVkTZHReJ/Pk6ROPb8FAeXU/Y5g4
	GMRntpUaUgMMnifyMw8mx4OuHUsuOMz9tVhRnYFx1jNxjsC2b3g+yAH0emHwOQI8ygzd
	UeTQ==
MIME-Version: 1.0
Received: by 10.50.187.201 with SMTP id fu9mr9974346igc.5.1338457295700; Thu,
	31 May 2012 02:41:35 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Thu, 31 May 2012 02:41:35 -0700 (PDT)
In-Reply-To: <CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
Date: Thu, 31 May 2012 11:41:35 +0200
Message-ID: <CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Thu, 31 May 2012 09:51:58 -0000
Content-Type: multipart/alternative; boundary=14dae9340a6fa842a904c151df8b

--14dae9340a6fa842a904c151df8b
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

2012/5/30 Khem Raj <raj.khem@gmail.com>

> On Wed, May 30, 2012 at 8:18 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > It fails on undefined reference to xmalloc, xcalloc, etc... that however
> are
> > internally defined and used as wrapper for real malloc, etc...
> > Please, can somebody try to build this package for me?
>
> are you using  uclibc for system C library ?
>
Yes, I do!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340a6fa842a904c151df8b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,<br><br><div class=3D"gmail_quote">2012/5/30 Khem Raj <span dir=3D"=
ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt;</span><br><blockquote style=3D"margin:0px 0px 0px 0.8ex;pa=
dding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;bor=
der-left-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Wed, May 30, 2012 at 8:18 AM, Giuseppe Condorelli<br>
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; It fails on undefined reference to xmalloc, xcalloc, etc... that howev=
er are<br>
&gt; internally defined and used as wrapper for real malloc, etc...<br>
&gt; Please, can somebody try to build this package for me?<br>
<br>
</div>are you using =A0uclibc for system C library ?<br></blockquote><div>Y=
es, I do!=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-lef=
t:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-=
style:solid" class=3D"gmail_quote">

<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--14dae9340a6fa842a904c151df8b--
