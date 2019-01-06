Return-Path: <twoerner@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id B66717BDDE;
	Sun,  6 Jan 2019 03:57:44 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id y14so8958191lfg.13;
	Sat, 05 Jan 2019 19:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i5I9PsN9eJN6SYxAmf/URdoPeP5WmXCjw296EX16RXI=;
	b=h4WbKd2Cklx4e3RGMi8hUQ0urOz7yZgD7TdD9SnTvaw4ijWAirE+XQx2ZOtRYYloY9
	BueYtyqDxmydYZv5Wq97JKWjx4uMO6osgQ4ZrwOTjdUTG9Ry+avfE8MoDN8bZoDLSWSo
	XwrtadqZgPIgcL0ZC43iY5sJJf+UX4Vg48yxaUwRc8VJgGTrvAToPAAEOP/g/SdanNPx
	0bszZhK8wDGSkRJLvZ6CA/Z2n7PraBduH5xDHAVjYp67By8J7X51IZXiSRg6GsQzrwj7
	KHmxU2TsQQeZi/sac0ukiH4VQygOBRZ6fJ3uN/u+ApAMajzAz/u1nYVmsXg4cYhA3N43
	B2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i5I9PsN9eJN6SYxAmf/URdoPeP5WmXCjw296EX16RXI=;
	b=sqATOMQll/6x1MWEVt8tEeOIacoV2e3eE2GUQ9nVE5kBogXtilgOKmUvzj0lgl+WAT
	Rwb+cYDJ30Xsq7AJlIvbA0dOK+6W+dxotE3X1hJf2b+wdM9naJ6dfJQliFZnOmAWgvJD
	CV8rLzcjZA5XeSoBiYKd1ZHlPWuioTNPawPMecfhxeAgerXbOtAOG9Q/m0hR0I/0A214
	A/iIhAnrgywq9AFAkH9zkjDizfZMspUc83wklNdWqaWzSl/sYFGwa11l2tyQGcyMIuMP
	NOM1aO5LueHgJCvmUKJb2odvN9wRUmCK4ic9mwYopiafFGc8kdGSdgHhqy41QLUiS32m
	iluQ==
X-Gm-Message-State: AJcUukdNU3AK3HRaRqxgPwulRe7TUneV2NtQYclafOkMxxbs+N0JctMv
	oO4bOpDEwsbLfMoHKI6yfrlZi8FkbuFfVpO3zNs=
X-Google-Smtp-Source: ALg8bN7zLE4USX5j2ouJRDmIc5bzddefRQaNHAZ+HxXNUNW/dJIle170ClgHGvi8nZ0MlISEsXdvIjoPLbh5LxsxW50=
X-Received: by 2002:a19:e01e:: with SMTP id x30mr2490214lfg.89.1546747065104; 
	Sat, 05 Jan 2019 19:57:45 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sooPOtN-Y=0_cZ=Qv2viS5mwJAsm+yVsHpOJ5gpN65eZw@mail.gmail.com>
In-Reply-To: <CAMKF1sooPOtN-Y=0_cZ=Qv2viS5mwJAsm+yVsHpOJ5gpN65eZw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 5 Jan 2019 22:57:33 -0500
Message-ID: <CAHUNapTmVvPad7YjTt4CyLPA9tiNiTy-vF7hQ53chVV_Y3-RLA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Dropping armv5 and armv5e tunes in 2.7
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
X-List-Received-Date: Sun, 06 Jan 2019 03:57:45 -0000
Content-Type: multipart/alternative; boundary="0000000000005f8172057ec21d66"

--0000000000005f8172057ec21d66
Content-Type: text/plain; charset="UTF-8"

Hello Khem,

Thanks for pointing this out.

On Thu, Jan 3, 2019 at 5:02 PM Khem Raj <raj.khem@gmail.com> wrote:

> Secondly, I would also like to drop armv4t, and keep armv5te as lowest
> supported tune
>

Fortunately I don't have any ARMv4 boards.

But, just for informational purposes, I wanted to point out that I do have
a couple ARM926EJ-S boards (i.MX233, LPC32xx) which are ARMv5TE which I am
actively working with and maintaining. Therefore, thank you for keeping
this one around.

--0000000000005f8172057ec21d66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Khem,</div><div><br></div><div>Thanks for point=
ing this out.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On T=
hu, Jan 3, 2019 at 5:02 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Secondly, I would also like to drop armv4t, and keep a=
rmv5te as lowest<br>
supported tune<br></blockquote><div><br></div><div>Fortunately I don&#39;t =
have any ARMv4 boards.</div><div><br></div><div>But, just for informational=
 purposes, I wanted to point out that I do have a couple ARM926EJ-S boards =
(i.MX233, LPC32xx) which are ARMv5TE which I am actively working with and m=
aintaining. Therefore, thank you for keeping this one around.<br></div></di=
v></div>

--0000000000005f8172057ec21d66--
