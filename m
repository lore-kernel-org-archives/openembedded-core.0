Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QjdzO-00041J-R7
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:07:36 +0200
Received: by ywa12 with SMTP id 12so312610ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=20Z6ioEbxj2YQVhikExZVdojKoUvqv80OrVhO/UEwLk=;
	b=VbIMW4d7M3rI5iK/85pSd7qNgOV71ECZWXELck2VlXC8effaO9YFS7KzqynQC5Shd4
	6PYQgPhZAlinjyEmCH3vKYm/hgeuTlR49s7hshapvwrgmaZwEYFfSGBM4h5qsTRrUwJT
	2eKjhY6aGwd+OXjFvAyRteO8zHVHN8kHWOKew=
MIME-Version: 1.0
Received: by 10.91.186.19 with SMTP id n19mr8818639agp.48.1311195774881; Wed,
	20 Jul 2011 14:02:54 -0700 (PDT)
Received: by 10.90.223.19 with HTTP; Wed, 20 Jul 2011 14:02:54 -0700 (PDT)
In-Reply-To: <1311172926.2344.49.camel@rex>
References: <1311154909.30326.51.camel@phil-desktop>
	<CACW_hTYXboQ+Zzkt3PXBuA_=uMDVovTgt7g7BNJSxbCdjuoS2A@mail.gmail.com>
	<4E26D87A.5020808@gmail.com>
	<CACW_hTb=t9hMoVc-3F538xn1kTwrGT7-wk7DW8FTmi6=Txmvpg@mail.gmail.com>
	<1311172926.2344.49.camel@rex>
Date: Wed, 20 Jul 2011 23:02:54 +0200
Message-ID: <CACW_hTbh69QjuJrOXUdTb4t-k01CHDpTeWVyWQ7Lwk6fdGeskQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 21:07:36 -0000
Content-Type: multipart/alternative; boundary=0016e68db882648f9704a8868e7b

--0016e68db882648f9704a8868e7b
Content-Type: text/plain; charset=ISO-8859-1

2011/7/20 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Wed, 2011-07-20 at 16:26 +0200, Frans Meulenbroeks wrote
> >         there is already patch sent to fix it.
> >         http://patches.openembedded.org/patch/7933/
> >         libiconv is not default provider of virtual/libiconv on
> >         eglibc/glibc based systems and sometimes that can trip you
> >         over. It happens and as long as we find it and fix it quickly
> >         I don't see a problem. Do you ?
> > Some people seem to think differently about this. I still recall the
> > pile of shit Koen dumped upon me about a year ago when I accidentally
> > removed a version of openssh or so that was still used. Even though
> > the problem was fixed very quickly after it was brought to my
> > attention. Ah well. As Orwell already said "all animals are equal but
> > some animals are more equal than others".
> >
> >
> >         IMO we should not get so pedantic that people start getting
> >         scared of making changes
> >
> > It was by no means my intention to be pedantic.
> >
> > Then again I *do* think it is good practice if someone creates a new
> > recipe that (s)he tests it before submitting it.
> >
> > And my impression was that one of the goals of YP and oe-core was to
> > increase the quality level.
> > One of the ways to increase quality is to do a build after pulling
> > changes and before committing them.
> > (at least I feel that is one of the ways to increase quality, and yes
> > there are other ways too).
> >
> > And where people work, mistakes happen. One can accept that, but one
> > can also see if there are ways to improve and avoid that a problem
> > re-occurs.
>
> I think its fair to ask how this happened and it appears to be due to
> PREFERRED_VERSION and/or PROVIDER confusion. Its unfortunate but I think
> the people involved will not do it again :).
>
> I don't think its entirely fair to immediately bring into question the
> overall quality goals as we are continuing to work towards those and
> this is an exception, not the norm.
>
> Cheers,
>
> Richard, Saul, all,

