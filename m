Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1CF772A0;
	Mon,  1 Feb 2016 18:24:52 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g73so168326675ioe.3;
	Mon, 01 Feb 2016 10:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sxSnDY97hQZb/bsFff/y12+37Ai29iauEtDWp578ZOw=;
	b=wz9DQ9W3sHJ7rYTlGMwRJruvr/eSlF8PN6Uu0qxV9PnGT5inaXClVoqliGT4nxIG5K
	MJHxLIhIGmCzZr7+QNAsOcoZhfaKc9WycGr/RfIQplvXWCf5ZGFVefhphGKzzzW67D4V
	lVFxA8hP6iDwkex7KQ5Rgsd18tlMUP1bY652k7n0hZ+A/PkN2Et/dWjsadc+P/+4oEsn
	2AuMvicpQ5Kfjh2XYD2QzECCKdBdQ9b+PqEM1c/KfEnbb5BobMyOhd/WJCq4FTJAvRk2
	2A8u83eosMttEfi/Kv6a44LvJXraU5yoQkIb3NIY2M2PvwMn7zsA/Lj9puHDfLgW6YOM
	/qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sxSnDY97hQZb/bsFff/y12+37Ai29iauEtDWp578ZOw=;
	b=kcD5kf2xt3JFoj3LMcuDpilGHemhK76Yp3QNYkOPWzn27AU7RpzdS0RG9grLBQcRXU
	/Uq9G5q4vqDkG6UKoi9+M7I8yILiewxBG4RvOSiq06M5jn/nAxA3jtAUTXoeWC5gc/Wk
	o0dDNAxuMVdGvQhU+9F+J/aN8GCSB564FPbygc8XOozEl51oesCRcppKKo5N1yzhNcSn
	JuDo2lMnzjUCkRxzlzVZpDaAo8mgBmCSnP74U3Au9rZzfvr0sltrSiEtl4Y4hDi5p5rz
	ymqXUKhHWtPO9YRLTp+22Pfo+6Wdam0tDaLe46kqHDAKFAKUCReSftKvVGbJOO8bLrxw
	jlAA==
X-Gm-Message-State: AG10YORWgzIONFZ5iMwD+czKlx/QapKluP4RqWAyi/KQQkzLpKV2ixJNn3LxS5dwAyOMUB6FSB9nVn+krHsC8A==
X-Received: by 10.107.9.211 with SMTP id 80mr17739111ioj.112.1454351093494;
	Mon, 01 Feb 2016 10:24:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 10:24:24 -0800 (PST)
In-Reply-To: <56AF9FA4.8050603@mvista.com>
References: <CAMKF1sriCy0VxkkJHKsHaLy0K1N4Ns2E7o-rE_Lq8wSGXoy8hw@mail.gmail.com>
	<56AF9FA4.8050603@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 10:24:24 -0800
Message-ID: <CAMKF1soHPUQpA6v3t_T+KH7HeYLWcKRc5H+J_HPQHgTSHmz0OA@mail.gmail.com>
To: akuster <akuster@mvista.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Glibc 2.24 _might_ require minimum kernel version 3.2
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
X-List-Received-Date: Mon, 01 Feb 2016 18:24:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 10:10 AM, akuster <akuster@mvista.com> wrote:
>
>
> On 01/31/2016 09:41 AM, Khem Raj wrote:
>> Hi
>>
>> This is FYI, as I have sent a RFT for glibc 2.24, there might be another change
>> coming which is under discussion on glibc mailing lists which is on
>> supported minimum
>> kernel version bump to 3.2 since 2.6.32 will be EOLed this summer [1]
>>
>> If anyone is planning on using upcoming yocto/OE release and sticking
>> to kernels older than  3.2 then please plan for upgrading your kernel.
>
> Nope.

Thanks, its like 10month ahead of time warning so no one then forces
to keep us using 2.6.32
you have been informed

