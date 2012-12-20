Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TliAC-000750-Ii
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:36:05 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Tlhvy-0000Fo-3U; Thu, 20 Dec 2012 16:21:18 +0100
From: Phil Blundell <philb@gnu.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 20 Dec 2012 15:21:17 +0000
In-Reply-To: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1356016878.24487.187.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: have postinstalls run at do_rootfs time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 15:36:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-19 at 18:03 +0200, Laurentiu Palcu wrote:
> Since pango-native is built anyway and all the modules are in the native
> sysroot, create the cache file by scanning those files instead of the
> target files. The latter will fail because the shared objects wouldn't
> be from the same ELF class.

Is it guaranteed that the native build will have the same set of
modules?  It seems to me that it would be safer to scan the target ones
under qemu as you did for gtk-immodules.

p.




