Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjSlJ-0005K9-IH
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 11:08:13 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjShN-00035v-Ms
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 11:04:09 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 10:04:08 +0100
In-Reply-To: <c1e38312fe3efff38610002ac534d90e32a2f669.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
	<c1e38312fe3efff38610002ac534d90e32a2f669.1311150183.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311152649.30326.46.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 39/50] uclibc_0.9.32: Implement sync_file_range2.
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
X-List-Received-Date: Wed, 20 Jul 2011 09:08:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 01:28 -0700, Saul Wold wrote:
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
> @@ -0,0 +1,40 @@
> +Index: git/libc/sysdeps/linux/common/sync_file_range.c

This new patch seems to be missing Signed-off-by and Upstream-Status.
Functionally though it does look much better than the old one.

p.




