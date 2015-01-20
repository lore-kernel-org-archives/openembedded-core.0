Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6665A7231B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:27:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 20 Jan 2015 08:20:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,435,1418112000"; d="scan'208";a="653777524"
Received: from jkan1-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.1.52])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2015 08:24:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 20 Jan 2015 16:24:04 +0000
Message-ID: <2948032.KnzhuCi0IO@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1421689604-28787-1-git-send-email-sgw@linux.intel.com>
References: <1421689604-28787-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] core-image-kernel-dev: add a DEFAULT_TEST_SUITES
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
X-List-Received-Date: Tue, 20 Jan 2015 16:27:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Saul,

On Monday 19 January 2015 09:46:44 Saul Wold wrote:
> If we do not add some additional tests, we just get the core-image-minimal
> tests which are only ping
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/images/core-image-kernel-dev.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb
> b/meta/recipes-extended/images/core-image-kernel-dev.bb index
> d14f658..5e4edd8 100644
> --- a/meta/recipes-extended/images/core-image-kernel-dev.bb
> +++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
> @@ -15,3 +15,5 @@ CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
> 
>  # We need extra space for things like kernel builds, etc.
>  IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
> +
> +DEFAULT_TEST_SUITES = "ping ssh df syslog scp date rpm smart dmesg
> parselog"

At the moment this should be set in meta/classes/testimage.bbclass rather than 
in individual image recipes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

