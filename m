Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C27176F6F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 5008E314B067
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 22:04:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hYJUyOA7dnkM
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 22:04:36 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.239.58])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B8FDC314A281
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 22:04:36 +0200 (CEST)
Message-ID: <533C6D54.2040501@opendreambox.org>
Date: Wed, 02 Apr 2014 22:04:36 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1396451750-10888-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1396454510-5744-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1396454510-5744-1-git-send-email-Matthieu.Crapet@ingenico.com>
Subject: Re: [PATCH v2] rootfs.py: introduce USE_DEVFS check
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
X-List-Received-Date: Wed, 02 Apr 2014 20:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Matthieu,

On 02.04.2014 18:01, Matthieu Crapet wrote:
> Since commit a83144bac8d67704ff66f5dc0fc56f5b63979694 (2014-02-11), USE_DEVFS is not considered anymore.
> For compatibility, let's restore USE_DEVFS semantic.
> Also add USE_DEVFS to documentation.conf.
> 
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta/conf/documentation.conf | 1 +
>  meta/lib/oe/rootfs.py        | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 4d49a02..315e1b5 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -436,6 +436,7 @@ UBOOT_MACHINE[doc] = "Specifies the value passed on the make command line when b
>  UBOOT_MAKE_TARGET[doc] = "Specifies the target called in the Makefile."
>  UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
>  UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
> +USE_DEVFS[doc] = "When building images, specifies to populate or not ${sysconfdir}. This variable defaults to '1' (leave directory empty, surely because devtmpfs do the job). Set it to '0' to use makedevs (or consider using a custom file with IMAGE_DEVICE_TABLES)."

${sysconfdir} usually contains /etc, not /dev.

Regards,
Andreas

