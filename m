Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BE09279C0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 13:47:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9JDlfC6008439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 19 Oct 2018 14:47:42 +0100
Message-ID: <fa65fef901b5056d730703ce1c01a1594b2dc37c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan McGregor <danismostlikely@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 14:47:41 +0100
In-Reply-To: <20181018152215.23525-1-danismostlikely@gmail.com>
References: <20181018152215.23525-1-danismostlikely@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Fri, 19 Oct 2018 13:47:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-18 at 09:22 -0600, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> These are also provided by toybox in its default configuration,
> and can be turned on in busybox.
> 
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 3d8b3ff592c..2f99e8409f5 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -93,7 +93,7 @@ FILES_util-linux-findfs = "${sbindir}/findfs"
>  FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
>  FILES_util-linux-runuser = "${sbindir}/runuser"
>  FILES_util-linux-prlimit = "${bindir}/prlimit"
> -FILES_util-linux-ionice = "${bindir}/ionice"
> +FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
>  FILES_util-linux-su = "${bindir}/su.util-linux
> ${sysconfdir}/pam.d/su-l"
>  CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
>  
> @@ -209,7 +209,7 @@ ALTERNATIVE_${PN}  = " \
>      dmesg kill more mkswap blockdev pivot_root \
>      hexdump last lastb logger mesg renice wall \
>      setsid chrt flock utmpdump eject nologin taskset fallocate \
> -    fsfreeze nsenter \
> +    fsfreeze nsenter cal rev \
>  "
>  
>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
> @@ -218,8 +218,10 @@ ALTERNATIVE_LINK_NAME[more] =
> "${base_bindir}/more"
>  ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
>  ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
>  ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
> +ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>  ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
> +ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
>  ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
>  ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
>  
> @@ -293,8 +295,8 @@ ALTERNATIVE_LINK_NAME[mountpoint] =
> "${base_bindir}/mountpoint"
>  ALTERNATIVE_util-linux-unshare = "unshare"
>  ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
>  
> -ALTERNATIVE_util-linux-switch-root = "switch_root"
> -ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
> +ALTERNATIVE_util-linux-ionice = "ionice"
> +ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"


The rebase went wrong here. I'll try and fix this up in -next and
retest so we can figure out if switch_root really is broken (cc
Randy)...

Cheers,

Richard


