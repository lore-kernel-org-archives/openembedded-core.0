Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C7D936FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 15:05:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 20 Jan 2016 07:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="636978552"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2016 07:05:49 -0800
Date: Wed, 20 Jan 2016 17:07:54 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160120150754.GA26306@mbabyjoh-mobl.fi.intel.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
	<f457364648f238d8b0353c2f7d14a5b08ed427fe.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f457364648f238d8b0353c2f7d14a5b08ed427fe.1452472146.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/9] elfutils: 0.163 -> 0.164
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
X-List-Received-Date: Wed, 20 Jan 2016 15:05:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jan 11, 2016 at 08:30:32AM +0800, Hongxu Jia wrote:
> Update patches from debian
> http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.164-1.debian.tar.xz
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../elfutils/elfutils-0.163/arm_func_value.patch   |  165 ----
>  .../elfutils-0.163/arm_unwind_ret_mask.patch       |   83 --
>  .../elfutils/elfutils-0.163/non_linux.patch        |   35 -
>  .../elfutils-0.163/redhat-portability.diff         | 1021 --------------------
>  .../elfutils/elfutils-0.163/scanf-format.patch     |   40 -
>  .../uclibc-support-for-elfutils-0.161.patch        |  106 --
>  ...ferences-between-mips-machine-identifiers.patch |   34 +
>  ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
>  .../0001-fix-a-stack-usage-warning.patch           |    0
>  .../0001-remove-the-unneed-checking.patch          |    0
>  ...-support-for-mips64-abis-in-mips_retval.c.patch |  168 ++++
>  .../0003-Add-mips-n64-relocation-format-hack.patch |  226 +++++
>  .../arm_backend.diff                               |  389 ++++----
>  .../fixheadercheck.patch                           |    0
>  .../hppa_backend.diff                              |   69 +-
>  .../elfutils/elfutils-0.164/kfreebsd_path.patch    |   15 +
>  .../m68k_backend.diff                              |   61 +-
>  .../mips_backend.diff                              |   71 +-
>  .../mips_readelf_w.patch                           |    8 +-
>  .../testsuite-ignore-elflint.diff                  |    0
>  .../{elfutils_0.163.bb => elfutils_0.164.bb}       |   15 +-
>  21 files changed, 735 insertions(+), 1771 deletions(-)
>  delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
>  delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
>  delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
>  delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
>  delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
>  delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch

Here, the patch uclibc-support-for-elfutils-0.161.patch was removed. 
However, it is still referenced in the recipe. It should be updated
to fix build error with uclibc.

WARNING: Failed to fetch URL file://uclibc-support-for-elfutils-0.161.patch, attempting MIRRORS if available
ERROR: Fetcher failure: Unable to find file file://uclibc-support-for-elfutils-0.161.patch anywhere. The paths that were searched were:
...

Best Regards,
Maxin

