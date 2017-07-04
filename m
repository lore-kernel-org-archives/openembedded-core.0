Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id D6FD771A65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 22:11:30 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id p21so177091025qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 15:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3RukQcQttVGKdFH3da6vP5PatbI6yRPZYn+BwIeWzp0=;
	b=Lk1hbUkCDzS533EjnkBLPoYl1jI+seYItKZwaK1aiqbtYR/gTau4iMLTZGwQ11Le9I
	i57ROM9LPQFSvDDlBKdbEuzImLgkq+h/ui6FPvwjdGv4ZgG1ZARNGuLlEI+HnBrG6qkf
	d61AIvapkS2qk9k98txwOd+e9wGY+fMphDdIzjY4d1i3rVRmntmNpRjPstmXUzW1WfMH
	FeZFe37xAmP8iFnyjpR+u/EMrrTfhqPrqfWfkz2MNVN1XSUHVLKW7CEcd1VR5u8lMV45
	1GnYw+25P1KjjUQ/5np317yGFpWIq789F8bymU604OxCBtb2yObpUVIEKYUk/ED+Kr1H
	A9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3RukQcQttVGKdFH3da6vP5PatbI6yRPZYn+BwIeWzp0=;
	b=WwiMEwk5Mqe9OFcceUW8cH8cV8zG3HQsrgEBHBbTDdVKFakQY0/w1sMK884IMnrYiJ
	G1A/jjOytLlwkaVligWZakAQjihCfvScRzEEYf0YplIDdS2pSy3i3+duqWBRkYm72e8W
	aDk/dRvc0xuRdMxvBZGzgzUlHohwwdG3NO7mRlJwLmVgR0VTRYXK8yiFVVTGN5qAh5Uh
	i9aT51jVtb1lhk70yRutbwemxS7SHsh2hW1sjqPdk77i6pSwZ60dXZmJIGd2pxLptPdW
	K4OV2/FCUQpM7IUQdRr558pq2VbyXRJGth7I0w7JStznArSFKQYFk99idZ7jyjOTRhK6
	Yq2A==
X-Gm-Message-State: AKS2vOwVlOsourCAflZcWFVrwI0HYKEz/Ns9aRH4jb8Fk34qxP1NhhP6
	kAD/R3VP3ZtrPbnlgf00MBEMCEJdR9K1
X-Received: by 10.55.31.162 with SMTP id n34mr47125623qkh.46.1499206292000;
	Tue, 04 Jul 2017 15:11:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 4 Jul 2017 15:11:11 -0700 (PDT)
In-Reply-To: <CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
	<20170704153229.6628-1-sledz@dresearch-fe.de>
	<CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Jul 2017 23:11:11 +0100
Message-ID: <CAJTo0LbK1brj7Xd_LeOZNf8ZkCHfRHXVujtKeAXGDxvJnT0cfw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [pyro][PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Tue, 04 Jul 2017 22:11:31 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f87aec760553852af5"

--001a1147e5f87aec760553852af5
Content-Type: text/plain; charset="UTF-8"

On 4 July 2017 at 23:08, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> Ross, please apply it as it has been causing problems for many users.
> It is applied in master
> OE-Core:5d3df78367be0afbfe001b4fa776a98a82e6ce54
>

I would, but I'm not Pyro maintainer ...

Ross

--001a1147e5f87aec760553852af5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 July 2017 at 23:08, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@o=
ssystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":v0" class=3D"a3s aXjCH m15d0fa5c05e15bc2">Ross, please apply it as=
 it has been causing problems for many users.<br>
It is applied in master<br>
OE-Core:<wbr>5d3df78367be0afbfe001b4fa776a9<wbr>8a82e6ce54<br></div></block=
quote><div><br></div><div>I would, but I&#39;m not Pyro maintainer ...</div=
><div><br></div><div>Ross</div></div></div></div>

--001a1147e5f87aec760553852af5--
