Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC180C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 14:38:05 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.185288.1703947075368223639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 06:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=D/1bDc5A;
 spf=pass (domain: mvista.com, ip: 209.85.167.52, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so4451955e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 06:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703947073; x=1704551873; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4bkS5RwCa6wuOJkj0KJse5cHe/rAfy0cfXp405j/1SA=;
        b=D/1bDc5ACaszCe37W4WNWM3r6kV0RQMsvOkugrf613QD7yOPGX6vHaJ+UBa5sVhhXm
         Frmncb0wgFeJfomwVcQTN/mK7QY4bhmrAVgTpaEFYwuJ6VHU0BkzTjIWYWD5V6U5AW8z
         Xw2y7PepKEum56b8ZbviDOFFaebtM5sBft55c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703947073; x=1704551873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bkS5RwCa6wuOJkj0KJse5cHe/rAfy0cfXp405j/1SA=;
        b=I37CpDwFRKOPTuKAmijjBVz/FlnLBvpUweCqXIxohzLoLnrCQZXCAavzHfbTpxhr+c
         oxYKoQPG0uFHZK/IJ1ejx/uYaTI3jtwBLeDhImVvTbcFDaGvSBeqX6ONRCbqk3yYPVbf
         FryxSlO0J30ZX8ez3Iu3fZqiWe/zehQM/kML5xjjL5BtffiBPed/dWm34UZevPR2IxYu
         ifu7URUn+cVvjsO5jN+AfRRJxf9itSFt5s0yCohCURulL9UiZ95AVDPK+3dNdMd2cdxE
         82nGZjKSVG/60HH9iqRUrXkb5X8gpDlYOEmnSTiD70f+nxU7hfFnwcpt2pxnu9SI24Vr
         d/Cg==
X-Gm-Message-State: AOJu0YzUx45ElGApKxeDY5na5wonEVv4qj6dH4++Qnnjd46jKMVQ1DAL
	Txv2fmHwsvup6UP9FPAzFHkAj67Ar7pjUudVJmcQ3VfBfFGjBA==
X-Google-Smtp-Source: AGHT+IHri7/4ofZ4qV4CGyXUwi/InzyvUq654x3GqUwLdsB32BMoYlcENnJRCHc9ucG5L4EKMqZkFBXSJGnhU4Bo4bc=
X-Received: by 2002:ac2:4642:0:b0:50e:4eff:fe9b with SMTP id
 s2-20020ac24642000000b0050e4efffe9bmr2372755lfo.43.1703947073185; Sat, 30 Dec
 2023 06:37:53 -0800 (PST)
MIME-Version: 1.0
References: <17A47110AD953EDF.18684@lists.openembedded.org>
In-Reply-To: <17A47110AD953EDF.18684@lists.openembedded.org>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Sat, 30 Dec 2023 20:07:21 +0530
Message-ID: <CAKzga+y7yeFf95cP3qfkDpPTr0QXK+opNpCO0agT5EZu_EtdZA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] tzdata: Upgrade to 2023d
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster@mvista.com>, Mahesh Mathapati <mmathapati@mvista.com>
Content-Type: multipart/alternative; boundary="000000000000038309060dbb1892"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 14:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193071

--000000000000038309060dbb1892
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I have sent this patch to upgrade tzdata to the latest version "2023d" for
dunfell branch.
The mailing list link for the same:
https://lists.openembedded.org/g/openembedded-core/message/192913

Can you please check if this patch can be accepted in the dunfell-nut
branch of oe-core-contrib.

Thanks,
Shubham Kulkarni



On Tue, Dec 26, 2023 at 10:44=E2=80=AFPM Shubham Kulkarni via lists.openemb=
edded.org
<skulkarni=3Dmvista.com@lists.openembedded.org> wrote:

