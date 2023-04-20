Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFB3C77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 09:58:07 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.4212.1681984681083107384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 02:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IGaMBEq8;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4edc114c716so439953e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681984679; x=1684576679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qyrS0LSXqUCNo4b+GBI0v/MdkVq8gV0M70CAnbCe0lE=;
        b=IGaMBEq8iyBBiS4Nx/z3XP8yVfl31Kob90dHC/39nN+ojVr7B6BfzfeHcbPjDLyVsP
         CWnfl0BpcELzNIucyWk4q4782SOlMgnJU2gXD9tjvo3vFcfr0/Y4F2cM2sYVXoFIuQGi
         JxqI7UWc7IJSy/R0RVK3MVvNFe/iaH4jgTe4MxTED7zsxz9Z5MTgLMy8u9YnPXbBVR0f
         hY1MrUauQCdoXHfJ+KSAigeS94Rpah5LQa1DtJpF7Hfioly9VPT3u+3FaqdhfhdhneKZ
         k/t7TfKuhE7/V9U6B7bkTjTYWiDmKCg7d4ZCvlcbGE1aWzKlkDOUNhK8mE2me6mJhvH9
         QHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681984679; x=1684576679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyrS0LSXqUCNo4b+GBI0v/MdkVq8gV0M70CAnbCe0lE=;
        b=IJVW8BBzLrdTouwGES/sE4eMCieeXs+tuvjb4NW2E9Lm+ugYpJaVdl3zjGnFy/pUyO
         WUgGgBwA07PrOnU+4ogRm2tDNg8ZAuyeG5oEN2Q8bZPxcMDMoIntTqdCaiu9iUm/iinQ
         10qx84MDq8e+lfMp+HKJJ3RvFn4rF8L81uRSWf1+k3xVCoqdIhlImcbZcTPnsjxY+1sQ
         4OQ/eI75vfQVX+kdi7/aoFvs1mtTx0Yqg2LJTBsQE8S2M6NZWvPxutbUSEloM8IcF7dR
         AEeJsltVfOR3aCILnRmkqwAUrKfjhDp2cRAZlIDVdbB6qhMburqz6WP+BEZkth81vGZu
         rlBA==
X-Gm-Message-State: AAQBX9fjQVshRYgPmeu25mycQ1eTVgULAqwQdo3tpTTqKAFgmEE2n6mG
	D3dr2S01XdSgV+3nKycFfnxe+uWqbdsJSv6zhU4=
X-Google-Smtp-Source: AKy350bildGCTcCuqeWrRBRwBdSlrvlikBZxMXx27G+DGBpIz6Je9mjq+mqVlFUbFL88BzivMJV3pGM/0fX5InCGV8w=
X-Received: by 2002:a05:6512:145:b0:4e0:822f:9500 with SMTP id
 m5-20020a056512014500b004e0822f9500mr207471lfo.12.1681984678796; Thu, 20 Apr
 2023 02:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
 <b8187209629974cf50110a5690a14360e7c02026.camel@linuxfoundation.org>
In-Reply-To: <b8187209629974cf50110a5690a14360e7c02026.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 20 Apr 2023 11:57:47 +0200
Message-ID: <CA+cAkeqwkQRFzEYVC0jm0xdby9RrGqYtVOenc85+J-nMiGwtoA@mail.gmail.com>
Subject: Re: [OE-core] Cargo and ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004c229905f9c1934b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 09:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180246

--0000000000004c229905f9c1934b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 20 avr. 2023, 11:41, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Thu, 2023-04-20 at 09:27 +0200, Frederic Martinsons wrote:
> > Hello,
> >
> > I would like to build and ship tests for recipes which uses cargo and
> > in the process, three questions arose (maybe more when I will
> > progress).
> > I would like to have your opinions on them.
> >
> > 1) should we ship cargo-native in ptest images or should we just
> > build and ship test binaries alone ?
>
> ptests run in target images so they'd depend on "cargo" and cargo-
> native wouldn't be appropriate.
>

