Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4B316601A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 06:21:30 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id n12so1106090wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 23:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=2PffZQ55pWGiljignGLKWfuokgGDTlD03WEA6jUjvaM=;
	b=YMgFnHY6IzvYi7Dt5yRTrEk43mXAt9Gz1QrIB/WjGre+taGSw+kNcWx6l3dedQWtNL
	UlWoClBAvwgF2ph1+XC6GZqvSGVWqZxD+O6B8lQSCs404iFtoLZCR86Ro1wo3wxy0oKZ
	vOTxSGuCnh9xz4G1GqAbuPuudtTd1QZBUizBeg8ud8tC/N1SeBSDTgwdT+YRmWavsX9/
	ZixQZUn903FXM6eT+VE9eG1i0QSTyvAzWBM3z3G8TQqyn/rr1lZ0xu/ltW9YMLVlQ4R9
	0h443oRB3CUa2qbQEc9FMXcU+K+6Jh1nfSIqrQjUGJcdNGCjI1TIQtCdQJvFQcpk+qsh
	im+Q==
X-Gm-Message-State: ALoCoQm7gzG/n1jqV13MmER1qOjOthfESf5HeTIF/DwYy75Q61aiVdAuYBjxY2AS8aY0xchTN18c
X-Received: by 10.194.223.67 with SMTP id qs3mr94775wjc.127.1414563690618;
	Tue, 28 Oct 2014 23:21:30 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id gw6sm4422536wib.8.2014.10.28.23.21.29
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Oct 2014 23:21:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1414534938.7967.176.camel@ted>
Date: Wed, 29 Oct 2014 07:21:28 +0100
Message-Id: <34873CF5-1E79-4954-B3C4-A7A4B77033B9@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
	<18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
	<CAJTo0Lam=wC-MBny66h-jC0ieb9tp9nTJUWEQ+KXvLDEqbk23Q@mail.gmail.com>
	<473E6E55-239E-4EC8-813C-8494BEF78CED@dominion.thruhere.net>
	<CAJTo0LY5A00MG1hmFL7Smo1sdHnGdfqpun4+kbhDRZ3iAQ2NDw@mail.gmail.com>
	<A5FC7B4F-F911-4DFA-8F66-C006740DC0F4@dominion.thruhere.net>
	<1414534938.7967.176.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Wed, 29 Oct 2014 06:21:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 28 okt. 2014, om 23:22 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
> On Tue, 2014-10-28 at 10:36 +0100, Koen Kooi wrote:
>>> Op 27 okt. 2014, om 14:15 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>>>=20
>>>=20
>>> On 27 October 2014 13:06, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> Ah, two different problems :/
>>>=20
>>> The problem that lzip-native isn't in oe-core is only a problem when =
there's a .lz SRC_URI in oe-core, but the false-positives are a problem =
now.
>>=20
>> Apart from this dependency problem, bitbake has a problem as well. =
Does anyone know why bitbake does:
>>=20
>> 	compressiontool --stdout file.tar.compressed | tar x
>>=20
>> instead of:
>>=20
>> 	tar xf file.tar.compressed=20
>=20
> The unpack code is rather old, its age being around a decade. A decade
> ago, tar without inbuilt decompression support was not uncommon. The
> code has remained unchanged...
>=20
> zlib was added, I know that most tar has bzip2 now. I'm not 100% sure
> which formats we could rely on being in tar though.

What hapenneded over here was:

tar xf foo.tar.lz
<error>
install lzip
tar xf foo.tar.lz
<success>

So I'm not sure if tar has the knowledge already or not, but installing =
lzip made things work without rebuilding tar.

> It would also be
> interesting to know which performs better on a multicore system.

Indeed.

regards,

Koen=

