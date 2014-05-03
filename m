Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0A0606E1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 01:37:12 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id 10so3892312lbg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 18:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=lDMZOtMwPJFkmVU9EAcbr22aMENYzr58hb8wDfGmCwk=;
	b=F1Fnz7d17vDj6nW9D94IhYFBWUGjstnb72sWCDPY20RYojpRDp/EQHgDNgGHgJ+Occ
	QMAoLsn9FCJl6fZn2mHv5Cbos5lJ52I7VOfef26V5uGRT/fQ7g3Sg+iU08pQNK1U2wb2
	l+eRXrKsbzW1Uns7dw4QvHBeqzpprQ5dSdfXKkNHNTAzhIE4Jg0QyBSB9rNLM/NFC7pG
	hKm2C43CDcZHfOVkFsCAbjmNzM2OWb7CXCq7dVTECLg/r2J0aKnVYJ3sIh99bzJASXwc
	ugjCp8TXODqxYpyN0TpUXlyVn0+gLELmcFUVQG/hw+2jLqis1kcuacYW8qVeVpdp8Bmv
	FM5w==
X-Received: by 10.112.137.39 with SMTP id qf7mr14621244lbb.18.1399081032728;
	Fri, 02 May 2014 18:37:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Fri, 2 May 2014 18:36:52 -0700 (PDT)
In-Reply-To: <1399021218-27441-1-git-send-email-radek.dostal@streamunlimited.com>
References: <1398872793.16672.526.camel@ted>
	<1399021218-27441-1-git-send-email-radek.dostal@streamunlimited.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 2 May 2014 18:36:52 -0700
X-Google-Sender-Auth: rVvPGGxsf5AnLDFs29JWFTthHWs
Message-ID: <CABcZANmQENs+H2A1FBKtNonAF2N5TjZg6sc7cuKpWO9BjBVPOQ@mail.gmail.com>
To: Radek Dostal <radek.dostal@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils.bbclass: only modify *.py file if it contains path to be removed
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
X-List-Received-Date: Sat, 03 May 2014 01:37:17 -0000
Content-Type: multipart/alternative; boundary=089e011609ccf7c6b404f874efd9

--089e011609ccf7c6b404f874efd9
Content-Type: text/plain; charset=UTF-8

On Fri, May 2, 2014 at 2:00 AM, Radek Dostal <
radek.dostal@streamunlimited.com> wrote:

> -            sed -i -e s:${D}::g "$i"
> +            # only modify file if it contains path to avoid recompilation
> on the target
> +            if (grep "${D}" "$i") >/dev/null 2>&1


If you're to go this route, I'd suggest:

    if grep -q "${D}" "$i"; then

Avoids the unnecessary re-directions, and unnecessary sub-shell.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e011609ccf7c6b404f874efd9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, May 2, 2014 at 2:00 AM, Radek Dostal <span dir=3D"ltr">&lt;<a href=
=3D"mailto:radek.dostal@streamunlimited.com" target=3D"_blank">radek.dostal=
@streamunlimited.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sed -i -e s:${D}::g &quot;$i&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# only modify file if it contain=
s path to avoid recompilation on the target<br>
</div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grep &quot;${D}&quot; =
&quot;$i&quot;) &gt;/dev/null 2&gt;&amp;1</blockquote><div><br></div><div>I=
f you&#39;re to go this route, I&#39;d suggest:<br><br></div><div>=C2=A0=C2=
=A0=C2=A0 if grep -q &quot;${D}&quot; &quot;$i&quot;; then<br>

<br></div><div>Avoids the unnecessary re-directions, and unnecessary sub-sh=
ell.<br></div></div>-- <br>Christopher Larson<br>clarson at kergoth dot com=
<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>

Senior Software Engineer, Mentor Graphics
</div></div>

--089e011609ccf7c6b404f874efd9--
