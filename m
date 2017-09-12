Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 48F2F78501
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 19:22:29 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id j16so12758480pga.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rKhRTnLkqakSL2Iw/Lswjjii3bnRFIzWuk0AGyoLstc=;
	b=BgA6t3ZNInjDhO/9FyEgqusBMrqhkZadiAILfFnLRtIi6dJBCMzEpDQVku3Qpdn7vD
	rRGpS21CslF5Sm5TgrlAAKDwdYGrW75JvoMBUB0ser86g00F0CaeBUCtLsEDEtjJgBCF
	2yrOgJgP7/F6ySGWguVI4Olt/GfRPR40mM/URazdZB5Avv511uL06fMdw3P9AaA4SRV/
	YCsxGthkx86FLgUhSht/liwRJZKbJ4Wnd2TKOnqFQ1N7tIxa0B+1hJr56n6VC3Q8Axdv
	Sm04gXfiYQFjmTUo6AGiDdXK6qOQQhG87h2grAhDVAT+IxVQqFLKjWYYWHjxiaJgJ19+
	4P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rKhRTnLkqakSL2Iw/Lswjjii3bnRFIzWuk0AGyoLstc=;
	b=YMkTFC6TOstKJyCTso1RsSrZHvl5R1T5pNu8KI4tcar21EfM+yg8+TNsjD/Xx7LblY
	NT6uETr6mMcMKh4C7m84rrRZZbCbNr7QRlHjeMjY4ejn5DUlPMDpjp4KemPjjw00f9ew
	8I1D5Am9v+3+YyS/Rbh+mxITZeStBKE60y0dWl10REn/mThWDIuE/wi4bbK7mv/2FrA2
	sxEBKJv3iORahVWmfJnfJVLzjE7tpw7kg11x4raAQyeoAo1+/V0NpIeS4zWYxqDZGyaa
	qGAxVkGjyFVBEab+Ay0qgF9oTC1Fz1UJ9vbSAtGKztn/H8peUU9sA1QIjubzVBNjOu2y
	gDpA==
X-Gm-Message-State: AHPjjUiAowPCHuNdfD9OTSfy9McQWJ+Qlyx6AkHTL36ppWbO5uKsAzpj
	4OSvjIxvbVMh3GjCcxlwO/Fpzp44hX1dkXrwmfQ=
X-Google-Smtp-Source: ADKCNb7+nvDmjYRFQGAXRWSPjPv34oHo4DyOxEhWCrij92SvkNGiQf3xeTHXkhyyciNHJlN1k29Iiul3Ib6K2eDfwn0=
X-Received: by 10.84.177.129 with SMTP id x1mr18636062plb.161.1505244151507;
	Tue, 12 Sep 2017 12:22:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Tue, 12 Sep 2017 12:21:59 -0700 (PDT)
In-Reply-To: <CAP9ODKocG317bbmcnDvOGp5VJnAUsFy8DbRBVZ51a3akkg5tSQ@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<20170912125031.4009-7-otavio@ossystems.com.br>
	<CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
	<CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
	<CA+chaQcSMj-47DzgRrwWoUGNyc4WKoGM72bqKSf1YZHO2sskpQ@mail.gmail.com>
	<CAP9ODKocG317bbmcnDvOGp5VJnAUsFy8DbRBVZ51a3akkg5tSQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Sep 2017 12:21:59 -0700
Message-ID: <CAMKF1sphM28T3CC1hkb9Hi8MbGGweBC-Q9YKQTy3J4jnVt8FGQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
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
X-List-Received-Date: Tue, 12 Sep 2017 19:22:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 12:20 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Sep 12, 2017 at 3:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Seems like this version was already picked to master-next, so probably
>> better to leave as standalone change now.
>>
>> The version currently in master fails to build for arm with thumb enabled:
>> http://errors.yoctoproject.org/Errors/Details/155765/
>>
>> Is it fixed somewhere in this new patchset?
>>
>> # github.com/golang/dep/cmd/dep
>> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/go/pkg/tool/linux_amd64/link:
>> R_ARM_THM_CALL, are you using -marm?
>> WARNING: exit code 2 from a shell command.
>> ERROR: Function failed: do_compile (log file is located at
>> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/temp/log.do_compile.13531)
>
> No, it is not.
>
> It seems that Go, when using CGO, does not play nice with Thumb. Matt,
> do you know if there is a known fix for it?

Disable CGO for thumb, we have a variable to select cgo

