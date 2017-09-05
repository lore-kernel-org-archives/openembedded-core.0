Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 215D26E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:02:29 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id j189so884617vka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RhOIeqZEaslPPSlTnl7t0sdULlYofFxAqzmmEOFkGCQ=;
	b=EbtNCTDBrQ4dJ7NU2AcGQSQg0/FIukanKsic7/VLQyoK2v7fbexWp1xonK5073cqyt
	Iftq4gkfH5vDriI0zUCCOv0EMAhxEquAc6pm5wxyx62Hj4YoK5NbsEWxRuRNhb5YSVZJ
	1tpmvSxZzu1EiZK8KH/Z/Q/VolPXsfXOA3bKk5b3BG2qN7T0eBwhD6Cm3fPDWgO7VX/l
	t+MGC8U6ZBLYW3tiOw4vhdhUWMeyrrmD8iyVVi7Ddxelrds+oL0VLNjvKOC2DP7DjNHj
	U8x3FRlJaak3Y1Gwqp1jgC8shrcCWAkSNg7o4Jfg/Qrn65XN706cmOoHBesB33GjtxJL
	D1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RhOIeqZEaslPPSlTnl7t0sdULlYofFxAqzmmEOFkGCQ=;
	b=Y/Q39wl3i7IiT1vTRY0JASydfX583TxflxFSrnm9PR9v5YVrqthB/BYvBVYrF20dNA
	RvKvwwMjsx4XfI40gQuRyz6Hf67QV+2orIFGPvjYGCiBDWtdfwp1ltJlk5+qeGhbSRVU
	zTKfc0E0sMgwUzJblBlAhdJKCXi7WBuFExYJREL/x61D6DpmEqCCp0P/LAIcV/BDwjv4
	g1xjish81M6v+70vg2s3MbEEV57aaTrnrB7vBD2AYrvJr080BRaASoscpsHy+M9hzS+j
	Ya+lYdDi505mo8fGMl32Om+CYZJpigMlLCjkxtrVUAJ82+ooDs7QdI1/0wrJHpjWbcXT
	ZBag==
X-Gm-Message-State: AHPjjUhS8ufMObNNEcL0SwxhZGRtGsq6yrH9OkLuCUmJjzIwdlptjdUa
	vfrhxnrVxq5ST+AsCHRq+cjwS0b8lA==
X-Google-Smtp-Source: ADKCNb7Z/Q2Zg+W8/d01S5qpiD4AhILp32FyekGmy/Sgw8TLRz5Qz88Ol2aak8LlOAas98wxTulWHWOpLkNbEfRLovE=
X-Received: by 10.31.205.135 with SMTP id d129mr1872986vkg.84.1504602150997;
	Tue, 05 Sep 2017 02:02:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Tue, 5 Sep 2017 02:02:30 -0700 (PDT)
In-Reply-To: <CALbNGRSzHa1gDGUZDGiHSLVP9DtjKU+XZgj-v5LmYtH919bV0Q@mail.gmail.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
	<1503431754.32591.130.camel@linuxfoundation.org>
	<e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
	<d5f6dd10-db72-629a-df50-7e6a644c5967@balister.org>
	<CALbNGRSzHa1gDGUZDGiHSLVP9DtjKU+XZgj-v5LmYtH919bV0Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 5 Sep 2017 11:02:30 +0200
Message-ID: <CALbNGRTY=D_CgoyYryb6fooJCcopNG7FG17=zGeNkd1mpgGQ2g@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Sep 2017 09:02:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2017 at 10:44 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Aug 23, 2017 at 11:04 PM, Philip Balister <philip@balister.org> w=
rote:
>> On 08/22/2017 09:26 PM, Randy MacLeod wrote:
>>> On 2017-08-22 03:55 PM, Richard Purdie wrote:
>>>> On Tue, 2017-08-22 at 12:51 -0700, Andre McCurdy wrote:
>>>>> On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com>
>>>>> wrote:
>>>>>>
>>>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>>>
>>>>>> We want to provide python libs by default, and some other
>>>>>> popular Linux distributions like redhat/fedora does the same.
>>>>> Has something changed? Is there anything in oe-core or meta-oe which
>>>>> now needs boost python support enabled?
>>
>> I'm aware of a package in meta-sdr that will need boost python support.
>> So there is need for this feature.
>>
>> Philip
>>
> FWIW: I have an append in metea-qt5-extra enabling python since two years=
.
>
> Andreas

