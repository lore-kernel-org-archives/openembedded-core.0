Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1299672F2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 22:03:20 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j32so370837iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 15:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LYqMZhuXyb3ZDpX9DVDNoaw2cEqRnYx8vgMQbdVYiJc=;
	b=ioUAEnGtzsThkxrBjFGCz3L+5C8HGb+3kj6U44ZYoZV/LQrMyS37FpobpcizlS8r5k
	EL1MgrCcT6jZBMWWx3gQ0E1+7YnQmYJfzbR/VJ42kGfFxJPEXBXldtVKwRK1hpp5ZWdr
	bzcIVfD/LKpnsxirrZ86bYRBbvC2SHwj0vHb3JV02Sb5LBOHkHZtXKYWweeGK0SIUOYf
	NEiU8gotGWFb1OF/ykhJuTlNJHKPaZuzhpILWAWJuK3BOO9Q1CNw467vA/WoIqYadZel
	fvp8eJ3oYrJV9zWCkFl/co5jqwLf90tNdteyx27l0ES4oM2DIHVHYl52Zq+qnhjWkbXf
	BOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LYqMZhuXyb3ZDpX9DVDNoaw2cEqRnYx8vgMQbdVYiJc=;
	b=gezz1f6EDRbD3x5UIJQKlWA8lk6RrF4kruFT7UODsmKqO2di+XjsgvMbNlgHYsFBDj
	RXuTnMbMxZ58PmV/B5Fd+7YCmegSrM9bcdR5szm/BkcJRJRtOLXoj5yVdpb0oYyuvbVa
	eioZHN1pOzXrtJk02ctUYiuCfrNVPIQxsn+PbaUcciyM8ZnZ0SngIlAqOGUuros/dsE1
	FzfF3rHfXtVI71gIkRTJv71PWNS2hd2Mo4/jsIhsezd9VAjjIyrOefKBS83883CSkdg8
	f3Uj0X2iHd3+dgzzxb1t7SrPiQPIT550rp/0uz29OzYvECA+PoT4QZSAvTSOuaEdRnqn
	3wCQ==
X-Gm-Message-State: AIVw113J4VM5ttV0+0lKlMLh+P6iM9KMin3MijgLQ6yog8/0YEBMtB+N
	dT9M/E6fWLoMKEXbQKZBRzuiMY8xaoaG
X-Received: by 10.107.170.170 with SMTP id g42mr30068743ioj.19.1501711401921; 
	Wed, 02 Aug 2017 15:03:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Wed, 2 Aug 2017 15:03:01 -0700 (PDT)
In-Reply-To: <CAMKF1sossdZYGd9QFunkAHKBxUUikus8N18MKa-fNckLpWerdw@mail.gmail.com>
References: <20170801163443.10899-1-raj.khem@gmail.com>
	<CAJTo0LYexDbJbkWb0=v1L4cjpEMyw5gL8NmcSTQd9QXjnF4_aA@mail.gmail.com>
	<CAMKF1sossdZYGd9QFunkAHKBxUUikus8N18MKa-fNckLpWerdw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Aug 2017 23:03:01 +0100
Message-ID: <CAJTo0LbzivYA=X5=n6FnbJ2jJpuymrcp+YEvRwmEk1t6O85vaw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Wed, 02 Aug 2017 22:03:21 -0000
Content-Type: multipart/alternative; boundary="001a114260baaaed3d0555cc6e31"

--001a114260baaaed3d0555cc6e31
Content-Type: text/plain; charset="UTF-8"

On 2 August 2017 at 21:34, Khem Raj <raj.khem@gmail.com> wrote:

> How to reproduce it
>

Build almost anything because it will need glibc-locale.  Sorry.

I can throw it on the AB to see what fails/works.

Ross

--001a114260baaaed3d0555cc6e31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
 August 2017 at 21:34, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=
=3D"auto">How to reproduce it</div></div></div></blockquote><div><br></div>=
<div>Build almost anything because it will need glibc-locale.=C2=A0 Sorry.<=
/div><div><br></div><div>I can throw it on the AB to see what fails/works.<=
/div><div><br></div><div>Ross=C2=A0<br></div></div></div></div>

--001a114260baaaed3d0555cc6e31--
