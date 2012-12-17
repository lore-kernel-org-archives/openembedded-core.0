Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tkcji-0003Bk-RN
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 16:36:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBHFLTMK026830
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 07:21:30 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 17 Dec 2012 07:21:28 -0800
Message-ID: <50CF3879.2070809@windriver.com>
Date: Mon, 17 Dec 2012 09:21:29 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1212160555200.745@oneiric>
	<CAGfZjq49PpLifX4aRAJ1gq7L8mm45Wqm3w+3wRYRS6_QqMsfcA@mail.gmail.com>
	<20121217075238.GA4305@mi.fu-berlin.de>
In-Reply-To: <20121217075238.GA4305@mi.fu-berlin.de>
Subject: Re: sprinkled references to "powerpc" vs "ppc" in adt-installer
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
X-List-Received-Date: Mon, 17 Dec 2012 15:36:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/12 1:52 AM, Henning Heinold wrote:
> On Sun, Dec 16, 2012 at 04:11:15PM -0500, Bill Traynor wrote:
>> On Dec 16, 2012 5:57 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>>>
>>>
>>>    perusing adt-installer recipe and files and i notice there are a few
>>> mentions of "powerpc" whereas it seems that "ppc" is the correct
>>> architecture abbreviation.  obviously doesn't hurt anything but it
>>> might be confusing for people reading the source.
>>
>> Isn't the architecture just called Power now?
>
> Nope, POWER is the midiron architecture from IBM, where POWERPC is a subset of POWER.

 From power.org:

> What is happening to the PowerPC wordmark and logo?
> The PowerPC wordmark, as referencing the PowerPC instruction set architecture (ISA) and products based on that ISA, will continue to exist. However, we encourage everyone to use the new Power Architecture trademark and the new logos to help establish a more consistent voice in the marketplace for the Power Architecture platform.

In otherwords when talking about the overall architecture platform "Power" is 
correct.  When referring to the specific (older) PowerPC ISA, PowerPC is acceptable.

The way I've done it is, depending on usage, either refer to it as "Power" (i.a. 
ia32, MIPS, ARM) when discussing the 'architecture family'.  (The FAQ item above 
seems to indicate 'Power' is the right term.)  "PowerPC" is still used when 
talking about older processors...

"powerpc" when talking about the GNU architecture, and 'ppc' when abreviating 
the GNU architecture (such as a package arch, CPU tuning, etc.)  Much of it is 
historical so you should see all three (or four) terms used through the 
documentation when discussing different parts.

--Mark

> Bye Henning.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



