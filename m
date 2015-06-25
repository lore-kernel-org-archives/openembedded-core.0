Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 19F2F605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 14:24:13 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so39290848qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0ZBvQfcdJdcp2wTfU6WW2MVbPeZiiC8dvCSKawhcfbw=;
	b=h8zbxCbMJHhpAlkswNbqoW8hoEvBRtBjRjUTlYI1VsrTwyWYPf3GXmJjmCGfYvwLz/
	Sl9yn3Gm51iUG9FaXX9zn9qKSSRViY1hPMoOm0FPa+0FsyEittwbcrXHBlKv22xmXtcP
	Ts6PJotKrzHClH6UVds2warviS89RUwsdC/AZJq5hYOP1n75C2cuEGDr4MQRt33hod1u
	1a4ntXzDpnmJHxz8l+/xAHmmvD2j5Wa4QwjsZwGlSNdMYpGFrvDGP7ro7MHr4Jaw8j6y
	7OER1D1C/61robgy/pgGkT9aHZXDGdJ5hi31PH6hhSOTE4h+dWuCrnXunHFXLcTzPbpo
	IyvA==
X-Gm-Message-State: ALoCoQkP2i9/wNQhFhswh/LafCvJk+yewNVQihy8qYX5MtaCPvwDEsMI5xJKprEtbNRGjQaI9fT7
X-Received: by 10.140.89.104 with SMTP id u95mr15354125qgd.15.1435242254555;
	Thu, 25 Jun 2015 07:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 25 Jun 2015 07:23:54 -0700 (PDT)
In-Reply-To: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
References: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jun 2015 15:23:54 +0100
Message-ID: <CAJTo0LZXnV=-PWRhekYvkqgPkjy1pit_zMxGXErUs77eC5NNMg@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Set S to fix QA warning on systemd-serialgetty.
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
X-List-Received-Date: Thu, 25 Jun 2015 14:24:17 -0000
Content-Type: multipart/alternative; boundary=001a11c135f6bff6f10519586003

--001a11c135f6bff6f10519586003
Content-Type: text/plain; charset=UTF-8

On 25 June 2015 at 12:24, Thomas Perrot <thomas.perrot@tupi.fr> wrote:

> +S = "${WORKDIR}/${PN}-${PV}"
>

But that's the default value for S (well, S uses BPN), so how does this
help anything?

Ross

--001a11c135f6bff6f10519586003
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 12:24, Thomas Perrot <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:thomas.perrot@tupi.fr" target=3D"_blank">thomas.perrot@tupi.fr</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2dd" class=3D"=
a3s" style=3D"overflow:hidden">+S =3D &quot;${WORKDIR}/${PN}-${PV}&quot;<br=
></div></blockquote><div><br></div><div>But that&#39;s the default value fo=
r S (well, S uses BPN), so how does this help anything?</div><div><br></div=
><div>Ross=C2=A0</div></div></div></div>

--001a11c135f6bff6f10519586003--
