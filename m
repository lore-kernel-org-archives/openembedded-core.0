Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1T3ngH-0004TX-TK
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 14:35:38 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B5EB3F81230; Tue, 21 Aug 2012 06:23:35 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0CFD0F811F3;
	Tue, 21 Aug 2012 06:23:34 -0600 (MDT)
Message-ID: <50337DD2.3040704@mlbassoc.com>
Date: Tue, 21 Aug 2012 06:23:46 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<50337719.7040801@linaro.org>
	<1345550404.2673.23.camel@phil-desktop>
In-Reply-To: <1345550404.2673.23.camel@phil-desktop>
Subject: Re: Toolchain rework, call for testing
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
X-List-Received-Date: Tue, 21 Aug 2012 12:35:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-08-21 06:00, Phil Blundell wrote:
> On Tue, 2012-08-21 at 13:55 +0200, Marcin Juszkiewicz wrote:
>> W dniu 17.08.2012 06:47, Khem Raj pisze:
>>> Hi All
>>>
>>> Recently glibc build has been simplified upstream. It has dropped the
>>> dependency on libgcc_s and libgcc_eh for building glibc itself.
>>> This means that we can simplify our toolchain bootstrap a bit by
>>> dropping 1 of the 3 cross gcc build stages. We do not need
>>> gcc-cross-intermediate anymore.
>>
>> Please adapt also toolchain-layer in meta-oe for those stuck with gcc 4.6.
>
> Why is it that gcc-4.7 doesn't work for those people?

I have troubles with older versions of the Linux kernel on ARM.  Anything
older than 3.2 either doesn't boot or is unstable.  Kernel only, user code
built with 4.7+ seems to be fine.  Since I need to use those older kernels
and I don't have the time/budget to figure out why they don't work with 4.7+,
I'm sticking with 4.6+ for now.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


