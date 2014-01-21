Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id C7C8F6007C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 11:39:45 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id x14so3346799vbb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 03:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z4TWv0Qfb5lDoodv5upR71lRoPyvg7v3qvWu5vGXE7U=;
	b=UMVLSTuo6MxzXoudxxpdssPPokWpY5wKsNZe0crI6AOmBQo8wKyu0qbCUtuIBKA8Z4
	CsyEiieILXpnuoanGrjj3vmMR8a8MYg67yGDnkm+RXHXad8CKydpJ++zllfifInvmDZv
	wIVxL9ytiUsegLSniFvmVe7I5LUp4x0OseG/z4akJJFhbR4DeK9J8ofkONhKjRpsHuRX
	lRX0kXd9luPQIzyfx1TkmjGFmGJ9wJaiKloUwnssgQ3FA3Zx+0xDbJ92IlU40ex1lY+m
	aGXpXYLg4xfuGP0LMeGMhdcSVr0kmfTp7gH8gAxGnriy9CAAlxa43/g2iccwbnMI35Lt
	zuAg==
X-Gm-Message-State: ALoCoQmLsint2IXBVRbdd5Zuyc4WKxlxavGBUKMlISY+pbqz5GwRzY6WtNo70oukrYKt8rJfZb9q
X-Received: by 10.220.193.70 with SMTP id dt6mr14129489vcb.17.1390304386062;
	Tue, 21 Jan 2014 03:39:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Tue, 21 Jan 2014 03:39:25 -0800 (PST)
In-Reply-To: <52D7B3EA.6090308@herbrechtsmeier.net>
References: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
	<1389376488-22286-4-git-send-email-ross.burton@intel.com>
	<52D7B3EA.6090308@herbrechtsmeier.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jan 2014 11:39:25 +0000
Message-ID: <CAJTo0LZm8e2kN4KX6QnGn9Aa1q=t42E=2G3QCo3QLHMD6YYaTg@mail.gmail.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] cmake: default to out-of-tree builds
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
X-List-Received-Date: Tue, 21 Jan 2014 11:39:46 -0000
Content-Type: text/plain; charset=UTF-8

Good point, thanks.  Patch sent.

Ross

On 16 January 2014 10:26, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> wrote:
> Am 10.01.2014 18:54, schrieb Ross Burton:
>
>> Set B=${WORKDIR}/build in cmake.bbclass so that recipes using
>> cmake.bbclass do
>> out-of-tree builds by default.
>
> You should update the note to reflect the new behaviour.
>

