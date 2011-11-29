Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RVLe8-000749-MI
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 12:14:44 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RVLXj-0001Q0-Tq; Tue, 29 Nov 2011 12:08:08 +0100
From: Phil Blundell <philb@gnu.org>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 11:08:06 +0000
In-Reply-To: <4ED4AFF4.8020506@emagii.com>
References: <4ED4AFF4.8020506@emagii.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322564887.26081.131.camel@phil-desktop>
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
X-List-Received-Date: Tue, 29 Nov 2011 11:14:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 11:12 +0100, Ulf Samuelsson wrote:
> Have had a lot of problems trying to get a recipe running.
> I finally discovered that "COMPATIBLE_MACHINE" is sensitive to whitespace.
>This is a real PITA expecially since COMPATIBLE_MACHINE is yet to be
>documented in the manual

Indeed, it's a regular expression.  This is mentioned in
documentation.conf:

COMPATIBLE_MACHINE[doc] = "A regular expression which matches the
MACHINES support by the package/file. Failure to match will cause the
file to be skipped by the parser."

If you think the description can be improved then I'm sure patches would
be welcome.

>Working:
>COMPATIBLE_MACHINE = "machine1"
>COMPATIBLE_MACHINE = "machine1|machine2"
>COMPATIBLE_MACHINE = "(machine1)"
>COMPATIBLE_MACHINE = "(machine1|machine2)"
>
>COMPATIBLE_MACHINE = "machine1"
>COMPATIBLE_MACHINE += "|machine2"

I'm slightly surprised that this last example would work.  It ought to
be equivalent to...

>COMPATIBLE_MACHINE = "machine1 |machine2"

p.




