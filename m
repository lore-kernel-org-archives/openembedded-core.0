Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHZK8-0001I2-Sl
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 13:33:25 +0200
Received: by wgbdr12 with SMTP id dr12so4182289wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 04:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=NLnarAalFeL+BS77eka9ltE8E/b+9ZdruE4OaGZuZUM=;
	b=MJMhw6tBuX+DLpXwXLlgIhvnYGKNSu1X0uEfRQAmASZ/T0qUUj91kILR5MAoDVUkkp
	vwcWcHyd1ZclEHViXoKdoDy6EtR6Jv2tsN8ke4vDpHPhdHEbU9qzw1KLoaTyfbQbXH8E
	R0Ovunb40bJKRQdhD6/zsEMzPD0l85V8YxmUAQ+FcabYx7SSP7Hj6yQhYsVDJJVvukiy
	pmDrf8mngMulBLLGH6m7rZMzN5oy6TbMVokzstXolYlf/6mmMIdGIqF/BimErrlb7A2T
	gOSrSoyZj3s9q1y6K0FnLO2IApBPHo/yJHi1/6YGLG0Kibr4nNnNh51F7w3boICY3ud6
	FLTA==
Received: by 10.180.101.136 with SMTP id fg8mr6165439wib.4.1334057047268;
	Tue, 10 Apr 2012 04:24:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j3sm60159333wiw.1.2012.04.10.04.24.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 04:24:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrEiLo7DMkNBks8s8jHw=WgTQ3S_zf-QUYSseLqD5tMEQ@mail.gmail.com>
Date: Tue, 10 Apr 2012 13:24:04 +0200
Message-Id: <3FB0FE38-93D2-44D1-9BFF-2E742A8BEA92@dominion.thruhere.net>
References: <cover.1334027369.git.lianhao.lu@intel.com>
	<0953244152d03d27f6c60729c58484af81f95a1d.1334027369.git.lianhao.lu@intel.com>
	<637B72D9-1F2D-4CD3-8903-36E73E7CC465@dominion.thruhere.net>
	<CAP9ODKrEiLo7DMkNBks8s8jHw=WgTQ3S_zf-QUYSseLqD5tMEQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkDSe564xYDvoBl3H7/Lgwvf5ZGdJH7oj5VVV5vUtUQ7Mfu91qdcBJAWvDl/TbB9MveG9eO
Subject: Re: [PATCH V2 1/1] connman: optionally build ofono plugin.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 11:33:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 10 apr. 2012, om 13:18 heeft Otavio Salvador het volgende geschreven:

> Hello Koen,
>=20
> On Tue, Apr 10, 2012 at 03:48, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> This changes the default behaviour, so it should not go in for 1.2
>=20
> I don't see why this shouldn't be included. It does improve build time
> and works for both OE-Core and Yocto setups.
>=20
> Can you clarify what is your concerns?

It changes the default behaviour. There shouldn't be any behaviour =
changes so late in the release cycle.
And apart from that, it should use PACKAGECONFIG :)=


