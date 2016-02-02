Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8DB6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 20:52:25 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aQhw1-0008H8-DV; Tue, 02 Feb 2016 21:52:25 +0100
Message-ID: <1454446338.7421.45.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Pascal Bach <pascal.bach@siemens.com>
Date: Tue, 02 Feb 2016 20:52:18 +0000
In-Reply-To: <56B0AE88.3090103@siemens.com>
References: <56B0AE88.3090103@siemens.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Tue, 02 Feb 2016 20:52:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-02 at 14:26 +0100, Pascal Bach wrote:
> I'm not sure if the documentation is wrong or if the default set in bitbake.conf is incorrect.
> Maybe somebody can shed some light on this.

FULL_OPTIMIZATION in bitbake.conf did use to match what the
documentation says (or at least, was much closer to it).  It was changed
to the current value by commit 9cb71137 which apparently omitted to
update the documentation. 

As an aside, this commit also added "-pipe" to both FULL_OPTIMIZATION
and DEBUG_OPTIMIZATION, which seems a bit weird since (a) -pipe doesn't
have any effect on the generated code; and (b) if it's going to enabled
for both debug and release builds then it might as well go in ${CC} or
somewhere.  Also, that commit seems to have deliberately turned down the
level of optimisation somewhat in order to facilitate debugging, which
is perhaps not what folks who request FULL_OPTIMIZATION would expect.

But anyway, irrespective of the detailed merits or otherwise of that
patch, I think that updating the documentation to match what the code is
now doing would be a fine idea.

p.



