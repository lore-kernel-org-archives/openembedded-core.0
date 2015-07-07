Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA8873779
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:22:25 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so139359426qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Flom4lCcOmWdGEMM1dWVCN6jMs5Q3AN1Ml0e0Z5GLwQ=;
	b=D0KQAy5/NNWa5DcSHFgqbV9JpdtzrxmofelugvU5v2EvcP2duWChafZFkk01bfXoEq
	USAE2M725M5+j2bryMmw5s1vRGI0AaQcJIx6oPPYcPtDhsSdeFSlXv/NJBlSYlak9Uae
	siHFmbsTjDxP2ARvQfI+XuZwxwY+plcGLe0fgfDqgLMdHfFuVuBj3mcDyJ8unMdFy5bN
	COQhxWLHvfZ7x3GgdJeTyfR+HombN57pVwXNdB//KQgFTtoz4Zw2mnRB1o/IB7/2c2cV
	nBT09IuQ5vNNLdLJNl6zBsqZ6SpKkbKTk89uWK2zelhgdOf7oysO0otTxrFX+WafDsDn
	8FRA==
X-Received: by 10.140.165.150 with SMTP id l144mr6712153qhl.99.1436275345192; 
	Tue, 07 Jul 2015 06:22:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.99 with HTTP; Tue, 7 Jul 2015 06:22:05 -0700 (PDT)
In-Reply-To: <b43e9f344635ef03616702689d946a769132e171.1436253346.git.liezhi.yang@windriver.com>
References: <cover.1436253346.git.liezhi.yang@windriver.com>
	<b43e9f344635ef03616702689d946a769132e171.1436253346.git.liezhi.yang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 7 Jul 2015 06:22:05 -0700
X-Google-Sender-Auth: Dn-E_OXvCnqY_lAeRbFk7KEKGgM
Message-ID: <CABcZAN=b5CZeVLpooQRok7eo0C1tt9VKJqchmebpBbavEOJ4YA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] toolchain-scripts.bbclass: use MLPREFIX to instead of MULTILIB_VARIANTS
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
X-List-Received-Date: Tue, 07 Jul 2015 13:22:25 -0000
Content-Type: multipart/alternative; boundary=001a1134effac000cb051a48e974

--001a1134effac000cb051a48e974
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 7, 2015 at 12:17 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>      for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or
> "").split():
>          deps += " %s:do_populate_sysroot" % dep
> -        for variant in (d.getVar('MULTILIB_VARIANTS', True) or
> "").split():
> -            clsextend = oe.classextend.ClassExtender(variant, d)
> +        mlprefix = d.getVar('MLPREFIX', True)
> +        if mlprefix:
> +            clsextend = oe.classextend.ClassExtender(mlprefix[:-1], d)
>              newdep = clsextend.extend_name(dep)
>              deps += " %s:do_populate_sysroot" % newdep
>

Do we really want to get MLPREFIX and construct a ClassExtender for each
dep in TOOLCHAIN_NEED_CONFIGSITE_CACHE? Could we do those outside the loop?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134effac000cb051a48e974
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jul 7, 2015 at 12:17 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
2v7" class=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 =C2=A0for dep in=
 (d.getVar(&#39;TOOLCHAIN_NEED_CONFIGSITE_CACHE&#39;, True) or &quot;&quot;=
).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D &quot; %s:do_populate_sysroot&q=
uot; % dep<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for variant in (d.getVar(&#39;MULTILIB_VARIANT=
S&#39;, True) or &quot;&quot;).split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clsextend =3D oe.classextend.Cla=
ssExtender(variant, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mlprefix =3D d.getVar(&#39;MLPREFIX&#39;, True=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if mlprefix:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clsextend =3D oe.classextend.Cla=
ssExtender(mlprefix[:-1], d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newdep =3D clsextend.extend=
_name(dep)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D &quot; %s:do_popu=
late_sysroot&quot; % newdep</div></blockquote></div><br>Do we really want t=
o get MLPREFIX and construct a ClassExtender for each dep in TOOLCHAIN_NEED=
_CONFIGSITE_CACHE? Could we do those outside the loop?<br>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a1134effac000cb051a48e974--
