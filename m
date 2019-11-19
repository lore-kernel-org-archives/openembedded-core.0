Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 731D27CE22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 22:44:39 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r2so20121616iot.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 14:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oPEP4bqYAUO/2UaB4UcuNA46wKTOa92CMUYbt6z9sIE=;
	b=EYl5Qf8WZkMZ+SfPruQAkYbduFGFaK4u2hDqFCcA63T5Zf1BS/FeoQiyGSTId2Bd+h
	1tDHZsWUmVwwXXndgn0aF1GMFwiBGdsABebb0ozV7AbzVePtI3YxJrHCtFJPmqoaHzSV
	1qA3Dp5ylb1PXKXc9xeZHagfI0m06i6W1FmsxAC/lu411uDLafAhVR/kukznYX8dp/o0
	vH+vl+ZnueDdJb3Q13tcu7lGXS6OVlxSbQ7syFuTwX67lDQXfaP6S4fvs0twG0QEK8cY
	Fb7qEdbYYWv2EVCt43EiiNjF5usxJqdsQGQNurWQCDnVWBo1fJSugln7W2MGfXS+32CV
	/rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oPEP4bqYAUO/2UaB4UcuNA46wKTOa92CMUYbt6z9sIE=;
	b=f+FBABaoNhofRaF1M6bSSuG8Dh/43RZ9Vxo6rUqbfdEU+cJthwD3icEuuSRnXHlYw/
	7OHrtJt8Hn4BIQdbkxPoGSM+ywyIk7vhlP+75vUNyTwlL/vbADqp11fwq6TBQbQCDJ/4
	U+huDgKbr5gKxQBnEHfVejtWawmNHD1sefu9/XoPOsRnZ6jiM+z1OjfP7XYfeIMzCqX1
	LE25CoD5OV28vuDvibKP+DSfHo8A887PffeN/hZ5lacGpuHGrJy8rvkbcJzTV68uRiFT
	V/4HO8PyVqEjWPqqaiWOFhOYKZwYvGPf3bf5nRY8BAz+sko8avyeMxh3WVDTAIww7BQL
	Lf3A==
X-Gm-Message-State: APjAAAWX3Vzu0a9YH4BaTfidmv8wvR96I6UjPNxEqYbilyWaVZfv4nUK
	nD4SDdY+QSrkLpASV6lG2PAJPPMwnh3HRrom5Mg=
X-Google-Smtp-Source: APXvYqxt+io0g4DkUudAjDLWqaj71vuFCQbLBCGeOqmjiWVtlMUVopz4y4dUg0IzUg2Rc7mF5S0nwVW7zAA2hYLEK+4=
X-Received: by 2002:a6b:400d:: with SMTP id k13mr20663722ioa.299.1574203480246;
	Tue, 19 Nov 2019 14:44:40 -0800 (PST)
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
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 19 Nov 2019 23:44:28 +0100
Message-ID: <CALbNGRQ=kTRE_g0n-2Xx9qMKSbh4rWX+pRY_mqaegApUf_+jNA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Tue, 19 Nov 2019 22:44:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 12:31 PM Alexander Kanavin
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
Will take care on mozjs and interrupt my gnome crusade till its done.
Tried that months ago and used firefox-esr sources because there the
transition to python3-build is marked as working.

Unfortunately I did not succeed. Started that they rely on VERY old
version of parts of autotools - think it was automake. Need/like
polkit although I will never understand why a privileged process uses
javascipt for configuration files...

Cheers

Andreas

