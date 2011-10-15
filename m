Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RF5J2-0003rS-Ls
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 16:33:44 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RF5DU-0005ZP-N4
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 16:28:00 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1318672491-31826-2-git-send-email-Martin.Jansa@gmail.com>
References: <1318672491-31826-1-git-send-email-Martin.Jansa@gmail.com>
	<1318672491-31826-2-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 15 Oct 2011 15:27:55 +0100
Message-ID: <1318688875.3158.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/2] mesa-common: install internal GL headers to libgl-dev
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
X-List-Received-Date: Sat, 15 Oct 2011 14:33:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-15 at 11:54 +0200, Martin Jansa wrote:
>  FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
>  FILES_libegl-dbg += "${libdir}/egl/.debug/*"
> +
> +do_install_append () {
> +    install -d ${D}/${includedir}/GL
> +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
> +}

Why is this needed?  If the internal headers are meant to be installed,
why doesn't "make install" do that?  Or, conversely, if they aren't
intended to be installed, why do we want them there?

Please add some commentary to the checkin message explaining the
rationale for the patch.

p.




