Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RkYkD-0002i7-Me
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:15:53 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RkYd1-0007Rk-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:08:27 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 10:08:24 +0000
In-Reply-To: <20120110100306.GB3664@ad.chargestorm.se>
References: <20120110100306.GB3664@ad.chargestorm.se>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1326190107.12160.45.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Preventing RRECOMMENDS from installing
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
X-List-Received-Date: Tue, 10 Jan 2012 10:15:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-10 at 11:03 +0100, Anders Darander wrote:
> Is there a simple way, in a bbappend-file to prevent packages in an
> RRECOMMENDS from being installed? E.g. if package foo has:
> RRECOMMENDS_${PN} += "bar"

If you mean you just want to stop them getting installed during rootfs
construction, you can achieve that by declaring them to be
BAD_RECOMMENDATIONS.

If you want to remove the actual Recommends: header then you probably
need to write an anonymous python function to bash RRECOMMENDS around
after parsing completes.

p.




