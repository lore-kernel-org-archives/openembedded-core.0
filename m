Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A21C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:20:42 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.205991.1672327239192750606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XL7kgSHv;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id bq39so20114774lfb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 07:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrEncJ16XwKJHuD3lqnNE38aWQLxzITZWBtQ3aBQrUk=;
        b=XL7kgSHvpPCiNF4QpdaIzWG/3ryy6w6juHB9ba1n+MuCO/HgtvlKFJIsafvLKdHfi/
         5S4rA0oy82e0lKR2lMNg2XoHwABSB18vYyNFCCyK//PXLQ5WS+zcuz5DKQF43XDqjres
         MEZIuZoM7PxlFOCup8lYVkxzbClJev/jVu4GKkoUv76zE8+fOU28a1MbLWrJj3NRIBPT
         CFb0uW21G7DPMmeim0R0eZNvsU7YnzhQn3Z3sjvt4N9vjZ90gJ9AJwOAzK+bFdIK8teJ
         sFJAeX8h4cx3dsploxgDjriTWOu3jNUtqQbQiIDowYrMAwOw7Blh6rFjEvO6tWtCHead
         ZX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrEncJ16XwKJHuD3lqnNE38aWQLxzITZWBtQ3aBQrUk=;
        b=V5RtV7X0b0EeTMo5jKAgTvpYxi7oBbo6dnMlo3xa1b2NQ5gWM+bKy2oxaV515cA/pY
         dPL7LAb7seYrMtHMW2Wfs26HFkIGHTk41OAkABVeIEAdhbeJEjIIfatcZjwfzg7RgY74
         8lxYHREHhcIr0cShfR4xseRwCGlA/BaFqdFPJAnFHADdmugqiQgDtGqN6Fh67AmGOFmM
         PT3brQCFWjytAbORpZOnTb/5KAxjc6UeLpa3WRcDCK8cB88ryjRsSI15z+di6jlBkT2Q
         5ozpCn0QH1vdu3pPBtqIgqCIDxIJNcbxCONNjyOKIlNSPf6FwWgtdIdkCa7DWVusZxVe
         Xdzg==
X-Gm-Message-State: AFqh2kpky3AW/LbuuW2Idj4MrYGx+cyTa6UbFzb59UOcGmfMdSTglgnH
	sLhelm6K9wVUyjAPr3VQ38qCyw==
X-Google-Smtp-Source: AMrXdXtiZ58QouDnJNVf8tJ9TQP+6Ep8idf2DnDjwzTiL0VzsMtNN80ek7Y8UePPK2F06QfvMZyc1Q==
X-Received: by 2002:ac2:5982:0:b0:4b5:892:3987 with SMTP id w2-20020ac25982000000b004b508923987mr11389608lfn.9.1672327237542;
        Thu, 29 Dec 2022 07:20:37 -0800 (PST)
Received: from nuoska (85-76-48-196-nat.elisa-mobile.fi. [85.76.48.196])
        by smtp.gmail.com with ESMTPSA id m28-20020a056512015c00b004b580a526c3sm3111858lfo.295.2022.12.29.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 07:20:37 -0800 (PST)
Date: Thu, 29 Dec 2022 17:20:35 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
Message-ID: <Y62wQ3gdqXEFTB+/@nuoska>
References: <20221229151110.224320-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229151110.224320-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175104

Hi,

On Thu, Dec 29, 2022 at 04:11:10PM +0100, Markus Volk wrote:
> While updating gnome-control-center I encountered an issue where
> gtk-update-icon-cache could not be found and do_configure failed:
> 
> | Program glib-compile-schemas found: YES (glib-compile-schemas)
> | Program gtk4-update-icon-cache found: NO
> | Program gtk-update-icon-cache found: NO
> |
> | ../gnome-control-center-43.2/meson.build:298:6: ERROR: Program 'gtk-update-icon-cache' not found or not executable
> 
> This can be fixed by using DEPENDS:append instead of DEPENDS +=

Why? += and :append are applied differently and it is crucial to
understand why this is a problem in your case.

IMO it's bad design to use :append everywhere because the changes can't
be overwritten in a bbappend without explicitly removing all added
things with :remove. In upstream and intermediate layers it's best to
use += where ever possible since these can then easily be overwritten in
product specific layers with a simple assignment.

Cheers,

-Mikko

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/classes-recipe/gtk-icon-cache.bbclass | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-recipe/gtk-icon-cache.bbclass
> index 9ecb49916c..2096dcfcbb 100644
> --- a/meta/classes-recipe/gtk-icon-cache.bbclass
> +++ b/meta/classes-recipe/gtk-icon-cache.bbclass
> @@ -16,10 +16,11 @@ GTKIC_CMD = "${@ 'gtk4-update-icon-cache' if d.getVar('GTKIC_VERSION') == '4' el
>  inherit features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  
> -DEPENDS +=" ${@ '' if d.getVar('BPN') == 'hicolor-icon-theme' else 'hicolor-icon-theme' } \
> -            ${@ '' if d.getVar('BPN') == 'gdk-pixbuf' else 'gdk-pixbuf' } \
> -            ${@ '' if d.getVar('BPN') == d.getVar('GTKPN') else d.getVar('GTKPN') } \
> -            ${GTKPN}-native \
> +DEPENDS:append = " \
> +	${@ '' if d.getVar('BPN') == 'hicolor-icon-theme' else 'hicolor-icon-theme' } \
> +	${@ '' if d.getVar('BPN') == 'gdk-pixbuf' else 'gdk-pixbuf' } \
> +	${@ '' if d.getVar('BPN') == d.getVar('GTKPN') else d.getVar('GTKPN') } \
> +	${GTKPN}-native \
>  "
>  
>  PACKAGE_WRITE_DEPS += "${GTKPN}-native gdk-pixbuf-native"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175101): https://lists.openembedded.org/g/openembedded-core/message/175101
> Mute This Topic: https://lists.openembedded.org/mt/95937867/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


