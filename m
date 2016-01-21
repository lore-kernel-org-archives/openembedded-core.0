Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 528E0731DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 20:32:42 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id z14so132474312igp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 12:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=upvEadx7fr5QtjHrjBR9LIY2TCSzHFo1Mpqkql+Kqdc=;
	b=Y4LS/FlAlthb1E3GPte2MUd/mahx6qse877T2ENQUJWK7peAkoDLHbIfvmoCiCSM9/
	mN2By6AAdVDaJ/sOMdsQznqf+U9jLUlro+QVEjCErMpAmcRQJxqrNM3/aOxsfLLlmm+A
	bZPblO/zL8SgzhaMWoXFVESBB1a+BluPnoG29cPLPk+InCI6SQxQZSp/z9CeT6n+rKGA
	f63i7i5XLCGrdTUnSrI79wkikFGMkoyk4+4Wyj4U0yX9qIZfxsS9p20cUudqnMWLpbZv
	Y/5iRtRcUaw4y0t8HPBEWA9hmTWt6bDhvQF2Hlt9b5XETWMMF07Jb3Jy8g686gvdcJbx
	MrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=upvEadx7fr5QtjHrjBR9LIY2TCSzHFo1Mpqkql+Kqdc=;
	b=BS4bepOlzio5w7WE52dOU30fyHLHOhXKangD0TOV2pjw6oTyStgUNpe4uf9cWkfYug
	+m8U1m3H/ywi82V599tdDpg3U1mA2TpS4AA13NJt2ZEtmC8ReaKfu+1wWsJEvUuWXUlX
	s2iAlj6eMLbthjuprKvXcj3ig4zs2Z3k5gvMVnmc+ypnJu6I8CPN/dLlXuV5bTe/vBFV
	cK2RX3idJEf6XXuuvK3NJ6UbxMRvg1bLm+sjj31CD26jxtGrtTjOWch/siy4Oh1AahUV
	zgC1y92SZ4z6h1T4FlzgdUmg9Cw+OQkBCWBnEMN7JBY9fcw9/0x6iwdKBQ1h03X95ve6
	DPjw==
X-Gm-Message-State: AG10YOSnfwsUBAsxt7FMtPmTXZBfqTtG7yGa0IDTyKq/fJZ3sUK1NQDLfOhRRS4TbXGxg6RZvP6ePj1O/MZPIhEF
X-Received: by 10.50.13.100 with SMTP id g4mr10927396igc.64.1453408363701;
	Thu, 21 Jan 2016 12:32:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 21 Jan 2016 12:32:24 -0800 (PST)
In-Reply-To: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
References: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jan 2016 20:32:24 +0000
Message-ID: <CAJTo0LY4=LYYMoeyH=iX0kgT8viTWjsxWeV5Geh7_0+XOSx-YA@mail.gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: disable libblkid again
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
X-List-Received-Date: Thu, 21 Jan 2016 20:32:43 -0000
Content-Type: multipart/alternative; boundary=089e013c66143b80d30529de01d9

--089e013c66143b80d30529de01d9
Content-Type: text/plain; charset=UTF-8

On 21 January 2016 at 07:20, Koen Kooi <koen.kooi@linaro.org> wrote:

> We use the util-linux one and do_install deletes it anyway.
>
> See OE-core commit fb8e776ea91c39d586b46400ad30aeea8dead1c4 for more info.
>

Not sure this is complete:

WARNING: e2fsprogs: alternative target (/usr/share/man/man3/libblkid.3 or
/usr/share/man/man3/libblkid.3.e2fsprogs) does not exist, skipping...
WARNING: e2fsprogs: alternative target (/usr/share/man/man8/blkid.8 or
/usr/share/man/man8/blkid.8.e2fsprogs) does not exist, skipping...
WARNING: e2fsprogs: alternative target (/usr/share/man/man8/findfs.8 or
/usr/share/man/man8/findfs.8.e2fsprogs) does not exist, skipping...
WARNING: e2fsprogs: NOT adding alternative provide
/usr/share/man/man3/libblkid.3: /usr/share/man/man3/libblkid.3.e2fsprogs
does not exist
WARNING: e2fsprogs: NOT adding alternative provide
/usr/share/man/man8/blkid.8: /usr/share/man/man8/blkid.8.e2fsprogs does not
exist
WARNING: e2fsprogs: NOT adding alternative provide
/usr/share/man/man8/findfs.8: /usr/share/man/man8/findfs.8.e2fsprogs does
not exist
WARNING: alt_link == alt_target: /usr/share/man/man3/libblkid.3 ==
/usr/share/man/man3/libblkid.3
WARNING: alt_link == alt_target: /usr/share/man/man8/blkid.8 ==
/usr/share/man/man8/blkid.8
WARNING: alt_link == alt_target: /usr/share/man/man8/findfs.8 ==
/usr/share/man/man8/findfs.8

Ross

--089e013c66143b80d30529de01d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 January 2016 at 07:20, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:koen.kooi@linaro.org" target=3D"_blank">koen.kooi@linaro.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D":rij" class=3D"" style=3D"overfl=
ow:hidden">We use the util-linux one and do_install deletes it anyway.<br>
<br>
See OE-core commit fb8e776ea91c39d586b46400ad30aeea8dead1c4 for more info.<=
/div></blockquote></div><br>Not sure this is complete:</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra"=
>WARNING: e2fsprogs: alternative target (/usr/share/man/man3/libblkid.3 or =
/usr/share/man/man3/libblkid.3.e2fsprogs) does not exist, skipping...</div>=
<div class=3D"gmail_extra">WARNING: e2fsprogs: alternative target (/usr/sha=
re/man/man8/blkid.8 or /usr/share/man/man8/blkid.8.e2fsprogs) does not exis=
t, skipping...</div><div class=3D"gmail_extra">WARNING: e2fsprogs: alternat=
ive target (/usr/share/man/man8/findfs.8 or /usr/share/man/man8/findfs.8.e2=
fsprogs) does not exist, skipping...</div><div class=3D"gmail_extra">WARNIN=
G: e2fsprogs: NOT adding alternative provide /usr/share/man/man3/libblkid.3=
: /usr/share/man/man3/libblkid.3.e2fsprogs does not exist</div><div class=
=3D"gmail_extra">WARNING: e2fsprogs: NOT adding alternative provide /usr/sh=
are/man/man8/blkid.8: /usr/share/man/man8/blkid.8.e2fsprogs does not exist<=
/div><div class=3D"gmail_extra">WARNING: e2fsprogs: NOT adding alternative =
provide /usr/share/man/man8/findfs.8: /usr/share/man/man8/findfs.8.e2fsprog=
s does not exist</div><div class=3D"gmail_extra">WARNING: alt_link =3D=3D a=
lt_target: /usr/share/man/man3/libblkid.3 =3D=3D /usr/share/man/man3/libblk=
id.3</div><div class=3D"gmail_extra">WARNING: alt_link =3D=3D alt_target: /=
usr/share/man/man8/blkid.8 =3D=3D /usr/share/man/man8/blkid.8</div><div cla=
ss=3D"gmail_extra">WARNING: alt_link =3D=3D alt_target: /usr/share/man/man8=
/findfs.8 =3D=3D /usr/share/man/man8/findfs.8</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--089e013c66143b80d30529de01d9--
