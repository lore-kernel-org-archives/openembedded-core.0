Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8025B6D6EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 17:38:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2013 09:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435334631"
Received: from unknown (HELO [10.255.15.61]) ([10.255.15.61])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2013 09:37:43 -0800
Message-ID: <52850A67.7080701@linux.intel.com>
Date: Thu, 14 Nov 2013 09:37:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1384440781-12525-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1384440781-12525-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] lighttpd: upgrade to 1.4.33
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Nov 2013 17:38:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2013 06:53 AM, Valentin Popa wrote:
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   .../lighttpd/{lighttpd_1.4.32.bb => lighttpd_1.4.33.bb}               | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-extended/lighttpd/{lighttpd_1.4.32.bb => lighttpd_1.4.33.bb} (93%)
>
Can you please do the patch directory rename as I have suggested, files 
-> lighttpd.

Thanks
	Sau!


> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
> similarity index 93%
> rename from meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> rename to meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
> index a1f0589..e8be659 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
> @@ -24,8 +24,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
>           file://lighttpd.service \
>           "
>
> -SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
> -SRC_URI[sha256sum] = "60691b2dcf3ad2472c06b23d75eb0c164bf48a08a630ed3f308f61319104701f"
> +SRC_URI[md5sum] = "e66b8164e5fc5a6beec0823b697fbe1d"
> +SRC_URI[sha256sum] = "2ff2324658c0f90e7d39afd40f08f11ca230903b9019c31a2bbecd8f087f235e"
>
>   EXTRA_OECONF = " \
>                --without-bzip2 \
>

