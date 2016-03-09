Return-Path: <nathangutzmann@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 702F87317C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 16:14:47 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id vf5so15145232igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 08:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Hng2y1RJjm2EjR5ed8epNuwR9dwO0IreMctYcD6P8Tg=;
	b=pUDstAL/r9yORrMPhAr3ojognwkq8+A5rZFemUG3JMffTdwR0oNZ8cDVRweFHLZp9c
	0aeeRog2vpqgTw+KKA4y1InKYHUG/Rc3QxqfBbB3pWUy1XYBUrbtDmzc6RJ+D+MdTlQU
	+GMdR1LcAivZJeLTQajoC+Yk/+bTnvsM69YqCLFiZz9+j404wrt1OTWTV3XwoAP8Fw7S
	Ysu1i0V20T0tv/lUVd0BHC2goTDY7a25iCvSEv6YrShKvajTBRW6nYR2exjWLgxN9p8H
	0JaplVXnoN/8Dm5oMNUzuKkV8V1K+M25cz7FHIjlXt3bqBIv5VBBy0Y7h0jPyyPxJEiY
	MpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Hng2y1RJjm2EjR5ed8epNuwR9dwO0IreMctYcD6P8Tg=;
	b=fj9jjURAkDhgDO9XKgMYr4fg9F+Ps0vHdYP/6MV+2KtMIj3StRU1cNED8T2CkKrj7i
	8tEHJkc8VbiNtBu5evgUcx+lWt/tuvkVK7FN1+QF2z/J+krtWhLJYK3LSRX0dDwhorqt
	5cadsFVOP8srVUoqp0fXc4J2+WPfizUVvok4QosUXNcqY/wQl2l5nmofdINCto/eV59P
	KChiCzPS4DYScONoNBs7OChto/dceVHqynjN1asS3J7hyYsT+6rmcGnVUsKlUMXkmju8
	iK7YDXgbFFrOXx0cL96E05AL/XVvXNiGNl7TgywS8m70zWXBHhdxbTgyMHwnpvA3yMv9
	uA5Q==
X-Gm-Message-State: AD7BkJLDy7KeaGhs5nfs8TBf8GDiER4LjpaMYVLrxNEbHk3ClSPH9tMwZdjF2k4ETuF1nY/p0wAb2+SG/fVjsg==
X-Received: by 10.50.131.201 with SMTP id oo9mr24649105igb.68.1457540086337;
	Wed, 09 Mar 2016 08:14:46 -0800 (PST)
MIME-Version: 1.0
References: <1457473760-8486-1-git-send-email-nathangutzmann@gmail.com>
	<56DF764F.204@opendreambox.org>
In-Reply-To: <56DF764F.204@opendreambox.org>
From: Nathan Gutzmann <nathangutzmann@gmail.com>
Date: Wed, 09 Mar 2016 16:14:36 +0000
Message-ID: <CAGUrkt-sgkRQo3XnCgx-6QKrVvUeN-zZaaUvZ0OLMbPuup9DHw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] nettle: The variable named p in the patch file was incorrectly named.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Mar 2016 16:14:47 -0000
Content-Type: multipart/alternative; boundary=047d7b2e47c817afa2052d9fff0e

--047d7b2e47c817afa2052d9fff0e
Content-Type: text/plain; charset=UTF-8

Thanks for the advice Andreas, will do!

Nathan

On Tue, 8 Mar 2016 at 18:09 Andreas Oberritter <obi@opendreambox.org> wrote:

> Hello Nathan,
>
> On 08.03.2016 22:49, ngutzmann wrote:
> > The variable in question should have been called ecc->p. The patch has
> been updated
> > so that the compilation of the nettle recipe would complete successfully.
> >
> > Signed-off-by: ngutzmann <nathangutzmann@gmail.com>
> > ---
> >  meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
> b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
> > index 1c4b9a9..a956f42 100644
> > --- a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
> > +++ b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
> > @@ -40,7 +40,7 @@ Index: nettle-2.7.1/ecc-256.c
> >         u1 -= cy;
> >  -      u1 += cnd_add_n (t, rp + n - 4, ecc->p, 3);
> >  +
> > -+      cy = cnd_add_n (t, rp + n - 4, p->m, 2);
> > ++      cy = cnd_add_n (t, rp + n - 4, ecc->p, 2);
> >  +      u0 += cy;
> >  +      u1 += (u0 < cy);
> >         u1 -= (-t) & 0xffffffff;
> >
>
> looks good to me. However, I needed to lookup the commit where the
> backport originated from, because the reason for exchanging m and p
> isn't obvious at all without knowing the original commit. Maybe you
> could include it in your commit message.
>
>
> https://git.lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb985e3872e4550137209e3ce4d
>
> Regards,
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b2e47c817afa2052d9fff0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the advice Andreas, will do!<div><br>Nathan</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 8 Mar 2016 =
at 18:09 Andreas Oberritter &lt;<a href=3D"mailto:obi@opendreambox.org">obi=
@opendreambox.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">He=
llo Nathan,<br>
<br>
On 08.03.2016 22:49, ngutzmann wrote:<br>
&gt; The variable in question should have been called ecc-&gt;p. The patch =
has been updated<br>
&gt; so that the compilation of the nettle recipe would complete successful=
ly.<br>
&gt;<br>
&gt; Signed-off-by: ngutzmann &lt;<a href=3D"mailto:nathangutzmann@gmail.co=
m" target=3D"_blank">nathangutzmann@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patc=
h | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_88=
05.patch b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patc=
h<br>
&gt; index 1c4b9a9..a956f42 100644<br>
&gt; --- a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patc=
h<br>
&gt; +++ b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patc=
h<br>
&gt; @@ -40,7 +40,7 @@ Index: nettle-2.7.1/ecc-256.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u1 -=3D cy;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 u1 +=3D cnd_add_n (t, rp + n - 4, ecc-&gt;=
p, 3);<br>
&gt;=C2=A0 +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cy =3D cnd_add_n (t, rp + n - 4, p-&gt;m, 2);<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cy =3D cnd_add_n (t, rp + n - 4, ecc-&gt;p, 2);=
<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 u0 +=3D cy;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 u1 +=3D (u0 &lt; cy);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u1 -=3D (-t) &amp; 0xffffffff;<br>
&gt;<br>
<br>
looks good to me. However, I needed to lookup the commit where the<br>
backport originated from, because the reason for exchanging m and p<br>
isn&#39;t obvious at all without knowing the original commit. Maybe you<br>
could include it in your commit message.<br>
<br>
<a href=3D"https://git.lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb9=
85e3872e4550137209e3ce4d" rel=3D"noreferrer" target=3D"_blank">https://git.=
lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb985e3872e4550137209e3ce4=
d</a><br>
<br>
Regards,<br>
Andreas<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--047d7b2e47c817afa2052d9fff0e--
