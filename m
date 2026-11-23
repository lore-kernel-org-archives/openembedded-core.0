Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52305.1795435535885329605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 04:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IVLA0fBS;
 spf=pass (domain: mvista.com, ip: 209.85.218.42, mailfrom: rsangam@mvista.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c515369b627so272436866b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 04:05:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795435534; cv=none;
        d=google.com; s=arc-20260327;
        b=ETqWlPh8O0ROZO6U29WDZFJWXHX2wg5eyP7QhqfGrMkECXE/bNDsKjwh/h2V9kHHeG
         MXuoI+aRHw2eP/f6KG8uzVWJv7Z3d3AsNTB9zftgmkb+/JqcgbVsWghCmVvKsp0vQMoR
         m8acGWsHapgHb752KCkDqP8GpKPd6m7DVOKLYSjHCw7/EKX+8wYcHMsQCNFjUVzJAGMS
         6Hf9GRSk1ICWFizMPJl6xNS3PjuwcJxkXJMMaVtH96B6jsvowXgc8EWCry8YnCkcpzEY
         C/c+R3WPRSBLfeyWCH6y2wviItz9ZKFTjBQThu6Q3PCz+B9y4mqZiZ2Da/ghGIkFKRXS
         AmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QntYviHKcYJEKsrerE0X/UbUXfLwJ2oUm5DVn8CEyNM=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=TL9aNUng2ZlFFoshCMe/p3B4gi6EomXcvrbsOXjQIjIZWKFnwXP/RCvMKt/WeVGRFp
         RxvmTW0jbd2vBhvX6K4GM2ZDttBqu9Lns3Odwtum/1+oZ3hpxQy5HD629wdZaWbm1/1T
         f1we3UkhSsInW+XB5PA+myUB6jCrsEn1tEMTjaKtd6mfhaO6DfLf60ndmYVG+EO1YhPl
         odQ1B3mKFe99HenzWcRZplK6UZF5vC1gqTRPQm8LwuzgNTcRP+9J9L3wdLWwqYFsS7jA
         By9cCxBbdJWN7ByVm9Ths0WP3ozbyuRmt8M7ARzN/RoMDuBJgMxj6mfnrBpVRcC2xjj4
         i6Rw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795435534; x=1796040334; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QntYviHKcYJEKsrerE0X/UbUXfLwJ2oUm5DVn8CEyNM=;
        b=IVLA0fBSpOvnMGgRDS0rvDauLK19nA+/HHsFUAuVeMZjvzfPfTHl/ON+23LJu+x/gA
         6JGyw36sc2O0Py8c6ZKLm0kYB69hfZPdnIOj16Sueqqvrs1bsNJ2K6kaX4J0yBmxEgf+
         aJzIW0q6ob4bZNaGUgtMFzECAXN3h9BM9Crlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435534; x=1796040334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QntYviHKcYJEKsrerE0X/UbUXfLwJ2oUm5DVn8CEyNM=;
        b=NPFMV7lubRsa+MC1M6GwuT0XptYWRHILJWfEMG1TLfj97o5sb/PuKnOPFO28I1Wcv1
         isOtJbOuVXUT4ptC3PehVZVplVvkpmhEm6HjhrimTpLWte63RHsGZGasES4wjy2TS0k9
         mii2YKf4c4uykVlbkzX+FjvsOhpUX3k7V4Adf8HCoUVEM4RGQszLt90YDgY954VyG96c
         G5HhELBNPvaEIPv28MRK9rRX+X843d1knjC3PvrKuXU2D16s067oOHan2KIhBTz0Zue2
         lQFEJQr9K6gNFpMxtdbKXtSafflvpn/hzuNbeb4Khfnl4IPvr9mSw7ln5eg0FfbAe2ad
         ggpw==
X-Gm-Message-State: APuU4Z86LJAtLA0VPu6jFk0XyMeTZ3Lt0z9wIpklRIanEwN4vu6rk/VY
	rYesbWp6Zf7R+MVUq4tIEkZigTYo8oqBA34GKJwn2MsukKIl13pU7eaBT4gOXBYkgjCCbZyy9CD
	NC+XTYwmTx/XhWGPFaq1IiFpmCAvtaYe003yjsg16XA==
X-Gm-Gg: AZFdTZfv6X63xCN4a4yUq4vTvvfJvNBJWAdwL5PpPuJfxeyQOuMJLSv6Y3LD7ROEKSm
	I5AkSgp86siwZrM/03Lf8WLyJR4VkiL8S7Pq0lPgH+KRDlTl9NfzkLFbYfztE/fbEN9v6ka5cjX
	H2BC4sIIKX+5AI1DgUC3tqvzi53dBY4JD2vG9CIaMoP+9Jl1rdCEhPbKvfop1wIL39LTEZVD+xd
	v2/63CadkxwR1YUV0k75A0uPMquINQDE3FfkqSXzf3RraZsDpBwnHLyZfkZ919c+AGSXuQYJ7zH
	N8Pw76Ic4wVP/7AuTcZT4z8+Nnjgsn0n6zfm7jXLgtPdpZ/h7RQ/hz2S7fchIxEwZvSlYyv94Xs
	GXJQ/GmcoDcFR/BFxi+EI0rcq+2gr2d9/tZQ56w==
X-Received: by 2002:a17:906:f146:b0:c4d:18e2:e66c with SMTP id
 a640c23a62f3a-c513ab06107mr645279666b.18.1795435533988; Mon, 23 Nov 2026
 04:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20261116175500.328321-1-rsangam@mvista.com> <DN19BWWOCZOA.13CEH4B1VTDU0@smile.fr>
In-Reply-To: <DN19BWWOCZOA.13CEH4B1VTDU0@smile.fr>
From: Rohini Sangam <rsangam@mvista.com>
Date: Mon, 23 Nov 2026 17:35:21 +0530
X-Gm-Features: Aa3M54qv_e8aEYsYtf7Dta2aheyrT2wsz0fyJG2g8wQwqe0vQO3zlzlRh2VHJ5c
Message-ID: <CAL7QmvDh=WTpVNkgQ_Qmzs6NpoN1iKnfYXtCNTaGJBsvApBcVw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] bind: Security fix for CVE-2026-19666
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000388dde0660f06960"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250907

