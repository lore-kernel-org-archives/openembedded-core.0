Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T6Jd7-0008Ey-TR
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 13:06:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Aug 2012 03:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,326,1344236400"; d="scan'208";a="138677377"
Received: from unknown (HELO helios.localnet) ([10.252.121.154])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2012 03:54:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 28 Aug 2012 11:54:28 +0100
Message-ID: <3785680.STh40WuoVt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
References: <cover.1338603853.git.kergoth@gmail.com>
	<acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] task-core-basic: drop portmap
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
X-List-Received-Date: Tue, 28 Aug 2012 11:06:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 01 June 2012 19:24:54 Christopher Larson wrote:
> Both rpcbind and portmap are RPC port mappers. Having both is redundant.
> Chose rpcbind over portmap as rpcbind supports ipv6, nfs4, and builds
> without the glibc rpc headers, which have been obsoleted in glibc 2.14.
> 
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/recipes-extended/tasks/task-core-basic.bb |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/tasks/task-core-basic.bb
> b/meta/recipes-extended/tasks/task-core-basic.bb index 8bab0db..a810d37
> 100644
> --- a/meta/recipes-extended/tasks/task-core-basic.bb
> +++ b/meta/recipes-extended/tasks/task-core-basic.bb
> @@ -148,7 +148,6 @@ RDEPENDS_task-core-sys-services = "\
>      nfs-utils \
>      pciutils \
>      libpcre \
> -    portmap \
>      rpcbind \
>      sysfsutils \
>      tcp-wrappers \

I came across this while digging back through the history in master. Does this 
mean we ought to be switching to rpcbind in our other tasks which currently 
bring in portmap (e.g. task-base-nfs, task-core-apps-console)?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


