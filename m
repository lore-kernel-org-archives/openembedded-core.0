Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6ixJ-0004Wb-Ch for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:32:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CUQvi015906
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:30:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15522-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:30:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CUEDq015889
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:30:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d6269e02c09499e0d603777a2315ff3600bc2489.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<d6269e02c09499e0d603777a2315ff3600bc2489.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:30:11 +0100
Message-ID: <1301920211.24596.346.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 24/46] elfutils_0.148.bb: Fix compilation issues on uclibc
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
X-List-Received-Date: Mon, 04 Apr 2011 12:32:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:29 -0700, Khem Raj wrote:
> * Add -luargp and -lintl to linker flags
> * __mempcpy is not there on uclibc so define it to mempcpy
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../elfutils/elfutils-0.148/mempcpy.patch          |   14 ++++++++++++++
>  meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    8 +++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
> new file mode 100644
> index 0000000..f4af7c4
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
> @@ -0,0 +1,14 @@
> +Index: elfutils-0.148/libelf/elf_begin.c
> +===================================================================
> +--- elfutils-0.148.orig/libelf/elf_begin.c
> ++++ elfutils-0.148/libelf/elf_begin.c
> +@@ -68,6 +68,9 @@
> + #include "libelfP.h"
> + #include "common.h"
> + 
> ++#ifdef __UCLIBC__
> ++#define __mempcpy mempcpy
> ++#endif
> + 
> + /* Create descriptor for archive in memory.  */
> + static inline Elf *

The patch description is missing...

Cheers,

Richard




