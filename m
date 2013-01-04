Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Tr9YJ-0001wT-M8
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 16:51:25 +0100
Received: (qmail 20793 invoked by uid 1003); 4 Jan 2013 15:36:17 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.164.36)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Jan 2013 15:36:17 -0000
Message-ID: <50E6F6F0.2070502@balister.org>
Date: Fri, 04 Jan 2013 10:36:16 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <50E5D101.9030701@balister.org> <50E5DA36.5090702@windriver.com>
In-Reply-To: <50E5DA36.5090702@windriver.com>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Enabling NEON instructions for fftw
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
X-List-Received-Date: Fri, 04 Jan 2013 15:51:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/03/2013 02:21 PM, Mark Hatle wrote:
> On 1/3/13 12:42 PM, Philip Balister wrote:
>> So, recent versions of fftw have NEON support for the single precision
>> build. In the poast, I just passed --enable-neon to configure or the
>> armv7a case. Now, this is not entirely correct, since some armv7a's lack
>> a NEON coprocessor.
>>
>> Does anyone have a suggestion for how to handle this better? Personally,
>> I think if you want to run fftwf without NEON, you should have your head
>> examined, but I would like to avoid generating packages that SIGILL on
>> people.
> 
> This says to me that either you need a machine specific package, or use
> an alternative architecture for that package.. (that is compatible)..
> then the package can switch neon on/off depending on arch of tuning flags.
> 
> There is an armv7a-neon tuning defined.  This enabled the TUNE_FEATURES
> of 'neon'.  So you should be able to check for that in the fftw recipe,
> and enable the --enable-neon when it's set.  (Using PACKAGECONFIG is
> likely best...)
> 
> Then you can change the DEFAULTTUNE_<recipe> = "armv7-neon" in your
> local.conf.

I really do not want to depend on users putting entries in local.conf to
obtain proper operation on a specific machine. It looks like the neon
tune is already selected for the machine I am building for.

In the end, this boils down to, do we care about supporting machines
with/without NEON from one set of packages by making ones with NEON
machine specific.

For now, I will purse the route of fftwf building with --enable if the
neon tune is available for the machine.

Philip

Philip

Philip

> 
> --Mark
> 
>> Philip
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 


