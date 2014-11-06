Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B98DE72067
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 11:27:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 03:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,325,1413270000"; d="scan'208";a="632566795"
Received: from ckithala-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.65])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 03:27:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 06 Nov 2014 11:27:39 +0000
Message-ID: <2205188.KeVNzL1xBI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.7-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1415259476-3411-1-git-send-email-koen@dominion.thruhere.net>
References: <1415259476-3411-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Thu, 06 Nov 2014 11:27:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Koen,

On Thursday 06 November 2014 08:37:56 Koen Kooi wrote:
> Besides from being useful as fdisk replacement this gives us 'sgdisk'
> which can be used to set the GUID for partitions, e.g.
> 
> 	sgdisk -t 1:C12A7328-F81F-11D2-BA4B-00A0C93EC93B /dev/mmcblk0p1
> 
> To mark it as ESP in scripts like mkefidisk.sh.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-devtools/fdisk/gptfdisk_git.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_git.bb
> 
> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
> b/meta/recipes-devtools/fdisk/gptfdisk_git.bb new file mode 100644
> index 0000000..62c32c3
> --- /dev/null
> +++ b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
> @@ -0,0 +1,22 @@
>...
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 cgdisk ${D}${bindir}
> +    install -m 0755 gdisk ${D}${bindir}
> +    install -m 0755 sgdisk ${D}${bindir}
> +    install -m 0755 fixparts ${D}${bindir}

Technically shouldn't these be in ${sbindir} ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

