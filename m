Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RshMs-0006FV-Tm
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 22:05:27 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RshFF-0004cr-RN
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 21:57:33 +0100
Message-ID: <1328129842.2716.156.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Feb 2012 20:57:22 +0000
In-Reply-To: <429ddbe3779c6957e6ecad5ae37200865e19fa0f.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<429ddbe3779c6957e6ecad5ae37200865e19fa0f.1328127940.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Wed, 01 Feb 2012 21:05:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:
>  pkg_postinst_dhcp-server() {
> +    install -d $D/${localstatedir}/lib/dhcp

Is "install" guaranteed to be available on the target?  I would have
thought "mkdir -p" would be better.

p.




