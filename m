Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id C25586017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 18:33:48 +0000 (UTC)
Received: by ykp131 with SMTP id 131so6780040ykp.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=JusA4MzxmjiIkLvE4bfY7se7C2hNdmziNVvGxE/Uw9M=;
	b=qURHvWd5thSljAhp9NjqI7DunVPF5PAj/Twc2wSFdViqJQbcG3FR62hSzvUghOzZtq
	d4hgpjbJt85W6ItR5G8250Y7z7hk7Omtp1Kf7dMwdsW11e1BeTt+tM6jk/4cLgTKEfYZ
	Z046V0z826uLluNK8Y7jyL+lPK4jJ2eiAcUs50SaRmMJYdFDis2+Ug97sYFLOnlOQmn7
	+jl055xb6Yk47PvCNp2ie/kHu9MF/sEZsImDn4bp8cFwnh22w3HgrS4BdQM/7IhZOSpX
	wdBC5TLeWkAF8+ffbuc+u6pv2gwzNNVBi6kJzeO6GBCZKzetQHCKPTPMKg5mu+40+PYD
	resw==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr13766471yho.104.1425666829518;
	Fri, 06 Mar 2015 10:33:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Fri, 6 Mar 2015 10:33:49 -0800 (PST)
In-Reply-To: <1425614247-20219-1-git-send-email-B40290@freescale.com>
References: <1425614247-20219-1-git-send-email-B40290@freescale.com>
Date: Fri, 6 Mar 2015 15:33:49 -0300
X-Google-Sender-Auth: nmblSw56V71v4roer37lxV5-Dc8
Message-ID: <CAP9ODKpGNP3Pm-YHPZEG0hEMxabvE6Mft91Npic+jdFVKbfGHw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: fix rename image error
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
X-List-Received-Date: Fri, 06 Mar 2015 18:33:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 6, 2015 at 12:57 AM, Chunrong Guo <B40290@freescale.com> wrote:
>   Resolve mismatch between U-Boot configs and uboot image name.
>   The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
>   and repeat compile or install so we need to check if ${type} match ${config} .
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 51 ++++++++------------------------------
>  1 file changed, 11 insertions(+), 40 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 6bdc86a..b514893 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -63,18 +63,13 @@ do_compile () {
>                 echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
>         fi
>
> +

Spurious new lines, please drop.

I will give it a go and see if I see any other issue.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

