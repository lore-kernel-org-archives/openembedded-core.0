Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C062C719B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 10:28:14 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id s140so15709026qke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5dvgT6o3/dEz1mSHuYG4/45zYS/Tk62Rmk0gD4RyY/I=;
	b=szjchOVp3Hz4oN53NMx2xcxs+B+COiRAqjyVIpFzMkffT4pw2KZxDhj+Ybr7/IvlZ6
	FlUsmf7K6BhIepu2xfQ/4nNz7RC4BXljyKV6tTKLxTualUgXraeKr+QIxEwp7iDBVPwa
	Pq0o0uKZN9Y+rc4Gc7WhsVovIxqyJVglMdzGG2/8V0aHp7sVb06kJQTZur74oOMABvIz
	BRezWM+QIee20J3b1tO+DvX3D1tvkldG/DLK5Gu/nXQctzHg4wzRJaBH6LEv2qMjnekL
	VxRS13x2aCoEk140jFGJGUGyV4K476I6jxgNEfQ/PfKuso4R2veEDejzbd2qlwb2UaZe
	5G6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5dvgT6o3/dEz1mSHuYG4/45zYS/Tk62Rmk0gD4RyY/I=;
	b=YXOrSgfZ0HC2/Cn5bVW5B0DgpHh+f2g+uenvlbsmgM6QDZG08Hi/+srfMLLzkndkYk
	o4Gp690hhJCh/ivmUnq+2Mm+GxdD8HTrHjvLaZWTNrFZA5xBnKcDzE2jUeoOhY/BYEBd
	CPiNFrMVlDelZsDJA02p5NSAjDKP2T2XYj8x8nDXYwUvEnzpZzM8+L7wDnNRAAQVrNqo
	t6xKoK2pMbaC8fJT9oVS1NRlM5Ptj7oqqweWxVxQO+i6Z+px+zZAohsO0PFBxIZMI5cm
	4AZFYT5BUY5w+gkzkOzRe2kY/+vMrwXRB4F8iueUbemDK35KpniUHR2P+jPo/8woHopL
	VsDw==
X-Gm-Message-State: AIkVDXLjpOvyNOr5Nyb+QpZDShiOTRKchGl9X5fRrCmvrPuYnq4ybpeFo/lZGHaOqzgeQak7s9wLwbODtHdw7BWP
X-Received: by 10.55.31.24 with SMTP id f24mr11876693qkf.221.1484216894667;
	Thu, 12 Jan 2017 02:28:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 02:27:54 -0800 (PST)
In-Reply-To: <CAP71WjxSDG0_XdT4D_jjKr+L2wN2haez0rsricomUQ+Pj6cBCA@mail.gmail.com>
References: <1484200338-27391-1-git-send-email-sgw@linux.intel.com>
	<CAP71WjxSDG0_XdT4D_jjKr+L2wN2haez0rsricomUQ+Pj6cBCA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 10:27:54 +0000
Message-ID: <CAJTo0LbvNGujUD53urqPPThpMg85D_33zh_xjigUoKO=UMpEuw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: Enable glamor by default
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
X-List-Received-Date: Thu, 12 Jan 2017 10:28:15 -0000
Content-Type: multipart/alternative; boundary=001a1147e2bac6d4ab0545e32cc9

--001a1147e2bac6d4ab0545e32cc9
Content-Type: text/plain; charset=UTF-8

On 12 January 2017 at 07:03, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', ' dri3 xshmfence
> glamor', '', d)}"
>

Yes, glamor is obviously triggered by opengl.

Ross

--001a1147e2bac6d4ab0545e32cc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2017 at 07:03, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":6il" class=3D"a3s aXjCH m159917e92e1248e7">${@bb.utils.contains(&#39;D=
ISTRO_<wbr>FEATURES&#39;, &#39;opengl&#39;, &#39; dri3 xshmfence<br>
glamor&#39;, &#39;&#39;, d)}&quot;</div></blockquote></div><br>Yes, glamor =
is obviously triggered by opengl.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1147e2bac6d4ab0545e32cc9--
