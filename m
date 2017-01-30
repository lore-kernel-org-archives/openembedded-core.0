Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2EBED71DA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A1E2231C6989
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:22:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id A4rZdQ5UKau7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:22:52 +0100 (CET)
Received: from t510.zcs.saftware.de (55d41ba8.access.ecotel.net
	[85.212.27.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 597F531C6988
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:22:52 +0100 (CET)
Date: Mon, 30 Jan 2017 23:22:51 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170130232251.33704831@t510.zcs.saftware.de>
In-Reply-To: <1480531827-11799-2-git-send-email-obi@opendreambox.org>
References: <1480531827-11799-1-git-send-email-obi@opendreambox.org>
	<1480531827-11799-2-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] util-linux: create own package for lsblk
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
X-List-Received-Date: Mon, 30 Jan 2017 22:30:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Ping.

On Wed, 30 Nov 2016 19:50:27 +0100
Andreas Oberritter <obi@opendreambox.org> wrote:

> Let util-linux-bash-completion depend on it, because it uses it.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 70cba6b..ae85fd1 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -30,7 +30,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>               util-linux-swaponoff util-linux-losetup util-linux-umount \
>               util-linux-mount util-linux-readprofile util-linux-uuidd \
>               util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
> -             util-linux-mkfs util-linux-mcookie util-linux-reset \
> +             util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-lsblk \
>               util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
>               util-linux-partx util-linux-hwclock util-linux-mountpoint \
>               util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit"
> @@ -95,6 +95,7 @@ FILES_util-linux-prlimit = "${bindir}/prlimit"
>  FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
>                                 ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
>                                 ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
> +FILES_util-linux-lsblk = "${bindir}/lsblk"
>  FILES_util-linux-lscpu = "${bindir}/lscpu"
>  
>  FILES_util-linux-fsck = "${base_sbindir}/fsck*"
> @@ -116,7 +117,7 @@ RDEPENDS_util-linux-reset += "ncurses"
>  
>  RDEPENDS_util-linux-runuser += "libpam"
>  
> -RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
> +RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
>  RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
>  
>  RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit"
> @@ -285,6 +286,7 @@ python populate_packages_prepend() {
>                        extra_depends='', prepend=True, allow_links=True)
>  }
>  
> +RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
>  RDEPENDS_${PN}-ptest = "bash grep coreutils"
>  
>  do_compile_ptest() {


