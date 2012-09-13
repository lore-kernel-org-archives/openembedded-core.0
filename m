Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCI96-0008Ek-Ej
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 00:44:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2012 15:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,419,1344236400"; d="scan'208";a="203324788"
Received: from unknown (HELO helios.localnet) ([10.252.121.190])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2012 15:31:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 13 Sep 2012 23:31:45 +0100
Message-ID: <22844638.2V3OiWsK3u@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
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
X-List-Received-Date: Thu, 13 Sep 2012 22:44:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 13 September 2012 12:26:19 Saul Wold wrote:
> Make sure to find -package, this was causing a failure
> in the multi-lib build license generation during rootfs.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/license.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 29fe938..b29067c 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -88,7 +88,7 @@ license_create_manifest() {
>  	# list of installed packages is broken for deb
>  	for pkg in ${INSTALLED_PKGS}; do
>  		# not the best way to do this but licenses are not arch dependant iirc
> -		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
> +		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/*${pkg}| head -1`
>  		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
> 
>  		# exclude locale recipes

Surely this could end up matching a the wrong file when one package name is a 
substring of another?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


