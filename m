Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RuKlo-0003V3-H4
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 10:21:57 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RuKe6-00051B-0K
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 10:13:58 +0100
Message-ID: <1328519623.2716.208.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Feb 2012 09:13:43 +0000
In-Reply-To: <1624cca695c5baf08d376297f7278732dbcbfba6.1328509284.git.xiaofeng.yan@windriver.com>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>
	<1624cca695c5baf08d376297f7278732dbcbfba6.1328509284.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] glib-2.0: Don't check function qsort_r
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
X-List-Received-Date: Mon, 06 Feb 2012 09:21:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-06 at 14:41 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> function "g_qsort_with_data" has two kinds of realization. One calls qsort_r
> from libglib, the other realize itself.
> qsort_r from libglib cause sort error.
> For fixing this problem no checking "qsort_r" in configure.ac.
> 
> [YOCTO #1959]

This description doesn't make much sense.  libglib is part of glib-2.0
itself; I guess you meant to say that qsort_r is from libc6.  But, even
leaving that aside, if qsort_r is broken then the appropriate patch
would be to fix it, not just to hack glib to use a standalone
implementation.  So this patch seems like the wrong thing by any
measure.

Does glibc's own testsuite also have failures for qsort_r?

p.




