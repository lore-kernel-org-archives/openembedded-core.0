Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UbnyQ-0007na-Kf
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 10:19:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2013 01:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,660,1363158000"; d="scan'208";a="240653566"
Received: from unknown (HELO [10.255.12.238]) ([10.255.12.238])
	by AZSMGA002.ch.intel.com with ESMTP; 13 May 2013 01:00:57 -0700
Message-ID: <51909DB8.3060407@linux.intel.com>
Date: Mon, 13 May 2013 11:00:56 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
In-Reply-To: <3529451.hQA8zCVn47@helios>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 08:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2013 10:55 PM, Paul Eggleton wrote:
> On Sunday 12 May 2013 19:54:50 Phil Blundell wrote:
>> On Sun, 2013-05-12 at 08:40 -0700, Saul Wold wrote:
>>> On 05/12/2013 06:27 AM, Otavio Salvador wrote:
>>>> I think so, it'd be good to have it in oe-core and allow use of vpn :)
>>>
>>> I would like to see what the full dependency set looks like for these,
>>> clearly there is the vpnc, openvpn, l2tp and pptp recipes, but what else
>>> and what licenses are they under.
>>
>> I don't think we necessarily want openvpn, l2tpd and suchlike in
>> oe-core.  None of those things seem very "core" to me (in an embedded
>> context) and testing them seems like it would be a bit of a challenge.
>
> I agree, these don't belong in OE-Core. We already have them in meta-
> networking.
>
This is what I get for replying to an email while traveling overseas and 
not being 100% clear about my points.

I was more interested in the dependencies then actually thinking about 
including them in OE-Core,that was not my intent.

This would would allow us to better understand if those recipes not in 
meta-networking could be moved from meta-oe to meta-networking. 
Currently, I think vpnc and pptp are in meta-networking, not the other 2.

>> Equally, we certainly don't want to have dependencies in oe-core
>> pointing to packages in meta-oe or any other layer, since this would
>> make it impossible to test oe-core in isolation.  So I would be inclined
>> to say that the right way to deal with this is for those connman bits to
>> go in a .bbappend which lives in the same layer as the recipes in
>> question.
>
> That doesn't work well for software layers - it is not a good thing for
> various recipes to get rebuilt just because you add meta-oe to your
> configuration for example.
>
> The protocol we've established is to add PACKAGECONFIG options to enable the
> dependencies but have them disabled by default; these can be enabled as
> desired in distro or local configuration when the layer satisfying the
> dependency is also enabled.
>
This is correct and I talked with RP about this to verify, having these 
kind of dependencies use PACKAGECONFIG and being disabled by default in 
OE-Core make sense and is vaild recipe, a Distro or local configuration 
can then enable and require the additional layers whether it's meta-oe 
or meta-networking as needed.

Sau!

> Cheers,
> Paul
>


