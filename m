X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <99f030dc-85c4-3cd0-880b-8c5f2d15c91f@pr.hu>
Date: Tue, 4 Jan 2022 09:38:19 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] xserver-xorg: update to 21.1.2
References: <20211218205208.700161-1-open.source@oleksandr-kravchuk.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <20211218205208.700161-1-open.source@oleksandr-kravchuk.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, openembedded-core@lists.openembedded.org

2021. 12. 18. 21:52 keltezéssel, Oleksandr Kravchuk írta:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.2.bb}          | 2 +-

21.1.3 was released recently.

>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.2.bb} (92%)
> 
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
> similarity index 92%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
> index 196d1edff5..60c18c0a47 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
> @@ -3,7 +3,7 @@ require xserver-xorg.inc
>   SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>              file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
>              "
> -SRC_URI[sha256sum] = "782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd0363e1c2346ea755"
> +SRC_URI[sha256sum] = "c20bf46a9fe8e74bf4e75430637e58d49a02d806609dc161462bceb1ef7e8db0"
>   
>   # These extensions are now integrated into the server, so declare the migration
>   # path for in-place upgrades.
> 
> 
> 
> 
> 

