Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25040.1792942815322169100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 08:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rzWgPqGv;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so2326675e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792942813; x=1793547613; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-type:references:in-reply-to:date:cc
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=STsOh4fXImSJ8AsdYukIvKFIPf3vdn/ey/eTazRQJN4=;
        b=rzWgPqGv3tnBT+t8K/V9dSRJaR2DOq87csEjSPQFRXKMFB9xiP5s1AlfocmbE12wtg
         syj7VQ0Ll6MxpyN78mHCx6JVIo4389I+pfix7N7ezIOpsMU488PzM+2m5Pm17O/Ub8xp
         PNr+nvDvQ/0t+cdJqtoCzRFaax0MhTS1Z7jyEnQ0swc8QMc3Rcs5URoNWrOMx1rvwWIU
         7qvP3hRcSs6whVPcULiRIqqjZI0W1UaGkLQYHBI5rEujtySZ5bbdsu2GHsN+NckXNTLm
         7M/yEtF0B2Xf+ofKLOhBrG29u1RPtMkT0xcpqIpde4wdP/n4fZ5fVkn2fBN7Iy8ACtDX
         KUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792942813; x=1793547613;
        h=mime-version:user-agent:content-type:references:in-reply-to:date:cc
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=STsOh4fXImSJ8AsdYukIvKFIPf3vdn/ey/eTazRQJN4=;
        b=zVVuwfbZTDdqgjcUrpUotlspw5dw7PpFfD0FEBMxurZ9SCNoj7eTlDvAayjTF1q5OU
         LY0wd7EFvCUCwacgPQq+dmtf32GZB5nGX8FCfwvnKqhNZkSgsCBvWUFJs1G7eWINzwTd
         WvytLqGHGma2mOyR6+i0XPFt5Fsuh76Uw3UtSkOOXcyms89V4khuNW65gdL3EOk4CzZR
         N6pg87GM7CxO71/q45hIgQfcfkK596G5cHrNewPjWz8XDGBm1uuzCPbjG99gZTHE1aa8
         qmgf66X8qkfJdxQykOpkWZ5FBBoMBvomQ3tPFRHGnGTsAXbuXUAbDS7lBgyQUivg6UNY
         1IhA==
X-Gm-Message-State: AFq9FYJBB87PklQcqx3dspFa2+p7neEJD2uisOvMruz0OoUyUDBWq+ec
	URvSMk82IxjblEDtMQQluoS9i2eq7s6ZcuNhIrF0d70Hy2ukw64zWFPO2XVUYw==
X-Gm-Gg: AYBFou053fD+3dWaUtYX9oWfOJBIQvsMsqBycwAvggIahuEy/3G5m3Lq7drmX6T0mT0
	QBSyQ+jP59qfZK7+g5QH07EAARvXarxv6uBHl9TbEIyVA0UwnXAGuzbG5U9tCCcV9wNQaPD+jFQ
	MTbJdFPhqau+rw9h0Xn++249f2TL2efoPJV6ynkK3qOS4dnEKBNDGB8rjuRumSvksT7sVlJYV8a
	qfPOlWpbzrpt+H7GLbV/pQw+ANqFnZ7qBNsIQNEonFf9rRuIe1z8E5NqT8fTx3cwGssEz8VABnE
	+jX5Q6ZzqVsgho6oE4tdWnd91mzsY0vzlv55cYKvDeYxR0P10Ooz1s7s0llnAwK0sWCdeo+B0/7
	/TRiO4cuT+Tl9mKboRQ279Q3s8TzcD7uL5g+xCVtSj8FTU1wYMfZssCg2FDGBj32/5MHcle3vHi
	hmQHf3AXo+n0Qx0/rw97yKV+xOKbG4y5Bg1W/hHgfhRpzWzrANNFKwRu8zyU8bW+zdH9yoajh5B
	7ocQwMq2O9Co8wFCYz68wLifqBR4TFwYPXwTOWauLD2NqPXhx48Bq+1CliSMiI8lGUxgXE2nius
	NEJuLjC0wyvVoNmoJcC9X8eW8KwR
X-Received: by 2002:a05:600c:c091:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4a5015ef800mr34318825e9.24.1792942813216;
        Sun, 25 Oct 2026 08:40:13 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm10955988f8f.1.2026.10.25.08.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:40:12 -0700 (PDT)
Message-ID: <a5598f3d8e3c3a7d256bd27ded216070acc2f2c1.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fit-image: add FIT_LOADABLE_*
 variables to do_compile vardeps
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quaresma.jose@gmail.com, adrian.freihofer@siemens.com
Date: Sun, 25 Oct 2026 16:40:12 +0100
In-Reply-To: <CANPvuRkJwDsGzJ_JssUGyAUwZPCCNBp5LRyWuT02KB283NPtxw@mail.gmail.com>
References: <20261025101306.3845699-1-adrian.freihofer@siemens.com>
	 <CANPvuRkJwDsGzJ_JssUGyAUwZPCCNBp5LRyWuT02KB283NPtxw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-9llkABdinbhV+jSz5tdw"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 15:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248608

