Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOtBN-0005Xb-BZ for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 17:06:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOt8U-0002SQ-4Q
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 17:03:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306246595.3424.932.camel@rex>
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
	<1306246595.3424.932.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 16:03:05 +0100
Message-ID: <1306249385.2525.203.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC][PATCH] bitbake.conf: make OVERRIDES match what people expect
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
X-List-Received-Date: Tue, 24 May 2011 15:06:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 15:16 +0100, Richard Purdie wrote:
> I've been thinking through the different use cases and briefly talked
> with Koen offlist about this. I think the revised order makes sense with
> what users would expect and am happy to remove local and fail-fast as
> overrides since we don't have people using them (local is pretty
> weak/useless and fail-fast has only ever been used by gcc recipes
> afaik).

I've certainly found local useful in the past, though admittedly that
might have been in the days when it was the highest rather than lowest
priority OVERRIDE.  You might be right that it isn't a great deal of use
as it stands.

I agree that fail-fast should probably go away, but there is an existing
reference to it in gcc-cross_csl-arm-2008q1.bb and I think the patch
that removes the OVERRIDE should probably address that usage at the same
time.

What's "forcevariable" for?  I don't think we ever had that in oe, and
there don't seem to be any obvious users of it in oe-core either.

p.




