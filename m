Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id A17416B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 13:16:33 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1Uzo4Q-002PN3-4D>; Thu, 18 Jul 2013 15:16:34 +0200
Received: from f052224071.adsl.alicedsl.de ([78.52.224.71]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1Uzo4P-002hbc-UE>; Thu, 18 Jul 2013 15:16:34 +0200
Date: Thu, 18 Jul 2013 15:16:28 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20130718131628.GA28337@mail.zedat.fu-berlin.de>
References: <cover.1374050133.git.sen.zhang@windriver.com>
	<c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
	<1374057911.2651.118.camel@phil-desktop.brightsign>
	<CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
	<20130717145321.GA24542@mail.zedat.fu-berlin.de>
	<51E7AB55.5060401@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51E7AB55.5060401@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 78.52.224.71
Subject: Re: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Thu, 18 Jul 2013 13:16:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2013 at 04:46:13PM +0800, Jesse Zhang wrote:
> On 07/17/2013 10:53 PM, Henning Heinold wrote:
> > This makes we wonder which software on x86 relies on libatomic-ops anymore?
> > gcc buildins should be good enough now.
> 
> pulseaudio depends on libatomics-ops though I don't know about the
> reasons. The libatomics-ops recipe is actually inside the pulseaudio
> dir.
> 
> jesse

Hm yes, I still feared it.

pulesaudio needed libatomic-ops only for mips architecture. I looked that up a
long time ago. Now with 2.0 release of pulseaudio and newer releases of gcc I believe
libatomic-ops is not needed anymore for pulseaudio.

Bye Henning

