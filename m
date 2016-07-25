Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D988E6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 22:38:58 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id m101so179996395ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 15:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xGa6UbMGe1r5iJdz41OkZqtOAmU6vLvZpwpB1QyvFCQ=;
	b=1g/0iLGdFf4IqB2l7WvuQFHJdbnedCREi6vD/ba5pyj1BbuOFfLXVnL7QTh/xbUdkk
	pN4CCdRRlurOIRi7BE+eneMzHFH1elYRfGST6R0l7S04gtTj+pc9lFe+qKAeoTmml9VW
	PuKGrCZEGNUYeZyI6wRMDBcFt4UYRKR/vORIYTP1QgkFDL+2MjgnJU1ARt4Ar2llQK1i
	bweai/NtOgHZtl8acA8PatSVkqP/JS0z/CIdEJ2tI3W8QXKuFJMl4msNnezaLJoRoW2W
	VvzfizJ8QYzEQt5KDqXkbXKGIMI4z4QpAPtzTrB3CfdJOfexOfUwRODkmc0BdAptVinG
	NIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xGa6UbMGe1r5iJdz41OkZqtOAmU6vLvZpwpB1QyvFCQ=;
	b=Zn7LU0jy6X2YHECYyq2oV2kJw0oNa5z9nF7Jh7Am4va0/5VOZdy/IzRDnrah3SKsGK
	IPaEhYVfnQu7QJ8+krw6c8EThy7iQS6n8ehRamty68TEI9H8tO5uTnx6vEl3TdDs7/Vn
	Ywb0bGmI2y4azId8ayzRN2V95B/URJZL/ngOv817Qw9WaUHv+JRrwLF6R6cYEGq9oLNj
	CpGGdveZA2a7LKDKLcMSCzYIwgnAAt/5pGZ/GYn0r944LBVIFo+y+8HMsQbU8mdQ3y44
	aV+2EQkzINBHBLeEnlcOgZU8OCr0HH4xv9qBY8/E8AJpbzpSzG7DR9kS0NqsnsyA6epF
	fTWQ==
X-Gm-Message-State: AEkoouuHwiZUaeXvGVlL9w372EDywBXV1ladJhrJ4l22Ppldnn7/l4j8mgq+P69PrZDJKcI/71RBN8AASCM4mEMA
X-Received: by 10.107.135.142 with SMTP id r14mr24899210ioi.133.1469486339451; 
	Mon, 25 Jul 2016 15:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 15:38:40 -0700 (PDT)
In-Reply-To: <4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 23:38:40 +0100
Message-ID: <CAJTo0LZG6Zqonn8miXcDzG=CxqcWgo67du49FX4ZMjw48nU1pw@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] selftest/runtime-test.py: Add test for import test from other layers
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
X-List-Received-Date: Mon, 25 Jul 2016 22:39:00 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc441c2205387d73be

--001a113eccbc441c2205387d73be
Content-Type: text/plain; charset=UTF-8

On 13 June 2016 at 14:32, <mariano.lopez@linux.intel.com> wrote:

> +        features = 'INHERIT += "testexport"\n'
>

You mean testimage here as that class isn't inherited by default.


> +        features = 'TEST_SUITES = "ping ssh selftest"\n'
>

This overwrites the first assignment to features, and neither is actually
written using self.write_config().


> +        # Build core-image-sato and testimage
> +        bitbake('core-image-sato socat')
> +        bitbake('-c testimage core-image-sato')
>

I personally believe that core-image-sato is massive overkill for selftest
and core-image-full-cmdline is just as comprehensive (has ssh, for example)
without building all of Sato.

Ross

--001a113eccbc441c2205387d73be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2016 at 14:32,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mariano.=
lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":132" class=
=3D"a3s aXjCH m1554bb3cfec465aa">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D =
&#39;INHERIT +=3D &quot;testexport&quot;\n&#39;<br></div></blockquote><div>=
<br></div><div>You mean testimage here as that class isn&#39;t inherited by=
 default.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
132" class=3D"a3s aXjCH m1554bb3cfec465aa">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;TEST_SUITES =3D &quot;ping s=
sh selftest&quot;\n&#39;<br></div></blockquote><div><br></div><div>This ove=
rwrites the first assignment to features, and neither is actually written u=
sing self.write_config().</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":132" class=3D"a3s aXjCH m1554bb3cfec465aa">+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 # Build core-image-sato and testimage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-sato socat&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c testimage core-image-sato&#39;=
)</div></blockquote></div><br>I personally believe that core-image-sato is =
massive overkill for selftest and core-image-full-cmdline is just as compre=
hensive (has ssh, for example) without building all of Sato.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbc441c2205387d73be--
