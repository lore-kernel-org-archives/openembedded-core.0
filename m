Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB43A6D7C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 15:40:19 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id a25so9793634edc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ON7MqdpOjndgDKyKnKfuRmXXvWbZ8MMg+AwNiXn9VSA=;
	b=HAo5j65+fDh0VDlkrutu63zTBZi2luMdt/c+ofLB+kuCSw8N5cRa7kBnBVhThvdXP6
	L+DhbwkJnpI3Qyv8fVGQPYKM8FPbCgJKv5y1Y9AvThjDU6ebvw0A45EPPDQIJgcPlkDV
	Krsac6sAKntUYU+EvKsgGlY6wRhi0Belcpn1kPDpDXPdRP1t3l94iRHDV45tmoLPIc4w
	p45czJ8F/XpJttLCnJTQfeLaZWke2BazXclZlSaFKjeFzLo/XXG6jcTXUMysJtjYKnUy
	KqPfc8nsLKXz01tg/yMA/iZiQ5BKDDFnkbEHHMg7hsAyB2zg5zei7PHDJUU6T0LtP8cv
	DQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ON7MqdpOjndgDKyKnKfuRmXXvWbZ8MMg+AwNiXn9VSA=;
	b=aG37uRdbsXIL+Wd1EUWcKrcHw4l88I1YLluqI8y05iY4hrImAFaPi3Al7gl8KOoddC
	oV3hl1jrGaOe464iVDINuXljrw8mj3/L+XOFDiLMO7jPz4HwMQ0E8lMpuw6XLysl5lGN
	UoRYUbq6mjWEJswRZUa8jAze83TMDd5n/oBD1srPcH1oQwAbC7zd7Ey5Xx8j/N26X8Yy
	9P3Lw/KB2zH9esmWkXI4+hJwNwHRsRthg9HmaUws3b0FNPe8YONlG7AgysXhYlF8FtYv
	ZdqNDz7U4ZxgQZSpmPfpPtbypOikES0rOTLtOMfVQlIqwwsPHdMkD8smGEVafZSY+kpb
	OvPw==
X-Gm-Message-State: APjAAAWe5C/pwVZjD/IbphjXIpz/xFMHFQvx5oJ8FOJp4vMA/6hMYl5B
	PFSkKB6SwzW4UtGRknRUk0U=
X-Google-Smtp-Source: APXvYqzrKmJuFWQMn4r2vOUdcz1icrqvAaBzqlGRrFgfpGT8bjRalJjXMkO8d4OGD9/GkwR99brd3A==
X-Received: by 2002:a50:9956:: with SMTP id l22mr9372555edb.170.1553010020444; 
	Tue, 19 Mar 2019 08:40:20 -0700 (PDT)
Received: from [192.168.44.177] (vpn30.hotsplots.net. [185.46.137.15])
	by smtp.gmail.com with ESMTPSA id
	l42sm1711984eda.60.2019.03.19.08.40.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 08:40:19 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <cc444886-066d-6cf9-f309-7d35702ae065@gmail.com>
Date: Tue, 19 Mar 2019 16:40:18 +0100
Message-Id: <818D1EAD-451D-4D77-B14A-953EC54CAF23@gmail.com>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
	<cc444886-066d-6cf9-f309-7d35702ae065@gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Tue, 19 Mar 2019 15:40:20 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nope, we determined that it=E2=80=99s actually ok.

Alex

> On 19 Mar 2019, at 15.52, akuster808 <akuster808@gmail.com> wrote:
>=20
>=20
>=20
>> On 3/19/19 1:55 AM, Martin Jansa wrote:
>>> On Mon, Mar 18, 2019 at 07:36:29PM -0700, Armin Kuster wrote:
>>> Responses should be made by Wed March 20th 22:00:00 UTC 2019
>>>=20
>>> The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed35=
5ed:
>>>=20
>>>  mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)
>>>=20
>>> are available in the git repository at:
>>>=20
>>>  git://git.yoctoproject.org/poky-contrib stable/thud-next
>>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/thud-=
next
>>>=20
>>> Alexander Kanavin (1):
>>>  ca-certificates: upgrade 20180409 -> 20190110
> then this gets dropped
>> This depends on openssl >=3D 1.1.1 since:
>> https://salsa.debian.org/debian/ca-certificates/commit/d5e425c8405448e503=
4d1e16ca52be6a10cb3334
>> some people might not use new openssl with thud.
>>=20
>> More detail in:
>> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/2802=
34.html
>>=20
>> Cheers,
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

