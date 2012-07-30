Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SvpAm-0007Gj-7h
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:34:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2012 05:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128416523"
Received: from unknown (HELO helios.localnet) ([10.252.121.40])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2012 05:22:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 13:22:29 +0100
Message-ID: <1791255.KrCA1u10OF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1343650687-2307-2-git-send-email-ross.burton@intel.com>
References: <1343650687-2307-1-git-send-email-ross.burton@intel.com>
	<1343650687-2307-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] buildhistory: reduce the numeric delta to 10%
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
X-List-Received-Date: Mon, 30 Jul 2012 12:34:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 30 July 2012 13:18:07 Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oe/buildhistory_analysis.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/buildhistory_analysis.py
> b/meta/lib/oe/buildhistory_analysis.py index d0e0808..0a50432 100644
> --- a/meta/lib/oe/buildhistory_analysis.py
> +++ b/meta/lib/oe/buildhistory_analysis.py
> @@ -23,7 +23,7 @@ numeric_fields = ['PKGSIZE', 'IMAGESIZE']
>  # Fields to monitor
>  monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST',
> 'PKGSIZE', 'IMAGESIZE'] # Percentage change to alert for numeric fields
> -monitor_numeric_threshold = 20
> +monitor_numeric_threshold = 10
>  # Image files to monitor (note that image-info.txt is handled separately)
>  img_monitor_files = ['installed-package-names.txt', 'files-in-image.txt']
>  # Related context fields for reporting (note: PE, PV & PR are always
> reported for monitored package fields)

I don't think I picked 20% completely out of thin air but I wasn't especially 
scientific about it either, so:

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


