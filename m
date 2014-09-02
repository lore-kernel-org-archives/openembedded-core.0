Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 886A06A941;
	Tue,  2 Sep 2014 22:50:49 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so7804249qcx.13
	for <multiple recipients>; Tue, 02 Sep 2014 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=m2ScJa+ED90lGvwGcNkc8GcBOUgftr/BwczGOlzWUWQ=;
	b=Yue7gvqGjizZeth8TxcDLY3YjM4WQM1YoScMKugLO4jyBogflVoAWgryDco5nYzavu
	SsGn7xhxZ/rQaSvLZLdHF5dONPAW1nKxQma+3v4j4St/wWoxxt7c1fV89me9x5Ej+1xd
	EtEMuXLn2Ei9r8ruc6ppKp3pwYRNPKgDAio2p+XXywZfX1rzg8IygMbWxqK6+Pu2SyP1
	wTrD3w8l77JSPCDWk7B256UqA7AbRnY5A7VJ7JtpqtKvB2UCruarYNtnXbnFQS8eugT5
	D2Rzs3ib8U4mL1PrzVSD75A1Qnb7ZA63iS8PxXnViiJaP2A+uGcYsQNHSbjAAAKqKTeS
	jH0w==
MIME-Version: 1.0
X-Received: by 10.224.173.7 with SMTP id n7mr2875582qaz.15.1409698250459; Tue,
	02 Sep 2014 15:50:50 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Tue, 2 Sep 2014 15:50:50 -0700 (PDT)
In-Reply-To: <CAMKF1sq7w79s-TBV=RU8d2NP7ueJ8U8UFRSe2jBcfOzJ14qQzw@mail.gmail.com>
References: <20140828064051.GA13139@haswell> <1409266291.29296.147.camel@ted>
	<CAMKF1spz2KoO6NDSkZwh=V=pkyYi6e7-G0fpka5P2ifbjnNn6w@mail.gmail.com>
	<CAMKF1spj67i2i_50m=oTUpS3x2J=de0UxGf70zLhn-a7c4M3QA@mail.gmail.com>
	<1409314734.29296.169.camel@ted>
	<CAMKF1spiNQm8GVSNApqqhd6WFJnD8-=2A0_JxD85dKGaqkgOoA@mail.gmail.com>
	<CAMKF1sq7w79s-TBV=RU8d2NP7ueJ8U8UFRSe2jBcfOzJ14qQzw@mail.gmail.com>
Date: Tue, 2 Sep 2014 16:50:50 -0600
Message-ID: <CACS+7ZSnU5Juu5iWh2aO=4vW86BJFP6DP0ckRDAdF2O98xWVPA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Tue, 02 Sep 2014 22:50:52 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2014 21:01, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 29, 2014 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Aug 29, 2014 at 5:18 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Thu, 2014-08-28 at 18:46 -0700, Khem Raj wrote:
>>>> On Thu, Aug 28, 2014 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> > reproduced. will apprise as I have some fix.
>>>>
>>>> OK pushed another patch to the contrib tree that should take care of both
>>>> xf86-input-synaptics xf86-input-vmmouse
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/17/steps/BuildImages/logs/stdio
>>>
>>> xf86-video-imxfb has the same issue and will need the same fix. Otavio
>>> cc'd...
>>>
>>
>> I have sent a patch to meta-fsl-arm for this
>
> Until its installed, the patch is here
> http://patchwork.openembedded.org/patch/79443/
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Is it possible to add an RREPLACES to these recipes so there's a clean
upgrade path from eglibc?

