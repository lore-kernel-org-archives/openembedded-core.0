Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 542BA7CD7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 11:36:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d17so20614968wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9qa1GIAWgN12j6egJC9K3cXGc7ige8XS3nRp6RgHs8s=;
	b=A9NP7EfZq0Y45AL07IUVzlGnGBsVeB2b8+jeqlkYOwWxP64xhiS2MW0HIk7Pdh0OQZ
	tp21GAR+rPG7vPRJj4NhSaWLFF0pZSE4USlZXfoNp/PwkgqUgfWG3SnNyFhDcS/8xeOF
	TzcvRsnfAELy3iEz4m1G6g8DkWwFjrl96JWZX/Z+Lx8lP+/gdUuGAAZNeH4QOV23YWQw
	+WOXNPpvwDxn54uhxPKN5xmDxEoe/QxJ8R1wQb7jhUb6R+6s/ga9vHHxkJIQfODNjb4n
	BbjpPy+vjtj0UbpI3JtLRClp38Y2anwB2KfVcIC+VfhMsQO69ntPPpKWo2pwuU5QT/8S
	QxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9qa1GIAWgN12j6egJC9K3cXGc7ige8XS3nRp6RgHs8s=;
	b=hzaXJ/NFBBKMSpkS9m7y4qf9yUZ+MYsLrn35e7yh7okcE+Zmuysbejdn7DuCt4xGeb
	3X0vHjPSkg0qaShkM8UJuHODo0dNVV6SxxLX/FdmWUouwfK/eWmKMGFd8xstpJ1Aeuvh
	3Ded1HUWPf9bBFGfM4sv0eivChmntnbN3XPRBRm2uqaAOzNwqiJ1mzGEHL4EmepCA+G7
	qbj8DhZDmc/E67TRbirBHPw5n3AlVD/TQ1TDRy+4VnpaikfDHY5w3l+MVO+djkFQIOxg
	JrtFq7yhpMcRSz7fp/XDFA6tJ7ujI4BN4agbtT/gmTkh59jGkMGY5NrKeBeh9NGI+rbV
	oFIA==
X-Gm-Message-State: APjAAAWWN0CqF6WNnjTk9tFwtBoAqlyNgNuNPJ0ZvT+618OQyB782wWs
	H6lkYqpQepMLousE9+RdJxM=
X-Google-Smtp-Source: APXvYqyf42ygAZkeDmd9fSaWjZ2rV1TwTLAdTV/evlg8JoABo61G2mhOeG5DAD81V71Zecsbcv++/Q==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr540905wrq.147.1552995361034; 
	Tue, 19 Mar 2019 04:36:01 -0700 (PDT)
Received: from ?IPv6:2a01:598:b00a:dc3f:92c:a996:7b40:80e6?
	([2a01:598:b00a:dc3f:92c:a996:7b40:80e6])
	by smtp.gmail.com with ESMTPSA id t2sm44697360wra.9.2019.03.19.04.36.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 04:36:00 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190319104001.GG1994@jama>
Date: Tue, 19 Mar 2019 12:35:59 +0100
Message-Id: <22BB06E0-D9DD-4070-960B-53D03755B65A@gmail.com>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
	<D3413079-663B-47D2-8550-658159790D3B@gmail.com>
	<20190319104001.GG1994@jama>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 11:36:00 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Just to remind once more, all upstream support for OpenSSL 1.0.2 ceases in 9=
 months, so shipping products with it may not be the best idea.

Alex

> On 19 Mar 2019, at 11.40, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
>> On Tue, Mar 19, 2019 at 11:22:11AM +0100, Alexander Kanavin wrote:
>> The commit you refer to changes the dependency from 1.1.0 to 1.1.1, so ca=
-certificates currently in thud already needs 1.1.
>>=20
>> Alex
>>=20
>>>> On 19 Mar 2019, at 9.55, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>=20
>>>> On Mon, Mar 18, 2019 at 07:36:29PM -0700, Armin Kuster wrote:
>>>> Responses should be made by Wed March 20th 22:00:00 UTC 2019
>>>>=20
>>>> The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed3=
55ed:
>>>>=20
>>>> mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)
>>>>=20
>>>> are available in the git repository at:
>>>>=20
>>>> git://git.yoctoproject.org/poky-contrib stable/thud-next
>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/thud-=
next
>>>>=20
>>>> Alexander Kanavin (1):
>>>> ca-certificates: upgrade 20180409 -> 20190110
>>>=20
>>> This depends on openssl >=3D 1.1.1 since:
>>> https://salsa.debian.org/debian/ca-certificates/commit/d5e425c8405448e50=
34d1e16ca52be6a10cb3334
>>> some people might not use new openssl with thud.
>>>=20
>>> More detail in:
>>> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280=
234.html
>=20
> hmm right
> https://salsa.debian.org/debian/ca-certificates/commit/1bc87e0b41a04551a93=
d4e784e158b044c18792a
> was already included in 20180409, another thing to work around when
> upgrading to thud.
>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

