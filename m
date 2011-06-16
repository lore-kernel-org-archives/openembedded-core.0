Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QXDMy-00069D-90
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 16:16:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2011 07:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,375,1304319600"; d="scan'208";a="18973220"
Received: from unknown (HELO [10.255.13.22]) ([10.255.13.22])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2011 07:11:55 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <baf12b233c03a619928269bdbe6754d3e4d483e0.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<baf12b233c03a619928269bdbe6754d3e4d483e0.1308215406.git.dongxiao.xu@intel.com>
Date: Thu, 16 Jun 2011 09:11:59 -0500
Message-ID: <1308233519.23788.2.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH 5/6] systemtap: add fishriver in COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 16 Jun 2011 14:16:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-16 at 02:20 -0700, Dongxiao Xu wrote:
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index 8ac4c14..0d18e1d 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -23,7 +23,7 @@ EXTRA_OECONF = "--prefix=${D} --with-libelf=${STAGING_DIR_TARGET} --without-rpm
>  SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
>  SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
>  
> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450)"
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450|fishriver)"
>  
>  S = "${WORKDIR}/git"
>  

This shouldn't be necessary if/when my patch from a couple of days ago,
"[PATCH] systemtap: remove non-core COMPATIBLE_MACHINES" gets pulled in.

Tom




