Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QTTlv-0006Hm-T2 for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:58:47 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QTTik-0005MC-Ie
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:55:30 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
Date: Mon, 06 Jun 2011 07:55:22 +0100
Message-ID: <1307343323.3131.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
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
X-List-Received-Date: Mon, 06 Jun 2011 06:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
>  SECTION_${PN}-dev = "devel"
>  ALLOW_EMPTY_${PN}-dev = "1"
>  RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
>  
> +FILES_${PN}-staticlibs = "${libdir}/*.a ${base_libdir}/*.a"
> +SECTION_${PN}-staticlibs = "devel"
> +RDEPENDS_${PN}-staticlibs = "${PN}-dev (= ${EXTENDPV})"

This should be ${EXTENDPKGV}, right?

p.




