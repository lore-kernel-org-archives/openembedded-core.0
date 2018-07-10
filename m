Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 755617600F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:18:58 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id y207-v6so41556686oie.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rh6Dee8DPrUitrFNss0+VaiTYBVOUIcdrehsjS8TMY0=;
	b=P37iedf8zVZFVAvbdpuCETcoYdgazZWgLcmkttdWIzYXsyeZvWimjqEsLFryRk6J0W
	p4XE1lwS1n+0YB2T1B/l/WKQhCib0F66zGf/arCC2LftyAp+MFDaJ+6dkZEZe0or709c
	WM2C7qp9R3erlSPfOTt2h9sDz+luBd0iP1fU0MnQwe0hEB1+NAXxBOioZgk8xzfAwciJ
	zGgxLajycIUgJmW79FfH1mNN4pFS/mCtIdRYcq4Q7qddqgjZJu/jjJx3KoIE+6xVtrVj
	pB21lGus0tFDMq1OXJZQwCmL1VyI18duJFzIZHFW92+fr9mVhAOLT1YBV7FD79sSwOP4
	jb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rh6Dee8DPrUitrFNss0+VaiTYBVOUIcdrehsjS8TMY0=;
	b=EBy1ZVRB3npwtb53TtFcBNFY2SN1S4/uiKYU2mgFw3A1m/O62OhjnO66d9KLta88FM
	AnUygywVEzcnsrx8nWflIL+Gpa033n2TxpnbevOe4clh2wmQQBIARe/ABEDiSUBQqf3h
	DBHAki8koRhYaJSE4Oa6LNq+aKVKaeFcFNZZNZkres5JuhoInkwo0SIVSGSL7roiTAjk
	mR7mlbe7ZnIv95nYCa1sGAba7y1DDCI2orzcCkPTJZztXtoCRwKv7kiv1XehKgbDhe1G
	Pt48JmVvNyF/3LUjzxKZUoDMOd9PB9MrqHUM+GKMRsrwp9Wb140C8hewSCLFf2+WZMiw
	Fdng==
X-Gm-Message-State: AOUpUlGk+0KuATJV7+PRdNAy29sTjX5+jV+ZzynnyNTky8ZwwhLwcATD
	+BbfRIs7A11jeHf7n/yht5z56yu2sK35qX6H3pKC5g==
X-Google-Smtp-Source: AAOMgpc6t8Hsy0av6WS1DZvSyUoaklGizupJIJXClQn8BAT2cYGuiXyN3wwwMPXV8S64+4f+l2Xr6NupfD8+fdA19BA=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr1576002oia.18.1531217939438; 
	Tue, 10 Jul 2018 03:18:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 03:18:38
	-0700 (PDT)
In-Reply-To: <20180710095223.GC1825@jama>
References: <20180710080702.20527-1-Martin.Jansa@gmail.com>
	<CAJTo0LafAv3Qk0EDWnunng1fq4OENz2DhiOjth19hGNJ__Rh-Q@mail.gmail.com>
	<20180710095223.GC1825@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 11:18:38 +0100
Message-ID: <CAJTo0LaZm_3K0uAH_GzbfAvUuhsTfPz+_YMeXcz3OOm35kvHUw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libdrm: Add PACKAGECONFIG support for all meson options
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
X-List-Received-Date: Tue, 10 Jul 2018 10:18:58 -0000
Content-Type: text/plain; charset="UTF-8"

I can't replicate the error, I don't think util-macros is needed anymore.

Ross

On 10 July 2018 at 10:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Jul 10, 2018 at 10:41:10AM +0100, Burton, Ross wrote:
>> On 10 July 2018 at 09:07, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > * Use the same defaults as meson does, with few modifications based on
>> >   previous EXTRA_OEMESON
>> > * move libpciaccess dependency to new intel PACKAGECONFIG
>> > * add dependency on util-macros which was previously pulled by
>> >   libpciaccess, because it's still needed even with intel disabled:
>> >   | configure.ac:34: error: must install xorg-macros 1.12 or later
>> >     before running autoconf/autogen
>>
>> Why is configure giving you an error message when Meson is being used?
>
> Because this error message is almost a year old from:
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/qemu&id=2eb3926cc54fef8e8cdd39cc20fbdc129aa1e52f
> switch to meson just pushed me to send this part upstream instead of
> rebasing it forever.
>
> I can update it with meson version of the error if you want.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

