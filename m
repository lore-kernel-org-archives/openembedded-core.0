Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2343C7199D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:41:36 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id l75so1864199ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 23:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uIw/CCZhuFYI0gQMJHduPuc8MOHmtRA+4fUIPzzO0Fg=;
	b=ZOVvvzyKlAHciY52dXTQgBZpYt4196OnfgAgcyG2WyoWCnYXQ0/d51FLld7v/miLgb
	7d60FhEaVqe+/YS4x+QfF7B7d5ErO3xaRrhyaytmz/yGfAJM0+CE+GocKjLRCDlm5dGe
	TYiDHroWLI31kf4ncX/+KLmJgRC5jsPikS0p1NKvd2b+b+SKTEnxvcgJN0yB6WMDOiRn
	qFZa4qp78mPLmRiGblNcY4I/r9/uFDPdvOB5c87cWrG0GUCXz8+uaBSO6ukENvFblpWV
	VVmAEJpS4VHCdOLJfAudIqxYwpIVOzr0U9fo57mf/s3D8ID1rVptw7okjH+tnsoFaenC
	F/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uIw/CCZhuFYI0gQMJHduPuc8MOHmtRA+4fUIPzzO0Fg=;
	b=KVYudExtc20KyPl4tFXVgPmlS6XJ8nUMecbaiBBAAe2xAOXSon3H2yN5M6aSQAO2Lx
	OivYisYotIiQVszkGhCv1IEUYjNEbOmAzl4RTVzILvLhxzjQKW6DAZDsB6tvjzMPC4hw
	F6GpYhuroLn4FQBYMWJAt/Ra1eDcVvvtzVdfM92IrWzUoa+WRcaCP9CS3Jzj2aHEPgjr
	Y/kLPz53y/mL5v5hChyI43XOxq1D4CMA2mze7v3aBt3PlQP5Nsa1/ERTFBRLj7wVjp/1
	+uDD5lTjxml7MVbh8N+BtXdVSBAo5kJRkw45GJteyLyKwaqE5F6uweF2zkU9b24R30Dc
	1JNg==
X-Gm-Message-State: AKS2vOxPcMT+dKZtCZIzxJSXGqz6RB9BGDgl/m0RR4XxiJwMzBTdhqJf
	bS8z2wE75Dmg7lBwGZQTGhJQQ7JTng==
X-Received: by 10.129.80.193 with SMTP id e184mr3353236ywb.44.1497508897656;
	Wed, 14 Jun 2017 23:41:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Wed, 14 Jun 2017 23:41:37 -0700 (PDT)
In-Reply-To: <4e21f51a683e80b8e0098504f05d524de10421fa.1497278129.git.raj.khem@gmail.com>
References: <cover.1497278129.git.raj.khem@gmail.com>
	<4e21f51a683e80b8e0098504f05d524de10421fa.1497278129.git.raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2017 08:41:37 +0200
Message-ID: <CA+chaQc2z4XkSsmVBLOzcK6iu4Xfx708M5+M6s10NdX-7XaPkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gcc: Add recipes for gcc-7
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
X-List-Received-Date: Thu, 15 Jun 2017 06:41:38 -0000
Content-Type: multipart/alternative; boundary="001a1147e4e2e497310551f9f506"

--001a1147e4e2e497310551f9f506
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 12, 2017 at 4:38 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Switch default compiler to gcc 7
>

I'll try to switch back to gcc 6 to confirm this, but something in latest
oe-core upgrade made WORKDIR to be significantly bigger (even when using
rm_work and building in smaller steps) so now it doesn't fit in tmpfs I've
available on jenkins.

Any idea what might be causing this?

--001a1147e4e2e497310551f9f506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Jun 12, 2017 at 4:38 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Switch default compiler to gcc 7<b=
r></blockquote><div><br></div><div>I&#39;ll try to switch back to gcc 6 to =
confirm this, but something in latest oe-core upgrade made WORKDIR to be si=
gnificantly bigger (even when using rm_work and building in smaller steps) =
so now it doesn&#39;t fit in tmpfs I&#39;ve available on jenkins.</div><div=
><br></div><div>Any idea what might be causing this?=C2=A0</div></div></div=
></div>

--001a1147e4e2e497310551f9f506--
