Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RnC34-0005zT-GN
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 17:38:14 +0100
Received: (qmail 12471 invoked by uid 1003); 17 Jan 2012 16:30:36 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	17 Jan 2012 16:30:36 -0000
Message-ID: <4F15A22B.6060004@balister.org>
Date: Tue, 17 Jan 2012 11:30:35 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>	<1326737165.2933.7.camel@ted>	<CAGDS+n=HwjOz-QKMDyGy6qKf74WESsUFR-mCUT1HV+qaOzcCfg@mail.gmail.com>
	<1326739512.3367.32.camel@pb-ThinkPad-R50e>
In-Reply-To: <1326739512.3367.32.camel@pb-ThinkPad-R50e>
X-Enigmail-Version: 1.1.2
Subject: Re: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Tue, 17 Jan 2012 16:38:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/16/2012 01:45 PM, Phil Blundell wrote:
> On Mon, 2012-01-16 at 10:19 -0800, Steve Sakoman wrote:
>> My tested-by was indeed performed with the meta-oe layer enabled.
>>
>> In the future I will make clear what layers were used in my testing.
>>
>> I fear that this kind of thing is going to bite us repeatedly :-(
> 
> It's never been entirely clear to me why meta-oe needs to override quite
> so many bits of oe-core as it does.  I think you're probably right that,
> as long as it continues to do so, and people enable meta-oe during
> testing, this sort of issue probably is going to continue to occur.

It sounds like we need to collect a list of bits of oe-core that meta-oe
overrides and work out a plan to resolve these differences.
This sort of thing creates a lot of confusion for people (like me) that
are primarily concerned with getting work done using OE, and are less
concerned with the inner workings of layers.

Does anyone have suggestions for identifying these cases and explaining
why they are that way?

I see no sense in forcing people to basically fork layers due to
unresolved issues between OE-Core and meta-oe.

Philip

> 
> We had some discussion a while back about making the layer priority be a
> user-configurable thing, which would enable you to sink meta-oe beneath
> oe-core in the priority stack.  This would allow you to use the recipes
> which are in meta-oe but not oe-core, without overriding the bits that
> do exist in oe-core itself.  I think I lost that argument at the time
> but I still feel this would be an improvement.
> 
> (Actually, right now what I am doing is just cherry-picking the few
> recipes that I need from meta-oe into a local layer and not adding
> meta-oe itself to bblayers.conf at all.)
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


