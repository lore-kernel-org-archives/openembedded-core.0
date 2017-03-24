Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1304D77BB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:07:54 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id n21so3073398qta.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u68WRDh4lT77OmZ3BANJScbOqnm3LPZMODxavP6GtJc=;
	b=nMqEvlTrSPB4f2eEKZgLHNwOhW1U6rN+vXrRGqEqSronNxXpRhAvkGqNLVCZv3datF
	Bz3FVTGP1euEkIX74lQBfs66+QrteexN4oZDeJKb6y/EmBIyL/v7ip0GdghpelRRHALb
	d6n4AmSZzyDYJGTmdxU8uRV3p0v8ffG+Nu2B478hagy+5K+XkKWGeHbevPCByvIfBy36
	kgiClOJZLBFuSfVwIqXmx6ElfjGeQm+5KyxlX6tBwfapVzkcWdjhDmkn/HjxRCEWZHOf
	vogyra7Ky1njU3IilPWXEYYuYADV6Q7Tn+WOR/qXk+RAperaDmj3gFa6r43+ZWsJs7c6
	wEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u68WRDh4lT77OmZ3BANJScbOqnm3LPZMODxavP6GtJc=;
	b=WZMM10GPhmkdVh3GyBuRo2TWEEdX+riSPZgdOFaaUGMOB46uIh0IE95NAZ67ay3sIA
	2N7teSUP8M2AGMc7iYia10AeEk0c5/emDT/1izCtOCTXFnaUPs4DcGwi1ofkMBeFyCdc
	mdCgSPrxQAvQ14jF4kF756DMUoxW3pkUqtShEnS/WY+ulnikoabbTz9zCTfHUZXLZPRr
	S4/e18vJPRSKNJWOuv75HgelsolTkvaptEArZChfKqDiD0PQzVkayq9Qf0ld3dqHUl+m
	CEMqngWqY2dFwLwy631ImAjHc5ltsGDLF6BRfoQ65ZN0MIixVtElUb7MHbDHzsDYj6Ju
	khdg==
X-Gm-Message-State: AFeK/H0d/QUZrx/6OoWG78s7CcKRsKiMf0TiZPG5qhZh1Oahkz23Nw15k0Vw24uZJWT4duZwPwVJ2mcRSzbQVHD6
X-Received: by 10.237.43.69 with SMTP id p63mr7792588qtd.68.1490364475455;
	Fri, 24 Mar 2017 07:07:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 07:07:35 -0700 (PDT)
In-Reply-To: <82c9bea8-d333-c1b8-638a-e24945af795b@pengutronix.de>
References: <20170324111502.23474-1-ejo@pengutronix.de>
	<d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
	<82c9bea8-d333-c1b8-638a-e24945af795b@pengutronix.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 14:07:35 +0000
Message-ID: <CAJTo0LZZKN3tBLx0NBS1HCsZ5vEy5Yc9=+FLdVM9grRBRDNrJw@mail.gmail.com>
To: Enrico Joerns <ejo@pengutronix.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: perform fsck on created ext image
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
X-List-Received-Date: Fri, 24 Mar 2017 14:07:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc4261eab054b7a85d7

--94eb2c124cc4261eab054b7a85d7
Content-Type: text/plain; charset=UTF-8

On 24 March 2017 at 14:01, Enrico Joerns <ejo@pengutronix.de> wrote:

> But, there is another difference between our patches. We use `-pvfD`,
> while you use `-fy` as an fsck.extN option.
>

Indeed, I've selected your patch for my staging branch.

Cheers,
Ross

--94eb2c124cc4261eab054b7a85d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2017 at 14:01, Enrico Joerns <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ejo@pengutronix.de" target=3D"_blank">ejo@pengutronix.de</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":o8" class=3D"a3s aX=
jCH m15b009fd556cc0b5">But, there is another difference between our patches=
. We use `-pvfD`, while you use `-fy` as an fsck.extN option.<br></div></bl=
ockquote></div><br>Indeed, I&#39;ve selected your patch for my staging bran=
ch.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ch=
eers,</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c124cc4261eab054b7a85d7--
