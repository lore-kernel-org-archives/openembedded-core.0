Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QgJpG-0004sf-91
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 18:59:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 09:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,516,1304319600"; d="scan'208";a="24518015"
Received: from vorpal.jf.intel.com (HELO [10.7.199.64]) ([10.7.199.64])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2011 09:55:21 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 09:59:41 -0700
In-Reply-To: <1310399257.20015.968.camel@rex>
References: <1310399257.20015.968.camel@rex>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1310403581.2188.3.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Subject: Re: [PATCH] update-rc.d: Switch from a tag to a sepcific revision
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
X-List-Received-Date: Mon, 11 Jul 2011 16:59:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 16:47 +0100, Richard Purdie wrote:
> Unfortunately the git fetcher cannot resolve a named tag into a revision
> without network access. Since its desireable for OE-Core to function
> in a networkless environment, we need to specify the revision in the
> recipe which corresponds to the 0.7 tag.
> 
> [YOCTO #1140]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Joshua Lock <josh@linux.intel.com>

> ---
>  meta/recipes-core/update-rc.d/update-rc.d_0.7.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> index 5bd88cb..8bc3dbf 100644
> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=148a48321b10eb
>  
>  PR = "r4"
>  
> -SRC_URI = "git://github.com/philb/update-rc.d.git;tag=update-rc.d_${PV};protocol=git \
> +# Revision corresponding to tag update-rc.d_0.7
> +SRCREV = "eca680ddf28d024954895f59a241a622dd575c11"
> +
> +SRC_URI = "git://github.com/philb/update-rc.d.git;protocol=git \
>             file://add-verbose.patch;striplevel=1"
>  
>  S = "${WORKDIR}/git"

-- 
Joshua Lock
        Yocto Project "Johannes Factotum"
        Intel Open Source Technology Centre



