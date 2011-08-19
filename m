Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QuRvu-0000V8-DD
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:28:34 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QuRrP-0002L0-TU
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:23:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2011 17:23:55 +0100
In-Reply-To: <788258d226dc94004ce8284a62cf8524bcf4b010.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<788258d226dc94004ce8284a62cf8524bcf4b010.1313700595.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313771035.6733.304.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 16/32] gcc-4.6: Use --with-linker-hash-style configure option
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
X-List-Received-Date: Fri, 19 Aug 2011 16:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -90,6 +90,7 @@ EXTRA_OECONF_BASE = " --enable-lto \
>  			--disable-bootstrap \
>  			--disable-libgomp \
>  			--disable-libmudflap \
> +			--with-linker-hash-style=${LINKER_HASH_STYLE} \
>  			--enable-cheaders=c_global "
>  
>  EXTRA_OECONF_INITIAL = "--disable-libmudflap \

Which gcc did you test this against?  As far as I can tell this patch
was only applied to the trunk (as of May this year) and not the 4.6
branch.  The corresponding configury certainly doesn't seem to exist in
the oe-core build tree that I happen to have lying around in front of
me, so it isn't apparent that this patch will have any useful effect. 

p.




