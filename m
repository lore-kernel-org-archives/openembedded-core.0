Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1D92971A78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 10:26:24 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id v138so65326544qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AZTPH1CZ+zQaGwSAXqoQTnCZ1taV6zXh7AZKhTearzU=;
	b=lif8ZawW5uNgGmzT2zOTpLOQBcgumKPTZ7MCVAJXRX0Hk3RVNhQN/2v2tjnNDuoLr7
	qxUqbVfifqRBCw4LwF+RVCCI6GKHvs1q/ieYGU8oT6vsV4ColsrGJWWk2w+hpmv32gpz
	7eakm8xft0pvJBvRyvz+yMBVsjrL8o4RpdZpHODrqGxHsPxtcXe8GJJIlrWV0hTGh1Sx
	s93YkdR8YEA1fGjE3cCWUAQky9D+w4OsjEnXLs4Z3D4+/UwBwlVAsWmiwoW1JMf1fWu6
	JgcW5XVTc5rxh61mpUdoZ18/2Q0J6q5CnrZaAR99oGwzgn4DnrnykR6WTReKnUUzctxP
	Dvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AZTPH1CZ+zQaGwSAXqoQTnCZ1taV6zXh7AZKhTearzU=;
	b=Jejj3ytFhdCwhmO1TJjAlmqnl1jRBQ7UCMhYzZB+giYqwVDiy6nlTiSfwHPzctAnAi
	umTJYIyVGaIHsablcC7lP9YY0zWxo8lbUe31xxC6bxoa/KESGhFDaXJlL8NjZPgbZLth
	Dq8HP69nxTPhxHwgAsIgH+dY4K+0Ub9J2b9CHBsLMT+V5PickG8uKeBHaxiOAOegLEYL
	66Wi4erZ8B4OeAj+45FfrJziNR8db1Epq1l91TO+rXNDQ7+VR5E1D1o2hHWRleoKmG0A
	jDarkMtAUiB5+K/FtCgXkqOzwgDjl8yJlOgzRZ4+0pikf8dAXUZ+Pv1AhIXEck5DK7Vh
	n0Dg==
X-Gm-Message-State: ABUngvd7VKE/5ln99i6bto5eHGL5KtAfOrm8eDDj5TepcGO5402cN1vntxC7gJUenB3wuQnnnIW11DjbmU7sCFba
X-Received: by 10.55.31.157 with SMTP id n29mr22192582qkh.221.1477909586039;
	Mon, 31 Oct 2016 03:26:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Mon, 31 Oct 2016 03:26:05 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610290343130.7545@localhost.localdomain>
References: <alpine.LFD.2.20.1610290343130.7545@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Oct 2016 10:26:05 +0000
Message-ID: <CAJTo0LYORU9-1SCYVikomMkQA=XGJ=PNn5PpFg37+X5ubvXj8A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: couple questions about proper PACKAGECONFIG usage
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
X-List-Received-Date: Mon, 31 Oct 2016 10:26:25 -0000
Content-Type: multipart/alternative; boundary=001a1147f228e2ea2d054026a38f

--001a1147f228e2ea2d054026a38f
Content-Type: text/plain; charset=UTF-8

On 29 October 2016 at 09:08, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   actually, that might be it for this post ... am i missing any other
> subtleties involving PACKAGECONFIG worth mentioning? another
> PACAKGECONFIG-related post coming shortly, but it's more focused so
> i'll post it separately.
>

The only interesting thing is that the behaviour has changed recently: the
PACKAGECONFIG implementation now sets PACKAGECONFIG_CONFARGS and it's up to
the recipe and/or class to do what it needs with it.  autotools.bbclass
adds it to EXTRA_OECONF, cmake.bbclass adds it to EXTRA_OECMAKE, and so
on.  In the past it was added directly to EXTRA_OECONF but that made
integration with non-autotools harder.

Ross

--001a1147f228e2ea2d054026a38f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 October 2016 at 09:08, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:sw" class=3D"gma=
il-a3s gmail-aXjCH gmail-m1580f941823ace4e">=C2=A0 actually, that might be =
it for this post ... am i missing any other<br>
subtleties involving PACKAGECONFIG worth mentioning? another<br>
PACAKGECONFIG-related post coming shortly, but it&#39;s more focused so<br>
i&#39;ll post it separately.</div></blockquote></div><br>The only interesti=
ng thing is that the behaviour has changed recently: the PACKAGECONFIG impl=
ementation now sets=C2=A0PACKAGECONFIG_CONFARGS and it&#39;s up to the reci=
pe and/or class to do what it needs with it. =C2=A0autotools.bbclass adds i=
t to EXTRA_OECONF, cmake.bbclass adds it to EXTRA_OECMAKE, and so on.=C2=A0=
 In the past it was added directly to EXTRA_OECONF but that made integratio=
n with non-autotools harder.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1147f228e2ea2d054026a38f--
