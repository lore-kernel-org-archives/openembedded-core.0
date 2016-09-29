Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id C309E6093E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 09:11:53 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id n143so71548883ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bnuXQpBcr6vsEb7sjnNHr1suqYySxcsZj9Eu2dXVJ+g=;
	b=OgVo5N1jh3Co/ZqUUwiejA1Jwf5+jD7bKQbYy6GdAz/RDxKLpQm5PWewQk6kRCiQp2
	YQws+P/h/okVYCu62flWSDJFToVptyLCKZmPWed8gVirQ2gPcN55loQDRTR4xPkPbGRM
	yZRN/0dc+CqkTeIvSnUWn4+nc9seqarPv/9ABZ0zrpAQoP56O/o57bRxWLFokJZ/m9Gu
	ZIZ7OW6BqX3k8qXjlGXWmK4qRwT+rt/TR/0cTxdFA0ia9b2g4p/cq9dqPXlnuCgzAxcn
	ildTMl02vVxyUK0I50LafyyzxGPK1qBlZx9zPzWGWhzWBxgQ32F+F3KoCTYag2BSLvMx
	azZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bnuXQpBcr6vsEb7sjnNHr1suqYySxcsZj9Eu2dXVJ+g=;
	b=N/ks4CvKzH/aQ0b+/hEpQhcKNyirTe/Hm9EOV8mB/lkP9b66YGicvU0ZiWJH65mynT
	rSOTTDDh4o/xVWmXr80a9PVujf0/X8R+vswJ+FPxYf2uKil2EBDb47q5vPwfh2Uy+enW
	4lmIPHv1/u4/iS5GoOfg8Gm5F8l2E3lvfPpI9XcpWPfU+AMRGELxtkJISgXV8JpHELIw
	l+LEz5ZhERdgK3SC/8O2XsdhckYTDmsSAxjVIDQI/38Mmez5Wj2b5d8v71S+eJVxuwq3
	D27i3noCnzhq12l935+lSUEVpSJg5v94eQn6YdMivLjvd8mm7bAK8pMcZlp5Uvf21F03
	OT3g==
X-Gm-Message-State: AA6/9Rl6sI7cSqMNvckh8Zl6uLO3svD/sKOC86smqITjrZX6tVQgdS7XHhKxx3mC2QhoExd53rMFKvwKo7I0RuyO
X-Received: by 10.107.5.147 with SMTP id 141mr1645816iof.132.1475140314987;
	Thu, 29 Sep 2016 02:11:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 29 Sep 2016 02:11:34 -0700 (PDT)
In-Reply-To: <4653801e7765ff1b46b90dade2d4f560a22053d6.1475139494.git.liezhi.yang@windriver.com>
References: <cover.1475139494.git.liezhi.yang@windriver.com>
	<4653801e7765ff1b46b90dade2d4f560a22053d6.1475139494.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Sep 2016 10:11:34 +0100
Message-ID: <CAJTo0LazGcScYqhDGM98BuYS2saK29VN6xj89CA6dEALrt2DQA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] xcb-proto: create blank .pyc files in xcbgen dir
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
X-List-Received-Date: Thu, 29 Sep 2016 09:11:53 -0000
Content-Type: multipart/alternative; boundary=001a113edf34783a9d053da1debb

--001a113edf34783a9d053da1debb
Content-Type: text/plain; charset=UTF-8

On 29 September 2016 at 10:02, Robert Yang <liezhi.yang@windriver.com>
wrote:

> +do_install_append() {
> +    # Create blank .pyc files, so that they will be recorded in
> +    # manifest, and can be cleaned correctly.
> +    find ${D}${libdir}/xcb-proto/xcbgen -type f -maxdepth 1 -name '*.py'
> -exec touch {}c \;
> +}
>

Why not compile them in do_install so the compiled form is in the sstate?

Ross

--001a113edf34783a9d053da1debb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 September 2016 at 10:02, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8ha=
" class=3D"a3s aXjCH m157752ede5cb0e41">+do_install_append() {<br>
+=C2=A0 =C2=A0 # Create blank .pyc files, so that they will be recorded in<=
br>
+=C2=A0 =C2=A0 # manifest, and can be cleaned correctly.<br>
+=C2=A0 =C2=A0 find ${D}${libdir}/xcb-proto/xcbgen -type f -maxdepth 1 -nam=
e &#39;*.py&#39; -exec touch {}c \;<br>
+}</div></blockquote></div><br>Why not compile them in do_install so the co=
mpiled form is in the sstate?</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a113edf34783a9d053da1debb--
