Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 84C3071AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:22:14 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id d123so992626ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 00:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y/Fny2qNtvOANk0cIzxR0XrwS+QaMYqGGGYV9VOzn80=;
	b=lueVpG4UtpnqQMBqilIPUr/vOwXq9wBD+czx7J+b1l9GUOocBsrKGp+SysRONDbs/U
	08u4MS/kl5X1nDqvW2phBTZl13kNeB63rGi+9oVK2bMyps9llNNtbMjw+UMsSvQyPOO/
	4p7t+i2NAZkkt5z8xYCRxZd97DV+I7l1V0nSCrXEzs7l1T0+1E0eh4YF4fCQawOmtUlE
	jsjERSIKI7yg5hCbt3e2gwrdwpQRVAK+zpfYS1bf8l/vYSzCp6FmZNWtfsC9NKEXk2M1
	QDUQBzlEj1d/HJpIGiQdpvPp3RGISG58vxorwKOubfQPvaLDmYi02FtBIw8jdw2ZNMRd
	f5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y/Fny2qNtvOANk0cIzxR0XrwS+QaMYqGGGYV9VOzn80=;
	b=lEhBgpQxAdAcYzfqQWGp7hPdgFOH0+8XDzUhnkQaXO5LaB3jJSpV/qxqqJUkeQyYbj
	AnYGAdaSqSaVB4WANUbdfGgeGGLlnk9+WKyUe5xHsoaHSCxPdAJbXiVM8kmc8MCmJC/E
	kazdqB+mHSDInHAEi1+eOZQuWwCIV3AfQmgCyW8u23yJObHC+w6F0GMeMV3w0Ug4nlYX
	XJckLmV+abFfjHhx2XLkaHEsj0JskT3OunbWLFwhlwyVineId/nseCMvPQsoS1iQCaV8
	E9y/B0c/2dyWIpe/nFC53zP8te5i8TIJuanwoU12MH320w/gOfHzOHnbafNN+lbiUSEN
	HUbQ==
X-Gm-Message-State: AHPjjUgftdjeIvdQeIeXVU7kE8+j50AWxSQvqAusZLcJnM/pDUfx7+6s
	aV2rWOhnAiGQumkbvamQKq6g6fiKdIxvAd+bqCTbyQ==
X-Google-Smtp-Source: AOwi7QAMO3OjJG4k3HW2qLDWUDTTWJpw0m1HmWKAWSapmkX3ql8ZKjqYZG+sUeDswXJzbMmFEEH0U9C1sE/d379bS9c=
X-Received: by 10.36.26.129 with SMTP id 123mr279714iti.38.1505805736422; Tue,
	19 Sep 2017 00:22:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 00:21:55 -0700 (PDT)
In-Reply-To: <CAHUNapTtXFnCurGoVtWKL=7v7Spxj4Hg2JqGh530ktRGgVgOyg@mail.gmail.com>
References: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
	<CAHUNapTtXFnCurGoVtWKL=7v7Spxj4Hg2JqGh530ktRGgVgOyg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 08:21:55 +0100
Message-ID: <CAJTo0LaTDVp1udWw5mDwA7P3gywHOX9y9Z6AGmZU_sNzOBbyLw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] pseudo: use epoll API on Linux
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
X-List-Received-Date: Tue, 19 Sep 2017 07:22:15 -0000
Content-Type: multipart/alternative; boundary="001a114463ec054d60055985b84a"

--001a114463ec054d60055985b84a
Content-Type: text/plain; charset="UTF-8"

On 19 September 2017 at 00:16, Trevor Woerner <twoerner@gmail.com> wrote:

> It doesn't make sense to carry these large patches against pseudo in
> OE itself. Isn't pseudo one of the tools under The Yocto Project
> umbrella? Adding patches to a recipe is what happens when upstream
> isn't under our control, isn't responsive, or isn't cooperating.
>
> Can someone volunteer to be the active maintainer of it and get commit
> access? I'll volunteer, if nobody else does. But if I become the
> maintainer, I'll need some time to get up-to-speed, or some potential
> support from the current maintainer.


This patch may not yet be acceptable "upstream" but is sufficient for our
purposes, and we've obviously got a good relationship with "upstream" so
carrying it in oe-core is a short-term measure.

Ross

--001a114463ec054d60055985b84a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 September 2017 at 00:16, Trevor Woerner <span dir=3D=
"ltr">&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@=
gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">It doesn&#39;t make sense to c=
arry these large patches against pseudo in<br>
OE itself. Isn&#39;t pseudo one of the tools under The Yocto Project<br>
umbrella? Adding patches to a recipe is what happens when upstream<br>
isn&#39;t under our control, isn&#39;t responsive, or isn&#39;t cooperating=
.<br>
<br>
Can someone volunteer to be the active maintainer of it and get commit<br>
access? I&#39;ll volunteer, if nobody else does. But if I become the<br>
maintainer, I&#39;ll need some time to get up-to-speed, or some potential<b=
r>
support from the current maintainer.</blockquote><div><br></div><div>This p=
atch may not yet be acceptable &quot;upstream&quot; but is sufficient for o=
ur purposes, and we&#39;ve obviously got a good relationship with &quot;ups=
tream&quot; so carrying it in oe-core is a short-term measure.</div><div><b=
r></div><div>Ross</div></div></div></div>

--001a114463ec054d60055985b84a--
