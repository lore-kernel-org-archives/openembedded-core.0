Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 303926AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 09:38:27 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so68109642qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 02:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k3Sbx8iFQS/wp/81zOyqUo0XYCpTwLqIItr+wk2E4oc=;
	b=kzMbMnF+1MiGdAi1SBNlvFcjm/5Yls02uvZX+ncrWJ5/rkKViTe7VnBBQFiesNb527
	WiZ1awb88N4FRphpWGLchKPqCfZ0jdgOMgd1el+9NDXco1UYSaQfl5DNZZb5Q+y8PEnF
	w9FQxstaVFIuBcSSdk74B++IMqc+qTbp+CFYrCinIICYSVfw2WPZfnGgSXmaSvLkQB5M
	ymY9cAS33Z/m3FNUJHTASpyIICXpyIsm74i2pyb7wAj/l35wQ7cTzfXHERQu8QEeUxpw
	mKt/HViUMAy7YW+5FFtFP3fQ0MKqZjXAKM084+G9u4T8dPGVAtf7X+C/ZorCGfjupkmn
	Q0ww==
X-Gm-Message-State: ALoCoQlsIp7XF/+Ugd2r8v9/M4KXMdl+60Rf2/l7RS/KXWRBTxNB7oNipTgu/zQ+2f+BPToRGCX4
X-Received: by 10.140.39.164 with SMTP id v33mr29443278qgv.80.1429090671240;
	Wed, 15 Apr 2015 02:37:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 02:37:30 -0700 (PDT)
In-Reply-To: <552E2FBF.9030701@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
	<CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
	<552E2FBF.9030701@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 10:37:30 +0100
Message-ID: <CAJTo0LY=ZiJUSD+gTJqqvok8+RyskJKR0BjvJb0pjR97ZSfrcw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 09:38:29 -0000
Content-Type: multipart/alternative; boundary=001a11c14eaecfbee60513c01976

--001a11c14eaecfbee60513c01976
Content-Type: text/plain; charset=UTF-8

On 15 April 2015 at 10:30, Robert Yang <liezhi.yang@windriver.com> wrote:

> +DEPENDS = "util-macros virtual/egl virtual/libx11"
>

This means we can't build GTK+ without X11 (eg core-image-weston with x11
removed from DISTRO_FEATURES), as gtk+3 will depend on libepoxy which will
depend on libx11 which will refuse to build as x11 isn't in DISTRO_FEATURES.

libepoxy does conditional checks so the libx11 dependency can be condtional
on DISTRO_FEATURES.  That's no idea but better than nothing.

Ross

--001a11c14eaecfbee60513c01976
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 April 2015 at 10:30, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":55f" cl=
ass=3D"a3s" style=3D"overflow:hidden">+DEPENDS =3D &quot;util-macros virtua=
l/egl virtual/libx11&quot;<br></div></blockquote></div><br>This means we ca=
n&#39;t build GTK+ without X11 (eg core-image-weston with x11 removed from =
DISTRO_FEATURES), as gtk+3 will depend on libepoxy which will depend on lib=
x11 which will refuse to build as x11 isn&#39;t in DISTRO_FEATURES.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">libepoxy does=
 conditional checks so the libx11 dependency can be condtional on DISTRO_FE=
ATURES.=C2=A0 That&#39;s no idea but better than nothing.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c14eaecfbee60513c01976--
