Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RMI6D-0007qf-V6
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 12:38:18 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RMI0I-0004No-Dh
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 12:32:10 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Nov 2011 11:31:56 +0000
In-Reply-To: <1320400712.1504.29.camel@localhost.localdomain>
References: <1320375012.1504.22.camel@localhost.localdomain>
	<1320400712.1504.29.camel@localhost.localdomain>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1320406330.22985.625.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: about the qemu net interface name
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
X-List-Received-Date: Fri, 04 Nov 2011 11:38:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-04 at 17:58 +0800, Ni Qingliang wrote:
> I have checked the version of ifconfig, it blongs to package
> "net-tools".
> 
> only the latest version 1.60.20110819cvs-1 have the ":" after Interface
> name. In this version, the output format of ifconfig has changed.

Parsing the output of ifconfig isn't a very good way to get a list of
devices (not least because ifconfig isn't guaranteed to be available).
It would be better to read /proc/net/dev directly since this file is
intended to be machine-readable.

p.




