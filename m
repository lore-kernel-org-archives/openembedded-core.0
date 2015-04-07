Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id E55C0605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 09:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B3EA83151DC3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:46:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CWJ87L4DjIwa
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:46:24 +0200 (CEST)
Received: from [172.22.22.61] (55d45cce.access.ecotel.net [85.212.92.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B60013151DA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:46:24 +0200 (CEST)
Message-ID: <5523A770.6030201@opendreambox.org>
Date: Tue, 07 Apr 2015 11:46:24 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1427274653.git.Qi.Chen@windriver.com>
	<9a54a9260aede9cf1842db3cd1244a1d4c247310.1427274653.git.Qi.Chen@windriver.com>
In-Reply-To: <9a54a9260aede9cf1842db3cd1244a1d4c247310.1427274653.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/2] util-linux: split util-linux-sulogin
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
X-List-Received-Date: Tue, 07 Apr 2015 09:46:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Chen Qi,

On 25.03.2015 10:11, Chen Qi wrote:
> [YOCTO #6698]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 10b14b3..d93505c 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -32,7 +32,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>               util-linux-mkfs util-linux-mcookie util-linux-reset \
>               util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
>               util-linux-partx ${PN}-bash-completion util-linux-hwclock \
> -             util-linux-findfs util-linux-getopt"
> +             util-linux-findfs util-linux-getopt util-linux-sulogin"
>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
>  
>  PACKAGES_DYNAMIC = "^util-linux-lib.*"
> @@ -96,6 +96,8 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
>  FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
>  FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
>  
> +FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
> +
>  # Util-linux' blkid replaces the e2fsprogs one
>  FILES_util-linux-blkid = "${base_sbindir}/blkid*"
>  RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
> @@ -173,7 +175,7 @@ ALTERNATIVE_PRIORITY = "100"
>  
>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
>  ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
> -ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject sulogin"
> +ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
>  
>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>  ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
> @@ -184,7 +186,6 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>  ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
>  ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
> -ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
>  
>  ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1 reset.1"
>  
> @@ -239,6 +240,9 @@ ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
>  ALTERNATIVE_util-linux-getopt = "getopt"
>  ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
>  
> +ALTERNATIVE_util-linux-sulogin = "sulogin"
> +ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
> +
>  BBCLASSEXTEND = "native nativesdk"
>  
>  python do_package_prepend () {
> 

I think you should add RDEPENDS_${PN} = "util-linux-sulogin". I didn't
check whether that was done for other split-out packages, but otherwise
people installing util-linux might miss sulogin in the future.

Regards,
Andreas

