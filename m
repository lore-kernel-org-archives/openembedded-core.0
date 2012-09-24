Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TG5em-000470-Rg
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:12:52 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TG5SI-0004Kn-FP; Mon, 24 Sep 2012 11:59:58 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Sep 2012 10:59:57 +0100
In-Reply-To: <1348480442.4486.3.camel@ted>
References: <1348467993.4444.252.camel@x121e.pbcl.net>
	<1348476693.10108.221.camel@ted>
	<1348479655.31293.19.camel@phil-desktop>
	<1348480442.4486.3.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348480798.31293.26.camel@phil-desktop>
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Avoid staging the same binaries again and again
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
X-List-Received-Date: Mon, 24 Sep 2012 10:12:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 10:54 +0100, Richard Purdie wrote:
> I'm torn whether its better to be simple or less fragile in this case.
> Or simply do some tests (if ${bindir} != ${sbindir}) and so on.

The tests would get a bit ungainly, since you'd end up with 'if !
[ "${sbindir} = "${bindir}" -o "${sbindir}" = "${base_sbindir}" -o
"${sbindir}" = "${base_sbindir}" ... ]' kind of things.  But yes, that
would certainly work as well.

p.




