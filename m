Return-Path: <roman@khimov.ru>
X-Greylist: delayed 1416 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Oct 2015 11:34:21 UTC
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3766275D4A;
	Fri, 30 Oct 2015 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From;
	bh=3h1kG310Zalemx02I4sqWoEUmLjO93gRRqH8RoinoC0=; 
	b=drbR6/OetkYG8pZeouc7bMnYCSbNUW9CN9dIYsX3cdZh2O/lDVnLqGlgoKqRgR7umteQRU8uoB0qxA8sYcaH/6wmBNnlqMuCICJxEHRhgG6TKMt9drhUq42Is9exGO7BsWj8YzMrg4+dZ2QDK0m7ZXoRWcd76WH1dwIb+dVGZxYjddV9OhMq7xkgcoGhnkaPWRXkBTXWzxZj0UA42j/O5Fp9njRgAEaEzLtwWeFik5J2eVUrrPq3btnQsqUM0H1IyIyCEfJyuzOI6R6g+Z6TBZPwd6rhv891dagdtVHKnlXqJeOF8w/7o6OXZ0Yo3nr54QqftM5goc88Bjbzzrr8ag==;
Received: from mail.pkcc-tb.ru ([185.33.199.10] helo=bancha.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1Zs7Zy-0005xN-Uz; Fri, 30 Oct 2015 14:10:43 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-core@lists.openembedded.org,
	Openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 14:10:42 +0300
Message-ID: <2298055.NpNxBfbHVS@bancha.hex>
User-Agent: KMail/4.14.9 (Linux/3.16.7-24-desktop; KDE/4.14.9; x86_64; ; )
In-Reply-To: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
MIME-Version: 1.0
Subject: Re: State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Fri, 30 Oct 2015 11:34:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 29 =D0=BE=D0=BA=
=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2015 08:42:31 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Khem Raj =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> 1. Drop kconfig support in glibc and we become inline with upstream

No opinion on this.

> 2. Move musl support to OE-Core from meta-musl

I would certainly support this kind of for musl.

> 3. Drop uclibc or leave it in current broken state, I would like to p=
ull it
> out into a layer in meta-openembedded and we can leave the core plumb=
ing as
> it is in OE-Core

But I don't think that moving uClibc out of OE Core is OK with the next=
=20
release. We do use it and there are probably some users too, I think it=
's=20
better to have a longer transition period for this kind of change, like=
 make=20
the next release support three libcs and only move uClibc to meta-oe in=
 a=20
subsequent release. This would give everyone some time to evaluate=20
alternatives rather than forcing to make choices right at the OE Core u=
pdate=20
when usually there are lots of other things that need to be fixed.

> 4. Poky-tiny switches to use musl

No opinion on this.

