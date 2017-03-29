Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3493E77C14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id CCB8931E1F00;
	Wed, 29 Mar 2017 23:09:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id hyP849Uixesh; Wed, 29 Mar 2017 23:09:43 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A619BC.dip0.t-ipconnect.de
	[87.166.25.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AC4B231E12BE;
	Wed, 29 Mar 2017 23:09:43 +0200 (CEST)
Date: Wed, 29 Mar 2017 23:09:33 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20170329230933.3b71d516@t510.zcs.saftware.de>
In-Reply-To: <1490820317-3686-1-git-send-email-andrea.adami@gmail.com>
References: <1490820317-3686-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add whoami to HOSTTOOLS
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
X-List-Received-Date: Wed, 29 Mar 2017 21:09:46 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Mar 2017 22:45:17 +0200
Andrea Adami <andrea.adami@gmail.com> wrote:

> Spotted in log do_compile of linux:
> 
>  /tmp/build/tmp-glibc/work-shared/c7x0/kernel-source/scripts/mkcompile_h:
>  line 46: whoami: command not found

As an alternative, we could set KBUILD_BUILD_USER (and possibly
KBUILD_BUILD_HOST) to a fixed or machine-based value in kernel.bbclass'
EXTRA_OEMAKE variable, which could also improve the reproducibility of
builds.

Regards,
Andreas


> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 96a9ed9..4f67413 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -462,7 +462,7 @@ HOSTTOOLS += " \
>      mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
>      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sleep \
>      sort split stat strings strip tail tar tee test touch tr true uname uniq \
> -    wc wget which xargs \
> +    wc wget which whoami xargs \
>  "
>  
>  # Tools needed to run testimage runtime image testing


