Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7F8766A3;
	Thu, 26 May 2016 20:42:34 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id f66so118314520vkh.2;
	Thu, 26 May 2016 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=wUMO78uOU8lJY9L/zV1bBYC1LVfIhVn6wd3lmdLd9qU=;
	b=stuQrlLeZnuPqA5xb88DJ4uHuqNFD5t2hMbtlHHEG4E+Z3kTmB1fMDh7AUverSVNfx
	OWlskWkxFA3J1rRY7IsaYzya0sVuDVa+8hryuQMxOHWU/au57Dn5bhEegrGcsNEP/wU5
	o2uybzPL/i7Jon8cCIJoKNYtNkYMzOAqNdm8BMVjJnGJaVkRy1u3lAALuT/BqaTIfafj
	LnxaximSK6m/1xnvAAun1AbX0qqq1PbeTugZjmIOghrPvD9CPdOyD+8ARYCX99uG0Atd
	tVrj0xI96qX6CSsjKASmlbrBEEqDhlY1FM+9YD4qsmAuZ+AI3MCWaRK8WDlegWPoOvgr
	Wh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=wUMO78uOU8lJY9L/zV1bBYC1LVfIhVn6wd3lmdLd9qU=;
	b=MUiX0CZoyc/DtRuaZr/adOMxPYm/nVDMdJ6i3ssn+BirnKAwAKNoGasD/CyXOPMcjl
	AUusw5L1CPW+Z3aI72K7scoLkfOoA4i+4fXqtp10rCT/26QFCgMqWfcwrKJefTdIhsb4
	nKbGqvD7doa1bwvxZ6vodV79IEZlZfMxiqaeso3ERhev8AXJ4S56+hZhKlNiQ/Adw5Ky
	2B+e+TB3q7lpItazbIEemlHH1+OTc5oi8no2GsAhigfkW3RJkPyU/Wroh+B5rDZ8PQOn
	zotB+gHl6yzOAbfSMi37xsWWIeI03Pc6x2hJrfRgHhASH7Ln7/ay6rwK3LOmzH243+Y0
	VKgQ==
X-Gm-Message-State: ALyK8tKO7NjjYdJ1pXXZhhus7AS6M37J7wlIFMBcPP/1GfQQkzIWFf/eKPpyvHcu9SCmAiwhOcxlaFldsjCkFw==
MIME-Version: 1.0
X-Received: by 10.31.56.211 with SMTP id f202mr6681216vka.135.1464295355293;
	Thu, 26 May 2016 13:42:35 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Thu, 26 May 2016 13:42:35 -0700 (PDT)
In-Reply-To: <17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
References: <1464054649898.9b34c448@Nodemailer>
	<3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTBcwNx0SMYjQ2GbRJviekG8h734t0yH24zeyiQEG367Q@mail.gmail.com>
	<17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 26 May 2016 22:42:35 +0200
Message-ID: <CALbNGRTxYZ-+ZFmxOCguBMbO5X4m6KTaM+jXVqmSBQ8pHuR9UA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, e8johan@gmail.com, 
	Samuel Stirtzel <s.stirtzel@googlemail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Thu, 26 May 2016 20:42:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2016 at 10:25 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thu, 26 May 2016 22:18:34 Andreas M=C3=BCller wrote:
>> On Thu, May 26, 2016 at 10:14 PM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Thu, 26 May 2016 13:46:21 Cliff Brake wrote:
>> >> On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.com>
> wrote:
>> >> > meta-java repo was moved to:
>> >> > git://git.yoctoproject.org/meta-java
>> >> >
>> >> > Is it possible to update the list with that info?
>> >>
>> >> Done, thanks!
>> >>
>> >> https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a0234=
1562
>> >> a9b f254b3dd9dc71704
>> >
>> > At some point it would be great if this script could be driven from th=
e OE
>> > layer index rather than being a separate entity - then updates would
>> > largely be self-service for the maintainers, or at least they would on=
ly
>> > need to be done in one place.
>>
>> Maybe a bit off-topic but layer index should have some mechanism of
>> removing rotten layers.
>
> We've discussed this on-and-off at OE developer meetings for a while now.=
 FWIW
> I can remove them manually - actually I just got around to deleting meta-
> picosam9 which has been unmaintained for years.
>
> Part of the problem though is determining what "rotten" actually means.
> Additionally, there's an element of leaving things around in case someone
> comes to fork/revive them again. We do show a "last updated" date but it =
would
> be good to figure out some other way of determining and indicating "layer
> health" - to date I don't think we've managed to figure out anything prac=
tical
> for that.
>
At least meta-kf5 is a candidate. I think it has never worked and
meta-qt5-extra is (try give my best) - maintained.

What about meta-kde4?

Andreas

