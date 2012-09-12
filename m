Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBgid-0002Lh-2G
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 08:46:39 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBgWX-0000rV-7m; Wed, 12 Sep 2012 08:34:09 +0200
Message-ID: <1347431522.29443.92.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2012 07:32:02 +0100
In-Reply-To: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/3] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Wed, 12 Sep 2012 06:46:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 22:59 -0700, Khem Raj wrote:
> kernel compiler is not special and we currently have it so
> we want to pass -march and -mtune options as CFLAGS to kernel
> build so that compiler picks the right subarch flags when
> compiling assembly files in particular.

Historically, the kernel compiler has indeed been special: there have
been some machines where, due to bugs in the kernel or the compiler or
both, we need to use a different version of the compiler for the kernel
than we use for userspace.  The most famous example of this were the old
ARM kernels back in the day which needed gcc-2.95 long after everyone
else had stopped using it, but I think there might be a few cases where
the same situation obtains even today.

If you remove ${KERNEL_CCSUFFIX} then we will lose the ability to do
that (easily).  I'm not necessarily opposed to such a change but I think
it does need to be justified with clear benefits.

p.




