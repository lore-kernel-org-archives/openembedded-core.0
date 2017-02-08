Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5393571C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:07:36 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id v200so86378337ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BP9R0OrbnnptRuFndHUiKm6fUt5KUY1EyyTEJRqigNk=;
	b=D/TiqTDwo3XAhGlFJmfLprklKbLyCALkAYbLUqIfve51jXc82oAS3R3u0ZOxXlTWLp
	S44vL6r9J5RLG24I7xgXdp1iMigsEjkouyJYAm2zID6CS47GJFSix8ZhHNC+hRKlkgRK
	9Gtshjqx66deIYIQaqfGa8Bf7Yj1Z4lbMDg2smG4LiRKK5qBcqX52X0mFMI9OveVvoSC
	PrZeIdUlbTEUDk1NnVHqKi9bq9/W1YWZ1ibPmIG9Z3V3k/DQJXPBiD7VK5JjHZeKxYEC
	ZLIzDoCKvL5aO5n8Hk0IThRVAHI0P6pDHU0yI8RyHLuwjgyXKg9J9V21z/Vh01O1/Xzc
	ax8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BP9R0OrbnnptRuFndHUiKm6fUt5KUY1EyyTEJRqigNk=;
	b=YWPWG2HmcGRGuRps2iluDFVk1X9Q2JCAb4+ZOGIEuPzBZGMMDSaGLFXRy3/YQaX+6l
	cJdn2j8w8YOhfAQMZX+04ZvQoAwm1hi5OYe+mekawsPuCH04eTRQTUxODg0XClOtYpUT
	qHzC7uzB2vxpvMEznX2zt8qyYLLw0ePZlamYxWUPy8mU59CQCbKUNzBYa3CyAbxBlUeF
	h3PU9ChHKj+3dOjpMUmVkDA9+HsuLkpVj/4vTgUFudz52sHFhztvwPVgz4kMxCKmCvDj
	biuK+c2l4TK5Daix3HHiiK72BB6YGRe7uASO3Qd1qYL1551hIMTgDAk/gGszWApvZUWk
	Q7FQ==
X-Gm-Message-State: AIkVDXLvZcdy1NfWR6M+Y8b07UOPMShITe++bvyzH4oX+mjxjVMhvJ5CDxEB4U1kHvroR/nS6siBNMi9bLBDbdUd
X-Received: by 10.129.152.77 with SMTP id p74mr14007148ywg.177.1486562856967; 
	Wed, 08 Feb 2017 06:07:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Wed, 8 Feb 2017 06:07:06 -0800 (PST)
In-Reply-To: <a124d3f3-a46a-e84f-a30e-904e02ce8bc3@mlbassoc.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<1486561983.3754.4.camel@linux.intel.com>
	<a124d3f3-a46a-e84f-a30e-904e02ce8bc3@mlbassoc.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 8 Feb 2017 16:07:06 +0200
Message-ID: <CAHiDW_EgMHAoBO+CnMEnTC6AMKud9GUZw_obX9i8GLGD=sWrVA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 08 Feb 2017 14:07:38 -0000
Content-Type: multipart/alternative; boundary=94eb2c0bbf56070bbf05480563ab

--94eb2c0bbf56070bbf05480563ab
Content-Type: text/plain; charset=UTF-8

On 8 February 2017 at 15:57, Gary Thomas <gary@mlbassoc.com> wrote:
>
> I agree - if ruby is OE-core worthy, go most certainly is.
>

webkit-gtk needs ruby-native as a build dependency. If that wasn't the case
ruby would almost certainly not be in oe-core.

Jussi

--94eb2c0bbf56070bbf05480563ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 February 2017 at 15:57, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wro=
te:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
I agree - if ruby is OE-core worthy, go most certainly is.<span class=3D"HO=
EnZb"><font color=3D"#888888"><br></font></span></blockquote><div><br></div=
><div>webkit-gtk needs ruby-native as a build dependency. If that wasn&#39;=
t the case ruby would almost certainly not be in oe-core.<br></div><div><br=
></div><div>Jussi</div><div><br></div></div></div></div>

--94eb2c0bbf56070bbf05480563ab--
