Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 716A260B87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 21:35:58 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id q9so2422834qvu.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Av9hq04fjXtLd0HsAWw2Cmy2gFAl0Tu4JzqAK7e75bM=;
	b=aEbd6NOMyGaUs8jBZOexMvV/oT5h8xTyqMFpGOmz6nH2O/ZLmS7kadvqvVSoYgQYTn
	1Vji5L3YknBnQ1wGbescA187lAt6pvbfJwjSOXv5a03d/kYDOzMlGZLOdUVbKD1dIRNn
	4c4KEcvulHHZNR8eqEY0DExsZNXOeD7gZimuQMCgrrSYhIk138PhHjsj5h7V02pPei+g
	zQT48D7OJV00gFJGnGA+PrcMa7IOdV+T05xE6/y/IoHSBU7fKgGJOQYnLo7Z/3dXkyT5
	XacLRDM4yykZo7nn/aZgmOOTYnA39+2xNZayCLFujNum+vfdncbpOzMxymnBsOsl7v47
	Y9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Av9hq04fjXtLd0HsAWw2Cmy2gFAl0Tu4JzqAK7e75bM=;
	b=m0hx8QULgbjwHzKwHHaOeBeqyMRpQEYTUfm8c+NENy9p4jsQ4u1QbmJMaSdnrTjJiV
	s+tsRmWuIig/Y2Ie+PlJCe9h5T1S6L8jDjMxizdlxuPuhfE5r+Qglc6iZI9cnIV40thb
	EIYkpmoqngOhnVW3k54rFyitgHRx14aWHkIIceYG25s7QM15QyhiYytfObQW++Rp14jQ
	Oi9jdmWuSV+uLBU4qXzf8MQFxKQ4A8piacDOpofXfICCnm91DoYpPTKhfbBag657pFLw
	QDUnOhrudGAYGHXlSPhRiwceUx4zMG38p6x9zEy1aG1EnZewai141jXTE9SHEv7D1r70
	AEZQ==
X-Gm-Message-State: APjAAAWxrujVrAegccAqCTCdmdsbb85Vh5QNESj3J7wrlX+NG10mMw6A
	FlRhlJwFn0ZTO//5NssHs+ZVi1p4wtG//fg7oIs=
X-Google-Smtp-Source: APXvYqyHS5A7ZihCAvSYe+wLCJqRudtxVOflB55fUckaXRdiBgY7SuMBtIXpUTZf1EFThyrq1+0yoH85Yr1sDYpwNHI=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr25859163qvy.185.1581629758946;
	Thu, 13 Feb 2020 13:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
	<CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
	<CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
	<CAMKF1sqiOxhyd98HTVbqCLWhxBeqW1sZ_d5cvT8E+OMUQejMHQ@mail.gmail.com>
	<CANNYZj8FsGqPQ9dOVSiOpg0DEGK-+rXLa3Xr86+ZjDcyyDDoPg@mail.gmail.com>
	<CAMKF1srJRQMqhhQtKJaqLxQdsRsWeb1OC-r=sRL7JD5A-70L3w@mail.gmail.com>
	<CANNYZj_3Cyf4N-g_rMd+GX=8Upxca4BKkGaR8OEZvjOj=cQtUQ@mail.gmail.com>
In-Reply-To: <CANNYZj_3Cyf4N-g_rMd+GX=8Upxca4BKkGaR8OEZvjOj=cQtUQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 13:35:47 -0800
Message-ID: <CAMKF1spwMfEwWrJ4WJ5AW2xGu8bU_XVA7YSGQ4jRV7TPq0Nnww@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 21:35:58 -0000
Content-Type: multipart/alternative; boundary="000000000000f2c295059e7bdf10"

--000000000000f2c295059e7bdf10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 8:57 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 13 Feb 2020 at 17:42, Khem Raj <raj.khem@gmail.com> wrote:
>
>> This still sneaks in pieces of rpm into distros where rpm is not needed
>> so better would be to retool dnf to not demand rpm support in libsolv an=
d
>> break the dependency chain. Opkg is usually sought for small systems and
>> last thing we want is unneeded dependencies
>>
>> I would rather use the OE configuration powers as such but I am not
>> opposed to such a solution
>>
>
> You can always set these things (rpm disabling in libsolv, blacklisting
> libdnf/dnf) in your distro configuration, but I would like less complexit=
y
> and special-casing in poky, not more, for the pieces that I maintain at
> least.
>

Btw it=E2=80=99s being proposed for Oe-core not poky and in Oe core rpm is =
not
default backend but opkg is
Moreover it is being done in a way where poky default are being taken into
account

I really fail to understand your line of arguments
Here I am sorry, there seems to be no technical arguments for alternatives
but for convenience

I certainly can this goes unsaid and it just takes distro one step away
from Oe-core


> Alex
>

--000000000000f2c295059e7bdf10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 13, 2020 at 8:57 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Thu, 13 Feb 2020 at 17:42, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><div>This still sneaks in pieces of rpm =
into distros where rpm is not needed so better would be to retool dnf to no=
t demand rpm support in libsolv and break the dependency chain. Opkg is usu=
ally sought for small systems and last thing we want is unneeded dependenci=
es=C2=A0<br></div><div><div class=3D"gmail_quote"><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I would rather use the OE configuration powers as such=
 but I am not opposed to such a solution</div></div></div></blockquote><div=
><br></div><div>You can always set these things (rpm disabling in libsolv, =
blacklisting libdnf/dnf) in your distro configuration, but I would like les=
s complexity and special-casing in poky, not more, for the pieces that I ma=
intain at least.</div></div></div></blockquote><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Btw it=E2=80=99s being proposed for Oe-core not poky and =
in Oe core rpm is not default backend but opkg is=C2=A0</div><div dir=3D"au=
to">Moreover it is being done in a way where poky default are being taken i=
nto account</div><div dir=3D"auto"><br></div><div dir=3D"auto">I really fai=
l to understand your line of arguments</div><div dir=3D"auto">Here I am sor=
ry, there seems to be no technical arguments for alternatives but for conve=
nience=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I certainly=
 can this goes unsaid and it just takes distro one step away from Oe-core</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><div></div><div><br></div><div>Alex=C2=A0</=
div></div></div>
</blockquote></div></div>

--000000000000f2c295059e7bdf10--
