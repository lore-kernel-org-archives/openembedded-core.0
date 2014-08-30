Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id BB269617B8;
	Sat, 30 Aug 2014 03:02:21 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id tp5so3567923ieb.8
	for <multiple recipients>; Fri, 29 Aug 2014 20:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hC7e67yZslvA4aoNi5FhiOTNJjf00NWkBtwoU6q6NWU=;
	b=tqN+v0Ag9gmbQkh+z2IIyvdOimblanEgRc/85qX8v0ldFCDuZk28JpakUd0kVcAXCK
	1qQPSxWfeJucXTrWMHAt90OXSzzI3HeGpYHxuyQccZ3aM+WKMkTePSimHbgrvJGsHhDq
	C5jnTu7c4A1SWQm1r4ZkF25DsSD9FybfXfOHRIpwkPC6MXwXr53hX5nk/JyK+n4Du8Pi
	dZM2Y3z2kGFO0GOjhoran9nSJFKfIdCvnLze0giRGMRlUArhc9bha3ToJ/cRYJ8KgkuS
	keENqN4roKAc9VVvDwCwIPR9K8rjoDUNqbHG3dp+icAjmpC26NPz0xgtZxnC7Me7ybfv
	nESQ==
X-Received: by 10.50.21.3 with SMTP id r3mr8533276ige.13.1409367743014; Fri,
	29 Aug 2014 20:02:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Fri, 29 Aug 2014 20:01:52 -0700 (PDT)
In-Reply-To: <CAMKF1spiNQm8GVSNApqqhd6WFJnD8-=2A0_JxD85dKGaqkgOoA@mail.gmail.com>
References: <20140828064051.GA13139@haswell> <1409266291.29296.147.camel@ted>
	<CAMKF1spz2KoO6NDSkZwh=V=pkyYi6e7-G0fpka5P2ifbjnNn6w@mail.gmail.com>
	<CAMKF1spj67i2i_50m=oTUpS3x2J=de0UxGf70zLhn-a7c4M3QA@mail.gmail.com>
	<1409314734.29296.169.camel@ted>
	<CAMKF1spiNQm8GVSNApqqhd6WFJnD8-=2A0_JxD85dKGaqkgOoA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Aug 2014 20:01:52 -0700
Message-ID: <CAMKF1sq7w79s-TBV=RU8d2NP7ueJ8U8UFRSe2jBcfOzJ14qQzw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sat, 30 Aug 2014 03:02:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 29, 2014 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 29, 2014 at 5:18 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2014-08-28 at 18:46 -0700, Khem Raj wrote:
>>> On Thu, Aug 28, 2014 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > reproduced. will apprise as I have some fix.
>>>
>>> OK pushed another patch to the contrib tree that should take care of both
>>> xf86-input-synaptics xf86-input-vmmouse
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/17/steps/BuildImages/logs/stdio
>>
>> xf86-video-imxfb has the same issue and will need the same fix. Otavio
>> cc'd...
>>
>
> I have sent a patch to meta-fsl-arm for this

Until its installed, the patch is here
http://patchwork.openembedded.org/patch/79443/

