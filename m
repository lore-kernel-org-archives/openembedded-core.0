Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E8E0A7F82F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:49:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i17so25126183qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gw5fd8nh+GXebaGYbEKIvgcy/tCpiITrT9Gs4CGUq8I=;
	b=SrzLyFynfXDUgte9WCVP7qFp5cFRYT6HcUBWNSpBgSjQ5fL6Pe6YNcT8ZSxnBx6BIz
	X7RAgzcJHo1sLbBwEzmbJqgjhC9g5x22qHMdtL7bmt6d5hIuUQEyVy+qiVIH/ZnnlhCE
	Km8aapDiWEHtsDeWIkqd3aISeQo+CMGwxgJWqYidfm9+FzhzRHIh8oTtdu2B3YVEInDh
	ayv+TTAPEZphm8wlaHsArjWilremSRfTj+lNR+s7nCvbWDqbCldBYu13mRM/W1OwZa8B
	Y4J4zg/cDYqJwQtLnT+Ld2B5Vt3o2Q0kZnORLkqv8rKzwVhy4qW690L8oGRYDKYztlnd
	E22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gw5fd8nh+GXebaGYbEKIvgcy/tCpiITrT9Gs4CGUq8I=;
	b=WiIPHJwxl3KtVKFCaFEY0xFjTd9K+9zVVMkAwhW85NEImvWaXLUaVlJVIFPknGgQA2
	Rwt/gDvk9DtvNzG4Ed4/X4dVkpXhUMBy99r4Uty6kcfXvZ3cdVI+2PaBTt5vRqGAMwV+
	Ws1xIcPA4KW7/m5Wr0gTxQOs8XrkfKieszytf3pba0MtrRJOW0DPILNToy9/mUKZeywK
	aX/gkpN6tXQ7SAy782gQiI1HlnUZg00Dut9KofJWcYUXMqV0id88FYSzwlwX/vRWtpW8
	0m0ZXvkwkRxlthYlu+qjjpHms1Ca7U0Icg7ETYJ9z5CeHlClV7rKsaPBmeZW0gdQvr32
	Cyzw==
X-Gm-Message-State: APjAAAXufekAT2zefZWw0GhBFXVdm69nEp5vm5RqaWxIK+F66fYI7jv5
	q5x4CJa/DQMQETjsVj3Yr941XIkdsIzx2RNnFN4=
X-Google-Smtp-Source: APXvYqw7nvW6azj7Mp9BjnZS3Toekiz1+wqkmv5gdXZ23BN0Ph5ZJjPifoddLM6m5EYHgAwY5W3VtWLsiWVWv9tswUA=
X-Received: by 2002:aed:2724:: with SMTP id n33mr33176367qtd.194.1574178586420;
	Tue, 19 Nov 2019 07:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
	<CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
	<CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
In-Reply-To: <CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2019 07:49:15 -0800
Message-ID: <CAMKF1spXYo2-Qor9YpPs13+EgCpxLq+f7Bc69YUXPmHwEJRdAw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Tue, 19 Nov 2019 15:49:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 3:30 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 19 Nov 2019 at 08:58, Tim Orling <ticotimo@gmail.com> wrote:
>>
>>
>> I have the beginnings of scripts to generate a meta-python2 layer. Someo=
ne with a vested interest in keeping python2 supported will need to step up=
 to maintain it. After bitbake and Oe-core moved to python3, my use of pyth=
on2 has gone to near zero.
>>
>> I intend to move all python2 recipes from meta-python to the new layer. =
meta-python will become python3 only in 3.1 release timeframe. The bb files=
 and inc files will also be merged, simplifying AUH and devtool usage.
>>
>> Attempts to send python2 patches to meta-python after that shift will be=
 nacked.
>
>
> Thanks! There is however a missing part: how close is meta-oe to being py=
2-free? Oe-core is very close (u-boot is the last holdout as noted), but I =
am not sure that we can simply take out py2, and not have half of meta-oe f=
ail. For instance (random example) mozjs, a fairly important component, sti=
ll pulls it in, together with a few 3rd party libraries: https://git.openem=
bedded.org/meta-openembedded/tree/meta-oe/recipes-extended/mozjs/mozjs_60.5=
.2.bb
>
> It's tempting to force the transition by breaking things, but it also ant=
agonizes users.
>

Its for how python2 should be organised after it retires and
suggestion is to move it to an independent layer rather than
meta-openembedded repo,
wether, layers under meta-openembedded will depend on it is a separate issu=
e

> Alex
>

