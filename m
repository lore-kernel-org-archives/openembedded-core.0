Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQOOo-0007Ak-LS
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 20:10:27 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Nov 2011 11:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,516,1315206000"; d="scan'208";a="90890974"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2011 11:03:51 -0800
Message-ID: <4EC2B797.4010503@linux.intel.com>
Date: Tue, 15 Nov 2011 11:03:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320709417.git.josh@linux.intel.com>
	<1320761883.10843.40.camel@ted>
In-Reply-To: <1320761883.10843.40.camel@ted>
Subject: Re: [PATCH 00/12] Recipe upgrades, fixes and additions
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
X-List-Received-Date: Tue, 15 Nov 2011 19:10:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 06:18 AM, Richard Purdie wrote:
> On Mon, 2011-11-07 at 16:10 -0800, Joshua Lock wrote:
>> All,
>>
>> Here's a series of patches I developed whilst trying to play around with some
>> Clutter based software.
>>
>> The interesting pieces may be:
>> Clutter 1.8 series recipes - do we want/need to keep clutter 1.6 around?
>> Are we OK with continuing to namespace the clutter recipes by clutter
>> version?
>
> Yes, I think this makes sense.

Why do we want to continue the clutter the namespace with version 
numbers?  Was this not for a past issue with mis-matched API/ABI?

If that problem is solved, then next remove that version info.

Sau!

>
>> Gconf - I've pulled in GConf from upstream as the D-Bus backend is maintained
>> there now. For this I pulled in the gnome-related classes from meta-oe as they
>> simplified this recipe and I've been wanting to see them merged for some time.
>
> I had to drop this patch as the gnome classes need a bit more work. I'd
> like to get gconf resolved though.
>
>> Pulseaudio - whilst adding a required build dependency I changed the recipe so
>> that it doesn't require X unless the X11 distro feature is enabled.
>>
>
> So I merged the series apart from the gnome class and gconf pieces.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


