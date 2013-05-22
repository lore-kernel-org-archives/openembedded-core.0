Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC8060657;
	Wed, 22 May 2013 10:14:15 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uf63j-000121-Td; Wed, 22 May 2013 12:14:15 +0200
Message-ID: <1369217654.6695.62.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 22 May 2013 11:14:14 +0100
In-Reply-To: <CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
	<CANyK_8c4t0Oy1p8sktO-rxMfc1CR+-gbkXYH1RzDSTRy6qQORQ@mail.gmail.com>
	<CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Wed, 22 May 2013 10:14:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-22 at 09:47 +0100, Paul Barker wrote:
> I've just sent a patch to the yocto@ list to fix this but it's brought
> up two things:
> 
> 1) In openembedded-core/meta/classes/image.bbclass SPLASH is set with
> '?='. I'm overriding this with '=' in
> meta-raspberrypi/conf/machine/raspberrypi.conf which means it can't be
> overridden further in local.conf. Is this worth changing to '??=' in
> image.bbclass, '?=' in the machine conf so that it can be overridden
> with '=' in local.conf? Is my understanding of the overrides correct
> here?

You can always override it from local.conf using a _forcevariable
override (which used to be named "_local", in fact, but that terminology
turned out to be a bit confusing), or a _MACHINE override of course.  So
I don't think there is any major problem here.  

But, that said, it probably is true that the semantics of ??= are less
surprising for users (since it isn't position-dependent in the way
that ?= is) which might make it a better choice for image.bbclass.

p.


