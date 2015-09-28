Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 96AD6755FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 09:11:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 28 Sep 2015 02:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,602,1437462000"; d="scan'208";a="814353804"
Received: from blavenax-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.166])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2015 02:11:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Date: Mon, 28 Sep 2015 10:11:37 +0100
Message-ID: <9137827.Hc2XNeC1g1@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1443108196-26245-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1443108196-26245-1-git-send-email-alejandro.franco@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/2] Empty image: core-image-empty recipe
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
X-List-Received-Date: Mon, 28 Sep 2015 09:11:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Thursday 24 September 2015 10:23:15 Alex Franco wrote:
> Added core-image-empty recipe in meta-selftest/recipes-test/images
> 
> [YOCTO #7664]
> 
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
>  meta-selftest/recipes-test/images/core-image-empty.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/images/core-image-empty.bb
> 
> diff --git a/meta-selftest/recipes-test/images/core-image-empty.bb
> b/meta-selftest/recipes-test/images/core-image-empty.bb new file mode
> 100644
> index 0000000..550567c
> --- /dev/null
> +++ b/meta-selftest/recipes-test/images/core-image-empty.bb
> @@ -0,0 +1,7 @@
> +SUMMARY = "An empty image."
> +IMAGE_INSTALL = ""
> +IMAGE_LINGUAS = ""
> +PACKAGE_INSTALL = ""
> +LICENSE = "MIT"
> +
> +inherit image

Can we call this "test-empty-image.bb" instead?

Also it's not necessary to specify LICENSE, image.bbclass already sets LICENSE 
= "MIT" as the default.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

