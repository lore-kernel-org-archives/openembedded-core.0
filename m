Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.72517.1629390902830800918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o0KYx/8M;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h13so10058812wrp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Kge2/FowWKcyTFLnIZO8pDQ59oKd5wCSnpt5pEmi2Y=;
        b=o0KYx/8MUVKQ+p0ykZpbV/mxQ/GU4n4ccHN3beRl/5GDLk3DZcJD07v41WDhU80BrQ
         gAl8nmQ8uipKKWf8NpSX+cfyrH0K9QQPuHris5ZS6Hs0vnqdQBvpyLlx2E0k1oUe26uv
         VBVZsBtzCxCN8B41BADmi+aNCHigqKcoDbVcmtu0A5Gu+7oZGVaW5GouEpA0t9zdkJSZ
         fDeNawLt5VZgvVj/fwyiAe5G80nSX0pedOvb0+U3D/mdyYKb4CW3wiLQkhUy8JSYlNQJ
         i/X1tRJWMy3a0tk6Ru1S2YgSEsSVER0ptPxsvHbKAmjXzL2cFaYGMnVZZgT+fFvnOscE
         Z+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Kge2/FowWKcyTFLnIZO8pDQ59oKd5wCSnpt5pEmi2Y=;
        b=C66QvcWbSyRtf8nuBYoH3YUi5EZ66+X/ufzK9MjZzQd6Sq96dXGOp+2fXEEpcAiG/h
         4jNMbAhxwtYiJR8YkucyCM7bHayC16+grO5Nf4bpBPWJJ5/LhakVblgJMmzB+yfaIZ0g
         bm9a1tptAtIWv6pRXwtRtO2lftPT9bD9sqT4kYnWrlKbEaPZPX4cWAWbin/6izxqgHrR
         eMP3DahAIuZh3oQfb6p2kzWOdBiEBJswMIcssoN09axLLOe6lLFweuBo6nRUFhbaXTcH
         h0IcYcCgNogr4Y0v218k7WZjPMPoA1hB3AQPawYKmaTFMLORBba4qzO6lpWLbWFxiXX4
         ngag==
X-Gm-Message-State: AOAM5308adEV3vvexnqCkxqCKxV8n//AnxwCj6q0Zq/Oyrpp753Yib4j
	cdjXqp9Hu9ZtpnTLpgykgPw1Jby9oQMVxFJJ8f0=
X-Google-Smtp-Source: ABdhPJyGwwUIUODgsDxkd19P7wt137UEU/A6CXYIb2MeYg9f/NIKuuNrptSS83yiPdwbT8ANIu4+bwm1e4FXLH7bhKk=
X-Received: by 2002:a5d:674c:: with SMTP id l12mr4985023wrw.112.1629390901462;
 Thu, 19 Aug 2021 09:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134248.21366-1-JPEWhacker@gmail.com> <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
 <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com> <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <ba3db5ea7343701e5a78c5b55704bcedfb2106b5.camel@linuxfoundation.org> <AM9PR09MB464268B7229085D9F34B7E15A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB464268B7229085D9F34B7E15A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 19 Aug 2021 11:34:50 -0500
Message-ID: <CAJdd5GbQ6D4-H_71twZ8nn4mY2JCSiHrpu7H4auhTptp76HOow@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e1c8ec05c9ec211e"

--000000000000e1c8ec05c9ec211e
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021, 11:31 AM Konrad Weihmann <kweihmann@outlook.com>
wrote:

>
>
> On 19.08.21 18:06, Richard Purdie wrote:
> > On Thu, 2021-08-19 at 16:50 +0200, Konrad Weihmann wrote:
> >> I kind of missed out on this change... but I got caught up by reality
> >> hard this morning :-(.
> >>
> >> I currently don't see a reason why zstd is required on the host - only
> >> systemd is having a hard dependency against zstd atm, while the other
> >> lately added references are just optional PACKAGECONFIGs (and there are
> >> plenty of them which have loose ends - in poky and meta-oe)
> >>
> >> So the question I want to raise: why a hard dependency? wouldn't have
> >> been HOSTTOOLS_NONFATAL enough?
> >>
> >> I mean this is the second hard cut in the project within just weeks and
> >> this time it was host related, which is even harder to fix in a timely
> >> manner in a corporate environment (basically rolling out changes to all
> >> dev installations isn't something I fancy on a Wednesday morning :-( )
> >>
> >> None of the commit messages somehow mentions, why we all of a sudden
> >> need that on the host, instead of building it from sources (which should
> >> be possible judging from the latest master sources).
> >>
> >> And on that note: that the documentation wasn't updated in the same
> >> changeset is very unfortunate (not even the crops container where
> updated)
> >
> > Sorry the change is a bit of a pain. It has been in master-next for a
> while
> > and we did have to jump through a number of hoops as a project to enable
> this
> > (e.g. adding to buildtools and our autobuilder infrastructure).
> >
> > The reason we're doing this is that we need to use compression within
> bitbake
> > itself for some of our output files. We've not done this in the past as
> it is
> > a pain to have the host prerequisites however there are multiple places
> we can
> > potentially benefit, such as compressed pkgdata and compressed siginfo
> files.
> > It is also possible we may be able to store a compressed parsed
> datastore.
> >
>
> Thanks Richard, that's explains why it's needed
>
> > The siginfo files and datastore could mean we can improve debugging of a
> > number of currently hard to solve problems our users face.
> >
> > Without this we're unlikely to be able to move forward in these areas.
> If we
> > do it, we open up new development opportunities and potentially improved
> > usability. We can't "just build it" as that would mean we can't use it
> within
> > bitbake itself.
> >
> > Sorry this isn't well described anywhere, it is mainly as we can't yet
> > "guarantee" that this will do these things. We do know it won't happen
> > unless we try though.
>
> Agree - btw maybe a good opportunity to insist on better commit messages
> ;-)- just out of interest: is there any guideline, maybe it's worth to
> at least link to a commit message guide at
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> or here https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines.
> And slightly off-topic, but maybe also worth to do some automation, as
> I've seen multiple patches lately, that don't 100% follow the patch
> guideline in place.
>

Sorry, that was my fault. I was preoccupied and didn't fix it when it was
pointed out earlier.

FWIW, I do have some WIP changes that use this functionality that will
hopefully land soon so it will be used :)


