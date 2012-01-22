Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rp4Az-0007IL-JK
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 21:38:09 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rp43Y-0004mZ-H4
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 21:30:28 +0100
Message-ID: <1327264221.2859.2.camel@pb-ThinkPad-R50e>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jan 2012 20:30:21 +0000
In-Reply-To: <4236e557f38c0e4c3e7088fd528face5b74f60a8.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
	<4236e557f38c0e4c3e7088fd528face5b74f60a8.1327123057.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
Subject: Re: [PATCH 18/20] eglibc: refactor packages for staticdev
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
X-List-Received-Date: Sun, 22 Jan 2012 20:38:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-20 at 21:18 -0800, Saul Wold wrote:
> @@ -54,6 +56,7 @@ RDEPENDS_${PN}-utils += "bash"
>  FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
>  FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
>  RPROVIDES_${PN}-dev += "libc-dev"
> +RPROVIDES_${PN}-dev += "libc-staticdev"

Is that really what you wanted?

More generally, I'm not very convinced that all these RPROVIDES in the
eglibc recipes are serving any useful purpose anymore.  I think we
should be trying to get rid of them, not adding new ones.  Does anybody
know of anything which currently depends on them?

p.




