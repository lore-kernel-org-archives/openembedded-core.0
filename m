Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfJ9I-00008t-TY
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 00:40:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Dec 2012 15:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,202,1355126400"; d="scan'208";a="225583546"
Received: from unknown (HELO helios.localnet) ([10.252.123.12])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2012 15:26:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 02 Dec 2012 23:26:13 +0000
Message-ID: <7327098.TAKnqlOXbO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <8db2a8dab66febf2844ac62cd207e9e40edec11c.1354480962.git.raj.khem@gmail.com>
References: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
	<8db2a8dab66febf2844ac62cd207e9e40edec11c.1354480962.git.raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] libcgroup: Fix QA error about .so symlink
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
X-List-Received-Date: Sun, 02 Dec 2012 23:40:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 02 December 2012 12:45:07 Khem Raj wrote:
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so:
> cgroups-pam-plugin path
> '/work/x86_64-angstrom-linux/libcgroup/0.37.1-r1/packages-split/cgroups-pam-
> plugin/lib/security/pam_cgroup.so' ERROR: QA run found fatal errors. Please
> consider fixing them.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb index 3ef1dad..7ac782b
> 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> @@ -24,4 +24,4 @@ FILES_${PN}-dbg += "${base_libdir}/security/.debug"
>  FILES_${PN}-dev += "${base_libdir}/security/*.la"
> 
>  # We really need the symlink so :(
> -INSANE_SKIP_${PN} = "dev-so"
> +INSANE_SKIP_cgroups-pam-plugin = "dev-so"

FWIW, Martin already sent this patch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


