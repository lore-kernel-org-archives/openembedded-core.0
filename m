Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-09.prod.phx3.secureserver.net
	(p3plsmtpa06-09.prod.phx3.secureserver.net [173.201.192.110])
	by mail.openembedded.org (Postfix) with ESMTP id 018CA72A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 21:21:25 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa06-09.prod.phx3.secureserver.net with 
	id ClMR1q00T0BVjqb01lMSby; Mon, 06 Apr 2015 14:21:26 -0700
Message-ID: <5522F8D7.3050007@pabigot.com>
Date: Mon, 06 Apr 2015 16:21:27 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1428070227.git.cristian.iorga@intel.com>	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Apr 2015 21:21:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/06/2015 09:32 AM, Iorga, Cristian wrote:
> Well,
>
> 1. Peter, Otavio: There is not a single doubt about moving to BlueZ 5 as default in 1.9;
> 2. The requested feedback was about the actual implementation;
> 3. Peter: " I do think it's a bit abrupt to make it the default in the first stable release that provides a usable bluez5."; The change is intended for 1.9,the release that will come in October 2015. Do you think that it is still abrupt? BlueZ5 is present in YP as an alternative BT stack from 1.7, it will still be a fully supported alternative in the (unreleased) 1.8 (as far as upstream goes as "fully supported", of course), it will the default BT stack in 1.9 (coming October 2015), while BlueZ 4 will still be supported as an obsolete, but still functional alternative; for 2.0 (why 1.10??), if that will be the name, all mechanisms for having BlueZ alternatives will be removed, and BlueZ 5 will be the only official supported BT stack. That's more than two years for a transition, is that too soon??

Sorry; I got confused about which numbers were which and where things 
are in the release cycle.  I didn't consider bluez5 to be generally 
usable until the patches that were merged in February for what will be 
1.8.  Since both bluez4 and bluez5 will be available in 1.8, making the 
default bluez5 in 1.9 is fine, and removing bluez4 in what follows is 
fine.  (I have no idea what version is intended to follow 1.9, but if it 
isn't some huge backwards-incompatible change I would expect it to be 
1.10 rather than 2.0.  That's just from the way I normally manage 
versioning myself.)

I have no objections to the technical approach in the patch (it's 
consistent with what I had in mind when I created that bbclass) but I'm 
not familiar with how DISTRO_FEATURES_BACKFILL is supposed to work so 
abstain from further comment.

Peter

>
> /Cristian
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
> Sent: Monday, April 6, 2015 4:18 PM
> To: Peter A. Bigot
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
>
> On Mon, Apr 6, 2015 at 9:57 AM, Peter A. Bigot <pab@pabigot.com> wrote:
>> On 04/06/2015 02:31 AM, Iorga, Cristian wrote:
>>
>> I thought of 1.9 as the preparatory stage for complete removal of
>> bluez4, so that in 2.0 it would be very easy to remove the support for bluez4.
>> Continuing to have bluez5 added to DISTRO_FEATURES create the
>> impression that BlueZ5 is still a second class citizen compared to
>> BlueZ4, and it is not my intention to sustain this opinion via code.
>>
>> I hereby standup for my solution. At the moment, we are 1to1. “We
>> think” – Who are the others persons, Ross?
>>
>> /Cristian
>>
>>
>> While I fully support moving to bluez5 and use it in all my images, I
>> do think it's a bit abrupt to make it the default in the first stable
>> release that provides a usable bluez5.  On the other hand, Yocto's
>> late to the
>> bluez5 party and it's going to be harder to support bluez4 now.
>>
>> Six of one; sign me up as weak support for delaying the move to
>> default
>> bluez5 until 1.10.
>>
>> Just an opinion.
> I prefer bluez5 default in 1.9 and removal in 2.0 (or 1.10). We shouldn't be support legacy without a very strong reason and if any member shows up to officially support bluez4 for longer we may drop its removal but bluez5 default should be done as soon as possible so we iron out regressions.
>


