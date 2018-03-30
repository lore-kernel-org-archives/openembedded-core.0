Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2807974555
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 02:18:12 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id m200-v6so5079748lfm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 19:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ByavclfIYhbdpvrO+Me8JTF09T5jWIAleT6JfOGQvjU=;
	b=oXb8YtQ0eynebeL6YPDOhObAmT7LePuYEOdH9MYmllihZz+oFKfa164PoN86PeTx7P
	vu8Y4kq1jdiYoaSqLk+OpKMcIeGDXwE4WXLSnKqJhtTORLhYzWg3xNDoVH7to88xVA7H
	zbngGASx5dsQa+bl9UohY/o203PP85/Q1Z7Rx67P8D+gcqaoAQ99wRew8td9HbvPGuxi
	je+J8u8aNV6bjSXJDLpx6xYPmAhNYBelTZNapEkOgmfGk3Aegvss+l53PV6f9PpPusdp
	w2E31DcgnlEJ4Aq8eW02AbK6Ya5XOX1WxYSaZ2z++u/9ieoOHNAM97ShXlK/UV0CJDod
	+X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ByavclfIYhbdpvrO+Me8JTF09T5jWIAleT6JfOGQvjU=;
	b=cZiasFElBUUqffoWY94fN42JY3OYgkhVPZ056ChpJTWL/lV5maGYyO/c3AAdtMKuDB
	Nw5DAoW17qChzSgw87qP6SFbqOcImR/ZzJSBW8zOtDfjUNTsuZQenWKz8Z8vBViTuHM+
	z/kKm8hGpzBAa/mI3ZKasooLrmMe9AQxN6md2iAQqqn9ELmOyXIeAHl2Wl9LLp2MP08X
	F1R1FJEdJ2jg+az5HWxcSmrU7AeAKA1MRY0rSBcsDsVAUqb6qdjD68yw9sRlOsoi6ojD
	ZklKDh04QduG4L3CHCVP7rm4Ek2qPdw91r8ahymh2LALDZGOdLV0XYKOaWp7HJhRsZkg
	e5sA==
X-Gm-Message-State: AElRT7HOgN+wNl/QjFqHNYJkIgWj5YkeMjwSEe6re6B+xA+12BPt5Tzz
	F76Tw6WpRXMVpEfXnm//sf45TQnKwZtmBZdNawo=
X-Google-Smtp-Source: AIpwx49Bu9h16utJwk062rY1hnztj3oTOlILHUxAaqJLNR96RgQ/bXO5Hc7PJvVG8PMjyrvGrXuKhfYGobBnuHwTv3g=
X-Received: by 2002:a19:5745:: with SMTP id
	l66-v6mr7052407lfb.135.1522376293508; 
	Thu, 29 Mar 2018 19:18:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:d80f:0:0:0:0:0 with HTTP; Thu, 29 Mar 2018 19:18:12
	-0700 (PDT)
In-Reply-To: <CADfgfoZq56q5wyyr9OQ8Xo0KACZ0-0am+LyXTp6ND7x6WqwFxw@mail.gmail.com>
References: <mailman.363.1522325586.1651.openembedded-core@lists.openembedded.org>
	<CAHUNapTc-iiZ6vbRV=J3pt5EQy-qJJbgkwzZKhpAkfC3pgzXiw@mail.gmail.com>
	<CA+chaQdYG-kNDqiStA=yg1nGjLH_pgH7vcm6Db_kxZ+Bt1pWSg@mail.gmail.com>
	<CAC+thW3gJDv_RGKAhXxkXM3rjAEDk8-_Ew2rszTpij2n_SwAtg@mail.gmail.com>
	<CADfgfoZq56q5wyyr9OQ8Xo0KACZ0-0am+LyXTp6ND7x6WqwFxw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 29 Mar 2018 22:18:12 -0400
Message-ID: <CAHUNapSv2h7dk2EgAumvgyHz4G9uTG=v6sLnZSP0N-w6PhgTDA@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: confirm 6bb527bbc2e6d9a2a2165aa081ea1271ece07fe8
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
X-List-Received-Date: Fri, 30 Mar 2018 02:18:13 -0000
Content-Type: multipart/alternative; boundary="000000000000306b26056897da24"

--000000000000306b26056897da24
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 8:45 PM, Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> We had several hundred bounces from Gmail today. I've made changes and
> Gmail is currently accepting new messages.
>
> I'm running a script to clear users' bounce counts now.
>

Thanks Michael!

--000000000000306b26056897da24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Mar 29, 2018 at 8:45 PM, Michael Halstead <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_blank">mhalstead@linux=
foundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"ltr">We had several hundred bounces from Gmail today. I&#39;ve made=
 changes and Gmail is currently accepting new messages.=C2=A0<div><br>I&#39=
;m running a script to clear users&#39; bounce counts now.=C2=A0</div><span=
 class=3D"HOEnZb"></span></div></blockquote></div><br></div><div class=3D"g=
mail_extra">Thanks Michael!<br></div></div>

--000000000000306b26056897da24--
