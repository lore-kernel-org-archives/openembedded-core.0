Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7Cg4-0004ec-WA
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 23:53:29 +0200
Received: by eekb57 with SMTP id b57so796341eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 14:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hIH30QscAdIJVaPBCi9f0nAIp2vO37LjDmNxk1mBWLc=;
	b=PiijsSF+LQ0gafSldLonw3V6zjyBPr8H2E3FQmaJ5AWpjI4WvTdjAX6QZBnbS3MwIC
	jpl2TmDdUpbi2uhOKKXdBu6GFjtgPTaA4gX2HLKYDnF67ULk34MWbyg0hCEf8YfMI+bw
	Yg+iqd3w6/NdvzJYoWr/1FYeHafNpoAuz5pgM8bfpByHetWmaN0bSRqrMmLU5BltJWy2
	A+OQQAMAOgI5RtGBf4gML/8sudL4Rv7kM4YthdX4jCkl0XcUOhQFqa5Jl49hlWL7NyZp
	7U04cGrVa6snPkH9rVkvybLksCB2L/lSZKXyQdqBBzX2Vl9c9gYaWs1JP0KqqQwjkkNK
	5IRQ==
Received: by 10.14.218.134 with SMTP id k6mr8491766eep.14.1346362873264; Thu,
	30 Aug 2012 14:41:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Thu, 30 Aug 2012 14:40:41 -0700 (PDT)
In-Reply-To: <1346357591.4396.76.camel@x121e.pbcl.net>
References: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
	<CABcZANn-7+kaOPJq1DV2QsjG3qqk_H=Vx8O3W5RN=rsfv+EsRA@mail.gmail.com>
	<1346357591.4396.76.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Aug 2012 14:40:41 -0700
Message-ID: <CAMKF1sqxFh0VSuqoWbzTETD6ttRfwLSTT814O_S7y3DyhvPSXA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] poky-tiny: Enable x86-64 to build eglibc correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 21:53:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 30, 2012 at 1:13 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2012-08-30 at 13:04 -0700, Chris Larson wrote:
>> On Thu, Aug 30, 2012 at 12:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > The libc-libm-big option allows eglibc to correctly configure
>> > itself to include the correct math functions for 64bit operations
>> >
>> > [YOCTO #2943]
>> >
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> I'm curious, is this needed for other 64 bit platforms, e.g. powerpc64?
>
> Also out of curiosity, what's the use-case for 64-bit userspace in a
> "tiny" context?  I would have thought that you'd generally want x32.
>

I guess its for sake of completeness.

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