> >
> > Master *is* a development branch, not a stable release so things can
> change.
>
> I've been brave enough to enforce a multi-branch development (just to
> keep the bar low when jumping from release to release), maybe I take
> that as a personal learning :)
>
> >
> > Cheers,
> >
> > Richard
> >
>
> 
>
>

--000000000000e1c8ec05c9ec211e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Aug 19, 2021, 11:31 AM Konrad Weihmann &lt;<a =
href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 19.08.21 18:06, Richard Purdie wrote:<br>
&gt; On Thu, 2021-08-19 at 16:50 +0200, Konrad Weihmann wrote:<br>
&gt;&gt; I kind of missed out on this change... but I got caught up by real=
ity<br>
&gt;&gt; hard this morning :-(.<br>
&gt;&gt;<br>
&gt;&gt; I currently don&#39;t see a reason why zstd is required on the hos=
t - only<br>
&gt;&gt; systemd is having a hard dependency against zstd atm, while the ot=
her<br>
&gt;&gt; lately added references are just optional PACKAGECONFIGs (and ther=
e are<br>
&gt;&gt; plenty of them which have loose ends - in poky and meta-oe)<br>
&gt;&gt;<br>
&gt;&gt; So the question I want to raise: why a hard dependency? wouldn&#39=
;t have<br>
&gt;&gt; been HOSTTOOLS_NONFATAL enough?<br>
&gt;&gt;<br>
&gt;&gt; I mean this is the second hard cut in the project within just week=
s and<br>
&gt;&gt; this time it was host related, which is even harder to fix in a ti=
mely<br>
&gt;&gt; manner in a corporate environment (basically rolling out changes t=
o all<br>
&gt;&gt; dev installations isn&#39;t something I fancy on a Wednesday morni=
ng :-( )<br>
&gt;&gt;<br>
&gt;&gt; None of the commit messages somehow mentions, why we all of a sudd=
en<br>
&gt;&gt; need that on the host, instead of building it from sources (which =
should<br>
&gt;&gt; be possible judging from the latest master sources).<br>
&gt;&gt;<br>
&gt;&gt; And on that note: that the documentation wasn&#39;t updated in the=
 same<br>
&gt;&gt; changeset is very unfortunate (not even the crops container where =
updated)<br>
&gt; <br>
&gt; Sorry the change is a bit of a pain. It has been in master-next for a =
while<br>
&gt; and we did have to jump through a number of hoops as a project to enab=
le this<br>
&gt; (e.g. adding to buildtools and our autobuilder infrastructure).<br>
&gt; <br>
&gt; The reason we&#39;re doing this is that we need to use compression wit=
hin bitbake<br>
&gt; itself for some of our output files. We&#39;ve not done this in the pa=
st as it is<br>
&gt; a pain to have the host prerequisites however there are multiple place=
s we can<br>
&gt; potentially benefit, such as compressed pkgdata and compressed siginfo=
 files.<br>
&gt; It is also possible we may be able to store a compressed parsed datast=
ore.<br>
&gt; <br>
<br>
Thanks Richard, that&#39;s explains why it&#39;s needed<br>
<br>
&gt; The siginfo files and datastore could mean we can improve debugging of=
 a<br>
&gt; number of currently hard to solve problems our users face.<br>
&gt; <br>
&gt; Without this we&#39;re unlikely to be able to move forward in these ar=
eas. If we<br>
&gt; do it, we open up new development opportunities and potentially improv=
ed<br>
&gt; usability. We can&#39;t &quot;just build it&quot; as that would mean w=
e can&#39;t use it within<br>
&gt; bitbake itself.<br>
&gt; <br>
&gt; Sorry this isn&#39;t well described anywhere, it is mainly as we can&#=
39;t yet<br>
&gt; &quot;guarantee&quot; that this will do these things. We do know it wo=
n&#39;t happen<br>
&gt; unless we try though.<br>
<br>
Agree - btw maybe a good opportunity to insist on better commit messages <b=
r>
;-)- just out of interest: is there any guideline, maybe it&#39;s worth to =
<br>
at least link to a commit message guide at <br>
<a href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenE=
mbedded" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.openem=
bedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a> <br>
or here <a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_G=
uidelines" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.open=
embedded.org/wiki/Commit_Patch_Message_Guidelines</a>.<br>
And slightly off-topic, but maybe also worth to do some automation, as <br>
I&#39;ve seen multiple patches lately, that don&#39;t 100% follow the patch=
 <br>
guideline in place.<br></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Sorry, that was my fault. I was preoccupied and didn&#39=
;t fix it when it was pointed out earlier.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">FWIW, I do have some WIP changes that use this functiona=
lity that will hopefully land soon so it will be used :)</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
&gt; <br>
&gt; Master *is* a development branch, not a stable release so things can c=
hange.<br>
<br>
I&#39;ve been brave enough to enforce a multi-branch development (just to <=
br>
keep the bar low when jumping from release to release), maybe I take <br>
that as a personal learning :)<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000e1c8ec05c9ec211e--
