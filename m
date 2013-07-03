Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B428F61485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 13:37:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2013 06:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="359940669"
Received: from unknown (HELO helios.localnet) ([10.252.121.238])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2013 06:38:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: b28495@freescale.com
Date: Wed, 03 Jul 2013 14:37:57 +0100
Message-ID: <3615537.9YYZDXbCb0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1372844710-15122-1-git-send-email-b28495@freescale.com>
References: <1372844710-15122-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: use PACKAGECONFIG to address libaio/attr/libcap dependencies
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
X-List-Received-Date: Wed, 03 Jul 2013 13:37:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ting,

On Wednesday 03 July 2013 17:45:10 b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
> 
> Move to using the PACKAGECONFIG mechanism to select configure options
> and dependencies. Without this the system will attempt to discover
> various dependencies, and sometimes does so incorrectly.
> 
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc index 7caef6e..8be3890 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -84,6 +84,8 @@ do_install_append() {
>  # END of qemu-mips workaround
> 
>  PACKAGECONFIG ??= ""
> +PACKAGECONFIG[virtfs] = "--enable-virtfs
> --enable-attr,--disable-virtfs,libcap attr," 
> +PACKAGECONFIG[libaio] =
> "--enable-linux-aio,--disable-linux-aio,libaio,"

The latter should be "aio" and not "libaio" (since "aio" is the feature being 
enabled/disabled).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

