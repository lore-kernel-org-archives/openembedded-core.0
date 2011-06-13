Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QW2eu-0004v0-DM for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 10:38:08 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QW2bZ-0002CL-Ol; Mon, 13 Jun 2011 10:34:41 +0200
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <22f849c8a4e592ed6a828d85a353dcfaf1e558be.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
	<22f849c8a4e592ed6a828d85a353dcfaf1e558be.1307947593.git.sgw@linux.intel.com>
Date: Mon, 13 Jun 2011 09:34:33 +0100
Message-ID: <1307954073.6879.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [*RFC CONSOLIDATED PULL RFC* 16/23] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Mon, 13 Jun 2011 08:38:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-12 at 23:54 -0700, Saul Wold wrote:
> From: Phil Blundell <pb@pbcl.net>
> 
> There is no good reason for uclibc to be machine specific.  Remove local
> assignment to PACKAGE_ARCH so that it gets the default target
> architecture and bump PR for that change.

I just noticed that I forgot to update the subject line when I split
this patch into three.  This part no longer has anything to do with i586
compile fixes; it should just be "uclibc: remove PACKAGE_ARCH".

p.




