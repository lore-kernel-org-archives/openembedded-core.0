Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 46A3F787B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:58:07 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id a75so2510985itd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yS05QryKS9UkZ9/v0I5K6qSmXJBPIMdh2VSl+gbUQrM=;
	b=rBpOkLyNK+EwwfOr0tR3kZVqR1N+WN3d6uzvdqsdVAaXvCSaFh356CgyvSDhXiT7PF
	7ZM/l3REk6qufF7T0R4wZinwDkXSeLvG5EgJN3lsqi8YPmXmVqMKcBCLhC1mtrpTaDey
	YUDCeTMuhvsBPLFLN2I4GjnOE53gdvP5zWp/aIjVwWkPhmjp9gCOrxqoCYb7fCrSfOHQ
	IV9YKVenTvnR0vhgKoY9dhBAuyiP1PaA8PP9+898q/2zMaok7f75hNgKdaQkOiqtXC5B
	h7eIgj+wmU0yf03qWiNnO3L5ChGNbPTqEK1suhEHyE3A1nPRr1+hDfM9GQSe6RhPEd/q
	jeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yS05QryKS9UkZ9/v0I5K6qSmXJBPIMdh2VSl+gbUQrM=;
	b=rqjCRGgpwFcmY9YZoRtgEOppaPGKO2MakNMx/M78vp096o5+wpgviVAPYma1bUeaIu
	gu7Hrb6F8VKqgMT8ngKWjXDkPFRyreAup/+FlyB867X3CQkIoyvHFK2UHzehuSohiD6b
	RJ/Uh9lbt/TAxGQI413c2bYeZ/qgmO3yHpH3OJF+TMJRhfKukndMa5e1tVWXuvtKus/p
	oalSSVXII5Oub3UlOo2GxnGBRQyAQdZ09cC9+oahnYy0fnm+UjESBxl9vOyafxOdy+k2
	vFe/iHh7Fs/D6PEIEjECAydk+PKA+UK1F3cPz37HH8TQzd3baACZR8LohS7Pgf8nSB6z
	XT0Q==
X-Gm-Message-State: APf1xPAQCSb5ZbDxpVokRvaGZ0B+yTKFQwWOz+sc92++GnTGPEYM1fL7
	aBNmJ4ML873XzOM6RN6EboiQMGBaXOb6p2VzWrVwjg==
X-Google-Smtp-Source: AH8x227VO1zntuZnczfj4PYMG7vF1WxxilTmtg8lZWRTm438R8i8ikT3gvoWiwKyT3ko+k/KR5ArtYqJea0hvp65GYA=
X-Received: by 10.36.185.24 with SMTP id w24mr3441677ite.127.1519225088643;
	Wed, 21 Feb 2018 06:58:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 21 Feb 2018 06:57:48 -0800 (PST)
In-Reply-To: <1519133494-41293-1-git-send-email-maxin.john@intel.com>
References: <1519133494-41293-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Feb 2018 14:57:48 +0000
Message-ID: <CAJTo0LanJ9Jgo+wKt5D_wxUCCpxbtpoMqL4cKbV=WxS_wqoDnA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libinput: upgrade to version 1.10.0
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
X-List-Received-Date: Wed, 21 Feb 2018 14:58:07 -0000
Content-Type: multipart/alternative; boundary="f403045d9a50be29df0565ba2789"

--f403045d9a50be29df0565ba2789
Content-Type: text/plain; charset="UTF-8"

On 20 February 2018 at 13:31, Maxin B. John <maxin.john@intel.com> wrote:

>
> +RDEPENDS_${PN} = "python3"
>

Ouch.  Can we split this bit into a separate package?  Pulling in all of
Python for a touchpad helper seems a bit overkill if the machine doesn't
have a touchpad...

Ross

--f403045d9a50be29df0565ba2789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 February 2018 at 13:31, Maxin B. John <span dir=3D"l=
tr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.joh=
n@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
+RDEPENDS_${PN} =3D &quot;python3&quot;<br></blockquote><div><br></div><div=
>Ouch.=C2=A0 Can we split this bit into a separate package?=C2=A0 Pulling i=
n all of Python for a touchpad helper seems a bit overkill if the machine d=
oesn&#39;t have a touchpad...</div><div><br></div><div>Ross=C2=A0<br></div>=
</div></div></div>

--f403045d9a50be29df0565ba2789--