I understand that these things can happen. It is a pretty basic mistake, but
I made my share of those as well. Unfortunately some community members were
not too forgiving in those situations :-(
I feel as long as those mistakes lead to improvement of the process and we
learn from it, I have no problem with it (and I'm sure this has happened in
this case).
What slightly irridated me was the email of Khem which stated "as long as we
find it and fix it quickly I don't see a problem". I'm not sure if that is
the most desirable way of working, and definitely not a statement I had
expected from a TSC member.

Wrt commits: in the past I have been picking up oe postings from other
people without commit access and commit these for them. When I did that I
always made sure to review and to build the changed or new recipe.
I think that is good practice. Now I know that a lot of patches are being
thrown to Richard, so this might not be too workable to do it that way. It
could help though to do some automated tests after taking patches and before
pushing to the oe-core repo. (ideally it would be an (incremental?) build of
world (if there is a bitbake world in YP, actually never attempted that, but
I can also imagine a fetchall or so).

And yeah, on reading back maybe I should have formulated things a little bit
more diplomatic.

Frans.

--0016e68db882648f9704a8868e7b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/20 Richard Purdie <span dir=3D"lt=
r">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt;</span><br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
On Wed, 2011-07-20 at 16:26 +0200, Frans Meulenbroeks wrote<br>
<div><div></div><div class=3D"h5">&gt; =A0 =A0 =A0 =A0 there is already pat=
ch sent to fix it.<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"http://patches.openembedded.org/patch/7933/=
" target=3D"_blank">http://patches.openembedded.org/patch/7933/</a><br>
&gt; =A0 =A0 =A0 =A0 libiconv is not default provider of virtual/libiconv o=
n<br>
&gt; =A0 =A0 =A0 =A0 eglibc/glibc based systems and sometimes that can trip=
 you<br>
&gt; =A0 =A0 =A0 =A0 over. It happens and as long as we find it and fix it =
quickly<br>
&gt; =A0 =A0 =A0 =A0 I don&#39;t see a problem. Do you ?<br>
&gt; Some people seem to think differently about this. I still recall the<b=
r>
&gt; pile of shit Koen dumped upon me about a year ago when I accidentally<=
br>
&gt; removed a version of openssh or so that was still used. Even though<br=
>
&gt; the problem was fixed very quickly after it was brought to my<br>
&gt; attention. Ah well. As Orwell already said &quot;all animals are equal=
 but<br>
&gt; some animals are more equal than others&quot;.<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 IMO we should not get so pedantic that people start ge=
tting<br>
&gt; =A0 =A0 =A0 =A0 scared of making changes<br>
&gt;<br>
&gt; It was by no means my intention to be pedantic.<br>
&gt;<br>
&gt; Then again I *do* think it is good practice if someone creates a new<b=
r>
&gt; recipe that (s)he tests it before submitting it.<br>
&gt;<br>
&gt; And my impression was that one of the goals of YP and oe-core was to<b=
r>
&gt; increase the quality level.<br>
&gt; One of the ways to increase quality is to do a build after pulling<br>
&gt; changes and before committing them.<br>
&gt; (at least I feel that is one of the ways to increase quality, and yes<=
br>
&gt; there are other ways too).<br>
&gt;<br>
&gt; And where people work, mistakes happen. One can accept that, but one<b=
r>
&gt; can also see if there are ways to improve and avoid that a problem<br>
&gt; re-occurs.<br>
<br>
</div></div>I think its fair to ask how this happened and it appears to be =
due to<br>
PREFERRED_VERSION and/or PROVIDER confusion. Its unfortunate but I think<br=
>
the people involved will not do it again :).<br>
<br>
I don&#39;t think its entirely fair to immediately bring into question the<=
br>
overall quality goals as we are continuing to work towards those and<br>
this is an exception, not the norm.<br>
<br>
Cheers,<br>
<font color=3D"#888888"><br></font></blockquote><div>Richard, Saul, all, <b=
r><br>I understand that these things can happen. It is a pretty basic mista=
ke, but I made my share of those as well. Unfortunately some community memb=
ers were not too forgiving in those situations :-(<br>
I feel as long as those mistakes lead to improvement of the process and we =
learn from it, I have no problem with it (and I&#39;m sure this has happene=
d in this case).<br>What slightly irridated me was the email of Khem which =
stated &quot;as long as we find it and fix it quickly I don&#39;t see a pro=
blem&quot;. I&#39;m not sure if that is the most desirable way of working, =
and definitely not a statement I had expected from a TSC member.<br>
<br>Wrt commits: in the past I have been picking up oe postings from other =
people without commit access and commit these for them. When I did that I a=
lways made sure to review and to build the changed or new recipe.<br>I thin=
k that is good practice. Now I know that a lot of patches are being thrown =
to Richard, so this might not be too workable to do it that way. It could h=
elp though to do some automated tests after taking patches and before pushi=
ng to the oe-core repo. (ideally it would be an (incremental?) build of wor=
ld (if there is a bitbake world in YP, actually never attempted that, but I=
 can also imagine a fetchall or so).<br>
<br>And yeah, on reading back maybe I should have formulated things a littl=
e bit more diplomatic. <br><br>Frans.<br><br><br></div></div><br>

--0016e68db882648f9704a8868e7b--
