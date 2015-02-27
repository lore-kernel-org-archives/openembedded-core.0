Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8402F605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 19:44:36 +0000 (UTC)
Received: by iecrl12 with SMTP id rl12so33606841iec.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 11:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QKICHj02/usGAthN+01bldrhBdgec1JG0E1ue2EOAj4=;
	b=imNbNUpWHy/Yfb8rKHSD/hU4AeLxnGGkurDGhpYShjcBfgMrkssx+y2zShFNbsbEGK
	as3J+SY48CNDJasbaGZ7bLKyDu4WgsROM7kVkzx4QmRuqGrIbDoO8NtyKJBRNNoChpgg
	Pw0eHElPrsaSCRbNJ5R1QM5kSsSVaBulmBMBmXYse8TstDldmsgAtzeD/wUTqn+FFFmh
	SbGOVrStbybfGSONtuhNAEjs0bhxRe9eFRHMnojVnJr0DMJqXhKxVX+HS+dTufL+3rLe
	CNdUwrNOj6q/FnKlny5qJCH50dPuUfo82O/CvoF2xeFP9HZGRPaTzinwtFz1VGj3mPda
	IF0Q==
MIME-Version: 1.0
X-Received: by 10.50.79.230 with SMTP id m6mr6377504igx.33.1425066277510; Fri,
	27 Feb 2015 11:44:37 -0800 (PST)
Received: by 10.64.123.2 with HTTP; Fri, 27 Feb 2015 11:44:37 -0800 (PST)
In-Reply-To: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
References: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
Date: Fri, 27 Feb 2015 20:44:37 +0100
Message-ID: <CAC1BbcSzdugU3LkehYOyAMHyK6ZCjbfk6iScNLaphjazKPeVvQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] sato: fix typo in packagegroup
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
X-List-Received-Date: Fri, 27 Feb 2015 19:44:41 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2015 at 15:14, Ross Burton <ross.burton@intel.com> wrote:
> The gtk-play binary is packaged in gst-player-bin...

core-image-sato fails to build, so please consider merging as it sound
like it should fix that inconvenience..

TIA,
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index fa9a261..18d8b16 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -49,7 +49,7 @@ WEB ?= ""
>  SUMMARY_${PN}-apps = "Sato desktop - applications"
>  RDEPENDS_${PN}-apps = "\
>      leafpad \
> -    gtk-play \
> +    gst-player-bin \
>      x11vnc \
>      matchbox-terminal \
>      sato-screenshot \
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

