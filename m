Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SZi47-00026w-1k
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:31:51 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SZhuA-0005RP-MO
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:21:34 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 13:21:33 +0100
In-Reply-To: <20120530120443.GL3138@jama.jama.net>
References: <20120530110550.04FA710217@opal>
	<20120530120443.GL3138@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1338380494.1964.369.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 12:31:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 14:04 +0200, Martin Jansa wrote:
> On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: da98266f3a228cf65f279db9810a5326c8bd5422
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=da98266f3a228cf65f279db9810a5326c8bd5422
> > 
> > Author: Valentin Popa <valentin.popa@intel.com>
> > Date:   Wed May 23 14:08:58 2012 +0300
> > 
> > xz: updated to version 5.1.1alpha
> 
> this upgrade is causing liblzma package name change
> -liblzma5_5.0.3-r1_armv4te.ipk
> +liblzma_5.1.1alpha-r0_armv4t.ipk
> 
> so all packages which rdepends on liblzma should get PR bump, e.g.:
>  *libsystemd-journal0
>  *libpoppler18
>  *libsdl-image-1.2-0
>  *libpoppler-glib8
>  *systemd
>  *ethumb
>  *libtiff5
>  *epdf

Or, better, someone should identify why the package has stopped getting
renamed and correct that.  Most likely some binary has leaked in to the
package which ought to contain only libraries.

p.




