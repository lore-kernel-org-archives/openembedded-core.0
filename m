Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5D4C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:17:09 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.7207.1690363027877941060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HAV0lQdD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fdddf92b05so9918995e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690363026; x=1690967826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vf319NApppFIDVL8vB+SwzDfXbs0+9ytZ0e8era+s8Y=;
        b=HAV0lQdD7wL0kHV/ic1uE4YnPfmxmkgt+UHV0m5iJ7pQNTgNvpFBRxT3ctKGoNSzkx
         MJOY4Oizl8hzjr3JQDqMhOGsHKy6pTzYJCH8x4QLarU7+4cG8GhYydinQGG06tAGOZdc
         W4BD0oTd++NCh3GdHzef5HJ4HrU5b/Zez3BTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363026; x=1690967826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vf319NApppFIDVL8vB+SwzDfXbs0+9ytZ0e8era+s8Y=;
        b=evNeqYgajSlh88vXey+nzhqc8b5pFIv0mTDF6PNuK9w9JDgBxC5l9jrdxj0ncaGmB/
         o47PMpU969pBN5Vj/WWfRgaPXeSVOMXi0zaTqPOptFNqIdjgy/TN2AOH6eoaE8OzYlAY
         kmD7NhTCCk9rJAsSXUfBfuDOAa6XVcC4HpVXXiHxSSjIDyC7FkegIhnAs8oSfUZ1D0S3
         Q+XLxwfRYAHvAQ/4Ma9S4JFSvXyDRf6b2fnUp6J2wxiGKRxQu5aoI/yRNyvM44hjztHl
         57viVTAJZq+c5RqpVaBPqFqFLTFYmf3fPCqXKwAxXNtMbf+hBJ/u0TbtxpUwRQYb+078
         w/dw==
X-Gm-Message-State: ABy/qLbQRLt3xLh/iDjLBa2Prax3yS8GWvHFTYIBsmnKlk5CaJLtU0q3
	RBuIXWyclZDkTCOuCzMeGgpLkg==
X-Google-Smtp-Source: APBJJlHtVPutAHHLmoKw7+We5R6lg2ep3BRpfLQAGN9azxYQPHUSjlAXxI1ebZtWh5q7osSacMQEiw==
X-Received: by 2002:a19:3842:0:b0:4fb:8bad:1cdf with SMTP id d2-20020a193842000000b004fb8bad1cdfmr828274lfj.42.1690363025480;
        Wed, 26 Jul 2023 02:17:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b15:acff:c09:f648? ([2001:8b0:aba:5f3c:b15:acff:c09:f648])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003fbd9e390e1sm1392825wml.47.2023.07.26.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 02:17:04 -0700 (PDT)
Message-ID: <89ae763f20e41dbf89cbb4d8ed4616ca9ed82d77.camel@linuxfoundation.org>
Subject: Re: [OE-core] Toolchain test results
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "steve@sakoman.com" <steve@sakoman.com>, "ross.burton@arm.com"
	 <ross.burton@arm.com>, "randy.macleod@windriver.com"
	 <randy.macleod@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	 <Sundeep.Kokkonda@windriver.com>
Date: Wed, 26 Jul 2023 10:17:04 +0100
In-Reply-To: <e6b6426580c3f6be5f492e2d1b9ae2a0b8049d12.camel@intel.com>
References: <1772EB68FCA90E64.1400@lists.openembedded.org>
	 <1c22b4fdfdcf22b58f7e06df872a9e0980645328.camel@linuxfoundation.org>
	 <e6b6426580c3f6be5f492e2d1b9ae2a0b8049d12.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184869

On Wed, 2023-07-26 at 06:00 +0000, Mittal, Anuj wrote:
> On Thu, 2023-07-20 at 12:26 +0100, Richard Purdie wrote:
> > On Tue, 2023-07-18 at 10:14 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > qemuarm has ~350 failures
> > > qemuarm64 has ~350 failures
> > > qemux86-64 has ~4000 (3900 in glibc)
> > > qemux86 has ~4000 (3500 in glibc)
> > > qemuppc has ~600 failures
> > > qemumips64 has ~5000 failures (all over)
> > > qemumips has ~1600 failures
> > >=20
> > > Anuj: Can Intel look into the glibc test failures on x86?
> >=20
> > I realised the glibc issues were due to the network being disabled
> > for
> > the tests and have sent a patch to fix that. That reduces the
> > failures
> > from ~3900 to ~330. We should really try and reduce that further but
> > it
> > is a start!
> >=20
>=20
> A lot of locale/iconv tests seemed to be failing when calling write
> with large buffers/files over NFS.=C2=A0Some of others were triggering OO=
M.
>=20
> I ran the tests again after making a few changes:
>=20
> https://autobuilder.yocto.io/pub/non-release/20230726-11/testresults/qemu=
x86-64-tc/
>=20
> After switching NFS mount to TCP and increasing the memory available to
> 1024, the number of tests failed came down to 69.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> qemux86-64 PTest Result Summary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -----------------------------------------------------------------------
> ---------------------------------------
> Recipe           | Passed       | Failed   | Skipped     | Time(s)
> -----------------------------------------------------------------------
> ---------------------------------------
> binutils         | 289          | 0        | 8           | -
> binutils-gas     | 1582         | 4        | 1           | -
> binutils-ld      | 1622         | 6        | 111         | -
> gcc              | 149696       | 28       | 27599       | -
> gcc-g++          | 219260       | 30       | 21108       | -
> gcc-libatomic    | 27           | 1        | 27          | -
> gcc-libgomp      | 3426         | 1        | 1962        | -
> gcc-libitm       | 24           | 1        | 24          | -
> gcc-libstdc++-v3 | 9695         | 32       | 5459        | -
> glibc            | 4984         | 69       | 147         | -
> rust             | 15768        | 0        | 554         | -
> -----------------------------------------------------------------------
> ---------------------------------------


That looks like really good progress, thanks Anuj!

I think we might rebuild M2 to allow for some of the resulttool, ltp
and other test fixes to make it in. I want to look into this 32 bit arm
regression first to see what is going on there. If you're able to send
some of these out we should pull them in and improve the failures for
glibc too.

Cheers,

Richard



