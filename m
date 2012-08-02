Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Swlnj-000390-1q
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 05:10:15 +0200
Received: by qcad10 with SMTP id d10so4786015qca.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 19:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RYIAxUvQ+u/cndFPk4+mK06sMiZ7Z+AklUjTTjeGxDE=;
	b=G0d/5VGHW52mwOM2Aw5EA+8YHrTl+6udDXcXeBgfHjwZontAJqY98Q84CZMwArcrqZ
	aGkoaGSbkETWsreJK1Y9H1giqeWksYktiH2u1M6jGYM6eatcYSKfHFH7LKUyP4UM08bo
	5VvdOxAsb/0wlKaLrdKwNmTvHVJap1iMjpLC2VgpSAXxlTZQbhWhlyzArODTybCQQvvZ
	usHXSr3V0aJemd50EpGL/gasbwbH3RugLWJZsIkscKWbXi62Rk3FQ4G/OxbZYXezrh5j
	bPlJi799JHbBVt43rQCNIJcAwnMCt5AYWDMpapT5sHIDoiOdYRDoGr+wGHqW6AizUQpL
	KWFw==
MIME-Version: 1.0
Received: by 10.224.188.12 with SMTP id cy12mr38008710qab.68.1343876315559;
	Wed, 01 Aug 2012 19:58:35 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Wed, 1 Aug 2012 19:58:35 -0700 (PDT)
In-Reply-To: <648B08DC-9D46-4EEF-AAAA-C1DA84D9AB42@gmail.com>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
	<15363b249e50ef40bad737d3a6c2a1c28d3a2dc9.1343325569.git.bruce.ashfield@windriver.com>
	<50131892.6020708@linux.intel.com>
	<648B08DC-9D46-4EEF-AAAA-C1DA84D9AB42@gmail.com>
Date: Wed, 1 Aug 2012 22:58:35 -0400
Message-ID: <CADkTA4O-u+S=2H9iZ9FxoX6mUfifvRO+Y4_HY9bDfBSwfg7c=Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Aug 2012 03:10:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 1, 2012 at 7:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Jul 27, 2012, at 3:39 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>>> kernel.bbclass is a common class for many different kernel versions,
>>> and as such the default module_autoload and module_conf values that
>>> it contains are not relevant, or out of date for most builds.
>>>
>>> Individual kernel recipes or distros can better specify these
>>> values to meet their needs.
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>> This makes sense to me. None of the below are likely to prevent boot and
>> seem to be more along the lines of MACHINE policy.
>>
>
> This needs some soak time. For folks who are unknowingly depending on this.

Is there a good place to stage this to get more eyes on it ? I'm willing to help
make sure no one is broken, but I'm @ 6 days and got a few comments, but
nothing much .. so if we can do more, I'm all ears!

Cheers,

Bruce

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


