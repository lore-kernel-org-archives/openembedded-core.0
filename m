Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 322B47570D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 05:37:07 +0000 (UTC)
Received: by iofz202 with SMTP id z202so46216721iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l40/KtSr6Sz6ClRltCbM7BB7DmeG1ftVb1VObmxRNGY=;
	b=bBHxZTQTPSbISSeBmUAnuvwD/Ldpln+53Wjzv2nRlDfgRklAbsTi94hdX8UpwyWac4
	dBQ4UAhKEpWhWOFbxO36nu6tbvxUkTNRNWLpg2MaiGdpborUM9Y3WUGXq1n3FLexgvSm
	VNj4toz1JfGLVsflhoQ5Z0y9EFb13GDQKLkHL+0vsi/79EPM2FDdYwZ+fxZwo4FVEqrg
	XNgAhkYc2nWBTXRbnHfwK1qjB/l+ILXE0ij6xGKMDdvcyef4HYCBYXHNX/U4Z0lgv7Hs
	Vecw0Dkzg+MTWTM3YTu9bp3711rVSrHDpJSFJ7l/ESjDoj1xfYx0n9AhdN0sNdUr6f1G
	/vEw==
X-Received: by 10.107.34.149 with SMTP id i143mr9117925ioi.195.1445405827717; 
	Tue, 20 Oct 2015 22:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Tue, 20 Oct 2015 22:36:38 -0700 (PDT)
In-Reply-To: <1445402033-28721-1-git-send-email-armccurdy@gmail.com>
References: <1445402033-28721-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Oct 2015 22:36:38 -0700
Message-ID: <CAMKF1sq4T-MPZPNVxSvpJP1CEYqsGqQsx6EMieOP3A2LMucKnQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image-mklibs.bbclass: update i586 TARGET_ARCH test to also handle i686
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
X-List-Received-Date: Wed, 21 Oct 2015 05:37:08 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 20, 2015 at 9:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/image-mklibs.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
> index c455a8e..d5f668c 100644
> --- a/meta/classes/image-mklibs.bbclass
> +++ b/meta/classes/image-mklibs.bbclass
> @@ -25,7 +25,7 @@ mklibs_optimize_image_doit() {
>                 x86_64)
>                         dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
>                         ;;
> -               i586 )
> +               i586 | i686 )

i*86 once for all

>                         dynamic_loader="${base_libdir}/ld-linux.so.2"
>                         ;;
>                 arm )
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

