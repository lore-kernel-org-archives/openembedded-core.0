Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0AD600E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B4FED31C698A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:23:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id wjhhsiQmBcoR
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:23:48 +0100 (CET)
Received: from t510.zcs.saftware.de (55d41ba8.access.ecotel.net
	[85.212.27.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2EC4C31C698B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:23:48 +0100 (CET)
Date: Mon, 30 Jan 2017 23:23:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170130232347.7389329e@t510.zcs.saftware.de>
In-Reply-To: <1480542646-26954-1-git-send-email-obi@opendreambox.org>
References: <1480542646-26954-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] gptfdisk: fix support for 'large' drives
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

On Wed, 30 Nov 2016 22:50:45 +0100
Andreas Oberritter <obi@opendreambox.org> wrote:

> Make's switch '-e' replaced important compiler flags from the
> project's Makefile, i.e. -D_FILE_OFFSET_BITS=64.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
> index 8fab28f..d62a903 100644
> --- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
> +++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "864c8aee2efdda50346804d7e6230407d5f42a8ae754df70404dd8b2fd
>  UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
>  UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
>  
> -EXTRA_OEMAKE = "-e MAKEFLAGS="
> +EXTRA_OEMAKE = "'CC=${CC}' 'CXX=${CXX}'"
>  
>  do_install() {
>      install -d ${D}${sbindir}


