Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYRI3-000693-4r
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 00:52:43 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 46369CDFC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 00:45:54 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj8hALr5305T4zgTPGdsb2JhbAAMN6puAQEBATeCJAEBAQECAQEBATU2ChELGAkWDwkDAgECARUBGxQTBgIBAYgDCLZpg3SEKIMYBJJHgiSSJA
X-IronPort-AV: E=Sophos;i="4.71,316,1320620400"; 
   d="scan'208";a="9822952"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 08 Dec 2011 00:45:53 +0100
Message-ID: <4EDFFAB3.6070603@emagii.com>
Date: Thu, 08 Dec 2011 00:45:55 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED0CC76.4040606@emagii.com>
	<1322579029.7964.0.camel@ted>	<4ED54C2B.2060505@emagii.com>
	<4ED66835.3050400@intel.com>	<4ED793E2.5070205@emagii.com>
	<4EDA80A2.5070303@emagii.com>	<20111204112019.GB4871@rhein.zuhause.netz>	<1322998509.25960.55.camel@ted>
	<20111207225108.GB7003@sakrah.homelinux.org>
In-Reply-To: <20111207225108.GB7003@sakrah.homelinux.org>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Wed, 07 Dec 2011 23:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-07 23:51, Khem Raj wrote:
> On (04/12/11 11:35), Richard Purdie wrote:
>> On Sun, 2011-12-04 at 12:20 +0100, Henning Heinold wrote:
>>> On Sat, Dec 03, 2011 at 09:03:46PM +0100, Ulf Samuelsson wrote:
>>>> Have made some further tests with the same machine, but now running
>>>> Ubuntu 11.04 x64
>>>>
>>>> bitbake console-image
>>>>
>>>>      PARALLEL_TASKS        BB_NUMBER_TASKS        BUILD TIME
>>>>      2                                  2
>>>> 1:24:16
>>>>      4                                  4
>>>> 0:48:22
>>>>      6                                  6
>>>> 0:45:00
>>>>      24                                24
>>>> C++ compiler fails with --sysroot problem
>>>>          after ~2200 out of 2400 tasks.
>>>>
>>>>
>>>>
>>>> BR
>>>> Ulf
>>> Hi Ulf,
>>>
>>> can you try the attached patch if it solves the problem?
> Does this really fix the problem.

It  apparently fixes the symptoms at least (but I didn't do many tests.
On the other hand, the performance improvement seems minimal
once your past 6-8, even on a hexa core machine.

>> Can someone please explain to me how this would fix the problem?
>>
>> If this were the issue shouldn't it either always work or always fail?
>>
>> I'm worried that even if this does "fix" the problem, there is a deeper
>> issue lurking somewhere :(
> We use --with-local-prefix and then also --with-gxx-include-dir which
> points to /usr/include/c++
>
> Now the documentation says that --with-gxx-include-dir is an absolute
> path but if sysroot gets prepended to it or not I am not clear yet
> if sysroot gets prepended to it then we should be in safe spot
>
>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



