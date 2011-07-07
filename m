Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QeiWw-00040x-0d
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 08:57:46 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Thu, 7 Jul 2011
	08:52:33 +0200
From: Anders Darander <anders@chargestorm.se>
Organization: ChargeStorm AB
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jul 2011 08:52:36 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.39-2-amd64; KDE/4.6.4; x86_64; ; )
References: <1309453832.7987.33.camel@desktop.home>
	<57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
	<4E14A132.9090003@mentor.com>
In-Reply-To: <4E14A132.9090003@mentor.com>
MIME-Version: 1.0
Message-ID: <201107070852.37034.anders@chargestorm.se>
X-GFI-SMTP-Submission: 1
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Thu, 07 Jul 2011 06:57:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


* Tom Rini Tom Rini <tom_rini@mentor.com> [07/06/11 07:53 PM]:
> On 07/01/2011 02:41 AM, Koen Kooi wrote:
> > Op 1 jul 2011, om 11:26 heeft Frans Meulenbroeks het volgende geschreven:
> >> 2011/7/1 Koen Kooi <koen@dominion.thruhere.net>
> >> 
> >> Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende geschreven:
> >>> Good idea.
> >>> Personally I'd like to also bring footprint into the equation. If a
> >>> feature drags in lots of additional packages, it is interesting to
> >>> make it configurable. My favourite example: bluez dragging in all kind
> >>> of rendering stuff (through DEPENDS) even though the hardware
> >>> functionality might not be there (e.g. you have BT but not audio).
> >> 
> >> Which is a great example, since that doesn't impact footprint at all,
> >> it's an alsa *plugin* that will get produced.
> >> 
> >> 
> >> bluez.inc:DEPENDS = "gstreamer gst-plugins-base dbus glib-2.0"
> >> 
> >> I don't think gstreamer is really needed or desired if you e.g. just
> >> want to do some tethering over bluetooth, or in my case, connect to a
> >> BT HID, and they do contribute to both the build time and the
> >> footprint.
> > 
> > Again, a plugin, so no footprint issues.
> 
> I disagree.  I care about the footprint of sstate/packaged-staging
> files.  And build time is still a concern without
> sstate/packaged-staging being used/found.

I agree with Tom. 

While I understand the concerns of others, that more configurability in 
building packages makes it harder to test and support oe-core, and in the end 
yocto, I still like to see more granularity when it comes to building. Sure, 
disk space is mostly cheap and we often have powerfull computers to build on, 
but having the ability to reduce build time and space is still something that 
I'd like to see. It's not that fun if a complete rebuild of a system takes 
half a day or a day to complete, when it easily could have build in 2 hours if 
less "unneeded" stuff was being built.

(Yes, for my embedded systems, I often consider everything related to sound, 
graphics etc as unneeded. I'm not advocating removing anything litek that, as 
it definitely is usefull; but I'd like an easy way to disable things like 
that).

Cheers,
Anders