> From: Shubham Kulkarni <skulkarni@mvista.com>
>
> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> ---
>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/timezone/timezone.inc
> b/meta/recipes-extended/timezone/timezone.inc
> index 2960bfefe3..75f13cfc94 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -6,7 +6,7 @@ SECTION =3D "base"
>  LICENSE =3D "PD & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43=
fba"
>
> -PV =3D "2023c"
> +PV =3D "2023d"
>
>  SRC_URI =3D"
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;nam=
e=3Dtzcode
> \
>
> http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;nam=
e=3Dtzdata
> \
> @@ -14,5 +14,5 @@ SRC_URI =3D"
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
>
>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
>
> -SRC_URI[tzcode.sha256sum] =3D
> "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
> -SRC_URI[tzdata.sha256sum] =3D
> "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
> +SRC_URI[tzcode.sha256sum] =3D
> "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
> +SRC_URI[tzdata.sha256sum] =3D
> "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192913):
> https://lists.openembedded.org/g/openembedded-core/message/192913
> Mute This Topic: https://lists.openembedded.org/mt/103372051/7032091
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skulkarni@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000038309060dbb1892
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>I have sent this p=
atch to upgrade tzdata to the latest version &quot;2023d&quot; for dunfell =
branch.=C2=A0</div><div>The mailing list link for the same:=C2=A0<a href=3D=
"https://lists.openembedded.org/g/openembedded-core/message/192913">https:/=
/lists.openembedded.org/g/openembedded-core/message/192913</a></div><div><b=
r></div><div>Can you please check if this patch can be accepted in the dunf=
ell-nut branch of oe-core-contrib.</div><div><br></div><div>Thanks,</div><d=
iv>Shubham Kulkarni</div><div><br></div><div><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 26, 2023 at 10=
:44=E2=80=AFPM Shubham Kulkarni via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;skulkarni=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org">mvista.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Shubham Kulk=
arni &lt;<a href=3D"mailto:skulkarni@mvista.com" target=3D"_blank">skulkarn=
i@mvista.com</a>&gt;<br>
<br>
Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com"=
 target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/timezone/timezone.inc | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-ext=
ended/timezone/timezone.inc<br>
index 2960bfefe3..75f13cfc94 100644<br>
--- a/meta/recipes-extended/timezone/timezone.inc<br>
+++ b/meta/recipes-extended/timezone/timezone.inc<br>
@@ -6,7 +6,7 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0LICENSE =3D &quot;PD &amp; BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc679c9d6b02bc2757b3ea=
f8f53c43fba&quot;<br>
<br>
-PV =3D &quot;2023c&quot;<br>
+PV =3D &quot;2023d&quot;<br>
<br>
=C2=A0SRC_URI =3D&quot; <a href=3D"http://www.iana.org/time-zones/repositor=
y/releases/tzcode$%7BPV%7D.tar.gz;name=3Dtzcode" rel=3D"noreferrer" target=
=3D"_blank">http://www.iana.org/time-zones/repository/releases/tzcode${PV}.=
tar.gz;name=3Dtzcode</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.iana.org/ti=
me-zones/repository/releases/tzdata$%7BPV%7D.tar.gz;name=3Dtzdata" rel=3D"n=
oreferrer" target=3D"_blank">http://www.iana.org/time-zones/repository/rele=
ases/tzdata${PV}.tar.gz;name=3Dtzdata</a> \<br>
@@ -14,5 +14,5 @@ SRC_URI =3D&quot; <a href=3D"http://www.iana.org/time-zon=
es/repository/releases/tzcode$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D=
"_blank">http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar=
.gz</a><br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.iana.org/time-zone=
s" rel=3D"noreferrer" target=3D"_blank">http://www.iana.org/time-zones</a>&=
quot;<br>
<br>
-SRC_URI[tzcode.sha256sum] =3D &quot;46d17f2bb19ad73290f03a203006152e0fa0d7=
b11e5b71467c4a823811b214e7&quot;<br>
-SRC_URI[tzdata.sha256sum] =3D &quot;3f510b5d1b4ae9bb38e485aa302a776b317fb3=
637bdb6404c4adf7b6cadd965c&quot;<br>
+SRC_URI[tzcode.sha256sum] =3D &quot;e9a5f9e118886d2de92b62bb05510a28cc6c05=
8d791c93bd6b84d3292c3c161e&quot;<br>
+SRC_URI[tzdata.sha256sum] =3D &quot;dbca21970b0a8b8c0ceceec1d7b91fa903be0f=
6eca5ae732b5329672232a08f3&quot;<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192913): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192913" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192913</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103372051/703=
2091" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103372051/7032091</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:skulkarni@mvista.com" targ=
et=3D"_blank">skulkarni@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000038309060dbb1892--

