Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0730E60E12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:35:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2013 05:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,880,1363158000"; d="scan'208";a="351045553"
Received: from unknown (HELO helios.localnet) ([10.252.122.47])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2013 05:36:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jesse Zhang <sen.zhang@windriver.com>
Date: Mon, 17 Jun 2013 13:35:36 +0100
Message-ID: <2019586.mcCT5j76os@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <cover.1371472283.git.sen.zhang@windriver.com>
References: <cover.1371472283.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] two patches for alsa-lib
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
X-List-Received-Date: Mon, 17 Jun 2013 12:35:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jesse,

On Monday 17 June 2013 20:33:24 Jesse Zhang wrote:
> The following changes since commit c18249353697f8b3741ae2024308d195671d3598:
> 
>   rt-tests: fix error check in hackbench (2013-06-17 13:53:42 +0800)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib szhang/alsa
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/alsa
> 
> Jesse Zhang (2):
>   alsa-lib: Change function type to "static __inline__"
>   alsa-lib: check if wordexp is supported in libc
> 
>  .../Check-if-wordexp-function-is-supported.patch   | 48 +++++++++++++++++
>  .../fix-O0-Optimize-unable-inline-function.patch   | 61
> ++++++++++++++++++++++ meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb    |
>  2 +
>  3 files changed, 111 insertions(+)
>  create mode 100644
> meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supporte
> d.patch create mode 100644
> meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-functio
> n.patch

Could you please add Upstream-Status to the inner patches?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

