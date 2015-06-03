Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0B460024
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 00:25:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t530PXVh019167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jun 2015 17:25:33 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 17:25:33 -0700
Message-ID: <556E497B.40200@windriver.com>
Date: Wed, 3 Jun 2015 08:25:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Soren Brinkmann <soren.brinkmann@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
In-Reply-To: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Wed, 03 Jun 2015 00:25:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


Hello,

Why not remove the old one dosfstools_2.11.bb, please ?

// Robert

On 05/26/2015 06:29 AM, Soren Brinkmann wrote:
> Add a recipe for building the latest (as of today) version of
> dosfstools.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> v2:
>   - add recipe for 3.0.28 additionally to the 2.11 one
> ---
>   meta/recipes-devtools/dosfstools/dosfstools.inc    |  8 ++++++++
>   .../recipes-devtools/dosfstools/dosfstools_2.11.bb |  7 +++----
>   .../dosfstools/dosfstools_3.0.28.bb                | 22 ++++++++++++++++++++++
>   3 files changed, 33 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-devtools/dosfstools/dosfstools.inc
>   create mode 100644 meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
>
> diff --git a/meta/recipes-devtools/dosfstools/dosfstools.inc b/meta/recipes-devtools/dosfstools/dosfstools.inc
> new file mode 100644
> index 000000000000..d2e672df1f48
> --- /dev/null
> +++ b/meta/recipes-devtools/dosfstools/dosfstools.inc
> @@ -0,0 +1,8 @@
> +# dosfstools OE build file
> +# Copyright (C) 2015, Sören Brinkmann <soeren.brinkmann@gmail>  All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +SUMMARY = "DOS FAT Filesystem Utilities"
> +SECTION = "base"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
> index d1c24b874845..d237cc9b9eac 100644
> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
> @@ -1,10 +1,11 @@
>   # dosfstools OE build file
>   # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
>   # Released under the MIT license (see packages/COPYING)
> -SUMMARY = "DOS FAT Filesystem Utilities"
> +
> +require dosfstools.inc
> +
>   HOMEPAGE = "http://daniel-baumann.ch/software/dosfstools/"
>
> -SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
>   PR = "r5"
> @@ -31,5 +32,3 @@ do_install () {
>   	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${base_sbindir}" \
>   		   "MANDIR=${D}${mandir}/man8" install
>   }
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
> new file mode 100644
> index 000000000000..3a746498a013
> --- /dev/null
> +++ b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
> @@ -0,0 +1,22 @@
> +# dosfstools OE build file
> +# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
> +# Copyright (C) 2015, Sören Brinkmann <soeren.brinkmann@gmail>  All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +require dosfstools.inc
> +
> +HOMEPAGE = "https://github.com/dosfstools/dosfstools"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz"
> +SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
> +SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
> +
> +FILES_${PN} = "${base_sbindir}"
> +FILES_${PN}-doc = "${mandir} ${docdir}"
> +
> +do_install () {
> +	oe_runmake "PREFIX=${D}${prefix}" "SBINDIR=${D}${base_sbindir}" install
> +}
>

