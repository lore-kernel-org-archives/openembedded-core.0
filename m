Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC8F77CDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 04:13:52 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id v77so38838720pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Aug 2017 21:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=glVf1thudDonGihxJCsZJySH7caCSvJEhVlzuYrp/iU=;
	b=IwQ3jZEodI18LS86gny4AhJ2gCR5bufPvKCiUwEf+4ksXx1Zk9fuKPzdFY/Jh3BIah
	Qbq8k0PMrflAOrw2JipHN6qWnn+SAz0vLL6stsPk3CmCS8SgPaSeFpGO8Zm+6ljemQBr
	CBAKjD1/uH+BBR1NVoSjal8a1gyAQuAe6RMJbZmaktDYvumsrdqsLCYHpeEq2wPeaD6x
	vY1KmrNVfcZ1wfFXCAjImjT13vW+I9sudqrtneXTHFueBfLTVg2eqOH02Sydg1xqlgOA
	3LtaR5MJXRa4EZozxU2m9vKK4NP5S02Jr5TYq1B97SJtmCy/nIRGPx8V7eHY4x5g4Gvr
	aDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=glVf1thudDonGihxJCsZJySH7caCSvJEhVlzuYrp/iU=;
	b=IMgQNkWzED4BEXW4/CkMS5AlndNnTZTKKb9TnwuofJtPt53FlVgkh/o/CKFlsUYTOX
	wjHelumQjw58ADxEz7BWkr04FGLFahe2EOHm0QQmMnfSpF54TwgfYVJO2aH9k/qkbk96
	YQHRIXJRXHwtR4TNXjgQ1l1zz/67e9pRoM8DZJoxBbcJWMl6qclgtZR2hVEHw7X9mejJ
	zlQfTuyIwk6vvKY8gzT/hhLthSP1WNRO9NasEFRqhNvDaO0xH3RKVEyfpW934cnQgCbV
	9VSlYByUkP6NoRgkBy7OiIIK/tz/6h5/i/OQrwOF1S1IvkIoIpamabT7HIRCuGsle0o5
	JIgA==
X-Gm-Message-State: AHYfb5g+IQAPIGOJqNsgHRZxTgBLtoa3C7Sqcm+1JiF9+dKtx3VAijDR
	cqCg8DdFWM501nJD8Y73h77A58oz+g==
X-Received: by 10.99.98.71 with SMTP id w68mr22688062pgb.100.1502684034070;
	Sun, 13 Aug 2017 21:13:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sun, 13 Aug 2017 21:13:23 -0700 (PDT)
In-Reply-To: <59911324.9070808@windriver.com>
References: <1502421401-112341-1-git-send-email-zhixiong.chi@windriver.com>
	<1502613383.18633.287.camel@linuxfoundation.org>
	<CAMKF1sqWL=M367APQ5-L1rw_41Ear+JjXJjVdudcY6uNexXEbQ@mail.gmail.com>
	<59911324.9070808@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Aug 2017 21:13:23 -0700
Message-ID: <CAMKF1sqQTa4KQAV9yiyWrUkXvvvyj6mxciJywPUnTDABrd30vw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add ld.so locks in _libc_fork
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
X-List-Received-Date: Mon, 14 Aug 2017 04:13:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 13, 2017 at 8:04 PM, Zhixiong Chi
<zhixiong.chi@windriver.com> wrote:
>
>
> On 2017=E5=B9=B408=E6=9C=8814=E6=97=A5 00:35, Khem Raj wrote:
>>
>> On Sun, Aug 13, 2017 at 1:36 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Fri, 2017-08-11 at 11:16 +0800, Zhixiong Chi wrote:
>>>>
>>>> The patch in this Bugzilla entry was requested by a customer:
>>>>    https://sourceware.org/bugzilla/show_bug.cgi?id=3D4578
>>>>    https://www.sourceware.org/bugzilla/show_bug.cgi?id=3D19282
>>>
>>> I'm a little nervous about accepting a patch which has been sitting in
>>> the glibc bugzilla for around 10 years. Any idea why upstream haven't
>>> taken this?
>>>
>> patches look sane to me. I would like to see if we can reproduce the
>> issue on x86 using the
>> testcases from bugzilla
>
>
> I don't know why the upstream don't take care of it. I guess the reason
> may be that the testcases is out of scope and we usually don't use the
> unasync-signal-safe function after the forking.
>
> Yes, the testcases from bugzilla can be reproduced easily on every
> qemu bsp. At the same time we have done the glibc regression testing,
> The patches works well.

Please test it on hardware as well. I think the patch is safe. I will bring=
 this
up in glibc community.

>
> Thanks.
>
>>> Cheers,
>>>
>>> Richard
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> ---------------------
> Thanks,
> Zhixiong Chi
> Tel: +86-10-8477-7036
>

