Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37.1794412477318560549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 07:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iLdgrl63;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b30cbfa628so39136747b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 07:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794412476; cv=none;
        d=google.com; s=arc-20260327;
        b=N2fx4YvcznRlqLVEuG1WrHW841giuUwTrr+dnWL+yb3SXchPhk9U60253W/i9OWq2q
         5hXqZQEdpuw22CN5Zp7UvWO0mbGZ8F/TWGHytC+fTK1C7F6ZxKzcsC071dWF3kz6FF8S
         B43sGRaKktKX7rmviGrvyS6R9/4YmbtBj8osBb4mpKfxDFGN1wyXosrKsx2fE0Ei+3DW
         MCYzbdG604IfMlWwaBOgUJfFxSAGhTri28X8fN5KN0ZcK9So3Dl1SfsdFWHLtNAnmIlF
         m/mhdnExyYUdSB81rVySWtKY6jrV+i6w2FWodPekZYIqIQK1pIsO0fHXT9/mDh7ubyhD
         S7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ba6QZfEelwUxTdQebdEaLgwfOvbq8UTorhMuYUOYPug=;
        fh=xcC28+wOIIx2i6UIXpIBbNfuDxcr8wtyV2kbv5tNpIo=;
        b=Oqf6RibOOVeOerWeEvzOVdp/KxnMiBlhBhHsvm96htYShFJzJFStet8Qz4TE7XZPk2
         Q7j0k1x61I+wBHI/irToappcWy5z65FuflspE9hs6G8ah4RFuQq6D3D4SL3DlTPpUTko
         fC1Wwpz/lCl3jjQUQm68GKgEBdq6wZQOJklgd0elZ3R6Xw2OyPtIXsTgdRb7yOKVcHRL
         ZDX8rVncuurnUs8NoOyCxYslbchZVxcQAhaSt84ogsI0IYME+YtKlNZPO/Ro4B5a6Gsb
         tZv+qXhSAQUvBg2ffLfcO32pxRw/Pagt9NAmTMlYmwQXisgDxQLUMllowwkXDhK8hinW
         MYjw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412476; x=1795017276; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ba6QZfEelwUxTdQebdEaLgwfOvbq8UTorhMuYUOYPug=;
        b=iLdgrl63/Hv3Vy5fWmBCh6/7thk0m7lQnmzLH7TrJVC5a2BCwi8eXq1+F4iDxmdO6i
         HzvXd8qD3nouu+n+s+dwX86ZlxI33b1Kn8I9/bECne6zLDXQiqYjQ4Nglnxc1SPkgjZt
         ejpopXjSLwivioymS48jVx2NIBQnzFKjuR0oXzSqbi4otOnbYgh7JOpkSOCcKSI9EjCE
         Cpdnii4qFsBwH1lyb76dU5yPDQoJgKqWM6Di3TQMlMvgqE4SSxQdzE7jzyHfxE3CL91h
         /TMDa6HeM7YvzqFqUJv2upzRJQS9rrYJuEOUbwtoW/mkthJGtafXqlflTicr9CdPdPTu
         qmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412476; x=1795017276;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ba6QZfEelwUxTdQebdEaLgwfOvbq8UTorhMuYUOYPug=;
        b=aDdSdOaCXFJLoMTpUUcpv/PHwv6k9ioxCBjEQwcjTQjooIBDWGcEwGKHlNzyKkrXvv
         8X92h1xNT0AGFk494MJNZyoXCgPksXJzYD3qoShEOXmMeDqs6ZkHkxb4Q2rMXK4BIjib
         qpA+3s9mKdSb6PuzpNaagOiaiV3V90K6Y17bOUbc5TH3w1cXhEDRWoTmi9ipGMDhzfIz
         7xYuXOmwuzuuHO0AL254UUga7iXZVC5exFKWFSpzUgaUEhR4Rbd6WOW7RtGsxZbB1x2j
         JIUCKqDfOBo53k4TGiDmAtdY2Y0UR+DKl/g4wEC8PHUq96tITNgxszZ8XCc0x8o1GDyn
         k+fA==
