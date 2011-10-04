Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RB78U-000791-7H
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 17:42:26 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RB738-0001AQ-UA
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 17:36:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 16:36:54 +0100
In-Reply-To: <62e9da86a45eef3dd374bd8c7e110f619f620f80.1316890497.git.sgw@linux.intel.com>
References: <cover.1316890497.git.sgw@linux.intel.com>
	<62e9da86a45eef3dd374bd8c7e110f619f620f80.1316890497.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1317742614.13337.47.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] attr/acl: add SSTATEPOSTINSTFUNC
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
X-List-Received-Date: Tue, 04 Oct 2011 15:42:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-24 at 11:56 -0700, Saul Wold wrote:
> +fix_symlink () {
> +	# Remove bad symlinks & create the correct symlinks
> +	if test -L ${libdir}/lib${BPN}.so ; then
> +		rm -rf ${libdir}/lib${BPN}.so
> +		ln -sf ${base_libdir}/lib${BPN}.so ${libdir}/lib${BPN}.so
> +	fi

This breaks the build for me on micro.  I end up with a symlink pointing
to itself:

lrwxrwxrwx 1 pb pb 76 2011-10-04
16:09 /home/pb/oe/build-epia/build/tmp-eglibc/sysroots/x86_64-linux/lib/libattr.so -> /home/pb/oe/build-epia/build/tmp-eglibc/sysroots/x86_64-linux/lib/libattr.so

with predictably bad results.

p.




