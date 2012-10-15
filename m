Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TNtFc-0003uj-Hn
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 00:35:08 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TNt2o-0005Qw-Np; Tue, 16 Oct 2012 00:21:54 +0200
Message-ID: <1350339558.4470.112.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 15 Oct 2012 23:19:18 +0100
In-Reply-To: <1350339349-6387-1-git-send-email-sgw@linux.intel.com>
References: <1350339349-6387-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nfs-utils: Ensure that the Kernel modules are include
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
X-List-Received-Date: Mon, 15 Oct 2012 22:35:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-15 at 15:15 -0700, Saul Wold wrote:
>This fixes the issue when booting a kernel with out the kernel modules
>included.
[...]
>  # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
>  # pull in the remainder of the dependencies.
> +KERNEL_FEATURES_append " nfsd"

Er, really?  I'm a bit surprised that this even parses successfully, let
alone fixes anything.  Is this definitely the patch you meant to send?

p.