X-Forwarded-Encrypted: i=1; AL+hErHbJDOxMfcTfJWKO/lq5DMx2dEz2YeS3a2dlmivttOrXE/6gEMTdiqSb/kZw4sNihbuzVRTJcU1bjxaofkgeSax/w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8Ujkl01uiMOBpkg4giCE/x3y7BEmhVT33L5YT3IPpB3z9Ug9XM
	2lAIcY5ZfNmubY1ytp713ICrWKYAzhsFaNoIPhoP3HzXvkcTknREDuCTF1qqFwlC2QqFYo0r+RP
	Fu2aZ78BqNcPwX/rlQnnSiayV2FE9y9M=
X-Gm-Gg: AYBFou3CI15IjhzYv49EZDyGZRGNvGRDlt1QDrcWanAD/y8GrQdRWqhwAooZM3wAAsw
	YgNYnaycs3XbTpEzjKdZ3dIznEYfJn4vR73pblwBpG1YwduKjiu3OGwimEpdcdyQ1CehhMB/210
	3TuSssSXkZMi1FB4/J1JfbqoePuLMWrYa1a8ndtYAYyQ5pev5dCJo0rB6bRX+I3I72YN7Z6AuhU
	atMGjzHvpFmyGOwGlr0yz3oeI0xCh+Au7VkZjzWQgy5CzetX4uCcgAI1edawXA+d/Qj49nSSaqN
	wZmFxQEHaDI9l8D+mEEeC2odbeRlpeoPjatZXmt6yoU+34dS57MnkM2jHYAEM+7/duU9xQ0XMhx
	7gIr4YNkjagcscQQCHUc6nL7bFcgnSnFcg6q0wDqZW1AY1lYukiHz
X-Received: by 2002:a05:690e:438e:b0:679:b8df:2aa with SMTP id
 956f58d0204a3-67c6802aea4mr1452864d50.82.1794412476349; Wed, 11 Nov 2026
 07:54:36 -0800 (PST)
MIME-Version: 1.0
References: <CAJdd5GZTCwr9VE8OmOw7RAki+Xu+kokCgtOHG+9ghE3frWPbqg@mail.gmail.com>
 <20261111115845.1940227-1-stondo@gmail.com>
In-Reply-To: <20261111115845.1940227-1-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Nov 2026 08:54:25 -0700
X-Gm-Features: AclHuK-O4wqVpqbhwINhG6QHndcjSU522gPjBnYSq5UyJeTr3DpATDVbetLJDG4
Message-ID: <CAJdd5GY0M8hYbRk8ZteztrrXJe01cRaDMT0eTiTqxrp7W7PJWQ@mail.gmail.com>
Subject: Re: [RFC] spdx30: name, version and purl for dependency downloads
To: Stefano Tondo <stondo@gmail.com>
Cc: stefano.tondo.ext@siemens.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	bitbake-devel@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, 
	Peter Marko <peter.marko@siemens.com>, Adrian Freihofer <adrian.freihofer@siemens.com>, 
	Patrick Wicki <patrick.wicki@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000003bc2b80660023675"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 15:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250040

--0000000000003bc2b80660023675
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:58=E2=80=AFAM Stefano Tondo <stondo@gmail.com> wr=
ote:

