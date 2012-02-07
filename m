Received: from smtp-out11.han.skanova.net ([195.67.226.200])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1Rujda-0002qm-S7
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 12:55:06 +0100
Received: from [10.175.196.237] (83.227.57.213) by smtp-out11.han.skanova.net
	(8.5.133) (authenticated as ulf_samuelsson@telia.com)
	id 4EFC3D3500E5A527 for openembedded-core@lists.openembedded.org;
	Tue, 7 Feb 2012 12:45:52 +0100
Message-ID: <4F310EEE.80905@emagii.com>
Date: Tue, 07 Feb 2012 12:45:50 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F25501F.9000606@emagii.com>	<CAMKF1so1dzbo3_YN-pJqn-axFAUazqkdKgFU+CUh3dSbWgYF2Q@mail.gmail.com>
	<4F26678A.1050803@gherzan.ro>
In-Reply-To: <4F26678A.1050803@gherzan.ro>
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
X-List-Received-Date: Tue, 07 Feb 2012 11:55:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2012-01-30 10:48, Andrei Gherzan skrev:
> On 01/29/2012 07:35 PM, Khem Raj wrote:
>> On Sun, Jan 29, 2012 at 5:56 AM, Ulf Samuelsson
>> <openembedded-core@emagii.com>  wrote:
>>> First I attempted to just remove the source tarball from the downloads
>>> directory.
>>> No download, but build completed.
>> if you want a fresh fetch.
>> you can just do bitbake -ccleanall module-init-tools
>> that will remove the sstate as well as the sources
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> Clean it's just a "clean". As in "make clean". So after a clean you 
> will typically have configure, compile etc.
> "cleanall" = remove unpacked + remove source. So after a clean you 
> will tipically have fetch.
I have tried clean, cleansstate and cleanall.
All of them remove the source directory.

If I try to use XorA's method of testing out the kernel
http://www.xora.org.uk/2009/12/10/openembeddedangstrom-kernel-workflow/
then it fails since a recompile of the source will fail to update 
dependencies.
If i bitbake -c compile virtual/kernel -f a
and then
bitbake virtual/kernel
then the previous build will be used.

Is it at all possible now to recompile, without having to clean out 
everything,
and start from scratch?

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



