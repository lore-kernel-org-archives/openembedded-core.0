Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 73A5E7018F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 23:46:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jul 2014 16:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,720,1400050800"; d="scan'208";a="574490359"
Received: from unknown (HELO [10.255.13.66]) ([10.255.13.66])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2014 16:46:55 -0700
Message-ID: <53D0496F.3070205@linux.intel.com>
Date: Wed, 23 Jul 2014 16:46:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Ben Shelton <ben.shelton@ni.com>, openembedded-core@lists.openembedded.org
References: <1406154587-30052-1-git-send-email-ben.shelton@ni.com>
	<1406154587-30052-2-git-send-email-ben.shelton@ni.com>
In-Reply-To: <1406154587-30052-2-git-send-email-ben.shelton@ni.com>
Subject: Re: [PATCH 2/2] util-linux: break out new package util-linux-findfs
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
X-List-Received-Date: Wed, 23 Jul 2014 23:47:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2014 03:29 PM, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>

For both this and the prior patch, can you explain why you are break 
these out.  I assume because you want finer grain control, but explain 
it in the commit messages please.

Sau!


> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index d640a5f..ffb84c4 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -36,7 +36,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>                util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
>                util-linux-mkfs util-linux-mcookie util-linux-reset \
>                util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
> -             util-linux-partx ${PN}-bash-completion util-linux-hwclock"
> +             util-linux-partx ${PN}-bash-completion util-linux-hwclock \
> +             util-linux-findfs"
>
>   SHARED_EXTRA_OECONF = "--disable-use-tty-group \
>                          --disable-makeinstall-chown \
> @@ -79,6 +80,7 @@ FILES_util-linux-uuidd = "${sbindir}/uuidd"
>   FILES_util-linux-reset = "${base_bindir}/reset"
>   FILES_util-linux-partx = "${sbindir}/partx"
>   FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
> +FILES_util-linux-findfs = "${sbindir}/findfs"
>
>   FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
>   FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
>

