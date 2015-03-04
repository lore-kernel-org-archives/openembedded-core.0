Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2506C60144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 16:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t24GnKwa009827; Wed, 4 Mar 2015 16:49:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vejx1dqADc2O; Wed,  4 Mar 2015 16:49:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t24Gn8i3009813
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 4 Mar 2015 16:49:19 GMT
Message-ID: <1425487748.26813.105.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>
Date: Wed, 04 Mar 2015 16:49:08 +0000
In-Reply-To: <1425389491-31479-1-git-send-email-net147@gmail.com>
References: <1425389491-31479-1-git-send-email-net147@gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-devsrc: avoid splitting debug info
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
X-List-Received-Date: Wed, 04 Mar 2015 16:49:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-03-04 at 00:31 +1100, Jonathan Liu wrote:
> This fixes "QA Issue: non debug package contains .debug directory"
> for some kernels.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index e36de1b..c3cad05 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -72,3 +72,4 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>  PACKAGES = "kernel-devsrc"
>  FILES_${PN} = "${KERNEL_SRC_PATH}"
>  RDEPENDS_${PN} = "bc"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

Why would your kernel source directory contain built binaries? I guess
I'd like to understand more about what "some kernels" are doing
differently.

Cheers,

Richard


