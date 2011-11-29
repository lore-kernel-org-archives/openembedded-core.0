Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RVPd9-0007cd-Th
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 16:29:59 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RVPWk-0001cq-Ts; Tue, 29 Nov 2011 16:23:23 +0100
From: Phil Blundell <philb@gnu.org>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 15:23:22 +0000
In-Reply-To: <4ED4E793.2080605@emagii.com>
References: <4ED4AFF4.8020506@emagii.com>
	<1322564887.26081.131.camel@phil-desktop> <4ED4E793.2080605@emagii.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322580202.26081.148.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Whitespace not allowed in COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 29 Nov 2011 15:30:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 15:09 +0100, Ulf Samuelsson wrote:
> Its pretty clear, but this assumes that you are aware of the file itself.
> Have just started looking into openembedded-core, so I didnt even know 
> the file existed.
> Is this file mentioned anywhere?

Hm, good question.  I think the primary use of documentation.conf is for
bitdoc but, given that the copy of bitdoc in oe-core is sufficiently
bitrotten that it doesn't currently run at all, I suspect not many
people are using it.  I'm not sure if there are any other links to that
config file.

> Is there a reason to use a regular expression?
> Why not a list of compatible machines?

A regular expression can always represent a list (via the A|B|C
notation) and it allows you to have more complex/concise expressions as
well.

> If I want to split into several lines, then I guess an ugly hack would be.
> COMPATIBLE_MACHINE     = 
> "at91sam9260ek|at91sam9xeek|at91sam9g20ek|at91sam9g20ek_2mmc|            
>                 XX1"
> COMPATIBLE_MACHINE    += "|at91sam9261ek|at91sam9g10ek|                

You can use ".=" to avoid that issue.

p.




