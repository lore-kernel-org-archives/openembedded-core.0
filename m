Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Swm1X-0003Ld-Ky
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 05:24:31 +0200
Received: by eaad12 with SMTP id d12so802063eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pEZ8D/X1uLWBhIIuvSZKLFtaVxRp23bAH7JcxfGUEOc=;
	b=rej6zXW3Hh2i8fdrtkraZZ4ull3ate+c+N1BMlYalxQABvMUYUyX7sjAbBkum+RHh0
	+ENNEED9NMXfr2O8hMSHQsG23b7nF0u+kCJYS82T2tL838Z6sE7U1rP/9uPBnfoGQx8H
	mwG0mObL36Pi4wAmgZzhvpvz6W3CsI2gt+C9k1InkG4+R1jXHytoSCJgfL/7vlJaaHEo
	79f9xgfse3wr2BDK9Z5eh0526/jjmxjKRI5i2TsRXWW3aohg4z86L7KFkVt7+Gr2N7kE
	AKbcTgOiqQDsJ7rgHF5mRZxMZicr/uj+muCFXhzbdds1piMjuPgXpMYzj6uN1IDF7D7z
	hcsw==
Received: by 10.14.213.137 with SMTP id a9mr3245850eep.38.1343877172677; Wed,
	01 Aug 2012 20:12:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Wed, 1 Aug 2012 20:12:22 -0700 (PDT)
In-Reply-To: <CADkTA4O-u+S=2H9iZ9FxoX6mUfifvRO+Y4_HY9bDfBSwfg7c=Q@mail.gmail.com>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
	<15363b249e50ef40bad737d3a6c2a1c28d3a2dc9.1343325569.git.bruce.ashfield@windriver.com>
	<50131892.6020708@linux.intel.com>
	<648B08DC-9D46-4EEF-AAAA-C1DA84D9AB42@gmail.com>
	<CADkTA4O-u+S=2H9iZ9FxoX6mUfifvRO+Y4_HY9bDfBSwfg7c=Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Aug 2012 20:12:22 -0700
Message-ID: <CAMKF1sqbDEdyAN+z4Y_EFVyt_ZF2SsHg-uEWtnjPgu6LGRx8GA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel.bbclass: remove default module_autoload and module_conf values
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
X-List-Received-Date: Thu, 02 Aug 2012 03:24:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 1, 2012 at 7:58 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Wed, Aug 1, 2012 at 7:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Jul 27, 2012, at 3:39 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>>>> kernel.bbclass is a common class for many different kernel versions,
>>>> and as such the default module_autoload and module_conf values that
>>>> it contains are not relevant, or out of date for most builds.
>>>>
>>>> Individual kernel recipes or distros can better specify these
>>>> values to meet their needs.
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>
>>> This makes sense to me. None of the below are likely to prevent boot and
>>> seem to be more along the lines of MACHINE policy.
>>>
>>
>> This needs some soak time. For folks who are unknowingly depending on this.
>
> Is there a good place to stage this to get more eyes on it ? I'm willing to help
> make sure no one is broken, but I'm @ 6 days and got a few comments, but
> nothing much .. so if we can do more, I'm all ears!
>

Well I fixed my case :)

> Cheers,
>
> Bruce
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


