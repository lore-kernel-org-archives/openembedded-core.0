Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14623.1794776732209843424
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NfaPOGuJ;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67da564d9f2so1063920d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 13:05:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776731; cv=none;
        d=google.com; s=arc-20260327;
        b=YidLWQ7PwveMm16KPB1E465V7N/jKpT6chjrbV41qJQamcy2iOWG2tmrBLaX6eoH96
         oIOruXarjhTWNPgM4NQN3GeToxCYlG1IX7M9URJRPfJwgfG6j4d/QB9lsybEPVgJorfj
         SRNuZH0GGOxoZIicJFUNxiu8F+dLeLB0vurWXbRgtvOY/IsA7nO8g7Ho+Y8Uh6CgVu29
         bdJ8/49OrXE+zY9TStd3wHEqjzoDg0iKKUq91OvcL8i0f8uFZVwlT/r6Bs3ByB+Wfz0X
         /QYpCMCCxu9tru/JC/03t4yJtu9KJH9QCP8vou6qRUHxgpnYIOxkudlmJJI9Z6ThoM55
         znQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YJNncgXVJRjTHb+VLe79btqqaxmEndIZNOTjdTvSmzE=;
        fh=ii0xzOkp7y6qx39uqUsQRC2bRyJwfY8PW0FqrpILZRw=;
        b=CpS6TsuXyGNLy4m4tGWzV1CWkrrEs3ceGkErtxp/U8cGXeqn+pv6irECuinbMi3hHc
         ztJlZqwQslI4iFN2hiStU9393R1oHZNPtq2WFnKGrM4dzJPRernznbauy5yJM/vvGe6Y
         orXX1vGb6JJLhpTJgtiiKmtgY6grMYyLNBg8Qmlwgr/r5s1Q+I3kw8Jkd3jqxnMxvJ/s
         erTspKpGV7ZBG4mQ7nc6stvsvCDdhShDoz8WbSERpGFsmdpDK1vVJyvKBn+JALtKS41S
         CPiGSefSNqVYBSZWIYl18iFzbn+me/JbI4breacil2eji0fx8rA/w1woLWqf850Jw0yb
         n3TA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794776731; x=1795381531; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJNncgXVJRjTHb+VLe79btqqaxmEndIZNOTjdTvSmzE=;
        b=NfaPOGuJ36RM3zvRryKugdh6cMAb2QS1A/Qs/W6T1n6gV9uO2WavXOimtMXlAkF0AB
         9D6/ySRCOmBdoVZfCAV7YFokzsyPfc9WpnG0pfxeJwX/U0+fBfZFTfritRpRdT8F7EZ5
         jxQ9hLxGR/sFy6tidiqV1hHiVUct4kaFGja/vH0EzSictF3YWHYsdpctlo88MpQPsvWB
         JS7ZsgmNIYrvxok+4tpEsl/Dw5WdejbH2xYcIHovLVWnLNeglSa4JYri3zupbmz/Islb
         lCW5w0W72bFoj+muxckPP+vYSA2J5XJknas0w6x3zp3NvL2YAn8GqFy+pBEGpHZ/BNK8
         W7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776731; x=1795381531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YJNncgXVJRjTHb+VLe79btqqaxmEndIZNOTjdTvSmzE=;
        b=metDuqX6F00JWjy8CFPZ6MMohnieo3uWRbQHfEf25G2ANG5pf4GeyHlaPQxeSv7O/j
         7sYqofqmH/ttLlRAASdPj6mh0kxOpeoD70QJBf2RDtFbSMLdXif37bn6/6rydgaLKrUR
         ZvGN9WY5Lv4yExdJZFaaCZJXkbFKZ0bUv2gLpJKJ2Fctm820ERQG+Ba71bmKlOHBe0Gn
         Pg2jMMbK/Ef4pFwUmS45Ad1A0bdY0A+6xUFc3lCznMrTr8ES18f9Rg6ZBNRE2/gwjGTB
         LzEFN2cPu3LsIxXBNCVVCfQlAiszOPvAWASp82C+GkWIzcXEzmASSiaxEZI4g2GiyWKh
         9qmg==
X-Gm-Message-State: APuU4Z9ZqngHeKUFqD2Au10PsVYKxuNTjvgtCBNki9Y1kZ3ovT/qQX8D
	3GBaYtuGyHQP+BrEEguDyuOT9dQc9osA87WN3d0H6U3BjXnSNwfLqnRagq6P7K1ZHBRp6ZcfZ8/
	TzcT1GiyGxxla1zNY7YIWDLeX+ipgEHc=
X-Gm-Gg: AYBFou0hnBr8+C+nzoK+z/aphA2YQOfEhpB17hfQqKrcUbiN0NO8RZdX4khRG0COukv
	ojJZeJNcbWs6DQt+/11lAhbe6TpsljWeJ+BudiC59v9R4T8CxbkgZ+XklaFaUqz9kUuvB42sqCH
	zOWK6TPjy4uE3mgjsmNIOCZVz2XhnOig6ly8sGbG4/TOVUDuhAGI922fukE6EYAtzCOg+BfVMEG
	fZKMG0qevi4lwCjR81bxLh4HCcKsoOB2MbKE/ZF7fU+6tjal0GdnLnxIrVe9h30D6pdCjD8ztt8
	5c+xPuNSlOHefWA5PGICh4/cauAXbONAmxamIT+9zK1T7UXWSp0XuvjDBUFc/kT5WCauV+mY9wF
	OG4u6SZTTwL13vWLaUA5bZwjUSfcY3HRR6pjsg8EYloXs3fH4ko/lvO3DrbiqgJaFHVFe/l5A4D
	C4dTPMKqT/cLTedw/lHqd2Nh4urzhCQv+ElvUdC9Y1EACaqPIwKXOIczAFmC8nmxv/7xXjvTJqY
	BODGKtIv4qJMvGUZBshvzxyTKbdMKvTUMPNk71XcQD0+kuEEcAFKUnuHZ6PEZr7ykKRub/b6NKX
	wssRwi5FGvzP7krL3wmJIaJgLRRfiC5i0J1Ky8J/n5BPGnEUbp2YUZdkXKjWMes=
