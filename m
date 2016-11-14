Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 844EC600EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 10:54:02 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id w33so44608873qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=thJiIASCxIk3nSIztf0Zt6evHW0/Ubqu7XLt+XZgdq0=;
	b=OP0ks7vVwHevLLuGYXjUjP9NMKpbQ1088KSSUOtOci33b7ECzp5bkqDUqf9E3JeIGC
	MwJnknvbf4p7U6y69yJ1jZm9kAo0INTGiyp0DNDFljsHOxG3LfrnxPpI9zn5MkYOxZo5
	C/mfy5Spc1XSBMtodEiqoMU3oHCqgtF6T4+BpPBhsAopRELyr1KnGg1UHvg4IIYVc2+T
	gbT9S4iTewinLK63M2WTiAGYId7d+TiNlp6o0Ro5aWfdg/sy1IKcyyx+6hkmd3ft7bKo
	r39LtdENfnfG25P4l5K1Ntm1FB+RxDAst7dHqKIZMGy7Gx5A9CR3wNwddY6a2AwciIeH
	M+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=thJiIASCxIk3nSIztf0Zt6evHW0/Ubqu7XLt+XZgdq0=;
	b=LSBbKe/4k0Ucd4q7JTw50ZUigiVDvj/ucj2ymL3kk2X/Aw3Da46+6Cn339x9WPnOTI
	zYPm7G44NXLux22XIBq8yfUt/cxF7MYt/jastttxWBYhkf9zCW/QXEgMID+qm92P523e
	IiU6YzZcwGwIlWbPwqEVFGkiqlKegrVV0BtJjT81YjDjBgNMv4IKPVIdaccB/RvYMpGw
	/rnpqRqJYop0frheusAwjG6GujOTyKF94Hd31hhQJp8XC+0vUK0MpwfUP774hNBaEymq
	oPPGioGByybon/Xkw6fT4USTltQPbMeXS+FftnUzEzr3e6xFVWSinz5+qTQWNQd4kgi/
	/xdg==
X-Gm-Message-State: ABUngve4GDswKqYojOeAZRd0HvdBPtawbAXSakycemSxe9y6x8Ubvyn1pM1NfQj3koeypq3XSe8A7NanLBOpKQMR
X-Received: by 10.237.44.161 with SMTP id g30mr10287225qtd.144.1479120844251; 
	Mon, 14 Nov 2016 02:54:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 02:53:43 -0800 (PST)
In-Reply-To: <1479119619.8647.1.camel@ts.fujitsu.com>
References: <1479119619.8647.1.camel@ts.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 10:53:43 +0000
Message-ID: <CAJTo0LZ68DbpCMpHy=5AKuxsHNCjzw2vJMJBd1WC27VTga=fqg@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libdbus-c++
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
X-List-Received-Date: Mon, 14 Nov 2016 10:54:03 -0000
Content-Type: multipart/alternative; boundary=94eb2c125848807913054140a854

--94eb2c125848807913054140a854
Content-Type: text/plain; charset=UTF-8

On 14 November 2016 at 10:33, thilo.cestonaro@ts.fujitsu.com <
thilo.cestonaro@ts.fujitsu.com> wrote:

> I wanted to build an executable using libdbus-c++ but OE-Core has no
> recipe providing libdbus-c++, please correct me if I'm wrong here!
>
> Is there a reason, other than no one wanted a recipe for libdbus-c++ yet,
> against the usage of dbus-c++ implementation or why isn't there a recipe
> for libdbus-c++?
>

There isn't a recipe in oe-core because nothing in oe-core needs it, and it
isn't considered fundamental enough.  It seems that every six months
someone writes a recipe for dbus-c++ (because they have problems and ask
for help on the lists) but nobody yet has actually submitted a recipe to
meta-oe.  You can be that person!

Ross

--94eb2c125848807913054140a854
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 10:33, <a href=3D"mailto:thilo.cestonaro@ts.fujitsu.=
com">thilo.cestonaro@ts.fujitsu.com</a> <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:thilo.cestonaro@ts.fujitsu.com" target=3D"_blank">thilo.cestonaro@ts.f=
ujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1dj" class=3D"a3s aXjCH m15862708d7687b60">I wanted to build an execut=
able using libdbus-c++ but OE-Core has no recipe providing libdbus-c++, ple=
ase correct me if I&#39;m wrong here!<br>
<br>
Is there a reason, other than no one wanted a recipe for libdbus-c++=C2=A0y=
et, against the usage of dbus-c++ implementation or why isn&#39;t there a r=
ecipe for libdbus-c++?</div></blockquote></div><br>There isn&#39;t a recipe=
 in oe-core because nothing in oe-core needs it, and it isn&#39;t considere=
d fundamental enough.=C2=A0 It seems that every six months someone writes a=
 recipe for dbus-c++ (because they have problems and ask for help on the li=
sts) but nobody yet has actually submitted a recipe to meta-oe.=C2=A0 You c=
an be that person!</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--94eb2c125848807913054140a854--
