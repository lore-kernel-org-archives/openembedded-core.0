Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 13BFF77114;
	Fri, 30 Oct 2015 20:56:11 +0000 (UTC)
Received: by igbdj2 with SMTP id dj2so19478748igb.1;
	Fri, 30 Oct 2015 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=dhoYCSz03BPVKtxgTSqIXmGHCWFk7B7ItIAbFV4hRd0=;
	b=gAZLqpFM8c18r8b1xJRYR3ELh6hKar1lNRdq1bVyxur9FncKTDscvpLgQbbWQ9K6tO
	LECjoFBR/9gbkf4bL0993zNNYjjawiUm14ZvmAQbf9QN3L//x6awfp0B1tNrgf2014kx
	YoIC/5maW1a2cU0wwMtB2crElu7HwuMrK0g5v6vd772iluDN4lMR6Ym/Vp2OpnKaUykx
	aJIm+X6vcE2T1n/7ijeHdFmTdqoJXQifdovNtxKvyRB36+jCyh9kAmwbuyAZGxxu0juP
	rY4uOpwumK/O+sCoVlWJ7p7eOnJ6wg4ZZAq9Kyz4l9VJfP4BGqWXbpN9824q/eU5S3ov
	NiTA==
X-Received: by 10.50.55.42 with SMTP id o10mr320033igp.11.1446238571911; Fri,
	30 Oct 2015 13:56:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 30 Oct 2015 13:55:42 -0700 (PDT)
In-Reply-To: <2298055.NpNxBfbHVS@bancha.hex>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<2298055.NpNxBfbHVS@bancha.hex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2015 13:55:42 -0700
Message-ID: <CAMKF1srB9b9iPF3WGyUeozOQdXi3DRa=BPx9CmtrM7VN_CAXeQ@mail.gmail.com>
To: Roman Khimov <roman@khimov.ru>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 30 Oct 2015 20:56:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 4:10 AM, Roman Khimov <roman@khimov.ru> wrote:
> =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 29 =D0=BE=D0=BA=
=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2015 08:42:31 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Khem Raj =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
>> 1. Drop kconfig support in glibc and we become inline with upstream
>
> No opinion on this.
>
>> 2. Move musl support to OE-Core from meta-musl
>
> I would certainly support this kind of for musl.
>
>> 3. Drop uclibc or leave it in current broken state, I would like to pull=
 it
>> out into a layer in meta-openembedded and we can leave the core plumbing=
 as
>> it is in OE-Core
>
> But I don't think that moving uClibc out of OE Core is OK with the next
> release. We do use it and there are probably some users too, I think it's
> better to have a longer transition period for this kind of change, like m=
ake
> the next release support three libcs and only move uClibc to meta-oe in a
> subsequent release. This would give everyone some time to evaluate
> alternatives rather than forcing to make choices right at the OE Core upd=
ate
> when usually there are lots of other things that need to be fixed.

may be not a bad idea however, this still will be available as an
independent layer on meta-openembedded
but we could still keep it for a release

>
>> 4. Poky-tiny switches to use musl
>
> No opinion on this.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