X-Received: by 2002:a05:690e:169d:b0:679:c4e9:b645 with SMTP id
 956f58d0204a3-67d893e225fmr7142691d50.4.1794776731259; Sun, 15 Nov 2026
 13:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20261108204650.3577385-1-khem.raj@oss.qualcomm.com> <B58FCA39-4F88-49D1-BE7E-E120F9E03177@arm.com>
In-Reply-To: <B58FCA39-4F88-49D1-BE7E-E120F9E03177@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Nov 2026 13:05:05 -0800
X-Gm-Features: AclHuK9ZsJ3IDk4Jrh-ijngZR87x5Dc-UV3hp-4rBy7OsVuDy3KrkunTv7cpxUA
Message-ID: <CAMKF1so_x1fXPzbqVbB2YMMP1tA62WigK_gN43ny7Ss-JM-ohQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest, packagegroup-core-buildessential: Add
 clang with clang toolchain
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000849ae90660570545"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250280

--000000000000849ae90660570545
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:26=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 8 Nov 2026, at 20:46, Khem Raj via openembedded-core <raj.khem=3D
> gmail.com@lists.openembedded.org> wrote:
> > The target clang package installs the ${TARGET_PREFIX}clang symlinks.
> > Add it to packagegroup-core-buildessential, and in ptest.bbclass append
> > it to the ptest RDEPENDS of any recipe built with clang whose ptest
> > already pulls in gcc, g++, their -symlinks packages or
> > packagegroup-core-buildessential. This covers python3, python3-cffi,
> > elfutils and others without per-recipe appends.
>
> This feels like the wrong solution, especially as you=E2=80=99ll end up w=
ith
> packages depending on both gcc and clang.
>

We can remove gcc from depends along with adding clang, its a ptest dep and
what does such a micro optimization get us?


>
> I=E2=80=99ve some patches locally that change python to do :append:toolch=
ain-gcc
> and :append:toolchain-clang, but maybe we need a variable that is =E2=80=
=9Cthe
> toolchain RDEPENDS=E2=80=9D for cases like this, that the toolchain class=
es can set?
>

python is not the problem, it's a symptom where another recipe needs to
know what compiler was used to compile python in order to decide its ptest
dependencies to be gcc or clang.

>
> Something like TARGET_TOOLCHAIN_RDEPENDS =3D =E2=80=9Cgcc-symlinks=E2=80=
=9D in gcc.bbclass
> maybe? Then recipes that respect the compiler choice can use that and wil=
l
> pull in the right packages automatically.
>
>
This suggestion may not fix the problem at hand but it will atleast make
OE system to not have gcc as default compiler assumption.


> Ross

--000000000000849ae90660570545
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12,=
 2026 at 6:26=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 8 Nov 2026, at 20:46, Khem Raj via openembedded-=
core &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; The target clang package installs the ${TARGET_PREFIX}clang symlinks.<=
br>
&gt; Add it to packagegroup-core-buildessential, and in ptest.bbclass appen=
d<br>
&gt; it to the ptest RDEPENDS of any recipe built with clang whose ptest<br=
>
&gt; already pulls in gcc, g++, their -symlinks packages or<br>
&gt; packagegroup-core-buildessential. This covers python3, python3-cffi,<b=
r>
&gt; elfutils and others without per-recipe appends.<br>
<br>
This feels like the wrong solution, especially as you=E2=80=99ll end up wit=
h packages depending on both gcc and clang.<br></blockquote><div><br></div>=
<div>We can remove gcc from depends along=C2=A0with adding clang, its a pte=
st dep and what does such=C2=A0a micro optimization get us?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I=E2=80=99ve some patches locally that change python to do :append:toolchai=
n-gcc and :append:toolchain-clang, but maybe we need a variable that is =E2=
=80=9Cthe toolchain RDEPENDS=E2=80=9D for cases like this, that the toolcha=
in classes can set?<br></blockquote><div><br></div><div>python is not the p=
roblem, it&#39;s a symptom where another recipe needs to know what compiler=
 was used to compile python in order to decide its ptest dependencies to be=
 gcc or clang.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Something like TARGET_TOOLCHAIN_RDEPENDS =3D =E2=80=9Cgcc-symlinks=E2=80=9D=
 in gcc.bbclass maybe? Then recipes that respect the compiler choice can us=
e that and will pull in the right packages automatically.<br>
<br></blockquote><div><br></div><div>This suggestion may not fix the proble=
m at hand but it will atleast make OE=C2=A0system to not have gcc as defaul=
t compiler assumption.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Ross</blockquote></div></div>

--000000000000849ae90660570545--
