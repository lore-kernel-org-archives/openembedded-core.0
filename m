Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE4071D9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0AAB431C698F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:24:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 80rx07kPeyg0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:24:01 +0100 (CET)
Received: from t510.zcs.saftware.de (55d41ba8.access.ecotel.net
	[85.212.27.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BCD1931C698E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:24:01 +0100 (CET)
Date: Mon, 30 Jan 2017 23:24:00 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170130232400.17657d3c@t510.zcs.saftware.de>
In-Reply-To: <1480542646-26954-2-git-send-email-obi@opendreambox.org>
References: <1480542646-26954-1-git-send-email-obi@opendreambox.org>
	<1480542646-26954-2-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] gptfdisk: put sgdisk into its own package
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

On Wed, 30 Nov 2016 22:50:46 +0100
Andreas Oberritter <obi@opendreambox.org> wrote:

> This allows to avoid pulling in ncurses if only sgdisk is needed.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
> index d62a903..047aa97 100644
> --- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
> +++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
> @@ -23,4 +23,10 @@ do_install() {
>      install -m 0755 fixparts ${D}${sbindir}
>  }
>  
> +PACKAGES =+ "${PN}-sgdisk"
> +
> +RRECOMMENDS_${PN} = "${PN}-sgdisk"
> +
> +FILES_${PN}-sgdisk = "${sbindir}/sgdisk"
> +
>  BBCLASSEXTEND = "native nativesdk"


