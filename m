Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ShMxc-0001Zr-UV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:36:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2012 08:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114243630"
Received: from unknown (HELO helios.localnet) ([10.252.120.176])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Jun 2012 08:25:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, liang.li@windriver.com
Date: Wed, 20 Jun 2012 16:25:45 +0100
Message-ID: <1472036.VpViiY8Ijl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <6e8878c5f3598b60d364e2656af74e9f712770ca.1340201997.git.bruce.ashfield@windriver.com>
References: <cover.1340201997.git.bruce.ashfield@windriver.com>
	<6e8878c5f3598b60d364e2656af74e9f712770ca.1340201997.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: Re: [PATCH 2/3] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Wed, 20 Jun 2012 15:36:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 June 2012 10:31:40 Bruce Ashfield wrote:
> From: Liang Li <liang.li@windriver.com>
>...
> +EXTRA_OEMAKE = \
> +		'-C ${S}/tools/perf \
> +		O=${B} \
> +		CROSS_COMPILE=${TARGET_PREFIX} \
> +		ARCH=${ARCH} \
> +		CC="${CC}" \
> +		AR="${AR}" \
> +		prefix=/usr \
> +		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \

Coincidentally, I've just noticed that the current (kernel integrated) perf 
package can sometimes depend on gtk+/glib-2.0 or not depending on whether 
these are available when the kernel is built. Presumably NO_GTK2=1 above 
disables gtk+ support and thus would prevent this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


