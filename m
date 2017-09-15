Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DCB4C78639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:42:34 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 04:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="152214182"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2017 04:42:35 -0700
To: Jussi Laako <jussi.laako@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170915113408.37844-1-jussi.laako@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4166c599-6cac-aab4-06dd-0d81c526c05a@linux.intel.com>
Date: Fri, 15 Sep 2017 14:38:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170915113408.37844-1-jussi.laako@linux.intel.com>
Subject: Re: [meta-oe][PATCH] libgcrypt: provide libgcrypt-config wrapper around pkg-config
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
X-List-Received-Date: Fri, 15 Sep 2017 11:42:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/15/2017 02:34 PM, Jussi Laako wrote:
> rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
> rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb

The version update and the -config stuff should be two separate patches.

> index 1797d9584d..529882d8a4 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
> @@ -15,18 +15,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>   DEPENDS = "libgpg-error"
>   
>   UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
> -SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
> +SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
>              file://0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch \
>              file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
>              file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
>              file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
> +           file://libgcrypt-config-wrapper.patch \

You forgot to git add the patch :)

Alex


