Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB3E37D5C0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 18:45:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id c4so7732954ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2019 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tEYRAHDY2smJKNDYnmF4OJQcvBSVM0rzW2X1A3lXzoc=;
	b=shz8g3AR3hV+djhNBznXf1Nx49PVKFHtLsIKvwr6gfsbUhR1aMBe0+AImnzp80AH7a
	5zcLI/gO90C/nAr/mqT6XwxJnSiHhvFHLwjkH0n9TgJIosrFobdj0OVYdbkEw+NX6HTr
	hTBtfjZg+WZEe+Vh0BjJqg1mgjYrAYG/SrN0Sh92I15xqvigq/DaIVLih7JyaKnFcRTc
	4Lqo9WxikN35VlhN4OABLXuWUuTWo7/sS3WiM6EBHYfFo6jBBEo89/eiblQvgO14QJFn
	gmsH9jWsI8vuPkb0MIUETuzIScQmrnmTd5tbp19rCnmj5vAt7B7NyFWMpunwc+IvRjkD
	dlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tEYRAHDY2smJKNDYnmF4OJQcvBSVM0rzW2X1A3lXzoc=;
	b=AzWhcQrl5D1e2CXTw8V6i2A1tlByrem0G75oGu4P6uq7X24iNKek7hO3hBiwf+NNCg
	VfRCSBOmrdBJjRzfrTbs22jRftQgD/S38mkVcdsZ+12FezNEP5bXEwVBVMLejjlmNBMx
	hwNjTvjdI/yM3JYmpO5kdkXvoo8ZF6BB5Y2nDhTTNh1LgxpjdI5KKLXjOSNzbZIyBiE4
	/tXRqMLqW8dMlM+ycFec/yJvxmmRTML5GYGGmv4rQTyTO2k1xpbMMGa6y5OuWkCEBkLS
	uk3AXWqmnRnzPRb+C7qELqNY/R7x0aW301JSoNaJ4zYudgDIZsTDhFbnDp1AkLIWzg9I
	V/Gg==
X-Gm-Message-State: APjAAAWl0YvUqMIO9Cu1ZUQ0fWgTL++PuHHXHNH18bMIIKK2ZsH7cfXA
	af+oefAcI3arSf4HfBDzH15AQkfQFkPHH96Ken4=
X-Google-Smtp-Source: APXvYqxrU2M9Y3Hst1n4c3nswrm4Ib4H2yX2qaxshy6re1tGIobnMQt1OMYUqYQ0+MoSwWSHodv4IGFRpvXt84KXHP8=
X-Received: by 2002:a6b:440b:: with SMTP id r11mr3751088ioa.48.1554576329715; 
	Sat, 06 Apr 2019 11:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190406161948.9151-1-raj.khem@gmail.com>
	<CALbNGRS9mRJidO1dDRrwJjBadjMz4DjRr40pj=WhOSF8443x-w@mail.gmail.com>
In-Reply-To: <CALbNGRS9mRJidO1dDRrwJjBadjMz4DjRr40pj=WhOSF8443x-w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 6 Apr 2019 20:45:18 +0200
Message-ID: <CALbNGRQwCG=vGmfiiuSSZzgFv6Qh7Du3LEpN7KR-Pzz+93KVbA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: Remove --enable-introspection
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
X-List-Received-Date: Sat, 06 Apr 2019 18:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2019 at 8:27 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
AArgh recent comment went out way too early.

This patch won't work if gobject-introspection-data is not in distro
features. Then there would be unknown configure option
--disable-introspection.

So what do others think: ignore unknown options (then my patch is OK) or re=
move?

Andreas
>
> On Sat, Apr 6, 2019 at 6:20 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This option is not available and recently it is reported as error
> >
> > do_configure: QA Issue: gstreamer1.0-python: configur
> > e was passed unrecognised options: --enable-introspection [unknown-conf=
igure-option]
> >
> Send out a patch already addressing [1] but honestly I parts of this
> parts more: remove option instead of ignoring.
>
> Cann you add:
>
> -inherit autotools pkgconfig distutils3-base upstream-version-is-even
> gobject-introspection
> +inherit autotools pkgconfig distutils3-base upstream-version-is-even
> gobject-introspection distro_features_check
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>
> or shall I send V3?
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/=
280958.html
>
> Andreas

