Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <manuel.bessler@gmail.com>) id 1SsGVG-0003KQ-3H
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 18:56:34 +0200
Received: by weyr6 with SMTP id r6so2667343wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tCnFre0txk4I49OebAYFNNWJKM81CRNgW9cyPDdLpQc=;
	b=unJdYWzMADDi2de4c3O6ZJ4UQtCcwRrLbF2rm6zwqpGmQIZbpUF2toGqMMU0wM4Saw
	VVQjMRLVvM3tB62nLed/NeOg9fc44nPAWYoDfTbDXMMNPRqsrYybq+C0FWN6h9Xb70iC
	XaI5bJKeZDp6v09aMU4FNU2RDdKq6GKzRhL7/+XbsjE40mAAcCarEA364H37CnSF3OZs
	8TojGchB1EC1y5zipQr6vo2uqBXMPnbbG6wgQZGKxeDlvDj4SMOnZ5Z6LJt/GnLRM1Wd
	ZoPcY4ayXrKe6VFmJ4EH16v+HEaujmo6XMXUNjsFI+kkqUpJhk+nBRWcCje/gcpj3Y6O
	O6Qg==
MIME-Version: 1.0
Received: by 10.216.198.10 with SMTP id u10mr4123845wen.80.1342802710618; Fri,
	20 Jul 2012 09:45:10 -0700 (PDT)
Received: by 10.216.93.142 with HTTP; Fri, 20 Jul 2012 09:45:10 -0700 (PDT)
In-Reply-To: <50087A5B.9030905@windriver.com>
References: <CAKSdS8L32A5wB4fzuc-EQTBX9_GXLhLO_gt4HgzgJk=UC+XZKw@mail.gmail.com>
	<50087A5B.9030905@windriver.com>
Date: Fri, 20 Jul 2012 12:45:10 -0400
Message-ID: <CAKSdS8LB0=8RieBGJSAyxyw9APPEksCKZ1WVz0EWwMZ49-SRow@mail.gmail.com>
From: Manuel Bessler <manuel.bessler@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain type SDK containing external toolchain possible?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 16:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Mark,

On Thu, Jul 19, 2012 at 5:21 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 7/19/12 3:13 PM, Manuel Bessler wrote:
>> Is it possible to setup my toolchain such that it will be part of the
>> SDK package instead of the default {gcc,binutils}-cross-canadian?
>
>
> It is possible, but the external toolchain needs to be provided via a
> crosssdk/cross-canadian binary.  The external-csl-toolchain.bb can be used
> as a model for how to do this.

What do you mean by "via a crosssdk/cross-canadian binary"? Built by
bitbake using the *-cross-canadian recipes?



> For my stuff I did;
>
> PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
> PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
> PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
>
>
>> That alone did not change anything.
>>
>> Then I tried adding the following to
>> recipes-core/meta/external-xxx-toolchain_4.5.3.bb in my layer:
>> PROVIDES += " gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} "
>> PROVIDES += " binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} "
>
>
> Within the external-cs-toolchain-cross-canadian.bb I had similar provides as
> well..

So you have a separate recipe to satisfy cross-canadian ? I tried
finding this file but had no luck...

Thanks,
Manuel


