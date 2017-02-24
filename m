Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2784072FE2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:01:12 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id s186so29187761qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sZj4NzV7A4AYn6h+Y33lk2X9chJFtKQmaoJjEXz8lGE=;
	b=QqlAxJBKN9HOH4zo51JLyxwvqHkl//9PG+L0GQi0itYLUMgJ+LjOCimGExSe4OXrRF
	yN+33IA2702+YGlhlfrspZKWduKdbPrMlzFOoNr3z9XlG9ejBBBC2+4D71wlG7NoaJ5D
	0QR1rfJke3mHVobI/q5Buvn83Cs8Nnx3xC7oCTyU5SwFcPNySqMAEcwxS6R2MO+jDxz7
	kw9JDB7MldpxDc/H6NGmrr1SysZeBAGFBrdcKWLAZynSsw6RPWpdv8hAFjLvxXNvJXhL
	MgZ8DVYVhfGmVHQ80n1idWqt98zYvumvbpYj4hcWqQ4Agl0NuD46bbHK0D+zuCo11Rhu
	ItQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sZj4NzV7A4AYn6h+Y33lk2X9chJFtKQmaoJjEXz8lGE=;
	b=noLawXk4Jb+1If1zhhDMfcC8iQacP/P2fHT7KR256OKAUKhdBfdSLg8bAS4K0nUi0h
	nVPhLqem+VA6FuuI/9pQPTI+zoA+zknGpK8ZZQbdXeBlPBOarw6/pfqVqMgrv9qWGIAH
	V/ODEwJZD1NoRy4zHTnyWJvr/zr+VxTc5zvCW3t+Lg9SAvoJIPK6bpGuK3NXAXst96Kw
	YqK9OgCMy1lrETJbeBbDy6zuM+71f32+bX5S0g/BHmN+c/E4aASMMfoKxnYutghRcsH+
	1N145BfcqdFaT2wvri8VI6XkGWlX67XDsq/mkgOrdTqjuUfbFXXi527LitRc3kZUUk7c
	8B6g==
X-Gm-Message-State: AMke39nxXeLMkAPz+jGzsHh3/K+MIw3AP4Qi2iFvyqOAjKiTrSK5gOeeu0glLbh++Jh3fWyC7q4xYApm6jTRUBCO
X-Received: by 10.55.8.129 with SMTP id 123mr404452qki.3.1487970074042; Fri,
	24 Feb 2017 13:01:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 24 Feb 2017 13:00:53 -0800 (PST)
In-Reply-To: <CA+chaQdPPNmrs_dNBh2T31h8c2LofDxtJ0jFXFrezks_YKJ==Q@mail.gmail.com>
References: <20170224205136.204410-1-mark.hatle@windriver.com>
	<CA+chaQdPPNmrs_dNBh2T31h8c2LofDxtJ0jFXFrezks_YKJ==Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Feb 2017 21:00:53 +0000
Message-ID: <CAJTo0LYj4P9doFeYwB5qPrZbXy=oEyC0sfGLv+cL5s4d1wLcXA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "flex: upgrade to 2.6.2"
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
X-List-Received-Date: Fri, 24 Feb 2017 21:01:13 -0000
Content-Type: multipart/alternative; boundary=001a114d740eb3892205494d07e2

--001a114d740eb3892205494d07e2
Content-Type: text/plain; charset=UTF-8

On 24 February 2017 at 20:54, Martin Jansa <martin.jansa@gmail.com> wrote:

> and I was pinging Ross about it few days ago as well, hopefully it will be
> included before pyro is branched.
>

It's in the current MUT, don't worry! :)

Ross

--001a114d740eb3892205494d07e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2017 at 20:54, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
>and I was pinging Ross about it few days ago as well, hopefully it will be=
 included before pyro is branched.</div></div><div class=3D"HOEnZb"></div><=
/blockquote></div><br>It&#39;s in the current MUT, don&#39;t worry! :)</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a114d740eb3892205494d07e2--
