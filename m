Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id DBF9071633;
	Tue, 24 Feb 2015 06:59:53 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so31319208pdj.6;
	Mon, 23 Feb 2015 22:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=0Mzf6jhiYadmKUQHafbMI7qUcfiMvw2vaSY1Fseou7g=;
	b=OxTaqt8kWiSG05B1RS2rlavyA6ERWMXBWVIiSKngAlipkQDtdxagnsQT29y5bPDK5+
	f+xWrBBwqu0ifMcvrLAc6/0dkRJV9j50DecNw7uPt7nStj+ghdD4iR7fPoaFZNUV+zp7
	SnUHoUg8fHCxrWWRt35xvlbgj8ZGfaBHn5dXQVpybauiM7fspl0Si+tI5zllZSkcoGwF
	IIx/CiPmMyy2kLU4LZ+xZNeQS06aijm+m6bQj6OGMGn6OIps2lWyE4KcxrRlrYZeri2G
	LP/8tzFHuGbdZ1r4jBPgTQCtUOw++RxGsL/TaMgNq8KXZRWUbnfu3tWt8rPLZmFZzYth
	QtGA==
X-Received: by 10.68.239.102 with SMTP id vr6mr1362482pbc.35.1424761194461;
	Mon, 23 Feb 2015 22:59:54 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:201b:b105:13ca:8330?
	([2601:9:3580:84c:201b:b105:13ca:8330])
	by mx.google.com with ESMTPSA id
	ah1sm38207966pad.16.2015.02.23.22.59.53
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Feb 2015 22:59:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1424510550.11836.66.camel@linuxfoundation.org>
Date: Mon, 23 Feb 2015 22:59:52 -0800
Message-Id: <9D1FFBD5-9F30-42BF-8242-4C06614F9F34@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<1424455387.11836.57.camel@linuxfoundation.org>
	<1424510550.11836.66.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Tue, 24 Feb 2015 06:59:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 21, 2015, at 1:22 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2015-02-20 at 18:03 +0000, Richard Purdie wrote:
>> On Mon, 2015-02-02 at 02:02 -0800, Khem Raj wrote:
>>> I have put together upgrade to gcc 4.9.2 as well as glibc 2.21 (
>>> upcoming ) on  a contrib branch ( top 2 patches) its has not got =
much
>>> testing besides x86 qemu thus far.
>>>=20
>>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-gl=
ibc-upgrade
>>>=20
>>> I would like to request some help in testing these out in your
>>> respective environments and please report any issues you see so we =
can
>>> start sorting them out at earlier and making its way into OE-Core.
>>>=20
>>> Thanks for your help
>>=20
>> For info, I've now merged the glibc part of this change now too.
>>=20
>> Khem: Thanks for the work on this!
>=20
> New issue that caught my eye:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/bu=
ilds/204/steps/Running%20Sanity%20Tests/logs/stdio
>=20
> segfault in init within libc :/.

I have booted core-image-minimal, for all arches and that have worked =
fine for both systemd and sysvinit and some of non-oe-core graphic =
images booted well too
but here it seems its using core-image-sato wondering what changed there =
=E2=80=A6 can someone try it out and may be see what is it trying to =
launch during boot that is in addition
to core image minimal.=

