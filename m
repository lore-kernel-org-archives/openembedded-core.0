Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id E788D719A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:03:14 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n21so95967019qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X8QQLYFuGderhFTExjwTCsDlk/OHy6cr29QDS7XliR4=;
	b=ywtiKsLgwaWEAeXOwdzdJqk2wZ3RBh+xL+9vyAcxaQvDuKqyj2Ef3ivxX2NfSWHEL3
	IkFScXtqdqOicFiwx/cIolWUbf4dDYrBVF+J8THJ5UFTaq7S3yOq61DAFLiV/kqcAwx4
	DfeIHjrr6xkET4pqS4fYuxxXotGCCR12tL0p1+pnpDtPftccvrNGNip7B9kH4QFfxy7e
	ebO1YISaRLQbAbbOlVXMiLjIFc4OQfT5C4OQeZQKh8jrjIDY2WQov1q7mB/ytoTRKjnw
	PQg3MBoKdeSKVk2H8MGzscXdhhltA46dg1HIVkzaHZvkEGNjjj3fWDSGxE7r1imf4cD9
	SaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X8QQLYFuGderhFTExjwTCsDlk/OHy6cr29QDS7XliR4=;
	b=IqADJlIHvwGTdDlyfnxpjmSs3/KOhmRPx9mTRsEij6AaAA4nClcSLPjtC4YsQEucI+
	sLwMc4p6i+6CQ8wJQKNQJ1fqrE5+NwKXYV6Qpfma+/TPHGAmEXsie5MCNLsfGnvT0Dge
	EyvD0SyBT6+FP/95Hbsw9Uw/K7crClDJWPc1d0FiOXUAqXM7935DFY+m/2jirR8baBCq
	xNHtupIbw2da0Nvl+Cy+vG040f5ia2QBnFdN2pjXjIIy48MwIpFOsmsEFIqFG7kuTkaL
	tbM6cPHx6+/Ukw60Cr+wKHqmZGawIV0IruYhywN6zAC9psEsPUHEKhlx+lvJftCA4boV
	/57A==
X-Gm-Message-State: ABUngve+NerHf+huJ/ky0xpFwdlrLUuNasY3aMWe049dOlQqGPGRodNkIVrFbTkBqAmNccA1n0j4RXrfeu3HiVZS
X-Received: by 10.55.8.20 with SMTP id 20mr1721512qki.3.1479132195534; Mon, 14
	Nov 2016 06:03:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 06:02:55 -0800 (PST)
In-Reply-To: <20161114103544.19886-1-linus.wallgren@scypho.com>
References: <20161114103544.19886-1-linus.wallgren@scypho.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 14:02:55 +0000
Message-ID: <CAJTo0LZQxKxVVTPY3FEwRNxsF_V18E9Uf9Qm0RiBNWnu67G2VQ@mail.gmail.com>
To: Linus Wallgren <linus.wallgren@scypho.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Supply correct argument to .deb pre/postinsts
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
X-List-Received-Date: Mon, 14 Nov 2016 14:03:15 -0000
Content-Type: multipart/alternative; boundary=001a114c9d601750e10541434d82

--001a114c9d601750e10541434d82
Content-Type: text/plain; charset=UTF-8

On 14 November 2016 at 10:35, Linus Wallgren <linus.wallgren@scypho.com>
wrote:

> The debian policy manual and MaintainerScripts wiki page states that the
> postinst script is supposed to be called with the `configure` argument
> at first install, likewise the preinst script is supposed to be called
> with the `install` argument on first install.
>
> https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html
> https://wiki.debian.org/MaintainerScripts
>

Please prefix the commit shortlog with the name of the component being
modified ("lib/oe/package_manager: " seems reasonable to me), and add a
signed-off-by to the commit log.

Ross

--001a114c9d601750e10541434d82
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 10:35, Linus Wallgren <span dir=3D"ltr">&lt;<a href=
=3D"mailto:linus.wallgren@scypho.com" target=3D"_blank">linus.wallgren@scyp=
ho.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
30h" class=3D"a3s aXjCH m15862710d9eeae1b">The debian policy manual and Mai=
ntainerScripts wiki page states that the<br>
postinst script is supposed to be called with the `configure` argument<br>
at first install, likewise the preinst script is supposed to be called<br>
with the `install` argument on first install.<br>
<br>
<a href=3D"https://www.debian.org/doc/debian-policy/ch-maintainerscripts.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://www.debian.org/doc/<wbr>de=
bian-policy/ch-<wbr>maintainerscripts.html</a><br>
<a href=3D"https://wiki.debian.org/MaintainerScripts" rel=3D"noreferrer" ta=
rget=3D"_blank">https://wiki.debian.org/<wbr>MaintainerScripts</a></div></b=
lockquote></div><br>Please prefix the commit shortlog with the name of the =
component being modified (&quot;lib/oe/package_manager: &quot; seems reason=
able to me), and add a signed-off-by to the commit log.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d601750e10541434d82--
