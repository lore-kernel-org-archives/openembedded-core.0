Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOtNI-000761-96 for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 17:18:24 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOtKP-0002T6-1Q
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 17:15:25 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306249675.3424.936.camel@rex>
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
	<1306246595.3424.932.camel@rex>
	<1306249385.2525.203.camel@phil-desktop>
	<1306249675.3424.936.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 16:15:23 +0100
Message-ID: <1306250123.2525.205.camel@phil-desktop>
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
X-List-Received-Date: Tue, 24 May 2011 15:18:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 16:07 +0100, Richard Purdie wrote:
> It was added to poky with the intent of doing what "_local" would have
> done before it was broken.
> 
> I think its a little safer than using "local" as the override keyword,
> I'm open to opinion on whether it should be kept but it probably has
> uses.

Ah, I see.  I must admit that I wouldn't have guessed that from the
name.

Maybe we should just delete both _local and _forcevariable from the
default OVERRIDES on the basis that nothing in the metadata (as
distributed) uses either of them.  Anybody who wants to make use of them
from local.conf or whereever can always add them back to OVERRIDES in
the same place.

p.