Of course, I meant cargo, not cargo-native.
I'm asking for that because running "cargo test" to execute the whole test
suite is the standard for rust project but it will force us to embed cargo
(plus all it's deps) and source code for doing that. I think I will go for
the test binaries only for the moment. Note that I will need to do some
"clever" search of them because they do not have a deterministic name (
https://github.com/rust-lang/cargo/issues/1924)


> 2) should we place the cargo ptest specifics in a dedicated class
> > (e.g ptest-cargo.bbclass, like already existing ptest-gnome or ptest-
> > perl) or put this in cargo.bbclass itself ?
>
> If ptests for cargo all follow a common format and a class can enable
> them for a large set of recipes, a class is appropriate.
>
> If would only be in cargo.bbclass itself if all cargo recipes had
> standard ptests.
>

Yes they do follow a common format for all rust projects (except for the
generated binary name, see above). But a recipe can perfectly choose to not
implementing any tests if they want to.
I'll go for a separate class to clearly distinguish test things in a first
time.


> > 3) should we embed all kind of tests (unit, integration and doc
> > tests, see
> > https://doc.rust-lang.org/book/ch11-03-test-organization.html) or
> > just the unit tests ?
>
> I don't know about the rust specific details but unit and integration
> tests are both appropriate. I've no strong opinion on doc tests.
> They're probably fine if they don't add large dependency chains and run
> quickly.
>
> Cheers,
>
> Richard
>

OK I'll see how doc tests behave for already existing recipes (if they have
some).

>

--0000000000004c229905f9c1934b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 20 avr. 2023, 11:41, Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Thu, 2023-04-20 at 09:27 +0200, Frederic Martinsons wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I would like to build and ship tests for recipes which uses cargo and<=
br>
&gt; in the process, three questions arose (maybe more when I will<br>
&gt; progress).<br>
&gt; I would like to have your opinions on them.=C2=A0<br>
&gt; <br>
&gt; 1) should we ship cargo-native in ptest images or should we just<br>
&gt; build and ship test binaries alone ?=C2=A0<br>
<br>
ptests run in target images so they&#39;d depend on &quot;cargo&quot; and c=
argo-<br>
native wouldn&#39;t be appropriate.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Of course, I meant cargo, not cargo-nati=
ve.=C2=A0</div><div dir=3D"auto">I&#39;m asking for that because running &q=
uot;cargo test&quot; to execute the whole test suite is the standard for ru=
st project but it will force us to embed cargo (plus all it&#39;s deps) and=
 source code for doing that. I think I will go for the test binaries only f=
or the moment. Note that I will need to do some &quot;clever&quot; search o=
f them because they do not have a deterministic name (<a href=3D"https://gi=
thub.com/rust-lang/cargo/issues/1924">https://github.com/rust-lang/cargo/is=
sues/1924</a>)=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
&gt; 2) should we place the cargo ptest specifics in a dedicated class<br>
&gt; (e.g ptest-cargo.bbclass, like already existing ptest-gnome or ptest-<=
br>
&gt; perl) or put this in cargo.bbclass itself ?<br>
<br>
If ptests for cargo all follow a common format and a class can enable<br>
them for a large set of recipes, a class is appropriate.<br>
<br>
If would only be in cargo.bbclass itself if all cargo recipes had<br>
standard ptests.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Yes they do follow a common format for all rust projects (e=
xcept for the generated binary name, see above). But a recipe can perfectly=
 choose to not implementing any tests if they want to.=C2=A0</div><div dir=
=3D"auto">I&#39;ll go for a separate class to clearly distinguish test thin=
gs in a first time.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; 3) should we embed all kind of tests (unit, integration and doc<br>
&gt; tests, see<br>
&gt; <a href=3D"https://doc.rust-lang.org/book/ch11-03-test-organization.ht=
ml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://doc.rust-lang.o=
rg/book/ch11-03-test-organization.html</a>) or<br>
&gt; just the unit tests ?<br>
<br>
I don&#39;t know about the rust specific details but unit and integration<b=
r>
tests are both appropriate. I&#39;ve no strong opinion on doc tests.<br>
They&#39;re probably fine if they don&#39;t add large dependency chains and=
 run<br>
quickly.<br>
<br>
Cheers,<br>
<br>
Richard<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">OK I&#39;ll see how doc tests behave for already existing recipes (i=
f they have some).=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000004c229905f9c1934b--

