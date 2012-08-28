Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T6Qtb-0004No-Qe
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 20:52:15 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T6Qhn-0000y3-Ja; Tue, 28 Aug 2012 20:40:03 +0200
Message-ID: <1346179084.4396.6.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 28 Aug 2012 19:38:04 +0100
In-Reply-To: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
References: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] base-files: provide a mechanism to skip creation of the hostname file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 18:52:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-28 at 14:20 -0400, Mark Asselstine wrote:
> +	if [ "${hostname}" != "none" ]; then

This magic string value seems a bit unwholesome.  Can't you just check
against the empty string?

Also, if the problem is that the static hostname set here is overriding
the one from dhcp or the command line, I wonder whether this just
indicates that the priority of them is wrong and the scripting should be
adjusted so that the static file has lower priority than the other two
things.

p.




