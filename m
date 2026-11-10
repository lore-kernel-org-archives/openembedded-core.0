Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.237.1794353542283310234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 15:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hBryZcW5;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c0bd676eeso2580652d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 15:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794353541; cv=none;
        d=google.com; s=arc-20260327;
        b=NNxRkYC2gF+WdDTWA5JSWZDeir9o2nCp2zLqHNv9OhqMrmVTemhiisA7dccUWQyi/N
         W/nnlWj8mbhGJvR3Zd1bT7zurOswMNMCO64hPJEjn0rtdAoCK3ldsKWVB7VmZE3eSBe0
         vtD7LF7e7Dp6aqGTUijkHyUCksYkDhNNOwsv0A7Zjou5IHm2e5VfdLcrP1ggjvxmux0x
         UUUnvrCugY7bO/IqPt7jRB/bvm+VXlu+1WO90cRqs1Itepfs86fOWF+yARjIqNImyeZw
         sKplnjRnULVT8mpEEaNkE82Q3vSXv9TVupvov/7S6GUowFB0FahlZ6y31jIOOBIbNZgi
         g4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V6Uxf5Cm8uSEuI8jibBm5FaLwE0iP6sD2ugF4sacsaA=;
        fh=kB4IViII3g5qyjNrSQpbjxBkfGmP/NiKsSOfZkNrORw=;
        b=ED53ZLxOZ5yne+hNopgOHU0Zk5n2qwmt/w74+XGEwAx7Uq/g6FGNQJYaSis1SKIstc
         GBxgTa1DRFeDL+pcaFcYBFkjGtxf4Bmsx2vevl/eiQdsjEqaG4ulaxeGrx4KWxCsYt0V
         fdImT9Ex/R7jYb0w4B9LEcNFb6of0JXrRgjPr6Pr74pBdCmTxhWaUNJ0F/ilFOfcjiw6
         fVzm6+U9PXgbriJWtCAzJHYpDGAyn/lLhoL0ShcczrpGjz0K0K+bchh0Eu2NnAR4o8Qf
         BJZfxCGfqhquTQNB/2LFY99lGgA+ZPLvWK3SuilsETmLpokKVA1VGZ7zQyse0pcO21NN
         jpEA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353541; x=1794958341; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uxf5Cm8uSEuI8jibBm5FaLwE0iP6sD2ugF4sacsaA=;
        b=hBryZcW5qWBIkuwILzP/V6tfwNHyam/gOxhmQSD2oYhUWvfAVvJbyh4U8rbVxDaZW9
         GT5lZ8qcm7K/5PhE1U5Z7RWBoewxBuY2jQeiUNXXkYhOsy/HPymMhsW7F3rgdJAi05OU
         SHB1Z0Y1IHqNL6l09/vLAvBsr+BJBVNsdHdvFzcbq794HwN20e2bJ/3tVcPf0G5Ph2lT
         Sqd8aAQAJ9fBgbvMwGxslk9nu9NIzB0Tq6zm1Ic5z0ZOHm9rixVlOQk6O59AZySO8Tca
         8Qrme++DYhWwOJBAExe1/LsYsOggn46+N88qXHkQXX28u0TVUh1xR3MvjyEM6htCBG5X
         oG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353541; x=1794958341;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6Uxf5Cm8uSEuI8jibBm5FaLwE0iP6sD2ugF4sacsaA=;
        b=DtYHLa5b5Dd4t4wcPIcgwXRHeicoekrOAf/Uk4ZASM/Be02384E4THXttKZJxwcoz5
         w/Y7/03kP5V3Qtwr7GsuXFIk5eVWfxPKMj4jpausGK6fiKNE0Ts8367YsrD6zRh+dr9S
         QceYPx3uEKcraMVyk7eSeHhJiOP7tp7OuR2MIidS5YMxluDiMMk5DIwKAQ9OOb5P+i6y
         bPrnZuqYIuWDdd/6U+ziRCUrdnSH/uXG8icsrJqa0UHvWyL481yP6sRwWrJvCqWUH57N
         LxKQTIMw9n6MPiSTMjHR3IAf4pzoFdyrpsDkCbaD0ameBcjlqaXED8NhWZO3zDuHLAUY
         K4KA==
X-Gm-Message-State: APuU4Z+a+boepeRGCWiMXjeDjb5Dhzxj7HcBb0IKrvc6RLDxs4qXElpQ
	4tv82LJj5cxfeU8mmsgRMZEeSkabPz5me69OSNdh2duFZw5wVsCDrlAKL+fLI+XEO8yYDblMO4g
	75cjucoFqxLZSLMKZqzQDJKA5FYWkYoiVDRyE
