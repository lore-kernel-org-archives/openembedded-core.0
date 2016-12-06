Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 28F376FEF3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 08:00:49 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 50so34786417uae.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j8JFA/A1NGSVI13Vp5cSK/gUPwvImIqs+Z4+eDTiSL4=;
	b=MDsINofBT7hJkQzmFnE8qjLCGz7s0c8MBJ/z8aXj4ae44V5C4zXgQO27NXGzi6THHZ
	reIa/dDfzqHX4eDiOO+IwJLmvB86B4Vcye7pHYjeag3lNaoJthGcpeD/O3tKTyuQWEup
	MNe7p+gh3Ahc9GbhOB3YM0vMD9aCEJ+e5qidpo9KNuA2m4wi+FNSeVbWRFgvuhS2k9F0
	0kN6zJjSl6oHVojNt+Nc5nkdEvF9xKBL62ClPNlnHvsGb180YBvccShniFxaRbFZX/rG
	mJIdyKvoooSptJHPCRZ67891ve/v8CtmuvPTyj1kesJ+42P/qkHEbX+OHLQqqV1hAoWB
	nf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j8JFA/A1NGSVI13Vp5cSK/gUPwvImIqs+Z4+eDTiSL4=;
	b=BDUC2aV8sPrumgnRclq+PfSCvGQmSi1fx9ton2KDywvbLU7om+vCHAemiKiClWq1Rz
	ktm/xkoY6vIgPrfzULp3We4Nf78+WpDO2MfQEzArUi/SX5oVMuuwdfqInyawkTppqFcq
	zZdUydNAHhmPTaBBTkgt7P+OZCKVQsLgAB6vEsa/Xci7BYA8l34kJGlenR897WULqdQv
	w+f3bQPKSB8O1Fn28xgtGogBdCPpUlXZYbGq0jDSDEadIQf/aLSyDN7F3akqeuWN6EDj
	K/8U6AOSkjPAtkEDaZcFNTFREU1wuN2azY55YwVll6bELfjZybR39mOWlBKvdzb+18JF
	i60Q==
X-Gm-Message-State: AKaTC03JB1HhSMdo/wek0Guu8oyrCrUrZk4tpAIaEHoizNeZYM1Yn3paLBYDk7HmShNGoWzd7kYfnf7M4MXORA==
X-Received: by 10.176.84.147 with SMTP id p19mr3206411uaa.76.1481011251150;
	Tue, 06 Dec 2016 00:00:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 6 Dec 2016 00:00:50 -0800 (PST)
In-Reply-To: <CAMKF1sorwZg-yF5k8NJBtDakZHqCZr0H=jvLP8mx8bkcU2B3Gg@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-3-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1sorwZg-yF5k8NJBtDakZHqCZr0H=jvLP8mx8bkcU2B3Gg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 6 Dec 2016 09:00:50 +0100
Message-ID: <CALbNGRTqROjBNZP=FsRMYUPn=sMbYYgAP6CAYmnjePKO3o4N=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libsdl2: add EXTRA_OECONF[vardepsexclude] = "MACHINE"
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
X-List-Received-Date: Tue, 06 Dec 2016 08:00:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 6, 2016 at 1:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
> There probably is no need to use this additional variable. We can just use
> PKG_CONFIG_SYSROOT
Problem is not finding the wrong .pc files. Problem is that the output
of pkg-config must be prefixed to find the protocols.

Andreas

