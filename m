Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U7qdi-00016n-NG
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 18:05:59 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Feb 2013 08:49:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,696,1355126400"; d="scan'208";a="258876984"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by azsmga001.ch.intel.com with ESMTP; 19 Feb 2013 08:49:41 -0800
Message-ID: <5123AD25.9000902@linux.intel.com>
Date: Tue, 19 Feb 2013 08:49:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: MiLo <milo-software@users.sourceforge.net>
References: <1361029505-32439-1-git-send-email-milo-software@users.sourceforge.net>
In-Reply-To: <1361029505-32439-1-git-send-email-milo-software@users.sourceforge.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Add package for libmount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2013 17:05:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2013 07:45 AM, MiLo wrote:
> The libmount shared library was part of util-linux. This caused
> util-linux-mount to RDEPEND on util-linux, so including that would
> also drag in all of util-linux and all its recommendations.
>
> To break this circular dependency, add a libmount package that holds
> the libmount.so.* files, just like the other libraries built by util-
> linux.

There's no "Signed-off-by:" tag, please add it and this will get pulled

Sau!

> ---
>   meta/recipes-core/util-linux/util-linux.inc       |    3 +++
>   meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>   2 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 10439c0..bd7b089 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>   PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
>                util-linux-swaponoff util-linux-losetup util-linux-umount \
>                util-linux-mount util-linux-readprofile util-linux-libblkid \
> +             util-linux-libmount util-linux-libmount-dev \
>                util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
>                util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
>                util-linux-mkfs util-linux-mcookie util-linux-reset"
> @@ -64,6 +65,8 @@ FILES_util-linux-reset = "${base_bindir}/reset"
>
>   FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
>   FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> +FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
> +FILES_util-linux-libmount-dev = "${base_libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
>   FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
>   FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>   FILES_util-linux-lscpu = "${bindir}/lscpu"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> index dd95573..f91784b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.22"
> -PR = "r0"
> +PR = "r1"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
>


