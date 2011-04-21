Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QCyAk-0006YS-2b
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:00:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Apr 2011 10:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,252,1301900400"; d="scan'208";a="682068377"
Received: from unknown (HELO [10.255.13.58]) ([10.255.13.58])
	by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2011 10:57:44 -0700
Message-ID: <4DB07017.80503@linux.intel.com>
Date: Thu, 21 Apr 2011 10:57:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>	<201104211605.28351.paul.eggleton@linux.intel.com>	<1303404025.9960.6.camel@vorpal>
	<6252772B-4D5D-4E5D-BCD5-1A53C1D25AFA@dominion.thruhere.net>
In-Reply-To: <6252772B-4D5D-4E5D-BCD5-1A53C1D25AFA@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] Working toward a GNOME layer
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
X-List-Received-Date: Thu, 21 Apr 2011 18:00:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2011 10:29 AM, Koen Kooi wrote:
>
> Op 21 apr 2011, om 18:40 heeft Joshua Lock het volgende geschreven:
>
>> On Thu, 2011-04-21 at 16:05 +0100, Paul Eggleton wrote:
>>> On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
>>>> and possibly more. I would like to create a meta-gnome layer in the
>>>> meta-openembedded repository where new recipes get added and things from
>>>> meta-demoapps can get moved over into. Long term recipes-gnome in oe-core
>>>> should move there as well.
>>>>
>>>> What are your thoughts on this?
>>
>> +1
>>
>>>
>>>  From my perspective this sounds like a great idea. The only question would be
>>> how much of the "GNOME" libs would remain in oe-core as some of them are quite
>>> widely used outside of GNOME proper; however that can easily be worked out as
>>> these things mature.
>>
>> +1
>>
>> My personal opinion would be that we start with glib&  gtk+ (plus their
>> dependencies, i.e. pango, atk, etc) in core and move the rest out to a
>> layer.
>>
>> I feel that Gtk+ is used by enough non-gnome software that it belongs in
>> core but others may disagree?
>>
I agree with Joshua here, I think that we need to keep some amount of 
core gnome libraries in oe-core.

>> Between meta/recipes-gnome and meta-demoapps we have a reasonable start
>> to a meta-gnome/
>
> Where did meta-demoapps go? It's not in OE-core anymore by the looks of it.
>
Still there for me.

>> I'd be happy to help with this layer.
>
> Awesome, do you have any objection to put meta-gnome into the meta-openembedded repo for the time being? Once we get better tooling we can move it elsewhere, of course.
>
Why not on git.yoctoproject.org? We already have the start of various 
meta-* layers there?

Sau!


> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


