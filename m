Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTGzv-00026x-2p for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 18:52:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANHk8rU015224
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 17:46:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14626-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 17:46:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANHjwAo015218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 17:45:59 GMT
Message-ID: <1322070364.15626.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 17:46:04 +0000
In-Reply-To: <1322035877-18151-1-git-send-email-msm@freescale.com>
References: <1322035877-18151-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] rpm_5.4.0.bb: Add xz as rpm DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2011 17:52:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-23 at 02:11 -0600, Matthew McClintock wrote:
> This fixes the following issue:
> 
> Log data follows:
> | NOTE: Creating RPM package for perf-dbg
> | NOTE: Creating RPM package for perf
> | NOTE: Creating EMPTY RPM Package for kernel
> | NOTE: Creating EMPTY RPM Package for kernel-3.0.9-00348-gec4b357
> | NOTE: Creating RPM package for kernel-image-3.0.9-00348-gec4b357
> | NOTE: Creating RPM package for kernel-dev
> | NOTE: Creating RPM package for kernel-vmlinux
> | NOTE: Not creating empty RPM package for kernel-misc
> | NOTE: Creating RPM package for kernel-devicetree
> | NOTE: Creating RPM package for kernel-module-libcrc32c
> | NOTE: Creating RPM package for kernel-module-crc-itu-t
> | NOTE: Creating RPM package for kernel-module-sctp
> | NOTE: Creating RPM package for kernel-module-pcbc
> | NOTE: Creating RPM package for kernel-module-crc32c
> | NOTE: Creating RPM package for kernel-module-binfmt-misc
> | NOTE: Creating RPM package for kernel-module-nfsd
> | NOTE: Creating RPM package for kernel-module-exportfs
> | NOTE: Creating RPM package for kernel-module-msdos
> | NOTE: Creating RPM package for kernel-module-nls-utf8
> | NOTE: Creating RPM package for kernel-module-udf
> | NOTE: Creating RPM package for kernel-module-isofs
> | NOTE: Creating RPM package for kernel-module-usbhid
> | NOTE: Creating RPM package for kernel-module-scsi-wait-scan
> | NOTE: Creating EMPTY RPM Package for kernel-modules
> | /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/sysroots/x86_64-linux/usr/bin/rpmbuild.real: error while loading shared libraries: liblzma.so.5: cannot open shared object file: No such file or directory
> | ERROR: Function 'BUILDSPEC' failed (see /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/work/p4080ds-fsl-linux/linux-qoriq-sdk-3.0.6-r2/temp/log.do_package_write_rpm.18943 for further information)
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)DISTRO_FEATURES_BACKFILLCONSIDERED
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> index 356512a..87fb833 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> @@ -42,10 +42,10 @@ HOMEPAGE = "http://rpm5.org/"
>  LICENSE = "LGPL 2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
> -DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
> +DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt xz ${extrarpmdeps}"
>  extrarpmdeps = "python perl"
>  extrarpmdeps_virtclass-native = "file-native"
> -PR = "r22"
> +PR = "r23"
>  
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>  # in order to extract the distribution SRPM into a format we can extract...

If we don't need xy (we don't as far as I know?), could we just disable
it instead? 

Cheers,

Richard






