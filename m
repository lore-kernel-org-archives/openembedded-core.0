Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm5cX-0002l2-VS
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:02:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm5YP-00029r-Sa
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:57:45 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 15:57:45 +0100
In-Reply-To: <4E30256F.7060503@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
	<CA4DDB0D-23FC-449D-B5CF-66C230471794@dominion.thruhere.net>
	<4E30256F.7060503@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311778665.30326.359.camel@phil-desktop>
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
X-List-Received-Date: Wed, 27 Jul 2011 15:02:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 09:49 -0500, Mark Hatle wrote:
> On 7/27/11 9:33 AM, Koen Kooi wrote:
> > As I understand it:
> > 
> > arm1136 doesn't have t2
> > arm1176 does have t2
> > 
> > both are armv6 :)
> 
> They also don't have "thumb" support either.  So armv6 & thumb == t2.

No, that's incorrect.  Both ARM1136 and ARM1176 do have Thumb-1 and, as
I wrote in my last mail, I can't think of any plausible target processor
for OE that has both ARMv6 and Thumb-2.  So, for all current intents and
purposes, (armv6 && thumb) == thumb-1.

p.



