Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0D97978637
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 21:13:20 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id 108so2894582wra.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aag8Om994j5K6O3NaQZEyepacjhD9vTKCRrxJRfW5xU=;
	b=dZpm9FnwLhxEIeOoWr/5pNZu9HvekjpPfNEHkZ6X5/vI1oFQLIb2bfsoFeCz3PIba5
	K6QF2bQ03No6MDCdQnOi3yiIei9SiZEYl1IdspDxU0wppiLUkP+jNLnK5vY5aM3RBQCN
	nsa+jd/ONya+AEGx1iC/fXlwU2X+OSdTY1OzHox73n7rVV6QpReOFAHOiciFpD/4ghJS
	leTvFaXNawxLv9hAj1WC4pdJqwBznnZxTBjIC+P/xgIIjJT6JgtLayZwwcVzsl32Kua+
	h6loS+MPnn3uMc69SQRiJKYYOKBPlKRhaXCauTQyRLATi+EudV0x3AKpXCJQ9Rb+OqA9
	Mujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aag8Om994j5K6O3NaQZEyepacjhD9vTKCRrxJRfW5xU=;
	b=ME5Na1HxepwOXCzudEr8mO90mkOwgkT+d3WpIxVIrsT1XW6gbpXtwU45Mawb4TwBzr
	56wVDSNDMDKws83PsrGCKu3FwBFr/SN2taJiX2wvegVyySEwcOljOWs8xypVds2V8KQr
	1APhCCU+0qy9ef7lShs7lYXFjp7j7evZgvQxsCHonutFqT2BxTxLFloCt4gTmnVat+6n
	y3swECVh5T8VH0zA4zVSuCpXU3C+umzLvoamOVb7iDFjeyM1dLHj/ERT5t//WuvCl20E
	0OFm4PWlc8XtIhIhmGQjw6FHknm73JaqEsXxeyPupd0RGfZdwuBVQR/wRvZl8R1W50D0
	wH6Q==
X-Gm-Message-State: AHPjjUjKqf0RZ35GgP3gYB7BHjM8Kxdu88rya/LocOlsSJHiznYb7Vca
	WygQ4bVUM1UQN0FV4R17aCHJsKWdwqWzLtav28A=
X-Google-Smtp-Source: ADKCNb7tsRz/pCSc0sDd0Y9MQVCrSv1g3bnpZDZuDFTgti8134KuDnEqR12tFRcL93Bd+kiyfq+ckJisZussnpMrSHA=
X-Received: by 10.223.187.74 with SMTP id x10mr15836374wrg.66.1505337201702;
	Wed, 13 Sep 2017 14:13:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Wed, 13 Sep 2017 14:12:51 -0700 (PDT)
In-Reply-To: <1505336969.18640.82.camel@linuxfoundation.org>
References: <20170905150847.32681-1-ross.burton@intel.com>
	<CAKmqyKPiyBMAMDQZ6RG0envtnUto=n7jx0dxwgsqJaZvV=yMzQ@mail.gmail.com>
	<CAJTo0LbmEOd=9_W4ru7=1VUY1c0eyOmEzr3rFvwsXnC_ftA1-w@mail.gmail.com>
	<CAKmqyKN-kxvENCrxR1bQ5Z7YDe5wO57GRgYZVmmy8-0eUOOicA@mail.gmail.com>
	<1505336969.18640.82.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Sep 2017 14:12:51 -0700
Message-ID: <CAKmqyKMoTxxiQJ5jsCP9bHdNinEHG5mfb=fWUCaS+_6C+ZFY9A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: recommend shared-mime-info
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
X-List-Received-Date: Wed, 13 Sep 2017 21:13:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 2:09 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2017-09-13 at 13:55 -0700, Alistair Francis wrote:
>> On Wed, Sep 13, 2017 at 1:42 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> >
>> > Can you share a log showing that?
>> This is the full log, so it's not just OpenSSL:
>
> I suspect the new dependency means other things get built on mingw
> which have never been needed until now. We may need to remove the
> dependency for mingw to avoid this..

Yeah, that is what I suspected. I tried the BAD_RECOMMENDATIONS in the
mingw machine-sdk conf, but that didn't seem to work.

Thanks,
Alistair

>
> Cheers,
>
> Richard

