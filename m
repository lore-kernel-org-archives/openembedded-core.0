Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 987226D6EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 17:27:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2013 09:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435327478"
Received: from unknown (HELO [10.255.15.61]) ([10.255.15.61])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2013 09:27:13 -0800
Message-ID: <528507F0.9000902@linux.intel.com>
Date: Thu, 14 Nov 2013 09:27:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: qiang.chen@windriver.com, openembedded-core@lists.openembedded.org
References: <1384414827-5485-1-git-send-email-qiang.chen@windriver.com>
In-Reply-To: <1384414827-5485-1-git-send-email-qiang.chen@windriver.com>
Subject: Re: [PATCH] util-linux: collect symbol link libxx.so for related libxx-dev package
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
X-List-Received-Date: Thu, 14 Nov 2013 17:27:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2013 11:40 PM, qiang.chen@windriver.com wrote:
> From: Qiang Chen <qiang.chen@windriver.com>
>
> Commit 91c0f9e3 moves library files to base_libdir for safe while
> symbol link libuuid.so and libblkid.so are placed in libdir, not
> base_libdir. Thus they are missed by related develop package and
> collected by util-linux's develop package at last. Fix it.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 15b6770..e25fbd6 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -74,11 +74,11 @@ FILES_util-linux-reset = "${base_bindir}/reset"
>   FILES_util-linux-partx = "${sbindir}/partx"
>
>   FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
> -FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> +FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
>   FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
> -FILES_util-linux-libmount-dev = "${base_libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
> +FILES_util-linux-libmount-dev = "${libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
>   FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
> -FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
> +FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>   FILES_util-linux-lscpu = "${bindir}/lscpu"
>

Don't the .la files need to be with the .so files.

Sau!

>   FILES_util-linux-fsck = "${base_sbindir}/fsck*"
>