X-Gm-Gg: AYBFou2l/yABc8tAwMUXIwTHeKMgb3Qo2rRFzFDDIp6Q5ONn7HSQDj0cgqQAJ5VfNVw
	5iruPPgj8JH4Qj9FHgqGOod3KJrCraLTzN2WLnaDPOyEMyCt/Ppv1BO7RjaYY50jEp+Pfp/BKv/
	OBtbqx5ml5pXB8vR1YxJguI8vOaL9AZ4JcIXq/U2zFHPn8yobu2dnIqP0RBbJkiavZdoQDyVq+A
	u40WKOp8JIU+XYRwSQ4LmJoZyGT0fqPBoDsv9wXIUn1rwRrwH3dE5Nx2mCZge8xg2o7sisNaL4d
	NHYoDOqbdDOWH33OdYDk4hYBU1OY56KPLmdSbvmt9PPVAbQmaq8PvAxbzeeMrct54tnkm9GNMHG
	MSTOUH/wKjR3HlLaEgJc+YGqEPgFl8F9665cMVGB77Q1zwORuKQo=
X-Received: by 2002:a05:690e:1301:b0:67c:6a94:f11e with SMTP id
 956f58d0204a3-67c6a94fb28mr181869d50.17.1794353540975; Tue, 10 Nov 2026
 15:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20260915130509.2184318-1-dwagenknecht@emlix.com> <20261106115455.4141199-1-dwagenknecht@emlix.com>
In-Reply-To: <20261106115455.4141199-1-dwagenknecht@emlix.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 10 Nov 2026 16:32:08 -0700
X-Gm-Features: AclHuK-GwuTd7tu50RXKL4N7WuV8T72qkqQgqOTjfY9_Sb_ScXNoP8hQrECJRxQ
Message-ID: <CAJdd5GYniL8b1hZAxi+QfbTmhmZHQVes8_OeMiT5cM4upr-mhA@mail.gmail.com>
Subject: Re: [OE-core] [DRAFT PATCH v3 0/2] Add meta layer information to spdx
To: dwagenknecht@emlix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000069517a065ff47d2b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 23:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249939

--00000000000069517a065ff47d2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:55=E2=80=AFAM Daniel Wagenknecht via openembedded-=
core
<dwagenknecht=3Demlix.com@lists.openembedded.org> wrote:

> v3 of the patch series looking for feedback on the overall architecture. =
I
> worked out the problem in alias linking, so a major blocker is out of the
> way.
>
> Please continue to consider this as a draft for discussion only!
>
> During discussion on IRC some questions were raised especially regarding
> the
> interaction with sstate caching.
> The layer information is only part of `create_spdx`, not
> `create_recipe_spdx`.
> It is thus only added to the final image spdx documents, not to the
> individual
> recipe or packagage spdx document. Images and their spdx documents are
> always
> rebuild, so with this approach no additional rebuilds occur even if a
> layers
> revision changes.
>
> My still open questions are:
> * is the overall architecture reasonable/correct?
>

Overall, this is approach seems reasonable to me. It's similar to how I've
thought about doing it in the past.


> * referring to layers is inconsistent across tooling. E.g. the core layer
> is
>   either named `core` as defined by `BBFILE_COLLECTIONS` or `meta` as tha=
t
> is
>   the layer directory in the openembedded-core repository.
>   I chose the latter since that is what the utility function
>   `oe.buildcfg.get_layer_revisions` returns. The package URL (PURL)
>   implementation uses the other naming scheme though. Any thoughts on whi=
ch
>   should be chosen and why?


This is very tricky. In an ideal world, we could use a "git" PURL as the
official identifier:
https://github.com/package-url/purl-spec/blob/main/docs/types/definitions/g=
it-definition.md

However, I'm not sure that we can reliably use the actual git URL of the
layer to construct the PURL, since mirroring, caching, etc. are pretty
common. Maybe there should be a per-layer variable that specifies the
PURL(s) to use for the layer and would thus survive mirroring, caching,
etc.? It would also present the option for a PURL to be something other
than just a "git" type (e.g. it could be "github", "bitbucket", or other
future PURL types).


