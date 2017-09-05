Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id B0BBF6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 08:44:03 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id l24so1025226uaa.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Cr4xD+apN3QmcfkkPhWvTS6cUHD/K3DRvl0LWnA4i78=;
	b=oK7clYnO7Yzan5MBxMiclgpTnDspfQPfxNY8a/9KYCMprowuATxlWLN9kqTYDXFOhB
	aXyPA4cLWtkMa1zX7I0Nq7OxF+HpsQNrtK3uvzqcizF4BYqYFGy6t85ZTI8C2rDnnvpw
	OS/AqxssmkgpktGLKCHZHAPlPHs+s+fuPE7C/ceUk7VU21rGA0jqWvsZzQZgeSYn+cMb
	ZD25h5OWQb7s4xTgcgHAv1wUYzh1JYk3cs8TocZWE6Q3y5qBsTJi135E9JDA2pnqhCMV
	QtCUwSEuPEg9bf6tMOgvd/c2Xp+OgRUqzNc0Nw1tRoayZRBDVyYvqQaQID2t5uAT6X1x
	oGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Cr4xD+apN3QmcfkkPhWvTS6cUHD/K3DRvl0LWnA4i78=;
	b=W9RhsSkDYreGomDuSX9eDcFIEEvM4BcWgyZyWKKY//OMCBzVGA3ygJkCIRPiL7YV9e
	Aqu0KETbOHFQfxFvj1bMXlu6UvMOg9l2phJDWrAJeCCwohyGLZ+Wc0ewsvWUjI/FAA07
	zdnhRM8d//ajXft1uYWs7vmd2E6TonYjrdNu2bq/ontOHvRWZXFLBgusSmHeqMi/oUrF
	0RQNEmdBjosoJl4yG4qdAYhIuDpMhPPzMX0SqDYn6GqSnvVRh10Zo6LZP1duJdWQB87n
	Dj3GqN0WiJxGdwBrgwGnRt++mNvad/XuwdQ+a1ntc3w/SMD3YpStIRKjwc7xuXWVaCnv
	gliQ==
X-Gm-Message-State: AHPjjUh7G9Kmny57gzQrlcFJKX61EEVpNm144XUJytmJwsa6NVWlCsUU
	ghsJPUHnaFRRHweD3FjlwDkTtRgNYA==
X-Google-Smtp-Source: ADKCNb6HReNR2+q/P5LXX7u/7ckT6+qfFupMCPU4Lw9CJOS5XKGgNo8lnV4MyF+w/yuhYOPBvdWlUAdz8EHAvfROjFc=
X-Received: by 10.159.57.88 with SMTP id i24mr2060758uag.18.1504601044598;
	Tue, 05 Sep 2017 01:44:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Tue, 5 Sep 2017 01:44:04 -0700 (PDT)
In-Reply-To: <d5f6dd10-db72-629a-df50-7e6a644c5967@balister.org>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
	<1503431754.32591.130.camel@linuxfoundation.org>
	<e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
	<d5f6dd10-db72-629a-df50-7e6a644c5967@balister.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 5 Sep 2017 10:44:04 +0200
Message-ID: <CALbNGRSzHa1gDGUZDGiHSLVP9DtjKU+XZgj-v5LmYtH919bV0Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Sep 2017 08:44:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 11:04 PM, Philip Balister <philip@balister.org> wrote:
> On 08/22/2017 09:26 PM, Randy MacLeod wrote:
>> On 2017-08-22 03:55 PM, Richard Purdie wrote:
>>> On Tue, 2017-08-22 at 12:51 -0700, Andre McCurdy wrote:
>>>> On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com>
>>>> wrote:
>>>>>
>>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>>
>>>>> We want to provide python libs by default, and some other
>>>>> popular Linux distributions like redhat/fedora does the same.
>>>> Has something changed? Is there anything in oe-core or meta-oe which
>>>> now needs boost python support enabled?
>
> I'm aware of a package in meta-sdr that will need boost python support.
> So there is need for this feature.
>
> Philip
>
FWIW: I have an append in metea-qt5-extra enabling python since two years.

Andreas

