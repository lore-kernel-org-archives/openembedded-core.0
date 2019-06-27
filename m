Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 10C0A6B8BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:46:23 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w7so1001058oic.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kAav/eR2e02P/diq7W8s5HF8L1eY/zK7wNCU0ckKsV4=;
	b=gEHhxrJo2rw7hIBca2IrMHbsPk3b8V7MFCGeuvqY08/qfSIkEaJy/kOPEvS2hSdtKf
	R1eVYhCyvIjQOypN6ce/qBtYZGKDRnjvgErqspBOMoIHzJLm4UEpsyxzpQI6H0y3OOyL
	JGHsYjIvSRbYo4unTnVPwHOl/GZTaQneBfM0kXm+1Nm2M54ZeLXque4H9ZFgf14rjXho
	AChxKMpavXHMXT6b/Iq7D7xRUAQo6VcSjyUJ+Z8YxNCO1fVmKlV0N2dXAdVlJvSTIgH9
	aQP3NwdxCoFTWYRqriiglvleq3X9+MhCkHGH1pJT9KrWQTVy9EAnUl13yiqflf226L9p
	oEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kAav/eR2e02P/diq7W8s5HF8L1eY/zK7wNCU0ckKsV4=;
	b=fwRNydPozAuiyj/POSEPBPVuXJ+DJbNhfcCvHHYbxd+lLpTo/KzebrZ7kWfzea2+4j
	TS2n0B6IvMByG4PDzHoDrUXreki0pHWQCwF32UiOL5cfXRYE0YFs9aNH1sJk2UWeVXrx
	pZtZC5iMRzIpqGl72RAwVlNljREkwP4iOnIFeD2fpol9B22QPPBmr8ihaSs4cjlbv4sZ
	JKEJzff5PT2KrmdkJy+Kr+E82ajdupFvaeNNo22sna/PxDRHXpbSiRzDvZ9XvXn/1jkM
	1iLmokBt2dGEbFjH6lbkGf6z99a6Sj0TdWTjj607BB8hAsjLxtJN+bNNP6imNJ5GSuWN
	3BmA==
X-Gm-Message-State: APjAAAV+Cud25uaO+4IByfGEocyNW6LqPOSkbnM9a5hDgGy5lJGA5afV
	Qa1Wi6yea8ZpwMwnF6oBJcmz1RlOAwKudExbhuQ=
X-Google-Smtp-Source: APXvYqzdwWi4sPmx9SIq47iDXF5Ll5F/sZSw0kxMAEmle/jXeYNd23N5D0s3BSM9UprMyF5rAuVpjop6IR4YCCAF5ZA=
X-Received: by 2002:aca:48c2:: with SMTP id v185mr1567183oia.132.1561625184957;
	Thu, 27 Jun 2019 01:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
	<5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
	<5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
In-Reply-To: <5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jun 2019 10:46:13 +0200
Message-ID: <CANNYZj-Oow=4m4A1a6k+Mcjo6qf5cnCAR5_OGrhitM1-XqZALg@mail.gmail.com>
To: Sinan Kaya <Okaya@kernel.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Thu, 27 Jun 2019 08:46:24 -0000
Content-Type: multipart/alternative; boundary="0000000000006bfbab058c4a3202"

--0000000000006bfbab058c4a3202
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2019 at 00:57, Sinan Kaya <Okaya@kernel.org> wrote:

> Let's see if we can peel the onion.
>
> Can you explain how it was designed to work for cross compilation use
> case where host machine architecture != target machine architecture ?
>
> If I understand this right, all of these postinst intercepts create
> a native package dependency via inherit foobar.class.
>

What makes you think so? Please point to the specific file and line where
you think this happens.


> This issue showed up in thud using core-image-minimal. It was not there
> on sumo.
>

If you can provide steps to reproduce, it could help. Please start with a
git checkout of poky thud branch.

Alex

--0000000000006bfbab058c4a3202
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 27 Jun 2019 at 00:57, Sinan Kaya =
&lt;<a href=3D"mailto:Okaya@kernel.org">Okaya@kernel.org</a>&gt; wrote:<br>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Let&#39;s see if we can peel the onion.<br>
<br>
Can you explain how it was designed to work for cross compilation use<br>
case where host machine architecture !=3D target machine architecture ?<br>
<br>
If I understand this right, all of these postinst intercepts create<br>
a native package dependency via inherit foobar.class.<br></blockquote><div>=
<br></div><div>What makes you think so? Please point to the specific file a=
nd line where you think this happens.<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">This issue showed up in thud using c=
ore-image-minimal. It was not there<br>
on sumo.<br></blockquote><div><br></div><div>If you can provide steps to re=
produce, it could help. Please start with a git checkout of poky thud branc=
h.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000006bfbab058c4a3202--
