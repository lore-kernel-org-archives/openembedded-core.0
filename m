Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5304565CC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:04:22 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id 11so37691847qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 05:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dQcGd1FAflVW7t1f1cTSzXK8eCT7aEH8U6+QEoEmHds=;
	b=glTMxpdui+RLIs6HB6oCL0zj+vg46Gh3Qzj1xlBq/SwbenUfkqyO5HQiQk5TaF98BC
	muDfepNOabuJni9i/h0dFEUvGOzn1Lk3um0PBul3Zq9l8qbcd9F8hpQaHKiYxo+CS9/8
	1Yllhbw39ioyTXST3SAP/LqMRLczDmsdx205lBD2vRfX8NwftDi6HoXDVQZ2MOKNNOwt
	xNqJwMKT/UjBYPzNv4E/u3G6APg899AtxNXvHm60AgaySiBHnb+mz8GA8RK17FYtDi9f
	FIUggtxNaDyEfFGsoSoJzuOA7Dsvhwc2OeKhTf/vZ5QddfB7ej33Ypt1tDy2phynDfF+
	axEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dQcGd1FAflVW7t1f1cTSzXK8eCT7aEH8U6+QEoEmHds=;
	b=BaD0nqXrOmlBTKV5qRWZFLMq9PDlNl1vSS8s/I3sQOBhU6W8GcIyLZGNw1nN3DR0nQ
	d0m0LF1MZHPh97D1hjef7d08zjQgSwXsqjyuXwdZ8w66SRtkDMW/VKI8nBCbFuDcKmSK
	oqcWgAkJPeUp7ZWzx3WZvvRpQShWeuWFEFuSFisicVToIQYyW2jTL5WbKCBkyNSzrMtK
	ZBSX1WDkbh1JxX3zrynEynjyhrLBdPa/l3HkMhyd5ohHkPaMcN3FpI8DIREDmv0Ve0MD
	z0dqvkY1/enCSMX3IaRi8tJX1j3du32to5LBQQUto3t4bgeNZFO/Yv8FVqPAhOadoNzL
	7zLQ==
X-Gm-Message-State: AMke39mHXLigDGA5N5ATc58fh17mJT0wSIsR335wq1B9/WPyCStQU9yZb1fbtb3aR8OH4i11zvJGxXaSD8FELn7m
X-Received: by 10.55.175.195 with SMTP id y186mr8093687qke.26.1486731863353;
	Fri, 10 Feb 2017 05:04:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 10 Feb 2017 05:04:02 -0800 (PST)
In-Reply-To: <f9a4abbc-498f-ce04-f9c4-c2c08e9b8be1@linux.intel.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
	<f9a4abbc-498f-ce04-f9c4-c2c08e9b8be1@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Feb 2017 13:04:02 +0000
Message-ID: <CAJTo0LajMHhcvkD5w3R14ZdbG1JUmop-tVoehyw8+KrBL1z8Rw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Fix cve-check (for recipe sysroots)
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
X-List-Received-Date: Fri, 10 Feb 2017 13:04:23 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c97b18c05482cbc24

--94eb2c06093c97b18c05482cbc24
Content-Type: text/plain; charset=UTF-8

On 10 February 2017 at 11:55, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> I mentioned error output improvements in email  but did not implement
>> as that requires more upstream changes: I'll talk to the maintainer
>> about them.
>>
>
> Isn't it so that the upstream maintainer has abandoned this tool (and the
> Big Rewrite of it too)? Then we need to find an alternative approach, or
> roll our own.
>

Abandoned may be a strong word, but I'm not sure how much development is
being done.  I do plan on looking at this and dedicating some actual
engineering time towards it soon.

Ross

--94eb2c06093c97b18c05482cbc24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2017 at 11:55, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I mentioned error out=
put improvements in email=C2=A0 but did not implement<br>
as that requires more upstream changes: I&#39;ll talk to the maintainer<br>
about them.<br>
</blockquote>
<br></span>
Isn&#39;t it so that the upstream maintainer has abandoned this tool (and t=
he Big Rewrite of it too)? Then we need to find an alternative approach, or=
 roll our own.<br></blockquote></div><br>Abandoned may be a strong word, bu=
t I&#39;m not sure how much development is being done.=C2=A0 I do plan on l=
ooking at this and dedicating some actual engineering time towards it soon.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--94eb2c06093c97b18c05482cbc24--
