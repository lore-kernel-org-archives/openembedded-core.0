Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R0H2E-00025u-TJ
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 20:03:10 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R0GxR-0000c7-QE
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 19:58:13 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9f4240fffc8748f28e2d4ce6a6c88dee30ab9ddd.1315109841.git.sgw@linux.intel.com>
References: <cover.1315109841.git.sgw@linux.intel.com>
	<9f4240fffc8748f28e2d4ce6a6c88dee30ab9ddd.1315109841.git.sgw@linux.intel.com>
Date: Sun, 04 Sep 2011 18:58:06 +0100
Message-ID: <1315159086.2896.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/2] groff: Fix sstate relocation issue
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
X-List-Received-Date: Sun, 04 Sep 2011 18:03:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-03 at 21:19 -0700, Saul Wold wrote:
> +	create_cmdline_wrapper ${D}/${bindir}/groff \
> +		-F${STAGING_DIR_NATIVE}/usr/share/groff/${PV}/font \
> +		-M${STAGING_DIR_NATIVE}/usr/share/groff/${PV}/tmac
> +}

Shouldn't that be ${datadir}?

p.




