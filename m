Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 51EAA725C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 16:40:11 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id kx10so14474903pab.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 08:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JJsXXVzH4pZ/r59UvR2wPyP4nwXj4YysL3qLSvYXKvQ=;
	b=d/XsbrvckE61W73cVoptVupEFsu0rOVqXn/pxaOIbO+qh95vVJCbwq2A29HK5vUfOr
	Xiwc/+afzd/qX0gA4CeOFSJYjh4Ol+GidxEISVvedJl5GtTTDvQSAz4EPQuNzTufUedB
	i/CKZgyJinXtjL12NlPzP/F+Sdo1O0H8WD66mdXy+FpyO8T0T+udkzFne4agllaHwR9C
	3VFHx6nvVgFq1x03UtyumEQHFg+TVCINm+Khp4ZmxvAV45PgC9z3Cy6C2erRnJcO/hlI
	nEBtdg1zJ01XUNdT9Py/K6lISpeJ6v5/d+zmMvMbwC68eMtp7ZDBvEmjju+IPQmCc4vA
	r7Tg==
X-Received: by 10.70.19.101 with SMTP id d5mr62548386pde.10.1418748011627;
	Tue, 16 Dec 2014 08:40:11 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:447d:2ae8:83db:988?
	([2601:9:3580:84c:447d:2ae8:83db:988])
	by mx.google.com with ESMTPSA id e9sm1415207pdp.59.2014.12.16.08.40.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Dec 2014 08:40:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <54904BDA.1080005@balister.org>
Date: Tue, 16 Dec 2014 08:40:10 -0800
Message-Id: <7CC1BDD4-170B-422B-BC51-33EC0B07E64A@gmail.com>
References: <54904BDA.1080005@balister.org>
To: Philip Balister <philip@balister.org>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Setting a a fixed resolv.conf file in OE built image
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
X-List-Received-Date: Tue, 16 Dec 2014 16:40:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 16, 2014, at 7:12 AM, Philip Balister <philip@balister.org> =
wrote:
>=20
> Any tips on how to do this the right way? It seems like fixed
> resolv.conf's are no longer fashionable and the volatile.cache script
> goes to great lengths to reset it.
>=20
> Adding a dns-nameserver entry in the interfaces file never makes it to
> resolv.conf. I tried installing the resolvconf package and played with
> it, but no joy. This package also appears to have some issues with
> missing pieces.

depends a lot on what package combination you are using. If its systemd =
and you
are using systemd-resolved then it generates resolve.conf in /run/ and =
symlink
in /etc/ gets the job done. if its udhcpc then it will populate the one =
in /etc
and it will take interfaces file in /etc into consideration

>=20
> I'll file bugs, but until I can figure out how it is suposed to work,
> any bug I file is going to be pretty vague.
>=20
> This really should be easier.
>=20
> Philip
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


