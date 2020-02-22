Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by mail.openembedded.org (Postfix) with ESMTP id 374466172E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 21:00:13 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id g15so3481688vsf.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 13:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=snuFwx4pFcYSBnHE3IVDfzIRNruAme2ck9Ig29hgjDQ=;
	b=JG5hgQVvNs0cStcmYtVOBAgUvaUnrLvcCLOmCDn3KAu3diGakAynoK7JpOhrxKVtoG
	jGp0yNLskZdN0M795zRrjpGBYIAduLkGrW3DIbroWS9kBkxiVcODxeLW1vQ4eO4CI98d
	5J03mNZ61i/M5CrSFg3LMPDngQ1SXb0DWPqMMvriccR3bIBXR7Y+48VIiY+JrF3Q0H/Y
	ri7Is3ZZH2kzyTwgiSBxDX2cqOu12569w9fAR7CHeMQgU+b+RnOQF1PhygaZI+thCpTu
	m3c2P1kresMKJPwLLJdrumoQjFuES7EjIwVZMECnDPbfFpGWsyFxYFQBWIUkKMVk/nQi
	EWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=snuFwx4pFcYSBnHE3IVDfzIRNruAme2ck9Ig29hgjDQ=;
	b=LLXazuDcpar+HXq96Ht8Ff4q6ecQ4sLKnsCYcszSbDlTI4N0ns36aBgtMJ3CsrwMZC
	uH+04VxuhnQr9TGa2nLEc2NTloa2zOWLYyMkvWpF68CzUcUbn9s9sKmFBFS+fPlp10ki
	7w8SFvvB7mVAtbfS2GvxsPfNPmSVEUJppyTXc5jKUE/ttDIl4jGty1N7cuvyuDyMF7yE
	bnbFux/DdwbruFy9/XDg/Tc00K9x7KAt7vbgJZS6ZhERitmt4x+vRF0ffF1QEfTNK0W/
	uB613nxUhFP/2bAFld2P2WHpidZ2/wGyQLqCaEJm21wvI7sJOgv1IkxO6uq1tvxv+JXM
	gkug==
X-Gm-Message-State: APjAAAXxIhrISWzVkMkpk+9xa2cO43Wtc2qp/wCTTgZ50tk9L4wIWPMo
	C+L1qsKnOprgXP0kCQSFSCpccT9g3MxeL0GRLMfKbA==
X-Google-Smtp-Source: APXvYqxw14SM2WVNQpvEpsgiCTVXOMthXZ4AnmOlOdFZOh7+yrdlW4fBfXFV+Drb0MAoMkwb7zI/1ZqcJ/MFeLz9Vwc=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr23489433vsa.25.1582405213976; 
	Sat, 22 Feb 2020 13:00:13 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2002221554210.9952@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002221554210.9952@localhost.localdomain>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 22 Feb 2020 22:00:01 +0100
Message-ID: <CANNYZj8EchSZ1vEPiOnx9n9X+osuikbL9hvYpnoykkPY+k66Og@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can i totally ignore recipes not related to the current build?
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
X-List-Received-Date: Sat, 22 Feb 2020 21:00:13 -0000
Content-Type: multipart/alternative; boundary="000000000000ab7c87059f306cdb"

--000000000000ab7c87059f306cdb
Content-Type: text/plain; charset="UTF-8"

BBMASK?

Alex

On Sat, 22 Feb 2020 at 21:59, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   i have a layer (from elsewhere) that needs massive migration, and
> generates numerous parse errors, almost all related to a specialized
> image. my normal workflow is to try to build for an absolutely stock
> core-image-minimal, so i don't care about any recipes or .bbappends
> that don't contribute to that.
>
>   regardless (AIUI), all recipes in all included layers will at least
> be *parsed* for syntactic correctness, even if they don't contribute
> to the final image, so i'd like a way to somehow totally ignore all
> processing of recipes that don't do that.
>
>   i'm aware of PNBLACKLIST, but i'm sure i verified that that simply
> won't *build* that recipe, but it will still be parsed. is there a way
> to utterly ignore recipes that don't contribute to a given target? i'm
> sure there must be, i've just never had need for that until now.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ab7c87059f306cdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>BBMASK?</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, 22 Feb 2020 at 21:59, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crash=
course.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
=C2=A0 i have a layer (from elsewhere) that needs massive migration, and<br=
>
generates numerous parse errors, almost all related to a specialized<br>
image. my normal workflow is to try to build for an absolutely stock<br>
core-image-minimal, so i don&#39;t care about any recipes or .bbappends<br>
that don&#39;t contribute to that.<br>
<br>
=C2=A0 regardless (AIUI), all recipes in all included layers will at least<=
br>
be *parsed* for syntactic correctness, even if they don&#39;t contribute<br=
>
to the final image, so i&#39;d like a way to somehow totally ignore all<br>
processing of recipes that don&#39;t do that.<br>
<br>
=C2=A0 i&#39;m aware of PNBLACKLIST, but i&#39;m sure i verified that that =
simply<br>
won&#39;t *build* that recipe, but it will still be parsed. is there a way<=
br>
to utterly ignore recipes that don&#39;t contribute to a given target? i&#3=
9;m<br>
sure there must be, i&#39;ve just never had need for that until now.<br>
<br>
rday<br>
<br>
-- <br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://crashcourse.ca" rel=3D"noreferrer" targe=
t=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ab7c87059f306cdb--
