Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWohe-0004Vb-0D
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 13:56:10 +0200
Received: by wwb17 with SMTP id 17so311132wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 04:52:43 -0700 (PDT)
Received: by 10.216.61.135 with SMTP id w7mr2087634wec.19.1308138763550;
	Wed, 15 Jun 2011 04:52:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id e1sm289660wbh.22.2011.06.15.04.52.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 04:52:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308137782.15712.415.camel@rex>
Date: Wed, 15 Jun 2011 13:52:40 +0200
Message-Id: <4E5331E5-260E-468A-A1C8-9FF132CF85F8@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<1308132426.15712.387.camel@rex>
	<9B8FDB01-CFAA-497E-BD0E-93D421E6C4F8@dominion.thruhere.net>
	<1308133322.15712.395.camel@rex>
	<0566033F-1AB8-4E16-A064-A3EB3A5CA143@dominion.thruhere.net>
	<1308137782.15712.415.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Wed, 15 Jun 2011 11:56:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 15 jun 2011, om 13:36 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-06-15 at 12:37 +0200, Koen Kooi wrote:
>> Op 15 jun 2011, om 12:22 heeft Richard Purdie het volgende geschreven:
>> 
>>> On Wed, 2011-06-15 at 12:15 +0200, Koen Kooi wrote:
>>>> Op 15 jun 2011, om 12:07 heeft Richard Purdie het volgende geschreven:
>>> I know, but we have two choices:
>>> 
>>> a) Continue this spiral of confusing variable names, conflict and wacky 
>>>  bugs
>>> 
>>> b) Come up with a plan to address it and roll it out
>>> 
>>> I'm favouring b), particularly since this would help several different
>>> architectures with a variety of issues. If we need to better document
>>> that and have a process fine, but that is not a good argument for not
>>> doing it at all.
>> 
>> I agree on that, put previous efforts in the yocto universe were
>> rushed through (like the machine-name -> machine_name change I keep
>> going on about), so I have a knee jerk reaction to such things
>> nowadays. For various reasons yocto and later oe-core have not been
>> friendly to distros having package feeds out there. Sometimes the
>> changes made things better, but they were still painfull. It seems to
>> be getting better nowadays, which is good, but everyone still needs to
>> be carefull. Pet peeve: missing PR bumps.
> 
> Well, I think everyone is trying to improve, trying to do better and
> hopefully we are learning from any mistakes made.
> 
>> What I need for angstrom is a variable that:For 
>> 
>> 1) *never* changes its value
> 
> As I've mentioned several times, I think it is reasonable to allarch to
> clear or otherwise invalidate such a variable. That is a very special
> case though and setting it to "all" was perhaps a poor choice of value.

>> 2) holds the base arch (armv7a, ppc603e, etc)
> 
> Sounds like BASE_PACKAGE_ARCH
> 
>> 3) Is set in *all* the tune include files
> 
> Again sounds like BASE_PACKAGE_ARCH. Can it not default to TARGET_ARCH?

Defaulting to TARGET_ARCH would break 4)

> Grepping the tune files in OE-Core we seem to be pretty good about this
> right now.

In OE-core yes, not sure about the other layers.

>> 4) must be set to complete parsing when MACHINE is set
> 
> I suspect this doesn't give as much value as you'd think but I'm
> indifferent.

It's an early warning system :)


