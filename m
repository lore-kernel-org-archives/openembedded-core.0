Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNo0b-0004Fo-U9
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 16:54:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Nov 2011 07:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72432760"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by orsmga001.jf.intel.com with ESMTP; 08 Nov 2011 07:48:30 -0800
Message-ID: <4EB94F4E.1040102@linux.intel.com>
Date: Tue, 08 Nov 2011 07:48:30 -0800
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
X-List-Received-Date: Tue, 08 Nov 2011 15:54:46 -0000
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
>
Yes to maintaining the version number, but not sure we want to keep 1.6 
around, also do you need to add a similar .bbappend for clutter-1.8 for 
the meta-yocto atom-pc configuration?

Sau!

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


