Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5E2739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:40:19 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so255323721qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iuiOF2xU0wTac0s5V9U5RAcZTtjAfPJjr4S/QrgtPAY=;
	b=cpmHUdMHOyBkDvOj4YtpQLF/L5f4uIQp3ajKU/zNIasEtiD4YdNrRxrdcO3BVEk98L
	x8FXiV8seJ3IYx1ijipQsf3teVBqyQKV5T4InURiwomRMYvEejVAhP0eH3iHQXWtPIoj
	4+W9bZ75VJ3E8iuHIKvhjA2PDwEogUTo/IPIp2hIaEBdUP7XwW9jNlQuoZa8ffrRvI46
	gpWNvOsB84nDCTASIARmdVhzXRWNaWX3Up4gQPHsq5hFw0rgCjYpeOq2xPH9rPNFdrPD
	05e/NE1yIffcVc5m6BG2zgJS6FmUf/kJy5RRLy7BDEjzk3kfgCnU4uLL+EDT2RAN8Ld5
	wptg==
X-Gm-Message-State: ALoCoQlLrpexBEk/g48YeLT4+dBCBEmP616cvuxI5tHhFaALCp/KehaDTKQ3ogkEZMvV8KVIKEJ9
X-Received: by 10.140.150.142 with SMTP id 136mr53656046qhw.17.1436798417671; 
	Mon, 13 Jul 2015 07:40:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 13 Jul 2015 07:39:58 -0700 (PDT)
In-Reply-To: <CABcZAN=fvRRCS1UzYwOWsgDwMOd5Ut7RnDp6fuv7Esu8oOh4=A@mail.gmail.com>
References: <cover.1436795781.git.ross.burton@intel.com>
	<0263c62a7c1a31f2d974d1b5f635133b16d92d2d.1436795781.git.ross.burton@intel.com>
	<CABcZAN=fvRRCS1UzYwOWsgDwMOd5Ut7RnDp6fuv7Esu8oOh4=A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jul 2015 15:39:58 +0100
Message-ID: <CAJTo0LZ-tdpMsBFB34nZXdw7ZLQEGqOWV+ZvnAbCWvoq56ibZQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] libc-package: fix path assumption
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
X-List-Received-Date: Mon, 13 Jul 2015 14:40:24 -0000
Content-Type: multipart/alternative; boundary=001a11357d4a4cb394051ac2b3a9

--001a11357d4a4cb394051ac2b3a9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 July 2015 at 15:38, Christopher Larson <clarson@kergoth.com> wrote:

> This says you=E2=80=99re passing -C <dir> to oe_runmake, but actually pas=
ses the
> dir as dirs for exec_func.
>

Good point - passing -C doesn't work as I was being stupid (bitbake can't
find a function called "oe_runmake -C ${B}").  Fixing comment in the repo.

Ross

--001a11357d4a4cb394051ac2b3a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2015 at 15:38, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">This says you=E2=80=99re passing -C &lt;dir&gt; to oe_runmake, but actua=
lly passes the dir as dirs for exec_func.<div class=3D"yj6qo ajU"><div id=
=3D":129" class=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div=
><br>Good point - passing -C doesn&#39;t work as I was being stupid (bitbak=
e can&#39;t find a function called &quot;oe_runmake -C ${B}&quot;).=C2=A0 F=
ixing comment in the repo.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a11357d4a4cb394051ac2b3a9--
