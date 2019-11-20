Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id A781B7F7DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:57:41 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id l38so198435uad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5TY8Zth1wq81FE3xGI4J39ahT6Cf2PLntCdrJy2hKnU=;
	b=L6SsVlXlPcD5Z+J23XohG31FZJrKRK5T04wZR9wRsx9FW8gFf3Se73ltv/duNEF2eh
	g/IfW/7R0keYEkX0rDxOSRsdESkFTTHvpglL6msJWk4N4VA5NUb7wURto3LyfGwl15GB
	e7Qzhu3/DcK51zP+LM7MZex5AcGvoqPYIhdalDQ0zo/qPL7UMOrcyPgmFgwC/eXndiz1
	e5dlabtUsMYK5tLC/OX+41Akfcvo8S0ilxpnK0QmHeIBQJA2FlpcuLi0k3vGJB+hEKn1
	Y0C6d8Ph+9au5hU6TkniqKaYI83v6n7Rbd70HvprwI5/AxCfyOMjf1sUuPcnf4Z8sVdC
	ZiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5TY8Zth1wq81FE3xGI4J39ahT6Cf2PLntCdrJy2hKnU=;
	b=cNGOX1jtAijijc6uukZKYLHUsuZWeHew5v6vxYfkM45RQzi0jNjzQkzg9f8lYdf61L
	ny+UWicFcw27lh5Fhq0fVIZg2O1Hr9wUcUbbOISuUpAQe66ssXX9/DvKXLI8UrhXf+Hw
	EpKwLUX3/36CkiQSe16rrl7aIPL/zrYJaVswKM5S4kKe9oU5eGW1NOKR4zM2e+0uQctn
	FEBT5eF2vq/BGg+VlliDt2RI3wnOUCR1T8IStHi04slvpUMI7ox/wSq0cpDhpVRSiM76
	XNKAvAhr6BdPa5nlBEwam7j6puuF7ryIbcftO/aDMDXci0vvYkzhJRSDYAI+NXRBfcVY
	+vrw==
X-Gm-Message-State: APjAAAUu4rRzbXOVDhblNnnoQOhWniszZXptxFP8z8Ap36gX88menBYJ
	eFSb+Pus0mI7q+crrVAOE4X5NRVIkXDKrKX80JE=
X-Google-Smtp-Source: APXvYqxveajTZ0svMdLM+m01K1VGH7V2YZ5aW2SmTeua7U0kwOe0EAwSeFQ/5GXzPpJBZDWMDj9w/Auvm6OPbc5IqH4=
X-Received: by 2002:ab0:5557:: with SMTP id u23mr2826659uaa.81.1574279862182; 
	Wed, 20 Nov 2019 11:57:42 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAJ86T=XhxLih7d6cdXc8-1ZOKhHXTU6quzHnt+G4Oa3qhSFypw@mail.gmail.com>
	<CAD0U-hL1m-2G67wfyKcr8BmG=ugf-s=534DnzhdQatJuG4DHaQ@mail.gmail.com>
In-Reply-To: <CAD0U-hL1m-2G67wfyKcr8BmG=ugf-s=534DnzhdQatJuG4DHaQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Nov 2019 11:57:30 -0800
Message-ID: <CAJ86T=V3eKrYn4RWnP1nQB7e1YXpVWoWLJ9SUEX-guQYh55YUA@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 19:57:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 20, 2019 at 11:44 AM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
> Hi Andre,
>
> On Wed, 20 Nov 2019 at 19:27, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Wed, Nov 20, 2019 at 11:09 AM Mark Hatle
>> <mark.hatle@kernel.crashing.org> wrote:
>> > On 11/20/19 1:06 PM, Ryan Harkin wrote:
>> > > On Wed, 20 Nov 2019 at 18:36, Mark Hatle <mark.hatle@kernel.crashing.org
>> > > <mailto:mark.hatle@kernel.crashing.org>> wrote:
>> > >
>> > >     You know that 1.0.2 and 1.1 APIs are not compatible?  So you will need to update
>> > >     everything that needs OpenSSL to understand the new API.
>> > >
>> > >
>> > > So far, we're only using it in a shell script to sign an image and later verify
>> > > the image, so I've assumed, perhaps naively, that the API changes won't matter...
>> >
>> > Correct, but there may be other components of the system that could be using the
>> > API that you are unaware of.  On a system as old as Sumo, you will need to take
>> > precautions to ensure that ONLY the 1.1x version is being used.  (There may be
>> > an openssl10 for compatibility that will need to be blacklisted.)
>> >
>> > >     For CVE fixes, typically you would patch 1.0.2p, or update to the latest
>> > >     (1.0.2t) as you go.  (If you have an OSV, this should be part of the services
>> > >     that they offer you.)
>> > >
>> > >
>> > >     In my opinion, 1.0.2 will be around for at least another 4-5 years due to the
>> > >     number of people actively using it in the world.  Until 1.1/3.0 (won't be a 2.0
>> > >     from what I read) exists and has a FIPS-140-2 support available -- people will
>> > >     continue to use 1.0.2 and maintain it as necessary for security.
>> > >
>> > >     As an FYI:  http://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/
>> > >
>> > >     This version is for thud, warrior, zeus and master.  It is intended to be
>> > >     maintained until either 1.0.2 is no longer maintainable -- or the FIPS-140-2
>> > >     needs have been met by OpenSSL.
>> > >
>> > >
>> > > Great, that looks like a better option anyway, assuming it has the latest fixes
>> > > I need, and doesn't give me the same build problem.  Thanks for pointing it out.
>> > > I'll give it a go.
>> >
>> > It's better to work with the Sumo version for your needs.  I just posted that as
>> > an example of openssl 1.0.2 being needed still by others, even as oe-core/Yocto
>> > Project have changed their defaults.
>>
>> If you want an up to date openssl 1.0.2 recipe which is compatible
>> with Sumo, you can find one here:
>>
>>   https://github.com/armcc/meta-plumewifi
>>
>> I'm only actively testing it with OE 1.6 (Daisy) and OE 2.7 (Warrior)
>> but it should work for all versions in between (and if it doesn't I'll
>> accept patches or try to fix it).
>
>
> Thanks! It looks similar to the tree Mark Hatle pointed out to me. Two diffs jump out:
>
> - Your repo adds the RPROVIDES for openssl-bin to "Be compatible with the openssl 1.1.x recipe".

Yes. Makes the transition between 1.0.2 and 1.1.x a little easier.

> - Mark's repo has two extra patches:
>            file://0001-Fix-BN_LLONG-breakage.patch \
>            file://0001-Fix-DES_LONG-breakage.patch \

Those patches are in my repo too - but only in the master-next branch.
They are not required for Sumo. (Since some might regard those patches
as a little "dubious" I don't pull them in unless they're necessary).

> Regards,
> Ryan.

