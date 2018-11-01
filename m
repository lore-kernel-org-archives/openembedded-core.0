Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2358379ED3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 18:57:13 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k19-v6so10488081lji.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 11:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CPM+7MM/jIiqZYiH9e/g4JlTvGkNv/+6Cgjw9GpFi88=;
	b=XrNnq514nfQnAB35K2NHwk0bc1U3one30r4fLgNIZWxcOxoO2GIBcIDL/bQaiUVLL3
	esdnhl2ilxFSkA47atm9Jt2KrObsp0tm1xehE6seJHLmYUPgcRLzK3QyAnv7IkaF2cR+
	QQE8Cf8JOb41/pVZCVEox+wwbL3/I78bgvlas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CPM+7MM/jIiqZYiH9e/g4JlTvGkNv/+6Cgjw9GpFi88=;
	b=bk/ucyGSbFeBBFG+g4c7B8DuMPA4yvpJBmVcfMEd+N//qIC9yGuLQfCVyqeLvDbb4V
	vBbxfmeKCcvQWtirtFBC8+YI/5tC9hEX/UqN38G+EXdUJG9cCv13JtOFvGIefX2Tb4C3
	UWQ9WA4ydNyTnazAMmCtL73JbupbKBbZx/usyNo61vZLfKX/ILewmmPBtOuYzD0+kjS1
	2FYosZkF+7rjjMTC6KBi51UUfQIeVxIvdpL/gepgqC2CzOdjfrxuhlJ8tQvL68TsujLB
	tUIP7rAprXfJkoXIj7iTvZETj0L0KHpB7RVz4wF4MaBmxZ2bkzLKZLJlA2U1kZqeGmRx
	RAVQ==
X-Gm-Message-State: AGRZ1gL/T5Qlh+EHsUaQrg5x3bmJQxDWfMiiAsyrUMusj731b5ntGnsT
	8eHnRmn+d2b7/TZAKglSGAKnLy4tZdkRw2SlcKvZJg==
X-Google-Smtp-Source: AJdET5fzHEtbbvKCtM1Ro2b0+iAWyvjpniiK0l0SqgaSyotio+K9WJa+kuxQDVbDq5VkeFRm2lp5ay9CYRMIP1vU+Oc=
X-Received: by 2002:a2e:710a:: with SMTP id
	m10-v6mr2090705ljc.66.1541098634318; 
	Thu, 01 Nov 2018 11:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20181007194243.2264-1-petr.vorel@gmail.com>
	<CAEUSe78cdBVy2A2HVO6jEjaDk6-0h7kuKTH__7NUMthg_PUoow@mail.gmail.com>
	<20181101175803.GA22705@x230>
In-Reply-To: <20181101175803.GA22705@x230>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Thu, 1 Nov 2018 12:57:02 -0600
Message-ID: <CAEUSe7_k1042j0GKzVbucvu_VS0AudaxZ88paXTsoCBS6A3NJA@mail.gmail.com>
To: petr.vorel@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20180926
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
X-List-Received-Date: Thu, 01 Nov 2018 18:57:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Thu, 1 Nov 2018 at 11:58, Petr Vorel <petr.vorel@gmail.com> wrote:
> > Patch 0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
> > also made it upstream, albeit with a different implementation. See
> > commit 822ad20433799193e2180862137c36f24e5d27d6.
> Well, I haven't replaced this one with upgrade :(.
> Shell I post v3? Or will you do it in separate commit?

Needs to be dropped:
0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch was
reworked and merged as 822ad204 in time for the 20180926 release.

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