--000000000000388dde0660f06960
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Upgrading the bind version to bind-9.18.50 doesn't fix the problem
(CVE-2026-19666).

Ref link:
https://bind9.readthedocs.io/en/v9.18.50/notes.html#notes-for-bind-9-18-50

NOTE: I built the bind package by upgrading it to bind-9.18-50. The SHA-256
checksum used
was a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d.
However, it didn't include the fix for CVE-2026-19666

Regards,
Rohini Sangam



On Sun, Nov 22, 2026 at 4:24=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Mon Nov 16, 2026 at 6:55 PM CET, Rohini Sangam via openembedded-core
> wrote:
> > Pick patch from [1] also mentioned at Debian tracker in [2]
> >
> > [1]
> https://github.com/isc-projects/bind9/commit/78175f9749fecdac4eb0d4b08dd0=
64968b4c55f8
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-19666
> >
> > Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> > ---
> >  .../bind/bind/CVE-2026-19666.patch            | 113 ++++++++++++++++++
> >  .../recipes-connectivity/bind/bind_9.18.49.bb |   1 +
> >  2 files changed, 114 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/bind/bind/CVE-2026-19666.patch
>
> Hello,
>
> This commit is from the bind-9.18 branch upstream. Instead of
> backporting patches one by one, how about we jump to the tip to this
> 9.18 branch? That would put us at "9.18.50+git".
>
> See: https://lore.kernel.org/all/DM4MPOPTHX9C.2IO3PVJDW950C@smile.fr/
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000388dde0660f06960
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br><br></div>Upgrading the bind version t=
o bind-9.18.50 doesn&#39;t fix the problem (CVE-2026-19666).<br><br></div><=
div>Ref link: <a href=3D"https://bind9.readthedocs.io/en/v9.18.50/notes.htm=
l#notes-for-bind-9-18-50">https://bind9.readthedocs.io/en/v9.18.50/notes.ht=
ml#notes-for-bind-9-18-50</a></div><div><br></div><div>NOTE: I built the bi=
nd package by upgrading it to bind-9.18-50. The SHA-256 checksum used was=
=C2=A0a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d.=C2=
=A0<br></div><div>However, it didn&#39;t include the fix for=C2=A0CVE-2026-=
19666<br><br></div><div>Regards,<br></div><div>Rohini Sangam</div><br><br><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Nov 22, 2026 at 4:24=E2=80=AFAM Yoann Congal &=
lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Nov=
 16, 2026 at 6:55 PM CET, Rohini Sangam via openembedded-core wrote:<br>
&gt; Pick patch from [1] also mentioned at Debian tracker in [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/isc-projects/bind9/commit/78175f9749=
fecdac4eb0d4b08dd064968b4c55f8" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/isc-projects/bind9/commit/78175f9749fecdac4eb0d4b08dd064968b4c=
55f8</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-19=
666" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-19666</a><br>
&gt;<br>
&gt; Signed-off-by: Rohini Sangam &lt;<a href=3D"mailto:rsangam@mvista.com"=
 target=3D"_blank">rsangam@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bind/bind/CVE-2026-19666.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 113 ++++++++++++++++++<br>
&gt;=C2=A0 .../recipes-connectivity/bind/<a href=3D"http://bind_9.18.49.bb"=
 rel=3D"noreferrer" target=3D"_blank">bind_9.18.49.bb</a> |=C2=A0 =C2=A01 +=
<br>
&gt;=C2=A0 2 files changed, 114 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-=
19666.patch<br>
<br>
Hello,<br>
<br>
This commit is from the bind-9.18 branch upstream. Instead of<br>
backporting patches one by one, how about we jump to the tip to this<br>
9.18 branch? That would put us at &quot;9.18.50+git&quot;.<br>
<br>
See: <a href=3D"https://lore.kernel.org/all/DM4MPOPTHX9C.2IO3PVJDW950C@smil=
e.fr/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all/DM4=
MPOPTHX9C.2IO3PVJDW950C@smile.fr/</a><br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000388dde0660f06960--
