Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36C5CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 08:18:06 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12919.1762849077696616692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 00:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FmHdH15O;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: liu.ming50@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29845b06dd2so1421285ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 00:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762849077; x=1763453877; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8p4+EaookZODvSIHb3HCAaNkIAbD5Jt1MgKayzrPSb4=;
        b=FmHdH15OCFNJVfbFDncqMU5rovt9l46eyUX4ljq3Dm7Yq28gNdydEBUiEaB1PHEalS
         wBTU/XlAPyKtQnSMJwiws3+dsWRMhWbjrg3dFippTZ4J73SYF9tNZfzUA8lDH5jXc3QV
         oJ3roo4X+KbmaraSmQIj2Ah0pkknCPG/OXEosfUUxSBVKca6LeE1GhySnli6z2EtBnK+
         xEuZ5aHcXbXEYJ2Bc5xOMJjm4zVGvSHgGoP8mQIfMPAZ/sWue5pNBKgjtQgPYPUGQi8t
         zhqlTkceQd/onNipshQBhaHdOWNjQDf/CJ9Bh1qHFKLYfvU23ulPw/wsUuDwgQ9Fv4ri
         K/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762849077; x=1763453877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p4+EaookZODvSIHb3HCAaNkIAbD5Jt1MgKayzrPSb4=;
        b=VFriPDQ36i4O/Os+43XYcI9Tww2hcJjIHVdcGBdGGJ0Ti2oxRPnjANOXHYSS/BZaXm
         A/1tawt1SOPhWGwn3/lZC+aotDuNDD8EMC5JhaU87y1DkTWHGyO8vaQEEF1jDCy/lvHk
         GVopQ1bqLcy00rarNC2eCkCXdLQFZaysxjLzXrnleJ9vvVxJqaBHnIDP70QH73Ih3K7Q
         HtLV2CWPdeTZBAeRnvfrVQ715h7g0+2DazNwoSKcLOhW/mDHZ3YQgrZThpGmJ0d0AHiy
         PZlT0JlJN4Uoz5uypGdGP0URT8mS1cH1fUbqx3go2MNpR4p0HeVgUy7wwYK65MxIcVg4
         M9VQ==
X-Gm-Message-State: AOJu0YzDqJcHwu5AWVgZ6Q7IrP1+JrmZ7TzEemOOkvXqsX5QOkCG7bim
	HArT8kvcLPN4CCoVq+bUQwKPOE0dF/JcBkQs91IFgHcUrsRoDDiFxHEtZ9itBk3lFr1nKm9cM0j
	aPNa1PplVL3i3DHr+UCA/KOiUWkZDuf4=
X-Gm-Gg: ASbGncu5E63LIXMI11KBuBoGx7/xdMMrGgZXoCWrDl8NhBZdpePIztTgtX2DKho01Aj
	w8oouw4egEVcxdZfNMPn7PwTDj0bMq0z+QJkJydM3zD/5hbxXIP5Z/Khwt1xZ/WAR0dOEIWZa9w
	zsn7iQXWXpJqd3dczqvEMUu5hjvZbNJhPh7dgMrW0h02ZJbMOeRs8JtZ/YdgHjDcaoJH7splQBi
	i3B5LrUdgDxNjj29h5q0FTGF3G5SlWFrENUYyNoKH/uP//jqRH20AytQrpi7VJYCUeHw67QJ+oq
	yy5cXpHMIJYudEJyL+j6ya+rhB4G
X-Google-Smtp-Source: AGHT+IFeQ0ThxO2NISQzp8vq/3NzMlmlBLh/zm+Z3febIive0JBVfn6U/nad9i+OJMGC9k3wmh2HJ9ZEpyGPO+/Nwl4=
X-Received: by 2002:a17:903:3b8b:b0:283:c950:a76f with SMTP id
 d9443c01a7336-297e56df846mr137506465ad.43.1762849076830; Tue, 11 Nov 2025
 00:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20251109173407.1320188-1-liu.ming50@gmail.com> <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com>
