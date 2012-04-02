Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SEg84-0002kk-W5
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 14:13:01 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SEfzH-0000TK-5z
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 14:03:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Apr 2012 13:03:54 +0100
In-Reply-To: <alpine.DEB.2.02.1204020736460.9309@oneiric>
References: <alpine.DEB.2.02.1204020736460.9309@oneiric>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1333368235.2668.34.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: so what's the deal with "..._append +="?
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
X-List-Received-Date: Mon, 02 Apr 2012 12:13:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-02 at 07:37 -0400, Robert P. J. Day wrote:
> pretty sure i mentioned this once before but this just looks weird:
> 
> $ grep -r "_append +=" *
> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
> meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
> $
> 
>   should those be just simple assignments?

Probably most of them should lose the _append and just use +=.  I doubt
many/any of them are actually relying on the delayed semantics of
_append.  

If they do require the delayed appending then yes, they should be
straight assignments with _append.  All except the last example would
need a space adding on the right hand side though, in that case.

p.




