Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC7A7ECF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 16:16:14 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id b2so5808088uak.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H1mWjT5S47+H8LDU+VVCPAJuvIt6VdFvBU8t4Ck3YrQ=;
	b=rKLQ1SCWY6AvX/N/BQyaEppBNsl95psK3CaZ2ga5AKPJNkpocehHn3m1hx5Dtzo4CU
	jJAZ8d2fIu3qd02vLUFLuxYcC1PSqOnUGWkg2TlBPDIYFUPaDfKmh0q/OJ+ITCZprw8c
	UjFxQBWhx7YTvGq0lr9bc55Bh8exOf86r38zGzDyhy4OkuhSS+exr6ew3Z6q2ia3pqvt
	f75wSilgibMeLf8opzJboFXzIITYoNttV0Q3NRi7nSDrfxfBUM5dk/Kng7HU1Kk8i8L6
	kkq1u+KSWIAysvp7Vbsz8BDF960Y9n0OtrXR4cgGq0h7sUrJmODVVP00aa/tKmOyUUbg
	nMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H1mWjT5S47+H8LDU+VVCPAJuvIt6VdFvBU8t4Ck3YrQ=;
	b=ppNnhrekpML3TIdtSLc2AC/zbHLw9roMCyMaoxlne7gv8+6rh+ehLhBNvenp7aYhyY
	7xzrcPgiT1X6n2jdmCaDJBQbMlitgB0EhI3CPwMA6RzFCaBCKNIbtXKZfzMAv6fxOnLp
	HnyYDemiVgF8IaUfBj0Qj/mNJaeFMb//wsS+tdDN5Ex21jOZyPN0nE2icjAXdestl2OP
	MlXEZlZ++FmYLu2P273ISdovNSdLqnUu90vyl/RWOcWusBLL/sY6NbEsDOHRivDXrOLa
	T/oaC1sJzQl6Cml0xIN9o3oUx9id6jNYJoEm5pIWCwjilybzm4ezXjCbNwGM+dn4VJV8
	IUJw==
X-Gm-Message-State: APjAAAXogLQaq2sBRr6qkcxrYrDz8DjaofrdnWyc61DiwQ97lCvGkzrr
	k09luWIQu0oC2bhdjU01HXCC39Kjp5wdiqG86Sw=
X-Google-Smtp-Source: APXvYqxu82Q3aPDL5gO6U4krZdfaua9nigQqWLIHPHoz5iKs3AGqWb9mQwQHV8lG8z2GeVeX6FY7SHfe32rNjkfngWg=
X-Received: by 2002:ab0:70b1:: with SMTP id q17mr11752689ual.100.1566922575160;
	Tue, 27 Aug 2019 09:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190827124617.18207-1-JPEWhacker@gmail.com>
	<CANNYZj_zr9+LbbGfhtd46pnUBYgpSW5LL5pE_fuvhxwne6yPrA@mail.gmail.com>
	<de80b1e5-dc0e-cabc-409a-0c8c84bc8ef2@gmail.com>
	<CANNYZj95TRH_+XELYLHGaBrg5gFfgOrpV+pvL5EjfQiXXWavEA@mail.gmail.com>
	<9a4134dd-dbf3-929f-379b-4ea8e3e098ee@gmail.com>
In-Reply-To: <9a4134dd-dbf3-929f-379b-4ea8e3e098ee@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2019 18:16:03 +0200
Message-ID: <CANNYZj92UK7HsdezbX_X3mWRrasUbTLfDMhnxLf_paRDuzmFZQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 16:16:14 -0000
Content-Type: multipart/alternative; boundary="0000000000007ba7b305911b97f7"

--0000000000007ba7b305911b97f7
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2019 at 18:12, Joshua Watt <jpewhacker@gmail.com> wrote:

> It's not populated just once. Any task can add things to the RSS as the
> build progresses. However, the RSS is only cleaned out at one specific
> point early in the build, which I can't recall ATM.
>

Can you point me to a specific example of tasks adding things to RSS
please? I'm fairly sure I haven't seen this happen yet, so would like  to
know the mechanism and use cases.

Alex

--0000000000007ba7b305911b97f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 27 Aug 2019 at 18:12, Joshua Watt=
 &lt;<a href=3D"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">It&#39;s not populated just once. Any task can add things =
to the RSS as the <br>
build progresses. However, the RSS is only cleaned out at one specific <br>
point early in the build, which I can&#39;t recall ATM.<br></blockquote><di=
v><br></div><div>Can you point me to a specific example of tasks adding thi=
ngs to RSS please? I&#39;m fairly sure I haven&#39;t seen this happen yet, =
so would like=C2=A0 to know the mechanism and use cases.</div><div><br></di=
v><div>Alex<br></div></div></div>

--0000000000007ba7b305911b97f7--
