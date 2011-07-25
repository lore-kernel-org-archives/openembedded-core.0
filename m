Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlOPr-0001G6-0e
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:54:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlOLp-0000w1-12
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:49:53 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 17:49:52 +0100
In-Reply-To: <1311603506-14101-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1311603506-14101-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311612593.30326.256.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] ncurses: enforce creation of pkg-config files
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
X-List-Received-Date: Mon, 25 Jul 2011 16:54:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 16:18 +0200, Enrico Scholz wrote:
> +	PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
> +-	if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
> ++	if test -n "$PKG_CONFIG_LIBDIR" ; then

I wonder if it would be easier to just create the directory in
do_configure() so that the test always succeeds, rather than patching
configure like this.

p.




