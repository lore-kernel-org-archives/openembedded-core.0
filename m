Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3FB71974
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:03:25 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id 184so878041vkn.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qZTS5nUPRnvleo3W4tCi8ztxSM5fxzcl27aMRqb7Roo=;
	b=h4YrgcEFnOXnM/wCjkSYNrpzoGR3gAnO012JgPwQyscODNFk+P8CBB9hysmsar+pjG
	7fEP5xWIk7ZB+5csCofjLo1mU8e4tehm5tZA/sl4Zej5KvHbEaVXQ2jKZJGXimPdA2nn
	+ZAcbO3z3ubO9L5hMDco0LN/+QNeyPFtE7ZaoihS6pPC3oINUepSL0rbvZNCniPwDo1o
	xQr+fHp4hsgnvnACiNgwuk5SyTBC6RxjwIBcO4LVkzPXZKDNts91i2M2pZ5UYiuDojqa
	MbIdUOn56ooRk4paENKSruHGtJkPWQWUiuoLEHsxGRteIucctmNNgXOS71WwTzUln2dY
	S++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qZTS5nUPRnvleo3W4tCi8ztxSM5fxzcl27aMRqb7Roo=;
	b=ek0CuU+maZUFMSdX4wMriKKBercc4/UjGBmGNB/zBBumCjisJvX0BHN/aHVsNFAmU1
	irvKPAVH0aetcKMhg/bt9v63BKX4W4junu+5KEJBxCaU6txSyQ3ApJpcvAdHF361ZFLk
	iyP3BdmptXdKtSp/HN6B98Zw2qTJO0QPkrVm6nkZ2C+OjUQauZmWukD7hNWPdmuhrxp+
	C6R4/MP+UEG953jskLMh6h0UhYdicI6Ww3h4Zvqtmv5V5pDLf63wOH/l7eSYbd4FwVfn
	soHbLfVO0rAHtNW5XHs3DET4valJtN2tZ5CzPiOYhCVDTIViLoAxZ3NZd15yD7LtRey6
	qseg==
X-Gm-Message-State: AHPjjUhtgzS1BJjvHy4KAc66AvtPmVjifG5b05nTNcvcth4DsH0338Su
	lxnUmUDpt0DmAlRJPr6dUNJb00XKew==
X-Google-Smtp-Source: ADKCNb6JzL0YrEak7eahwUwnKyIii8BgFV64LQbJhU4Y+3ZQmLibT489xvpozxB5W915EcGU0ZVyjZvet2+x2IAq5ME=
X-Received: by 10.31.216.195 with SMTP id p186mr1829992vkg.89.1504602207241;
	Tue, 05 Sep 2017 02:03:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Tue, 5 Sep 2017 02:03:26 -0700 (PDT)
In-Reply-To: <CALbNGRTY=D_CgoyYryb6fooJCcopNG7FG17=zGeNkd1mpgGQ2g@mail.gmail.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
	<1503431754.32591.130.camel@linuxfoundation.org>
	<e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
	<d5f6dd10-db72-629a-df50-7e6a644c5967@balister.org>
	<CALbNGRSzHa1gDGUZDGiHSLVP9DtjKU+XZgj-v5LmYtH919bV0Q@mail.gmail.com>
	<CALbNGRTY=D_CgoyYryb6fooJCcopNG7FG17=zGeNkd1mpgGQ2g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 5 Sep 2017 11:03:26 +0200
Message-ID: <CALbNGRQhF-7xWb3eJVNqSuFoMmGj94DTbXYr_qYUVRjKG+RFVQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add python to default PACKAGECONFIG options
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
X-List-Received-Date: Tue, 05 Sep 2017 09:03:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2017 at 11:02 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Sep 5, 2017 at 10:44 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Wed, Aug 23, 2017 at 11:04 PM, Philip Balister <philip@balister.org> =
wrote:
>>> On 08/22/2017 09:26 PM, Randy MacLeod wrote:
>>>> On 2017-08-22 03:55 PM, Richard Purdie wrote:
>>>>> On Tue, 2017-08-22 at 12:51 -0700, Andre McCurdy wrote:
>>>>>> On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>>>>
>>>>>>> We want to provide python libs by default, and some other
>>>>>>> popular Linux distributions like redhat/fedora does the same.
>>>>>> Has something changed? Is there anything in oe-core or meta-oe which
>>>>>> now needs boost python support enabled?
>>>
>>> I'm aware of a package in meta-sdr that will need boost python support.
>>> So there is need for this feature.
>>>
>>> Philip
>>>
>> FWIW: I have an append in metea-qt5-extra enabling python since two year=
s.
>>
Saw that this was applied already. Sorry for the noise..

A.

