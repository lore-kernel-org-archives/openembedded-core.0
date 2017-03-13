Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 09A3171D9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 18:57:06 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id l37so109989121wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HlafCUQdR4f5ScV9YamQ1HKBT/Cd8DpeN9bzv73bmlw=;
	b=hD14rorGb1xETMrs89gZRUe0SeFyeTyd4UuPFvCOV6oxzYwt2H77TKXP/6Yt/cypJK
	88HD9G9IbIQ6vdPmAB++yiLzObC0e81sLHip24eXFUrW+tAvxi5MefRaorSAFmA1aS8n
	Ut+V2KZ6VAmZdKYxzrr0dQ8n3cBcdtB4uMS9xK4st/OL3Y7lds/ICg2dGOMDPYGPpmYo
	6Q9oDSo1pJ7eXUIFkqt77D83vQRyK7s3YAx22izC/v6d+HEq1uzpX67Kc88P4lMIUvCS
	CHBmiQyPcaydY4Hc4SK6ZlyVyIn5Qg2kHhMHLapDRnsiXqwK6PSAKq6+LdRTYauQG0i8
	n3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HlafCUQdR4f5ScV9YamQ1HKBT/Cd8DpeN9bzv73bmlw=;
	b=dumLcdWQJlVuPgMtBu6+C8pvfRVhGILqHUONOsqEa5g/9IPSycO3VrJIhhSgeJXnjL
	qdv/eQwKGJMDpm4gj0+/GUw5WiwMMhXNtUDJ2LNinQCZKhOry86Qoc02Byr7CIu1UQjO
	8LqObN1SHdfGktoXVFo91b5Q22khKewMTOsliVVoFJVDODz2Apuw7Pf8U5EO5/myPnuw
	e1ZxSHSnxAfadUirgSkm4L/mVNtna70h4WyVq0WtvslWTN33sYyhZWZooxk5VLRZQvbv
	1wq1B6nN5LuAyWkdVsmkAxGLZ8Vq5IyvzepWLRv9QcA2zkegmJFTDHlGMZ0c8llflB1U
	GljQ==
X-Gm-Message-State: AMke39ne8bEGSVCi0WVLCNtWCUYQK3+Yd90r101tQ7JmlBz+L2MkZudIWVKfp4DHOF8dYzF+AUgtW5oLf9MtJw==
X-Received: by 10.223.165.17 with SMTP id i17mr31405342wrb.70.1489431427655;
	Mon, 13 Mar 2017 11:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.20.148 with HTTP; Mon, 13 Mar 2017 11:56:47 -0700 (PDT)
In-Reply-To: <CAP9ODKrS3MX=KHTyNum=sqYGReDaXVaRQ-1vL=ZifkoJfe1cPg@mail.gmail.com>
References: <20170303221947.17487-1-raj.khem@gmail.com>
	<CAP9ODKrS3MX=KHTyNum=sqYGReDaXVaRQ-1vL=ZifkoJfe1cPg@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 13 Mar 2017 19:56:47 +0100
Message-ID: <CAD4b0_+Naovt44JP2Lk7bqkwk62u4LbibNz7Q6faJuytrJjq=A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 13 Mar 2017 18:57:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 13, 2017 at 6:58 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Fri, Mar 3, 2017 at 7:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> * This is converging the recipes for go from
>>   meta-virtualization and oe-meta-go
>>
>> * Add recipes for go 1.7
>
> Go 1.8 is out so I believe we ought to move to it. Also one thing
> which need discussion is regarding the upgrade process of Go recipes.
> The 1.8 release is the last one supporting ARMv5 and this means some
> reference BSP won't work with Go 1.9 (QEMU ARM) without some hackery.
>

As usual in Go community, the things are in a state of flux. The final
decision about removing ARMv5 has not been reached yet. While the
original proposal was to deprecate ARMv5, members of community have
emerged, providing build systems and general argumentation in favor of
keeping this target supported (at least for the time being). Right
now, the discussion has evolved in the direction of figuring out a
general policy for deprecating legacy architectures. Still, there's no
guarantee that come 1.9 ARMv5E will be no more.

Interested parties can track the progress here:
https://github.com/golang/go/issues/17082 and here:
https://github.com/golang/go/issues/19075

-- 
Maciej Borzecki
RnDity

