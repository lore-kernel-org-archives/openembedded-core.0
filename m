Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 27AFC6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 12:19:03 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id mw1so47266676igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 04:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Jj1SAo6nQKz5t4PW2N9F5Y6u4E8z8Xzves3rF9XidFg=;
	b=16fl0jNXdACuSH43YuEXdyBBP2NSPT71KRZq+n+LOgLohPG93/6LyeH0YPkCDm2I+H
	hBNMkU8mZryYwk5JFhUc+xG5eWtnf95yo0IuUl/91A96PV1/93qkH/L3O4Q4dGT+eZKG
	orvH2n7YMc1MUanZy6qgQuggcisBpyg/QaGlujEnJwOVzCQHF27mjQN8otLyLoeMuamV
	hXSAAq5qzMD4zPiz8qw/CwwZDL0D5A0dp5o10EwrJyl2w5fRHmu/NN+JclfYkfQ9sXki
	5PtR7DUSMXWhfYB2LbSU9xF96sVPOYARZ639+yrK/1jKVmpc57uaWOTv85zkyORzWGMV
	YdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jj1SAo6nQKz5t4PW2N9F5Y6u4E8z8Xzves3rF9XidFg=;
	b=fKP4IMRqrzW/WvwHWhuCkvREigTm0exuazbnJstlp0FB0dN3qpXgJkwfJ7kwyU7n7c
	FkLbfpzIzP9qqhTCTBuPl2Hvw3CcC/zDwFXr9IIB3P0wXekp/Np6ZEbRgHvQrsKYZdKL
	Mg0Vazaq8MHApsppM1jRo8AB0osNKoMIjDFooUBpgVAv2HNMuO+aVtA+VfXf1cK3TO1p
	cRzJNuTBfs26eQwmES5PNebwSm9tQbnjtOqFTBussODZENsPllP5gSQ1v4kdMHCipyuy
	hlgaiXT/mCCJFiP8qaRpJAFgf66l7wR7mDP9Tu0UgINIRHdcKI59F1L+3UmT30bYtKVp
	MNpg==
X-Gm-Message-State: AG10YOQxNlf6VRQvxD7jsTEbZkJU+dYDA1tpXKUXV7J6LJf7/zW/oaxMnB3ylw9spnpvrWCmulNhq9+jxqDhO0bU
X-Received: by 10.50.126.8 with SMTP id mu8mr9931391igb.52.1453119544521; Mon,
	18 Jan 2016 04:19:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 04:18:45 -0800 (PST)
In-Reply-To: <1452804424-17632-2-git-send-email-danismostlikely@gmail.com>
References: <1452804424-17632-1-git-send-email-danismostlikely@gmail.com>
	<1452804424-17632-2-git-send-email-danismostlikely@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 12:18:45 +0000
Message-ID: <CAJTo0LaZgist+rg-WYBOFQ8ZBsnyhwWs7U89XZjHeYXZ25rcKA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: make localedir nonarch
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
X-List-Received-Date: Mon, 18 Jan 2016 12:19:04 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf44995305299ac20c

--047d7b1635bf44995305299ac20c
Content-Type: text/plain; charset=UTF-8

On 14 January 2016 at 20:47, Dan McGregor <danismostlikely@gmail.com> wrote:

> -localedir = "${libdir}/locale"
> +localedir = "${nonarch_libdir}/locale"
>

As was recently discovered, this variable isn't really used in many places:

$ dpkg -c xz-locale-de_5.2.2-r0.1_corei7-64.ipk|grep mo
-rw-r--r-- root/root     26533 2016-01-12 16:50
./usr/share/locale/de/LC_MESSAGES/xz.mo

I'd suggest that localedir should be ${datadir}/locale, and then any
explicit users of ${datadir}/locale/ replaced with ${localedir}.

Ross

--047d7b1635bf44995305299ac20c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 January 2016 at 20:47, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D":3fa" class=3D"" st=
yle=3D"overflow:hidden">-localedir =3D &quot;${libdir}/locale&quot;<br>
+localedir =3D &quot;${nonarch_libdir}/locale&quot;</div></blockquote></div=
><br>As was recently discovered, this variable isn&#39;t really used in man=
y places:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra"><div class=3D"gmail_extra">$ dpkg -c xz-locale-de_5.2.2-r0.1_corei7-64.=
ipk|grep mo</div><div class=3D"gmail_extra">-rw-r--r-- root/root =C2=A0 =C2=
=A0 26533 2016-01-12 16:50 ./usr/share/locale/de/LC_MESSAGES/xz.mo</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;d sugges=
t that localedir should be ${datadir}/locale, and then any explicit users o=
f ${datadir}/locale/ replaced with ${localedir}.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--047d7b1635bf44995305299ac20c--
