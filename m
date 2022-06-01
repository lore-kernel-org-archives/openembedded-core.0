Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C254BC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 11:48:25 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web11.6561.1654084103880986562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 04:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from [10.10.1.194] ([81.221.243.92]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0M55Wy-1naywG24vG-00zI3k;
 Wed, 01 Jun 2022 13:48:18 +0200
Message-ID: <d5813d390095db53d46f4177873035f3ac8bc9ba.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Peter Bergin <peter@berginkonsult.se>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 01 Jun 2022 13:48:16 +0200
In-Reply-To: <0e25e13f-2370-993b-a7dd-3780f056cd58@berginkonsult.se>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	 <20220531213206.7119-2-marcel@ziswiler.com>
	 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
	 <ab46486dd45aaedcfd1d00817e403572ef0b64d9.camel@ziswiler.com>
	 <CANNYZj8QZH-PyopuyQ8oo8mL7K96Jh=3-659zL=B+LvT8HWAug@mail.gmail.com>
	 <b448e78d04ef6dda6cfb2b974b5b5b7f8b7c3981.camel@ziswiler.com>
	 <CANNYZj_+wqbxXbyQ17a=eZJKhq9hjzpXMCO019iAwNXgvs5RBw@mail.gmail.com>
	 <0e25e13f-2370-993b-a7dd-3780f056cd58@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:XVAiwgwXKICoiacHDsUh0LNrS6VyiZv2LkHI5PXjuDDlj3bWsdR
 rnKGRqv7o7L6zgI2/Opu9SBtY95/J4PLBrhWdNWXXn2+o5+3if+SedGhs1R/xF6ZvMKV+Ky
 tnPCcBwaNxXhYOoeLbmZwQWz4lcJ56yBbv4dVuseIxDmq2GQ3tfiGDzSlSHAROmD6tP5iOw
 9+GmwI78StbO9CAC/CQLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nd90+Ak3QdU=:loXXtcGllWAI4STZonSACo
 V2T78YBXypbU3DO4UaZz0YSvzjel0T2xoPGJ+VHHafV4NqRcG4VxFyPtvuNIHsc6Pk56+Nf8c
 pn3/IhjqhwOHLGZjuoQcU6on0VSR/+X21GkZivyEs6Vs/uWE0M9cjsv9iZg5uAptyIft3ZcF4
 lUcRMP3RzDDjtw+cjNWzrs0mj8Jc8yxBLTKgZyK+xnysy5SrPHkWcGjkDLLUWHszw7fGP84jH
 DteYc22EdQYWxz1CeB2h217wrXNz0sRR9/K9mWa6YFD8duZ92pUVacjzWhHsjHcpqcQGm7PGr
 8fc7Jl1n3cRlsiIfFw47OyETRZpMv1S4BB5immlCbJM44K+UhzDxGSrm0+p9E3S/7zFQ3C837
 Ur2RS2If10fj5YW/3s3BPzZ6OHNUVAfU2c9Zgnp0MqYFWIfL3SAObcOwEuQWyoqHZET9NOGfH
 FTE2Y4eooUiuxnk7KowzR30Amoq3EmCJ3b219d01lJx3bF/sbMMM0YKdYiZYC1RyUW3Yj9Rmn
 QFCzKC5TkWUknDonFPveQxnzupQVQp41qFYUlYEtWyhJy/IAeB5smU+TWM+hd/goZhoOHLg31
 +07r6wXgM2cNnCn8whzGmnW4HZ++5A2+YN+mDqxkGESCE5CG4XTL5P0PY7yeX2DefYuJMpZaj
 qduhai5TN+FvSPHbblTlBeaC+ObF73HtxDyE+u/2o467QhVYVkJB7dXUVS41451Ce2izCJO67
 gUbQbwf092SHgzSYbsUTyEehiKUYKWwDzM5k6w==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 11:48:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166375

On Wed, 2022-06-01 at 12:52 +0200, Peter Bergin wrote:
> On 2022-06-01 11:43, Alexander Kanavin wrote:
> > I'm not sure what the dilemma is, inspecting the repo shows that
> > there's a standard 0.2.0 tag pointing to a commit in the master
> > branch. You can look at pretty much any other recipe fetching from
> > git.
> > https://github.com/Avnu/libavtp/tags
> >=20
> Agree.

I also fully agree. Sorry for my confusion in this regard.

> My suggestion for solution is 'SRC_URI=3D-...;branch=3Dmaster...' +=20
> 'SRCREV=3D<sha-sum of tag 0.2.0>' and rename recipe to libavtp_0.2.0.bb. =
I=20
> don't know if that is against any style guide or rules?
>=20
> And also fine with a move to meta-openembedded.

Sure, let me do that. Thanks!

> /Peter

Cheers

Marcel

