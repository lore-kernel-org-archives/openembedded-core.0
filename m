Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 20AF273D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 13:33:42 +0000 (UTC)
Received: by oiko83 with SMTP id o83so3841519oik.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZMspqPWMmmhU3QoRGdvT1xDgmV2WLMtIRImw+n5QkUU=;
	b=hHi/qhJFe9kRKrc+dIFp1QRjoEKUm2buPAXd9F4YDSC8XlhNWOayaGiJ8JJN5m5jf4
	wddZcd90aZjqUjFTvYYG73ez/mKN1rWnAuSJAGVP9fzyIagPpLvvxLZcKEXPJ+cZRxeo
	2gNCVLT7dTLU76oH8zNAOWY5Yr5ik1Z87CrqAjF9o+YwS6kRqnpc9OJYJPTo3AaDBN+8
	c64rDOG7Qq+rgYtyJ6orhLBgnLN6pZ9t0/Hlnhdzg731Qomf75PGpqsW5iCgHt6dn5sP
	WISJQWKURFsQsovayFHA0SFBNwXSgPm0Fg/x5cnfMID9IfMH+TZl1Er5JeQ8tHXf395k
	7Jhw==
X-Gm-Message-State: ALoCoQmBxE6OxV0SOPrnSoucTSQZO7Z1ewGYk2BJ7cFApyTVcDJhmQ2SUpSbhzlIioGWlwsyWIfX
X-Received: by 10.202.224.11 with SMTP id x11mr7355084oig.33.1428932023599;
	Mon, 13 Apr 2015 06:33:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.216 with HTTP; Mon, 13 Apr 2015 06:33:23 -0700 (PDT)
In-Reply-To: <01d8849d5b3421ecaed8bd5d9ccb5e8cbdc926b8.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
	<01d8849d5b3421ecaed8bd5d9ccb5e8cbdc926b8.1428656126.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Apr 2015 14:33:23 +0100
Message-ID: <CAJTo0LYLK6=BLLhQj3o28ApZwq_vGhCAmkK1ijyVWBWHdevwFw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/15] aspell: remove libpspell-dev from PACKAGES
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
X-List-Received-Date: Mon, 13 Apr 2015 13:33:45 -0000
Content-Type: multipart/alternative; boundary=001a113d42e0acdcf205139b296f

--001a113d42e0acdcf205139b296f
Content-Type: text/plain; charset=UTF-8

On 10 April 2015 at 10:29, Robert Yang <liezhi.yang@windriver.com> wrote:

> +FILES_${PN}-dev += "${bindir}/pspell-config"
>
>  inherit autotools-brokensep gettext texinfo
>

Is that a binconfig-style pspell-config and so we should be inheriting
binconfig.bbclass?

Ross

--001a113d42e0acdcf205139b296f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 April 2015 at 10:29, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2mk" cl=
ass=3D"a3s" style=3D"overflow:hidden">+FILES_${PN}-dev +=3D &quot;${bindir}=
/pspell-config&quot;<br>
<br>=C2=A0inherit autotools-brokensep gettext texinfo</div></blockquote><di=
v><br></div><div>Is that a binconfig-style pspell-config and so we should b=
e inheriting binconfig.bbclass?</div><div><br>Ross=C2=A0</div></div></div><=
/div>

--001a113d42e0acdcf205139b296f--
