Received: from emagii.com ([213.180.93.183] helo=www.emagii.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1Rv3z7-0004vc-Bz
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 10:38:41 +0100
Received: from www.emagii.com (localhost.localdomain [127.0.0.1])
	by www.emagii.com (Postfix) with ESMTP id 386CC28C00E6;
	Wed,  8 Feb 2012 10:21:24 +0100 (CET)
Received: from [10.175.196.243]
	(c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se [83.227.57.213])
	by www.emagii.com (Postfix) with ESMTPSA;
	Wed,  8 Feb 2012 10:21:24 +0100 (CET)
Message-ID: <4F323E94.2040307@emagii.com>
Date: Wed, 08 Feb 2012 10:21:24 +0100
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111109 Thunderbird/3.1.16
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4F25501F.9000606@emagii.com>
	<CAMKF1so1dzbo3_YN-pJqn-axFAUazqkdKgFU+CUh3dSbWgYF2Q@mail.gmail.com>
	<4F26678A.1050803@gherzan.ro> <4F310EEE.80905@emagii.com>
	<20120207224006.GA13125@sakrah.homelinux.org>
In-Reply-To: <20120207224006.GA13125@sakrah.homelinux.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake -c clean <package> fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 08 Feb 2012 09:38:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-07 23:40, Khem Raj wrote:
>>> Clean it's just a "clean". As in "make clean". So after a clean
>>> you will typically have configure, compile etc.
>>> "cleanall" = remove unpacked + remove source. So after a clean you
>>> will tipically have fetch.
>> I have tried clean, cleansstate and cleanall.
>> All of them remove the source directory.
> if you are talking about ${S} then yes but relevant content in ${DL_DIR} are only removed
> with cleanall
>

Yes, when I work on the kernel, I do not want to restart from unpack.
I would like to edit the existing ${S}and then restart a compile.
Once the compile succeeds, I want to deploy.
Once the kernel does what it is supposed to, I generate a patch
which is then added to the recipe.

At that time, I want to cleansstate and rebuild/retest.
To come around this problem right now, my kernel recipe generates a script
in ${S}, which will compile the kernel image and then copies it directly
to my tftp directory.

>> If I try to use XorA's method of testing out the kernel
>> http://www.xora.org.uk/2009/12/10/openembeddedangstrom-kernel-workflow/
>> then it fails since a recompile of the source will fail to update
>> dependencies.
>> If i bitbake -c compile virtual/kernel -f a
>> and then
>> bitbake virtual/kernel
>> then the previous build will be used.
>>
>> Is it at all possible now to recompile, without having to clean out
>> everything,
>> and start from scratch?
>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



