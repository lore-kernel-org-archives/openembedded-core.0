Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDD275894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:39:33 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z8so3678808ige.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 12:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FEvEh1RgZX/Zt7V3qZRaYroaPZ9zf3+oPwGdKW5Yuwc=;
	b=eJ61r2UBqLoK/3vs4ogoWSylnsOWXKEqH4/15jlis2q9fca2ZgAJTs/Th3GmLnxLLN
	LgmdvotBA22hlcqU4ErI8bw6MOkjymiGDClqJ7XBr7WvMshO9oKMRVbuwj37FkBthzxX
	xIiztUZl35Y+6lNCItbrNW7ASk0kgJsvTBchEl4DoQMQuqgzfWdiyHKE41O2Wf/bmeXY
	lZny2p7B1oUxYv9xJwGVV4QpmxYYzgEASkj8/NQMzx0KmoQytCHIPbMbG3am2mwdNj+H
	wl+zdXobA9P/mhvNhNnOHaAFSiDocOzcW41cGZGfsZJDpdLmyWXMHlkeytsQIl0da0ar
	c7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FEvEh1RgZX/Zt7V3qZRaYroaPZ9zf3+oPwGdKW5Yuwc=;
	b=hBgsp+lPMzXdFcPP05xlFLUd/+2H02c7jkj+5mqOHknlBao1aeaZDPFq8vBYrirLh1
	c4gKubP6zmjS+pPqMswxXVZrtj2iblcQNWI7IGM1NXIb9t5DHMFhywcEMDIx5dVJJ/Nj
	ngDIiXOA1Y5fdPoRN7MY9ogCMYEAVgB9Woc5dxLbbj/OK6orBnNtie7yDAxJfhS1Q5HC
	v19jzmg8kbGcJjEWS4xWaNZYyEDYDIwIbInTYc6YpSTvOP40c1FtmA4XWmCfRlA/oX2F
	vMsLwTzppfW7u3m1r1O3rrMQasIXy3lNieLKFghsF0Q7qejw5MWIJdxPZgCUbkb9+ixJ
	QvZw==
X-Gm-Message-State: AD7BkJJ4Kidn4o9CkUJTeYNiNk0PhwjA5KWAEO0yo+KA9J2qH+glqbc954LBkmw0MsUN/33poOQ7/DPPlKSpmtmP
X-Received: by 10.50.66.238 with SMTP id i14mr11210283igt.52.1456778373998;
	Mon, 29 Feb 2016 12:39:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 12:39:14 -0800 (PST)
In-Reply-To: <C902FB1D-2399-4CFF-B128-B239DDBF9539@gmail.com>
References: <C902FB1D-2399-4CFF-B128-B239DDBF9539@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 20:39:14 +0000
Message-ID: <CAJTo0LYuo4czMifRzRyTD4vcX+YxD0R6cmeGBAAKxL+xJgzz2Q@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] avahi: make dbus optional but default
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
X-List-Received-Date: Mon, 29 Feb 2016 20:39:35 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109c7fefd4052ceea5ef

--047d7bdc109c7fefd4052ceea5ef
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 20:19, Jens Rehsack <rehsack@gmail.com> wrote:

> +PACKAGECONFIG[dbus] = ",--disable-dbus,dbus"
>

With --enable-dbus for clarity?

Ross

--047d7bdc109c7fefd4052ceea5ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 20:19, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">+PACKAGECONFIG=
[dbus] =3D &quot;,--disable-dbus,dbus&quot;<br></span></blockquote></div><b=
r>With --enable-dbus for clarity?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc109c7fefd4052ceea5ef--
