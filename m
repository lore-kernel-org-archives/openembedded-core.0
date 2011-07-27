Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm5vo-0003Od-RA
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:21:56 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm5rk-0002Ax-Lt
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:17:44 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 16:17:43 +0100
In-Reply-To: <6F3C6EDF-430E-41D4-978D-C1EB57F2DAFD@dominion.thruhere.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
	<CA4DDB0D-23FC-449D-B5CF-66C230471794@dominion.thruhere.net>
	<4E30256F.7060503@windriver.com>
	<1311778665.30326.359.camel@phil-desktop>
	<332008BD-527C-4D2C-9C39-848D4CB3E74A@dominion.thruhere.net>
	<1311779288.30326.363.camel@phil-desktop>
	<6F3C6EDF-430E-41D4-978D-C1EB57F2DAFD@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311779864.30326.370.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 15:21:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 17:13 +0200, Koen Kooi wrote:
> Op 27 jul. 2011, om 17:08 heeft Phil Blundell het volgende geschreven:
> 
> > On Wed, 2011-07-27 at 17:01 +0200, Koen Kooi wrote:
> >> the s3c6410 is arm1176 which should support T2. Having said that, I'm not  sure if that actually works since T2 was broken in silicon for early cortex a8 revisions.
> > 
> > What makes you think that ARM1176 has T2?  I haven't actually tried
> > executing Thumb-2 on one, but my recollection is definitely that it was
> > Thumb-1 only.
> 
> In this case it's (yes, you may start making fun of me at this point) wikipedia: http://en.wikipedia.org/wiki/ARM#Thumb-2

I couldn't immediately see anything on that page which referred to the
ARM1176 specifically.  There is a slightly vague sentence which talks
about "[o]ther chips in the Cortex and ARM11 series", which I guess
could be construed as "all other chips", but apart from that it doesn't
seem to be saying much about what implementation goes with which ISA.

Anyway, the ARM1176 spec and reference manual are available on the web
and I think this is probably a more reliable source than wikipedia :-)

http://www.arm.com/products/processors/classic/arm11/arm1176.php

p.




