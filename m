Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id EFD2771A19
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 11:44:01 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id k74so49069917qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rw+LEv6lZgFwqrV5td+K+euZZwvQfcO7MK4tsFxGK2I=;
	b=rXc1/OilwwoyrqNxUnV7csHcK6/b/Im/QpxcNRI+0dpEDbI4dU2I8ZWXaKtolt7unr
	CK0W8xdVLnLzK1g3wG7aIiV0SNjp6wWbr8Zf45arxjxmKHJiHUKFi4aPO0jxBFX+iEbt
	3fbRsVxpSYtITaJONZ1SQKeBqy1ck2CeoxISr5YvpUXTREGr4hfK6UnVEBJ1KI2hyw8K
	1wG6i+crYHv56JfuMhG9vLhj7aaBT2oisk5lqtkgjN1LFqV4Dna5AmbOe2zqsm3Tl465
	VKc5gOr9SbYYZXork0WxU6hQZ43bDETavIOgaLDVq6NU0ecnF4ffEJhz38f5J5UvpzG3
	UDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rw+LEv6lZgFwqrV5td+K+euZZwvQfcO7MK4tsFxGK2I=;
	b=OQJKwUnTJtSL9XufFD9KfvI69Uq8TXp5KM+2gPHwsc1YnvGNlZFZh2crLCBKjUq+py
	4D9hwD68bR83yuCZRXO18hnaK6DkPIAZcOVlMVa1qhJOPwkJRIOP12wF33+2CSRc/qzT
	rDnfSp+u9Nr1u4ow+xsOA6sgK2CKayBLfmkfLrvt1vvJyDr1rlnYbdFkPQR6630okivb
	c9sXjuKskdeZe77huILqeenaNU6076WHGPukggItm2fiOiGsNRdQSt66zrz+PK59V5Vr
	tCSWAzUrK4pZP71apuc7cWWIMsn/8f9FyX/OD01BZGx+D8SLaPtg9YIHvgWkry+FTwlg
	7ZmA==
X-Gm-Message-State: AODbwcAFH4nNyVjEQpF/+G4p+cLXNgpUqUQGwxTG4+KjKw8Yyx22qMqE
	qa4oqLvKaK2ekfaZRud/U8pWziaRDblz
X-Received: by 10.55.17.224 with SMTP id 93mr23366982qkr.244.1494243842646;
	Mon, 08 May 2017 04:44:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Mon, 8 May 2017 04:43:42 -0700 (PDT)
In-Reply-To: <CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 May 2017 12:43:42 +0100
Message-ID: <CAJTo0LY67aoeeHiNXDSA+FYmEYMQdw3tq1_N7+N=a9xq9nyPiw@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 08 May 2017 11:44:03 -0000
Content-Type: multipart/alternative; boundary=001a1135cbcc72f81b054f01c1f1

--001a1135cbcc72f81b054f01c1f1
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 12:33, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Sato is extremely lightweight (not just runtime-wise but with regards to
> build time and maintenance effort). I admit I'm not familiar with LXDE but
> other DEs known as lightweight are in reality on another level compared to
> Sato... Sato projects themselves are tiny and depend on very little: this
> is quite beneficial since it keeps the automated test runtimes reasonable.
>

Also Sato works on a wide range of devices: if you have a 30" monitor with
a keyboard/mouse, or a 4" touchscreen, it is still usable.  It's not
optimal on anything, but it's functional on everything.  Put LXDE on a 4"
capacitive touchscreen and you'll probably have trouble getting anything to
start.

Obviously if you're happy to say "I target desktop users" then there's
meta-gnome, meta-xfce, and so on.

Ross

--001a1135cbcc72f81b054f01c1f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2017 at 12:33, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Sato=
 is extremely lightweight (not just runtime-wise but with regards to build =
time and maintenance effort). I admit I&#39;m not familiar with LXDE but ot=
her DEs known as lightweight are in reality on another level compared to Sa=
to... Sato projects themselves are tiny and depend on very little: this is =
quite beneficial since it keeps the automated test runtimes reasonable.<br>=
<div></div></div></blockquote></div><br>Also Sato works on a wide range of =
devices: if you have a 30&quot; monitor with a keyboard/mouse, or a 4&quot;=
 touchscreen, it is still usable.=C2=A0 It&#39;s not optimal on anything, b=
ut it&#39;s functional on everything.=C2=A0 Put LXDE on a 4&quot; capacitiv=
e touchscreen and you&#39;ll probably have trouble getting anything to star=
t.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Obv=
iously if you&#39;re happy to say &quot;I target desktop users&quot; then t=
here&#39;s meta-gnome, meta-xfce, and so on.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135cbcc72f81b054f01c1f1--
