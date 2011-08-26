Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QwtTe-0004Zw-8w
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 12:17:30 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QwtP2-0007ZS-3a
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 12:12:44 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2011 11:12:43 +0100
In-Reply-To: <cd4a85ccaa27bdd77ad06d9300ac71bd6b27e36d.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
	<cd4a85ccaa27bdd77ad06d9300ac71bd6b27e36d.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314353564.19905.81.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 02/10] eglibc-package: don't fail without localedef/gconv
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
X-List-Received-Date: Fri, 26 Aug 2011 10:17:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 23:06 +0200, Martin Jansa wrote:
>-       mv ${D}${libdir}/gconv ${dest}${libdir}
> +	if [ -f ${D}${libdir}/gconv ]; then
> +		mv -f ${D}${libdir}/gconv ${dest}${libdir}
> +	fi

This can't be right: gconv will be a directory if it exists at all and
hence "test -f gconv" will never be true.

Since this patch was applied I'm getting a whole bunch of "installed but
not shipped" warnings for /lib/gconv/*.  Could you please look into
that?

thanks

p.