>
>
> v3:
> * rebase onto current master branch
> * fixed the alias linking
>
> v2:
> * fix build failures on clean build (layers.spdx.json created before
> bitbake.spdx.json)
> * rebase onto current master branch
> * remove commented out parts for overwriting the layer commit id
>
> Daniel Wagenknecht (2):
>   spdx: add entries for meta-layers
>   spdx: link files to the meta-layer providing them
>
>  meta/classes/create-spdx-3.0.bbclass |   1 +
>  meta/classes/spdx-common.bbclass     |   3 +
>  meta/lib/oe/sbom30.py                |  12 +++
>  meta/lib/oe/spdx30_tasks.py          | 118 ++++++++++++++++++++++++++-
>  4 files changed, 130 insertions(+), 4 deletions(-)
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249634):
> https://lists.openembedded.org/g/openembedded-core/message/249634
> Mute This Topic: https://lists.openembedded.org/mt/122125585/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000069517a065ff47d2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 6, =
2026 at 4:55=E2=80=AFAM Daniel Wagenknecht via openembedded-core &lt;dwagen=
knecht=3D<a href=3D"mailto:emlix.com@lists.openembedded.org">emlix.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">v3 of the patch series looking for feedback on the overal=
l architecture. I<br>
worked out the problem in alias linking, so a major blocker is out of the w=
ay.<br>
<br>
Please continue to consider this as a draft for discussion only!<br>
<br>
During discussion on IRC some questions were raised especially regarding th=
e<br>
interaction with sstate caching.<br>
The layer information is only part of `create_spdx`, not `create_recipe_spd=
x`.<br>
It is thus only added to the final image spdx documents, not to the individ=
ual<br>
recipe or packagage spdx document. Images and their spdx documents are alwa=
ys<br>
rebuild, so with this approach no additional rebuilds occur even if a layer=
s<br>
revision changes.<br>
<br>
My still open questions are:<br>
* is the overall architecture reasonable/correct?<br></blockquote><div><br>=
</div><div>Overall, this is approach seems reasonable to me. It&#39;s simil=
ar to how I&#39;ve thought about doing it in the past.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
* referring to layers is inconsistent across tooling. E.g. the core layer i=
s<br>
=C2=A0 either named `core` as defined by `BBFILE_COLLECTIONS` or `meta` as =
that is<br>
=C2=A0 the layer directory in the openembedded-core repository.<br>
=C2=A0 I chose the latter since that is what the utility function<br>
=C2=A0 `oe.buildcfg.get_layer_revisions` returns. The package URL (PURL)<br=
>
=C2=A0 implementation uses the other naming scheme though. Any thoughts on =
which<br>
=C2=A0 should be chosen and why?</blockquote><div><br></div><div>This is ve=
ry tricky. In an ideal world, we could use=C2=A0<span style=3D"background-c=
olor:transparent">a &quot;git&quot; PURL as the official identifier:=C2=A0<=
a href=3D"https://github.com/package-url/purl-spec/blob/main/docs/types/def=
initions/git-definition.md">https://github.com/package-url/purl-spec/blob/m=
ain/docs/types/definitions/git-definition.md</a></span></div><div><span sty=
le=3D"background-color:transparent"><br></span></div><div><span style=3D"ba=
ckground-color:transparent">However, I&#39;m not sure that we can reliably =
use the actual git URL of the layer to construct the PURL, since mirroring,=
 caching, etc. are pretty common. Maybe there should be a per-layer variabl=
e that specifies the PURL(s) to use for the layer and would thus survive mi=
rroring, caching, etc.? It would also present the option for a PURL to be s=
omething other than just a &quot;git&quot; type (e.g. it could be &quot;git=
hub&quot;, &quot;bitbucket&quot;, or other future PURL types).</span></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
<br>
v3:<br>
* rebase onto current master branch<br>
* fixed the alias linking<br>
<br>
v2:<br>
* fix build failures on clean build (layers.spdx.json created before bitbak=
e.spdx.json)<br>
* rebase onto current master branch<br>
* remove commented out parts for overwriting the layer commit id<br>
<br>
Daniel Wagenknecht (2):<br>
=C2=A0 spdx: add entries for meta-layers<br>
=C2=A0 spdx: link files to the meta-layer providing them<br>
<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 =C2=A01 +<br>
=C2=A0meta/classes/spdx-common.bbclass=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +=
<br>
=C2=A0meta/lib/oe/sbom30.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 12 +++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 118 +=
+++++++++++++++++++++++++-<br>
=C2=A04 files changed, 130 insertions(+), 4 deletions(-)<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249634): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249634" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249634</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122125585/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122125585/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000069517a065ff47d2b--
