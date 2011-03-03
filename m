Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Puwtg-00014H-2K
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 02:00:04 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PuwsF-0007Os-Fn from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 16:58:35 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 16:58:35 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 2 Mar 2011 16:58:35 -0800
Message-ID: <4D6EE7A6.20603@mentor.com>
Date: Wed, 2 Mar 2011 17:58:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4D6E7EB1.5080602@windriver.com>
	<1299088802.26736.10715.camel@rex>	<BED5DD21-1E73-4DB2-9E29-17E70DF7344C@dominion.thruhere.net>
	<1299093521.26736.10877.camel@rex>
In-Reply-To: <1299093521.26736.10877.camel@rex>
X-OriginalArrivalTime: 03 Mar 2011 00:58:35.0323 (UTC)
	FILETIME=[1FB338B0:01CBD93E]
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 01:00:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2011 12:18 PM, Richard Purdie wrote:
> On Wed, 2011-03-02 at 19:27 +0100, Koen Kooi wrote:
>> Op 2 mrt 2011, om 19:00 heeft Richard Purdie het volgende geschreven:
>>
>>> Thanks for starting this thread Mark, I've also just been looking at
>>> this question so its timely.
>>>
>>> On Wed, 2011-03-02 at 11:30 -0600, Mark Hatle wrote:
>>>> I finally got a chance to look at the oe-core and where it currently is..  Some
>>>> suggestions below:
>>>>
>>>> LICENSE file, this may need to be cleaned up to only cover the components
>>>> actually in the oe-core.
>>>>
>>>> README likely needs some revision
>>>>
>>>> README.hardware needs a lot of revision.  Anything outside of support for QEMU
>>>> should be removed.
>>>>
>>>> The meta-demoapps and meta-rt components, will those be staying or going?
>>>>
>>>> The meta/recipes.txt needs to be verified as still what we want -- I assume it
>>>> is at this point..
>>>>
>>>> meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?
>>>>
>>>> Do the items in the "scripts" need to be renamed or is Poky being kept in the
>>>> naming?  Same with the poky-init-build-env?
>>>>
>>>> Then I also assume the items in the documentation directory need to be cleaned
>>>> up as well...
>>>>
>>>> Let me know what you'd like me to try and tackle -- or if we need to bring these
>>>> items up at the TSC for recommendation.
>>>
>>> I'm proposing this change so far:
>>>
>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/roorg&id=891ad22536b49d4fee066a5865ad730f791d36e9
>>>
>>> with those relocated files being removed from oe-core. Any objections to
>>> that to start with?
>>
>> Why not put the recipes in meta-oe? I have need for e.g eds-dbus and would like to have that in meta-oe.
>
> Which pieces are we talking about? Does oe-core want sato? Should some
> of these go to meta-gnome and is that what we want? Or do we want all of
> sato there?
>
> I was under the impression sato might not be wanted but I'm open to
> influence either way on that. Certainly there are some pieces "we" as in
> Yocto put into recipe-sato that could arguably be positioned elsewhere.
>
> Are you also concerned about meta-demoapps or is that fine?

To me, sato should be however poky wants to deal with it.  But a lot of 
the deps are common gnome things and so forth that others care about too 
and we should try for meta-oe.  Again, to me, this is how we can 
reconcile the bits that poky has better than oe.dev (and vice versa) so 
both parties win.

-- 
Tom Rini
Mentor Graphics Corporation