In-Reply-To: <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 11 Nov 2025 09:17:45 +0100
X-Gm-Features: AWmQ_bk9a1Va56VvpPuKG9vRpvKiPiwjRe72bnwA14NM6xfkSbg5BRcc6ND_V3Q
Message-ID: <CALatG=4+sV9MoTfpOPmefjwRKNLdYVeJfgKj8X=qQc7EuJyipg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000004655706434d491c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 08:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226151

--00000000000004655706434d491c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ross:

I was using exact PACKAGES_BEFORE_PN with +=3D as you suggested in V1 patch=
,
but it broke the build, clearly PACKAGES_BEFORE_PN is not handled correctly
in some recipes.

//Ming Liu

Ross Burton <Ross.Burton@arm.com> =E6=96=BC 2025=E5=B9=B411=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:54=E5=AF=AB=E9=81=93=EF=BC=9A

> On 9 Nov 2025, at 17:34, Ming Liu via lists.openembedded.org <liu.ming50=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > It was observed when FILES:${PN} contains "${sysconfdir}" or
> > "${datadir}", the bash-completion files wont be installed to
> > bash-completion package.
> >
> > Fix it by prepending bash-completion package to PACKAGES, this
> > ensures bash-completion package get the files packaged before PN.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> > meta/classes-recipe/bash-completion.bbclass | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/bash-completion.bbclass
> b/meta/classes-recipe/bash-completion.bbclass
> > index b656e76c09..e337c2045d 100644
> > --- a/meta/classes-recipe/bash-completion.bbclass
> > +++ b/meta/classes-recipe/bash-completion.bbclass
> > @@ -6,7 +6,7 @@
> >
> > DEPENDS:append:class-target =3D " bash-completion"
> >
> > -PACKAGES +=3D "${PN}-bash-completion"
> > +PACKAGES:prepend =3D "${PN}-bash-completion =E2=80=9C
>
> Please use PACKAGES_BEFORE_PN for this, and just +=3D.
>
> Ross
>
>

--00000000000004655706434d491c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ross:<div><br></div><div>I was using exact PACKAGES_BE=
FORE_PN with=C2=A0+=3D as you suggested in V1 patch, but it broke the build=
, clearly PACKAGES_BEFORE_PN is not handled correctly in some recipes.</div=
><div><br></div><div>//Ming Liu</div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;=
<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; =E6=96=
=BC 2025=E5=B9=B411=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=
=886:54=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 9 Nov 2025, at 17:34, Ming Liu via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> &lt;liu.ming50=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; <br>
&gt; It was observed when FILES:${PN} contains &quot;${sysconfdir}&quot; or=
<br>
&gt; &quot;${datadir}&quot;, the bash-completion files wont be installed to=
<br>
&gt; bash-completion package.<br>
&gt; <br>
&gt; Fix it by prepending bash-completion package to PACKAGES, this<br>
&gt; ensures bash-completion package get the files packaged before PN.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/classes-recipe/bash-completion.bbclass | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/bash-completion.bbclass b/meta/classe=
s-recipe/bash-completion.bbclass<br>
&gt; index b656e76c09..e337c2045d 100644<br>
&gt; --- a/meta/classes-recipe/bash-completion.bbclass<br>
&gt; +++ b/meta/classes-recipe/bash-completion.bbclass<br>
&gt; @@ -6,7 +6,7 @@<br>
&gt; <br>
&gt; DEPENDS:append:class-target =3D &quot; bash-completion&quot;<br>
&gt; <br>
&gt; -PACKAGES +=3D &quot;${PN}-bash-completion&quot;<br>
&gt; +PACKAGES:prepend =3D &quot;${PN}-bash-completion =E2=80=9C<br>
<br>
Please use PACKAGES_BEFORE_PN for this, and just +=3D.<br>
<br>
Ross<br>
<br>
</blockquote></div>

--00000000000004655706434d491c--

