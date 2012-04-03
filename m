Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCn6-0005ni-3x
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:05:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 15:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125036328"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 15:56:21 -0700
Message-ID: <4F7B8015.2010406@linux.intel.com>
Date: Tue, 03 Apr 2012 15:56:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332978770-6323-1-git-send-email-denis@denix.org>
In-Reply-To: <1332978770-6323-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCHv2] bc: use update-alternatives to make dc play nice with busybox
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
X-List-Received-Date: Tue, 03 Apr 2012 23:05:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2012 04:52 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko<denys@ti.com>
>
> busybox' default configuration enables dc app, which bc also provides,
> setup update-alternatives to resolve the conflict.
>
> Signed-off-by: Denys Dmytriyenko<denys@ti.com>
> ---
>   meta/recipes-extended/bc/bc_1.06.bb |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
> index 02915e1..283e2d8 100644
> --- a/meta/recipes-extended/bc/bc_1.06.bb
> +++ b/meta/recipes-extended/bc/bc_1.06.bb
> @@ -11,11 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>
>   SECTION = "base"
>   DEPENDS = "flex"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
>
>   SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
>   SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
>
> -inherit autotools
> +inherit autotools update-alternatives
> +
> +ALTERNATIVE_LINKS = "${bindir}/dc"
> +ALTERNATIVE_PRIORITY = "100"

Merged into OE-Core

Thanks
	Sau!


