Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm0bf-0004nO-Uu
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:40:47 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm0Xc-00022Z-1z
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:36:36 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 10:36:35 +0100
In-Reply-To: <3a8dba4abda014b2368eceff10b455c48dd54f39.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
	<3a8dba4abda014b2368eceff10b455c48dd54f39.1311752531.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311759396.30326.272.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [Consolidated & Tested 02/35] meta/conf/local.conf.sample: improve comments/layout
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
X-List-Received-Date: Wed, 27 Jul 2011 09:40:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 00:46 -0700, Saul Wold wrote:
>  # There are other application targets too, see meta/classes/core-image.bbclass 
> +<<<<<<< HEAD:meta/conf/local.conf.sample
>  # and meta/packages/tasks/task-core.bb for more details.
>  
>  EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
> +=======
> +# and meta/recipes-core/tasks/task-core.bb for more details.
> +<<<<<<< HEAD:meta-yocto/conf/local.conf.sample
> +# The -sdk image includes these features by default now.
> +EXTRA_IMAGE_FEATURES = "debug-tweaks"
> +=======
> +EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
> +>>>>>>> d82e8ed... meta/conf/local.conf.sample: improve comments/layout:meta/conf/local.conf.sample
> +>>>>>>> 8d50670... meta/conf/local.conf.sample: improve comments/layout:meta-yocto/conf/local.conf.sampl

Er?  That doesn't look like it can be right.  I'm a bit surprised that
you managed to test successfully with those conflict markers in there.

p.



