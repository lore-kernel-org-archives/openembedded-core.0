Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB5860B98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:08:42 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o28so4813776qkj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=81Aby50R92oZxqFe9gAabulCfgKrQBlZLo5pYuxTBCE=;
	b=OC6lGdPQnk3NFWTtaMNX3070KZ6gGnMRIl55eWmQAbof6VudL4S5tAXBxByorQBYYE
	5uDnIdGu3Uvmfby20Z7L7zMrpzYs4wn4B9/BebPAuFxxEWpXGpyml61zBeYcETaJ6rrc
	1R9VKHRhM9MtggoxOTC4WX7PNgSIQU/TEg21kDTPlKckhmCH8MWgP0tL+Q753bZoi/v+
	0P2NcOuHeaeGTljrZfHVO+2mF+phbecomr8IKVJgW3l2w6bHqFaKge2hALLfGvahdPCO
	/5RdmzQqtTN0f6eWI9DiiKMnhAxbXbLoQlFUJsg53gkx0s8HUBBr52n4DC+c4YNQxmKx
	CH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=81Aby50R92oZxqFe9gAabulCfgKrQBlZLo5pYuxTBCE=;
	b=av1/VowUGPmv92ufQtxvu6iEBCWzCU9K2xII9Pmr3kbOu46gM73l5KG1YMdqk/73wI
	bPnaC3awIR4g4i8Orr7y/IYi3VBz6bAAvpfOLZBCCl7tRpmlN/w25lYHadY2mF1Ye3f4
	A4MHInh2oCw12ET02bbhep0LjDn5ZvXdI4zb8YHzgEEF3iiRF2AFSX/B1hJG6hvLv+oP
	a3qByc+olMTA5k6iasHvgmPAI+XhelFBKmWGGLcJZaHqGzGBAPQNB8MpJjoyvomyISyv
	yxPDOj6tuMg13AhjDD587qsBMCAOLZ+nj+fZwiwsyElfLlSHuDerSBGc7ilN8NHoML5S
	ntdA==
X-Gm-Message-State: APjAAAWMzrVr6re9sgtjUzHGnGDQaY+89/kgmJ96Ke/jKaNXKzBrAMmH
	4REfj3GgrUgjytXQKkRMfBvGioEdHCKJOc6I7uofPv6a
X-Google-Smtp-Source: APXvYqzkJ29gwLzdWYL2XBxipLvNDWgmQRnLJKshqSZmo4BddiYX+Kgm7UQN1czzUiKPf5bsbL/asVbn/RYbN8B3qiA=
X-Received: by 2002:ae9:e88e:: with SMTP id a136mr237180qkg.71.1581610123259; 
	Thu, 13 Feb 2020 08:08:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<11cf7d82deafd496d30a4a28a38a3b1121762f9e.1581575578.git.raj.khem@gmail.com>
	<20200213073151.GA20530@localhost>
In-Reply-To: <20200213073151.GA20530@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 08:08:31 -0800
Message-ID: <CAMKF1soC2w3ntocLEeWyxMZ+sSUtCu6X0L9Co+iTTmd4Rxb-Jg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] binutils: Bail out if gold is used on 32/64 bit RISC-V
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
X-List-Received-Date: Thu, 13 Feb 2020 16:08:42 -0000
Content-Type: multipart/alternative; boundary="00000000000091f4b6059e774d3f"

--00000000000091f4b6059e774d3f
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 12, 2020 at 11:31 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Feb 12, 2020 at 10:38:22PM -0800, Khem Raj wrote:
> > gold is not supporting risc-v yet and, this will cause subltle errors
> > during build e.g. autoconf not finding certain features like visibility
> > and it could take a while to unwind the problem. Its better to error out
> > early
> >...
> > @@ -163,3 +165,8 @@ inherit update-alternatives
> >  ALTERNATIVE_PRIORITY = "100"
> >
> >  ALTERNATIVE_${PN}_class-target = "${USE_ALTERNATIVES_FOR}"
> > +
> > +python () {
> > +    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False,
> d):
> > +        bb.fatal("Gold linker does not _yet_ support RISC-V
> architecture please remove ld-is-gold from DISTRO_FEATURES")
> > +}
>
> This lacks some check for RISC-V,
> currently it errors for all architectures.


Yes this in itself was not enough please try the v2 series


>
> cu
> Adrian
>

--00000000000091f4b6059e774d3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 12, 2020 at 11:31 PM Adrian Bunk &lt;<a href=3D=
"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Wed, Feb 12, 2020 at 10:38:22PM -0800, Khem Raj wrote=
:<br>
&gt; gold is not supporting risc-v yet and, this will cause subltle errors<=
br>
&gt; during build e.g. autoconf not finding certain features like visibilit=
y<br>
&gt; and it could take a while to unwind the problem. Its better to error o=
ut<br>
&gt; early<br>
&gt;...<br>
&gt; @@ -163,3 +165,8 @@ inherit update-alternatives<br>
&gt;=C2=A0 ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ALTERNATIVE_${PN}_class-target =3D &quot;${USE_ALTERNATIVES_FOR}=
&quot;<br>
&gt; +<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld=
-is-gold&#39;, True, False, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Gold linker does not _yet_=
 support RISC-V architecture please remove ld-is-gold from DISTRO_FEATURES&=
quot;)<br>
&gt; +}<br>
<br>
This lacks some check for RISC-V,<br>
currently it errors for all architectures.</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Yes this in itself was not enough please try the =
v2 series=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--00000000000091f4b6059e774d3f--
