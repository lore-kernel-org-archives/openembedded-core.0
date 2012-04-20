Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SLKDg-00035q-RN
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 22:14:17 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2S006O3NR3BC11@vms173003.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 15:04:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B7A9E201A7; Fri,
	20 Apr 2012 16:04:15 -0400 (EDT)
Date: Fri, 20 Apr 2012 16:04:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120420200415.GE8228@denix.org>
References: <cover.1334940120.git.sgw@linux.intel.com>
	<d2330607b1757ad68add6ab2b37c6182b4f28d00.1334940120.git.sgw@linux.intel.com>
MIME-version: 1.0
In-reply-to: <d2330607b1757ad68add6ab2b37c6182b4f28d00.1334940120.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [CONSOLIDATED PULL 02/43] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
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
X-List-Received-Date: Fri, 20 Apr 2012 20:14:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 20, 2012 at 09:44:53AM -0700, Saul Wold wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Replace dependency on eglibc with virtual/libc
> Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

That's already been fixed differently:
http://cgit.openembedded.org/openembedded-core/commit/?id=fb89e4585644db0958a633a637fc70f0459af26a

-- 
Denys


> ---
>  meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> index 6c4931e..e38ada9 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> @@ -18,8 +18,7 @@ SRC_URI = "git://github.com/clrkwllms/rt-tests.git \
>  
>  S = "${WORKDIR}/git"
>  
> -# need to append rt-tests' default CFLAGS to ours
> -CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli"
> +TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  # calling 'uname -m' is broken on crossbuilds
>  EXTRA_OEMAKE = "NUMA=0"
> -- 
> 1.7.7.6
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