--=-9llkABdinbhV+jSz5tdw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-10-25 at 11:44 +0000, Jose Quaresma via
lists.openembedded.org wrote:
>=20
>=20
> Adrian Freihofer via lists.openembedded.org
> <adrian.freihofer=3Dsiemens.com@lists.openembedded.org> escreveu
> (domingo, 25/10/2026 =C3=A0(s) 10:13):
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > do_compile only reads the per-loadable flags of the FIT_LOADABLE_*
> > variables with d.getVarFlag('FIT_LOADABLE_*', loadable), never
> > their
> > values. As the flag names are not literals, bitbake cannot track
> > these
> > accesses, so the flags are not part of the do_compile signature.
> > Changing e.g. FIT_LOADABLE_LOADADDRESS[atf] did not trigger a
> > rebuild
> > and a stale FIT image was reused.
> >=20
> > When FIT_LOADABLES is set, add the FIT_LOADABLE_* variables to
> > do_compile[vardeps] in the loop that already processes them.
> > Referencing a variable includes all its flags in the signature.
> >=20
> > While at it, fix the duplicated word in the comment.
> >=20
> > This is a fixup for commit 2535427d8de0
> > "kernel-fit-image: support arbitrary loadables"
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 9 +++++++--
> > =C2=A01 file changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> > b/meta/classes-recipe/kernel-fit-image.bbclass
> > index 7b2bcd4673..d6a41d4979 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -32,8 +32,12 @@ python () {
> > =C2=A0 =C2=A0 =C2=A0# Parse loadables config
> > =C2=A0 =C2=A0 =C2=A0loadables =3D d.getVar('FIT_LOADABLES')
> > =C2=A0 =C2=A0 =C2=A0if loadables:
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check that the loadables configuration v=
ariables are not
> > set directly
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # directly, then assign them a synthetic v=
alue for
> > testability purposes
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check that the loadables configuration v=
ariables are not
> > set
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # directly, then assign them a synthetic v=
alue for
> > testability purposes.
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_compile only reads the flags of these=
 variables,
> > never their
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # values, and as the flag names are not li=
terals bitbake
> > cannot track
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # these accesses. Add the variables to the=
 do_compile
> > vardeps to get
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # all their flags into the task signature.
> >=20
>=20
>=20
> I believe=C2=A0it's better=C2=A0to declare the=C2=A0below list in a new v=
ariable and
> add it to=C2=A0vardeps in a single step.

Please ignore this patch.

Thank you for the review. I agree, this could be improved.
The complete fix looks more complicated anyway. I will send a different
series which also solves some issues on the test side which will
include an improved version of this patch as well.

Regards,
Adrian

>=20
> Jose
>=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for v in ['FIT_LOADABLE_ARCH', 'FIT_L=
OADABLE_COMPRESSION',
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'F=
IT_LOADABLE_DESCRIPTION',
> > 'FIT_LOADABLE_ENTRYPOINT',
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'F=
IT_LOADABLE_FILENAME',
> > 'FIT_LOADABLE_LOADADDRESS',
> > @@ -43,6 +47,7 @@ python () {
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0synt_value =3D " ? ".jo=
in([ d.getVarFlag(v, loadable) or
> > "" for loadable in loadables.split() ])
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(v, synt_value)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag('do_compile'=
, 'vardeps', ' ' + v)
> > =C2=A0}
> >=20
> > =C2=A0do_configure[noexec] =3D "1"
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#248605):
> > https://lists.openembedded.org/g/openembedded-core/message/248605
> > Mute This Topic:
> > https://lists.openembedded.org/mt/121925246/4454582
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > adrian.freihofer@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=-9llkABdinbhV+jSz5tdw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Sun, 2026-10-25 at 11:44 +0000, Jose Quaresma =
via lists.openembedded.org wrote:</div><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">Adrian Freihofer via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;adri=
an.freihofer=3D<a href=3D"mailto:siemens.com@lists.openembedded.org">siemen=
s.com@lists.openembedded.org</a>&gt; escreveu (domingo, 25/10/2026 =C3=A0(s=
) 10:13):<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><div>From: Adrian Freihofer &=
lt;<a href=3D"mailto:adrian.freihofer@siemens.com" target=3D"_blank">adrian=
.freihofer@siemens.com</a>&gt;<br></div><div><br>do_compile only reads the =
per-loadable flags of the FIT_LOADABLE_*<br>variables with d.getVarFlag('FI=
T_LOADABLE_*', loadable), never their<br>values. As the flag names are not =
literals, bitbake cannot track these<br>accesses, so the flags are not part=
 of the do_compile signature.<br>Changing e.g. FIT_LOADABLE_LOADADDRESS[atf=
] did not trigger a rebuild<br>and a stale FIT image was reused.<br></div><=
div><br>When FIT_LOADABLES is set, add the FIT_LOADABLE_* variables to<br>d=
o_compile[vardeps] in the loop that already processes them.<br>Referencing =
a variable includes all its flags in the signature.<br></div><div><br>While=
 at it, fix the duplicated word in the comment.<br></div><div><br>This is a=
 fixup for commit 2535427d8de0<br>"kernel-fit-image: support arbitrary load=
ables"<br></div><div><br>Signed-off-by: Adrian Freihofer &lt;<a href=3D"mai=
lto:adrian.freihofer@siemens.com" target=3D"_blank">adrian.freihofer@siemen=
s.com</a>&gt;<br>---<br>&nbsp;meta/classes-recipe/kernel-fit-image.bbclass =
| 9 +++++++--<br>&nbsp;1 file changed, 7 insertions(+), 2 deletions(-)<br><=
/div><div><br>diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/m=
eta/classes-recipe/kernel-fit-image.bbclass<br>index 7b2bcd4673..d6a41d4979=
 100644<br>--- a/meta/classes-recipe/kernel-fit-image.bbclass<br>+++ b/meta=
/classes-recipe/kernel-fit-image.bbclass<br>@@ -32,8 +32,12 @@ python () {<=
br>&nbsp; &nbsp; &nbsp;# Parse loadables config<br>&nbsp; &nbsp; &nbsp;load=
ables =3D d.getVar('FIT_LOADABLES')<br>&nbsp; &nbsp; &nbsp;if loadables:<br=
>-&nbsp; &nbsp; &nbsp; &nbsp; # Check that the loadables configuration vari=
ables are not set directly<br>-&nbsp; &nbsp; &nbsp; &nbsp; # directly, then=
 assign them a synthetic value for testability purposes<br>+&nbsp; &nbsp; &=
nbsp; &nbsp; # Check that the loadables configuration variables are not set=
<br>+&nbsp; &nbsp; &nbsp; &nbsp; # directly, then assign them a synthetic v=
alue for testability purposes.<br>+&nbsp; &nbsp; &nbsp; &nbsp; # do_compile=
 only reads the flags of these variables, never their<br>+&nbsp; &nbsp; &nb=
sp; &nbsp; # values, and as the flag names are not literals bitbake cannot =
track<br>+&nbsp; &nbsp; &nbsp; &nbsp; # these accesses. Add the variables t=
o the do_compile vardeps to get<br>+&nbsp; &nbsp; &nbsp; &nbsp; # all their=
 flags into the task signature.<br></div><br></blockquote><div><br></div><d=
iv>I believe&nbsp;it's better&nbsp;to declare the&nbsp;below list in a new =
variable and add it to&nbsp;<span style=3D"background-color:transparent">va=
rdeps in a single step.</span></div></div></div></blockquote><div><br></div=
><div><div>Please ignore this patch.</div></div><div><br></div><div>Thank y=
ou for the review. I agree, this could be improved.</div><div>The complete =
fix looks more complicated anyway. I will send a different series which als=
o solves some issues on the test side which will include an improved versio=
n of this patch as well.</div><div><br></div><div>Regards,</div><div>Adrian=
</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; =
border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote gmail_quote_container"><div><br></div><div>Jose</div><div><=
br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:=
2px #729fcf solid;padding-left:1ex"><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
for v in ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',<br>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'FIT_LOADABLE_DESCR=
IPTION', 'FIT_LOADABLE_ENTRYPOINT',<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOA=
DADDRESS',<br>@@ -43,6 +47,7 @@ python () {<br></div><div><br>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;synt_value =3D " ? ".join([ d.getVarFlag=
(v, loadable) or "" for loadable in loadables.split() ])<br>&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d.setVar(v, synt_value)<br>+&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; d.appendVarFlag('do_compile', 'vardeps', ' ' + =
v)<br>&nbsp;}<br></div><div><br>&nbsp;do_configure[noexec] =3D "1"<br></div=
><div><br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div=
><div>Links: You receive all messages sent to this group.<br></div><div>Vie=
w/Reply Online (#248605): <a href=3D"https://lists.openembedded.org/g/opene=
mbedded-core/message/248605">https://lists.openembedded.org/g/openembedded-=
core/message/248605</a><br></div><div>Mute This Topic: <a href=3D"https://l=
ists.openembedded.org/mt/121925246/4454582">https://lists.openembedded.org/=
mt/121925246/4454582</a><br></div><div>Group Owner: <a href=3D"mailto:opene=
mbedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a><br></div><div>Unsubscribe: <a href=3D"https://lists.open=
embedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/op=
enembedded-core/unsub</a>&nbsp;[<a href=3D"mailto:adrian.freihofer@gmail.co=
m">adrian.freihofer@gmail.com</a>]<br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-<br></div><div><br></div></blockquote></div></div></blo=
ckquote><div><br></div><div><span></span></div></body></html>

--=-9llkABdinbhV+jSz5tdw--
