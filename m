Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4F17048E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 20:43:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s69KhCjV019875; Wed, 9 Jul 2014 21:43:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vEEj_g830LVR; Wed,  9 Jul 2014 21:43:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s69Kh4xe019860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 9 Jul 2014 21:43:06 +0100
Message-ID: <1404938578.15985.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Roxana Ciobanu <roxana.ciobanu@intel.com>
Date: Wed, 09 Jul 2014 21:42:58 +0100
In-Reply-To: <fc1e780d3862d570820104c388a20e2b6d832c89.1404896873.git.roxana.ciobanu@intel.com>
References: <cover.1404896873.git.roxana.ciobanu@intel.com>
	<fc1e780d3862d570820104c388a20e2b6d832c89.1404896873.git.roxana.ciobanu@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add ROOTFS_POSTPROCESS_COMMAND to rootfs[vardeps]
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
X-List-Received-Date: Wed, 09 Jul 2014 20:43:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-09 at 12:08 +0300, Roxana Ciobanu wrote:
>     Changes to ROOTFS_POSTPROCESS_COMMAND require the rootfs
>     for the image to be rebuilt.
> 
>     [YOCTO #6502]
> 
> Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index a03b880..e088bdb 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -75,7 +75,7 @@ LDCONFIGDEPEND_libc-musl = ""
>  do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
>  do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
>  do_rootfs[recrdeptask] += "do_packagedata"
> -do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
> +do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS ROOTFS_POSTPROCESS_COMMAND"
>  
>  do_build[depends] += "virtual/kernel:do_deploy"

Are there other variables we look at in the rootfs process we also need
to list here?

As background, the move to lib/oe has moved the variables outside the
scope of bitbake's function parsing code so we need to handle that
manually now...

Cheers,

Richard


