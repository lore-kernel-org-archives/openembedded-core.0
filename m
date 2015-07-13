Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id F40C1607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:54:25 +0000 (UTC)
Received: by widic2 with SMTP id ic2so7460078wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=T8XDyWPMH0kraEgNoxrkNpm4Se5GpQAkGNtZ2NQBhCA=;
	b=qv/lZ3lIxEEJfNGCMTAln36HEyPEjFUVTqlNnECZImJ2hEppYKJAPkPFSW+lrcIiNK
	5mli/xTQMYUO+zp3yQPfDvOxZo/9HyzREX0CWH1U0DLkWrcRvbfR31oIsrkw9Xx5DQLX
	Y1LdkS8ms164ldI3xNTJFO8gtM6vDB2Y31tLYhEgMllvzlU6iIqA6hXZvCl3q77igmUK
	76mNIMW2ZAO3Jg4YzAkA7/aRv7gyYB+SqDBqRHhutH1AzG+ZRD3ucEebW0woxSXH0TXK
	L0zjtS6LCPwNk5jHG+amHNEq9S2zLG0KPI7RdIB0O0t55DHJSgRVedugakP3MYRQ4Nus
	TWBg==
X-Received: by 10.181.13.195 with SMTP id fa3mr20577811wid.7.1436781265283;
	Mon, 13 Jul 2015 02:54:25 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	s16sm8266093wib.16.2015.07.13.02.54.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jul 2015 02:54:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1436778457.3310.38.camel@linuxfoundation.org>
Date: Mon, 13 Jul 2015 11:54:49 +0200
Message-Id: <44F28AE3-4F52-429D-9CA5-298F05E216B1@gmail.com>
References: <3EECF939-15F6-43A4-BE87-CC1D57121CD1@gmail.com>
	<CAJTo0LZkMtES=kPa17dV_Sb6P3RYhdGhTK=iuLfJymzykvTBzw@mail.gmail.com>
	<635A9611-7B0D-4FB0-A643-88ACFAEE4C27@gmail.com>
	<1436778457.3310.38.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2102)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Update rrdtool from 1.4.8 to 1.5.3
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
X-List-Received-Date: Mon, 13 Jul 2015 09:54:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.07.2015 um 11:07 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> On Mon, 2015-07-13 at 09:57 +0200, Jens Rehsack wrote:
>>> Am 10.07.2015 um 21:50 schrieb Burton, Ross <ross.burton@intel.com>:
>>>=20
>>>=20
>>> On 9 July 2015 at 17:38, Jens Rehsack <rehsack@gmail.com> wrote:
>>> here is an update patch for meta-oe/recipes-extended/rrdtool:
>>> =
https://github.com/rehsack/meta-openembedded/commit/6ed5b4489beb1233bd4b3c=
9f73064e973eeef2ad
>>>=20
>>> Please send the actual patch instead of a link to the patch, and =
meta-oe patches go to openembedded-devel@ not -core@.
>>=20
>> I was told by RP that sending patches via GitHub is fine. =
Unfortunately that's the best I can do.
>> When it's clear how to submit patches, I'll go ahead to oe-devel@
>=20
> Not sure I said github was ok. What I perhaps would have said is that
> posting a link to such patches was better than not having anything at
> all. There are some good improvements in there for perl and as you =
know,
> our perl skills are a bit lacking :).

Well, IIRC there was a big Yocto discussion at first or second day where
this was acknowledged either.

> Our commit process is patches on the mailing list for review. If you
> can't help with that, it means someone else will have to step up and =
do
> that piece. Its then going to come down to how good the patches are as
> to whether anyone does.
>=20
> As I have said, I'd much rather know about them and have the option
> rather than not know about them at all though.

What I can do is sending mails and attaching the patch saved using
"git format-patch".

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


