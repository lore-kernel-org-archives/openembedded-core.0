Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SwmBb-0003Y5-HU
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 05:34:55 +0200
Received: by qabg1 with SMTP id g1so3784925qab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 20:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DuYHTmNap6Ell3czsFy0E8Wls6fnx9t/eQSPaitGXGc=;
	b=JjNdmFfxTdR8Rq7g+I/02RLWfUZsx++2ref8Hj7W+5tW63pH92rxwOzw2JAiUhTSmZ
	KwA4DMI9bmHht+NJvXm7bel4mjO6yHjuwZvcP5g9w4B1tz3AyhpnHA2w24OARu6B3i3S
	Pe5X3AiR2fYURW2J34PZAAsGlg36HJjXeJD9xoCBz/fsKi6dv89fiKODjFQQpvGZalJj
	q2nZgd36z9ekwIGaz9bZtLLftxpUtptwSswb88hx6QoUFbsGlZARe4QSj0SDfu5OJUBR
	+cp6XOjmkx7IW+g+UdWusVY9nR8jCxucVMjgtLeOYm9I0ZvlFruewz0ERtZOyIWaPkHj
	FQAA==
MIME-Version: 1.0
Received: by 10.229.105.100 with SMTP id s36mr10448950qco.88.1343877796191;
	Wed, 01 Aug 2012 20:23:16 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Wed, 1 Aug 2012 20:23:16 -0700 (PDT)
In-Reply-To: <CAMKF1sqbDEdyAN+z4Y_EFVyt_ZF2SsHg-uEWtnjPgu6LGRx8GA@mail.gmail.com>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
	<15363b249e50ef40bad737d3a6c2a1c28d3a2dc9.1343325569.git.bruce.ashfield@windriver.com>
	<50131892.6020708@linux.intel.com>
	<648B08DC-9D46-4EEF-AAAA-C1DA84D9AB42@gmail.com>
	<CADkTA4O-u+S=2H9iZ9FxoX6mUfifvRO+Y4_HY9bDfBSwfg7c=Q@mail.gmail.com>
	<CAMKF1sqbDEdyAN+z4Y_EFVyt_ZF2SsHg-uEWtnjPgu6LGRx8GA@mail.gmail.com>
Date: Wed, 1 Aug 2012 23:23:16 -0400
Message-ID: <CADkTA4O2QdhErXmLW8Q27-3SZ2O2DHL8kaSR1EB9N6D6kZ9Dxg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Thu, 02 Aug 2012 03:34:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 1, 2012 at 11:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Aug 1, 2012 at 7:58 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> On Wed, Aug 1, 2012 at 7:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Jul 27, 2012, at 3:39 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>>
>>>>> kernel.bbclass is a common class for many different kernel versions,
>>>>> and as such the default module_autoload and module_conf values that
>>>>> it contains are not relevant, or out of date for most builds.
>>>>>
>>>>> Individual kernel recipes or distros can better specify these
>>>>> values to meet their needs.
>>>>>
>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>
>>>> This makes sense to me. None of the below are likely to prevent boot and
>>>> seem to be more along the lines of MACHINE policy.
>>>>
>>>
>>> This needs some soak time. For folks who are unknowingly depending on this.
>>
>> Is there a good place to stage this to get more eyes on it ? I'm willing to help
>> make sure no one is broken, but I'm @ 6 days and got a few comments, but
>> nothing much .. so if we can do more, I'm all ears!
>>
>
> Well I fixed my case :)

Ha! You should have just said that (I'm dense at times) :P So it's
working as designed, let it soak!

Cheers,

Bruce

>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


