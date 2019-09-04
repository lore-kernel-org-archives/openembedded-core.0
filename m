Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7F07F2B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 10:11:39 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id s18so6333153vsa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 03:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iYL1OQWJN61k1lE1Cmxf0lp/09/CPWa7oYvYwCCHay8=;
	b=G0lviPx1wBSo5rNyZzfRTeITm1qnOf/91cbLWWZgjOn1Ss3E1K35Uo2xDXSWkX5xHe
	WuWZQnAwJr/io1ZLPOB4DqlLopUszwerX5us8N3YjvylMfJoWIJcQlQ2/75CRSAC0TB7
	hkWPgbl+8WS6KRx/p7HuMPbfiRIlhgvzHkf2EzLqHJrzYRguXMWh3FJO7051NBkwIKRI
	jsaeuosZKbZiwCF9KJ4s+QukHVTB7PjrVA3z2Wvrs+d9FY4HH39oWnnwtWDr9qJDRMqr
	OalWDv/zegelXePPGukTYPTI66gXSUxejUXOaW4NHYihCKgxuvvVdFsD3kBcxuFfAz0T
	7S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iYL1OQWJN61k1lE1Cmxf0lp/09/CPWa7oYvYwCCHay8=;
	b=haVg+cWtMGFXESVdJbZ9HBnT+5Qn7mRACSmqMyd1nYshzvXQ/Q1+9WiO3BsqZK620/
	e9UfVT1ezRUsa9ipSYwFJ6w0NQ5JnX1k/iJm2G4dEP800GKyOmU/9VOv/NFVYngr1ZPt
	CHSQiH/nHSUBquTpqMIvYq31RcpVUQJWORT/XUVCADqvPlBf9pux5aD6HYyKHxAuWxwV
	87M7H2g3NnXvEp3T7TIYgEbwIkCrMJERGfQFgNxQbc3TGSMGb2Vs5wggeZbQwtOc9RST
	AFuIAzWEBod0fAV/BUlIW7l/DXm9gf7Zqw1/OuR7Ggvjqoh2GM8zaBvrG7E1aaA5Gtzb
	lWGA==
X-Gm-Message-State: APjAAAVePXQO81QUBBr5zXqqkTqfmHC44tEMXJv4kel43Aez8inGLZPL
	2PAN3FESUrq4HQsWDVMoekDURAD2xxbExcfYbdKg9VRF
X-Google-Smtp-Source: APXvYqw22ugDJ3EXqVo1Bz9NhNE0gpjsXcucOeEIR2HwH609XmRNrBdeLFBkPOXADtEzb1XXHnswbDrKnya/eRX+RXo=
X-Received: by 2002:a67:347:: with SMTP id 68mr21774357vsd.35.1567591900245;
	Wed, 04 Sep 2019 03:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190903163241.87739-1-alex.kanavin@gmail.com>
	<20190904073239.rlk6spusid6m2zbd@qschulz>
In-Reply-To: <20190904073239.rlk6spusid6m2zbd@qschulz>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 12:11:29 +0200
Message-ID: <CANNYZj_ZFESLDrUxU9XjjdTQXEp-awnq+-EJEavE32SqJOZSXA@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Sep 2019 10:11:39 -0000
Content-Type: multipart/alternative; boundary="0000000000005df37c0591b76e2a"

--0000000000005df37c0591b76e2a
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sep 2019 at 09:32, Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> > +++ b/meta/classes/package.bbclass
> > @@ -1646,7 +1646,8 @@ python package_do_shlibs() {
> >                  prov = (this_soname, ldir, pkgver)
> >                  if not prov in sonames:
> >                      # if library is private (only used by package) then
> do not build shlib for it
> > -                    if not private_libs or this_soname not in
> private_libs:
> > +                    import fnmatch
> > +                    if not private_libs or len([i for i in private_libs
> if fnmatch.fnmatch(this_soname, i)]) == 0:
>
> We only need to know if this_soname is matching one of the patterns, we
> don't need to check for each and every pattern.
>
> Something like:
>
> for pattern in private_libs:
>         if fnmatch.fnmatch(this_soname, pattern)]) == 0:
>                 sonames.add(prov)
>                 break
>
> would be possible?
>

Actually, this suggested code snippet looks altogether wrong to me. We do
need to check the file against every pattern, and only if it matches none
of them, it gets added to sonames. Note the original code says 'this_soname
not in private_libs', which also means going over every item in the list.

Alex

--0000000000005df37c0591b76e2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Sep 2019 at 09:32, Quentin Schu=
lz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz=
@streamunlimited.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">&gt; +++ b/meta/classes/pack=
age.bbclass<br>
&gt; @@ -1646,7 +1646,8 @@ python package_do_shlibs() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prov =3D=
 (this_soname, ldir, pkgver)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not p=
rov in sonames:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # if library is private (only used by package) then do not build shl=
ib for it<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if not private_libs or this_soname not in private_libs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 import fnmatch<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if not private_libs or len([i for i in private_libs if fnmatch.fnmatch(thi=
s_soname, i)]) =3D=3D 0:<br>
<br>
We only need to know if this_soname is matching one of the patterns, we<br>
don&#39;t need to check for each and every pattern.<br>
<br>
Something like:<br>
<br>
for pattern in private_libs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if fnmatch.fnmatch(this_soname, pattern)]) =3D=
=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sonames.add(prov)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
<br>
would be possible?<br></blockquote><div><br></div><div>Actually, this sugge=
sted code snippet looks altogether wrong to me. We do need to check the fil=
e against every pattern, and only if it matches none of them, it gets added=
 to sonames. Note the original code says &#39;this_soname not in private_li=
bs&#39;, which also means going over every item in the list.<br></div></div=
><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></=
div></div>

--0000000000005df37c0591b76e2a--
