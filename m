Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWFnD-0002z8-Tl for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 00:39:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5DMaBJ5004765
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 23:36:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04419-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 23:36:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5DMa2Hl004759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 23:36:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF68AD4.1020403@mentor.com>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex>  <4DF68AD4.1020403@mentor.com>
Date: Mon, 13 Jun 2011 23:35:43 +0100
Message-ID: <1308004543.15712.297.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Mon, 13 Jun 2011 22:39:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 15:10 -0700, Tom Rini wrote:
> On 06/13/2011 02:30 PM, Richard Purdie wrote:
> > On Mon, 2011-06-13 at 22:36 +0200, Koen Kooi wrote:
> >> Op 13 jun 2011, om 22:28 heeft Saul Wold het volgende geschreven:
> >>
> >>> On 06/13/2011 11:31 AM, Koen Kooi wrote:
> >>>> Hi,
> >>>>
> >>>> Khem was asking if I could reproduce the recent x86 breakage he was seeing[1] and I ran into another bug:
> >>>>
> >>>> koen@dominion:/OE/tentacle/sources/meta-intel$ git blame meta-n450/conf/machine/n450.conf  | grep atom
> >>>> 158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require conf/machine/atom-pc.conf
> >>>>
> >>> meta-yocto seems to be the place you need to look!
> >>>
> >>> I hope that the layering tools can help to detect and inform folks of this like of dependency.
> >>
> >> Isn't meta-yocto supposed to a the integration layer with no new
> >> parts? I can't use meta-yocto since it has conflicting beagleboard
> >> stuff in it, which means that meta-intel is now broken for me as well.
> >> That surely isn't the intended plan?!?!
> > 
> > The plan on public record is that atom-pc moves to meta-intel as soon as
> > the layer tooling comes online and meta-yocto becomes its own repo
> > (which at present its not but its certainly the intent).
> 
> Until then, and even afterwards can we please get some testing of
> non-poky builds done?  I know the autobuilder is full but can't we toss
> a few things onto a personal box and try that a few times a week?

Sure, the more people testing the various combinations the better!

Cheers,

Richard




