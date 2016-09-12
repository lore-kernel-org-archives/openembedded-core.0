Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id F11C270031
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 17:43:38 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id 15so3800760ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FtIHwDIe19yeWvCwkpjiKxOdKqfhzk1/JTV2AObdu2g=;
	b=s1LCDhqNroktwLxA+XlcgvObVyEFdm344z6cYwyPaT/8Wq+lfeJrQXOYQiOokmTG4N
	fbS3VVnwwtM/BDP4I6XLP13dN/KtWoB3VN0oevUP2ZjvYVMAP0vWcPmuG2CZXaSUvkA1
	9Z4EXEgdGIcvMGU5u9IklQu3RxAvE8G02yVO3SV5MnATeo6pg/9GjBlQHGvg5V0GXGF7
	NdKsvUARQtuc3A+DJ/7h7OaFuFzutknGgf3QtnL7FtL7yPV/2P9vXMgJgkM+DacTPSNi
	lqWbLokNgWozWze8/rg5ZqMgxk0FKgW2xNyhNpvbuMzq++DjMAwVBjx9RIeucNNqcO1H
	6G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FtIHwDIe19yeWvCwkpjiKxOdKqfhzk1/JTV2AObdu2g=;
	b=WWqGOJlPVz+22vgzZhKaf5S24fvg+gMLZacHvQkKYvdKJF6PnunMOfpcShuZhfC7lo
	aXzNM2aQUC0xUfnfMirurFBINxWe2s6c7OGxgAKomORAzf17/nuCZ83bj1mrkS7mASiu
	cQUTJFFw1PeT39lfESJ/7H1BSHkqAa8bdRPCUOBjB+c5SHW4q2Uf0f+F9k+3ZmJe6/SP
	7M+NwCbssx43Xf7eA5Ev0Bl88FEHPHH8CZhGCQKJbOllSmXt9zS4PNK8Re2Bss5ulF+n
	lIbGnq/qDrjNLY/OZO2T83gZqD+22XPINkDB1Yo286k3BqfL79/QfJ8KoExOgrnSSY9c
	axEw==
X-Gm-Message-State: AE9vXwPLgvdHFP1GYF85PvIvBKA93CJg/SPPoWeTno8JIh5JrQ2H3hm447quvtQmt4DK8onXz2F7Dmsaljuz5ETz
X-Received: by 10.157.9.183 with SMTP id q52mr21537628otd.87.1473702219348;
	Mon, 12 Sep 2016 10:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 12 Sep 2016 10:43:18 -0700 (PDT)
In-Reply-To: <CA+chaQfeWvse-+vAb87m1A2BKVuii4SKEquZtDq-3WWFF9AKBA@mail.gmail.com>
References: <20160907233743.18699.54755@opal.openembedded.org>
	<20160907233744.4852350198@opal.openembedded.org>
	<20160911193712.GA6859@jama>
	<CAJTo0Lap_gBdBjbTpoNs5rF038TcNEGs+QybDb=G1GMM3nH4Bg@mail.gmail.com>
	<CA+chaQfeWvse-+vAb87m1A2BKVuii4SKEquZtDq-3WWFF9AKBA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Sep 2016 18:43:18 +0100
Message-ID: <CAJTo0LZm=X0c9t-cP2vLeUrvVRK=U1DaNYq1MCDomTgiYVFyqg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/24: gnutls: update to 3.5.3
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
X-List-Received-Date: Mon, 12 Sep 2016 17:43:41 -0000
Content-Type: multipart/alternative; boundary=001a113dc2c04a28f8053c53098c

--001a113dc2c04a28f8053c53098c
Content-Type: text/plain; charset=UTF-8

On 11 September 2016 at 23:37, Martin Jansa <martin.jansa@gmail.com> wrote:

> Default qemux86 as shown in:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.
> 20160910_205641.log
>

Yeah I can replicate this, must be a 32-bit x86 thing, or something.
Annoying.

Ross

--001a113dc2c04a28f8053c53098c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 September 2016 at 23:37, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">D=
efault qemux86 as shown in:<div><a href=3D"http://logs.nslu2-linux.org/buil=
dlogs/oe/world/log.report.20160910_205641.log" target=3D"_blank">http://log=
s.nslu2-linux.org/<wbr>buildlogs/oe/world/log.report.<wbr>20160910_205641.l=
og<br></a></div></div></blockquote><div><br></div><div>Yeah I can replicate=
 this, must be a 32-bit x86 thing, or something.=C2=A0 Annoying.</div><div>=
<br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a113dc2c04a28f8053c53098c--