> On Tue, 10 Nov 2026 at 23:53, Joshua Watt <JPEWhacker@gmail.com> wrote:
> > Perhaps, the better option would be to propagate the SRC_URI purls to
> > the output packages, but apply some sort of (optional) filter that can
> > remove a SRC_URI if it is not actually present in the output. That way,
> > if we have positive confirmation that some input is not present in the
> > output, we can remove its PURL from the output package (but, barring
> > that, we include it).
>
> Hi Joshua,
>
> Thanks, that model makes sense to me. A purl stays unless there is
> proof that the dependency is not in the output. For vulnerability
> checks, that is the safer side.
>
> The cargo prototype already works as that kind of filter.
> cargo metadata --filter-platform resolves the dependencies for the
> target. For python3-bcrypt, it gives the proof for 17 of the 42
> crates: 5 are not used on the target, and 12 only run at build time
> (build scripts and proc-macros). None of them end up in the binary,
> so they lose their purl, and the 25 runtime crates keep it. For Go,
> go version -m on each binary lists the modules compiled into it, so
> it can give the same proof.
>
> One question about the output side: how do you want the purls on the
> output package? I see two options:
>
> 1. Add them to the externalIdentifier list of the output package, the
>    way set_purls() handles SPDX_PACKAGE_URLS today.
> 2. Link the output package to the source download elements, which
>    carry the purls, with a relationship such as contains.
>
> Option 1 is simpler. But an external identifier says what the package
> itself is, so a scanner can take python3-bcrypt for one of its crates.
>

This one is likely the easiest. Static linking (of any kind) means you
should inherit the PURLs of the libraries you have linked against. The
alternative would be to try and make separate packages for the static
libraries and then link them into the final package with a `contains` or
something, but I don't think we have enough introspection into the build
systems to do that reliably.


> Option 2 keeps each dependency as its own element. I prefer option 2,
> unless you see a reason against it.
>
> Thanks,
> Stefano
>

--0000000000003bc2b80660023675
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 11,=
 2026 at 4:58=E2=80=AFAM Stefano Tondo &lt;<a href=3D"mailto:stondo@gmail.c=
om">stondo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Tue, 10 Nov 2026 at 23:53, Joshua Watt &lt;<a href=
=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a>=
&gt; wrote:<br>
&gt; Perhaps, the better option would be to propagate the SRC_URI purls to<=
br>
&gt; the output packages, but apply some sort of (optional) filter that can=
<br>
&gt; remove a SRC_URI if it is not actually present in the output. That way=
,<br>
&gt; if we have positive confirmation that some input is not present in the=
<br>
&gt; output, we can remove its PURL from the output package (but, barring<b=
r>
&gt; that, we include it).<br>
<br>
Hi Joshua,<br>
<br>
Thanks, that model makes sense to me. A purl stays unless there is<br>
proof that the dependency is not in the output. For vulnerability<br>
checks, that is the safer side.<br>
<br>
The cargo prototype already works as that kind of filter.<br>
cargo metadata --filter-platform resolves the dependencies for the<br>
target. For python3-bcrypt, it gives the proof for 17 of the 42<br>
crates: 5 are not used on the target, and 12 only run at build time<br>
(build scripts and proc-macros). None of them end up in the binary,<br>
so they lose their purl, and the 25 runtime crates keep it. For Go,<br>
go version -m on each binary lists the modules compiled into it, so<br>
it can give the same proof.<br>
<br>
One question about the output side: how do you want the purls on the<br>
output package? I see two options:<br>
<br>
1. Add them to the externalIdentifier list of the output package, the<br>
=C2=A0 =C2=A0way set_purls() handles SPDX_PACKAGE_URLS today.<br>
2. Link the output package to the source download elements, which<br>
=C2=A0 =C2=A0carry the purls, with a relationship such as contains.<br>
<br>
Option 1 is simpler. But an external identifier says what the package<br>
itself is, so a scanner can take python3-bcrypt for one of its crates.<br><=
/blockquote><div><br></div><div>This one is likely the easiest. Static link=
ing (of any kind) means you should inherit the PURLs of the libraries you h=
ave linked against. The alternative would be to try and make separate packa=
ges for the static libraries and then link them into the final package with=
 a `contains` or something, but I don&#39;t think we have enough introspect=
ion into the build systems to do that reliably.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Option 2 keeps each dependency as its own element. I prefer option 2,<br>
unless you see a reason against it.<br>
<br>
Thanks,<br>
Stefano<br>
</blockquote></div></div>

--0000000000003bc2b80660023675--
