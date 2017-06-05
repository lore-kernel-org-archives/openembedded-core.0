Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 941BF77EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 12:58:33 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id u19so26586489qta.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TB00lGYeGQ1KksG4MveRrmhR5B3jHbYUrzNdPZUm7l4=;
	b=0JWJb1aqBPMjxObdKzWwUNGIeLQgMpEXFSN9f0e7B+yRos7hctdbSNJwq/mbmQCQlX
	RvH4kZqpEql1CSLHYXgbidUqMg89IAzledwy37vJ4vgQs0NBygDXptFgh6XK/gNaRfAd
	j9Du+T0l06fK1tIjTjhPVNCu1rkylqPsLCrBAExq2HQTTqiCnBNR393m5dZfRnjxN4c3
	dH9rwsfPJEtdl/1W0h5yrT7y/F+/nAy96SjLWeo/54HC7NsKez6NycHgQl+8X2YhiyX6
	f9PJmp5jEFisajMY7yp0NOsDQQkd8QyyGdCLqLs2SEzk4LDyD8ccKg6QHAdUtqVeYBo8
	U3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TB00lGYeGQ1KksG4MveRrmhR5B3jHbYUrzNdPZUm7l4=;
	b=bTn/NoDbtaKVEvJ+pJuoawOoZoNcwAGlnBqmL8bky5+S/S0utpdqrl87giaQHFuTVp
	uQAwzYdiNIr7054r4XY6uHm/m8iUzGG31C98aHJXuVaX1LCdfRL8Hiv+tQKrkX+whiYM
	kPtHgOIaaTb1zBHjIeVjjWof2eh4otb/mRCkHVMS7LuyJ/jYA9aNMLvXxvmQ1Ch5EMoK
	APyciJlvATkzeXb+bNOI3NfIrsRFjDDrGdxUTiVANLnffT5oIUs++cVDvwDJ2uKbBRfH
	rMHJQSjvJhhqO1x0SZNobjY36VknWaHowo0+/rC3+mcW9HieHUczD4+18GFWHPWlnD42
	DZMw==
X-Gm-Message-State: AKS2vOwcjHTDVvOx+FNR36P348R3Sa0Ej9jOiWQGvraAEdpBBllWigIr
	ZOBlkbIBCEusUNfAO1+v+3esEPMWpSVT
X-Received: by 10.200.58.38 with SMTP id w35mr1965067qte.93.1496667514400;
	Mon, 05 Jun 2017 05:58:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 05:58:14 -0700 (PDT)
In-Reply-To: <1496624582-13307-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496624582-13307-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 13:58:14 +0100
Message-ID: <CAJTo0LaNT_DUzAP+PKrMWYwUdZK_7B4kKMoKY0M3GNRL=+O1Tg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: Upgrade 6.0+20161126 -> 6.0+20170408
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
X-List-Received-Date: Mon, 05 Jun 2017 12:58:33 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ca10c8b06d60551360f3a"

--94eb2c0ca10c8b06d60551360f3a
Content-Type: text/plain; charset="UTF-8"

On 5 June 2017 at 02:03, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> 1. Upgrade ncurses from 6.0+20161126 to 6.0+20170408
>
> 2. Delete the following patch file becuase new version already uses the
> awk to filter words.
>    fix-cflags-mangle.patch
>

This still fails to build mc:

| ../../../mc-4.8.19/lib/tty/tty-ncurses.c: In function 'tty_init':
| ../../../mc-4.8.19/lib/tty/tty-ncurses.c:199:13: error: dereferencing
pointer to incomplete type 'TERMINAL {aka struct term}'
|      cur_term->Nttyb.c_cc[VINTR] = CTRL ('g');   /* ^g */
|              ^~

Ross

--94eb2c0ca10c8b06d60551360f3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2017 at 02:03, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:fa=
n.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div id=3D"gmail-:2wa" class=3D"gmail-a3s gma=
il-aXjCH gmail-m15c75c7085baf7fc">1. Upgrade <span class=3D"gmail-il">ncurs=
es</span> from 6.0+20161126 to 6.0+20170408<br>
<br>
2. Delete the following patch file becuase new version already uses the awk=
 to filter words.<br>
=C2=A0 =C2=A0fix-cflags-mangle.patch<br></div></blockquote></div><br>This s=
till fails to build mc:</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra"><div class=3D"gmail_extra">| ../../../mc-4.8.19/lib/tty/t=
ty-ncurses.c: In function &#39;tty_init&#39;:</div><div class=3D"gmail_extr=
a">| ../../../mc-4.8.19/lib/tty/tty-ncurses.c:199:13: error: dereferencing =
pointer to incomplete type &#39;TERMINAL {aka struct term}&#39;</div><div c=
lass=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0cur_term-&gt;Nttyb.c_cc[VINTR] =
=3D CTRL (&#39;g&#39;); =C2=A0 /* ^g */</div><div class=3D"gmail_extra">| =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--94eb2c0ca10c8b06d60551360f3a--
