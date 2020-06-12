Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.401.1592007983968044231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 17:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TVgpbzCH;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id ga6so4313025pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 17:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:organization:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qVClWFr9rt58BxoN2C31BVFn0ZHG10Qt/b5BxwzH/rU=;
        b=TVgpbzCHzfETEYsmK+45wp5U033ASElgNsemV7x86cwmOUX/D86MEmK8Uf/abp25pe
         WDfC0f1cPtsZVqGVU4DW0dro6dEpIpdySaK9WSTMlR4sHC7WRZ0vofqm2zNwNturi+TO
         MzqNihaB23JhmLdZ5FAEq08Fjzp0R6f+QgGWVF0BgBrKPZyGmZTi/PSCb9xB1LNvvlSm
         v9c6ficj9speaSP+XnAdfgZubQBLyIMBzI1/1nPCz7an+Sv6l7+q3eoEJLwmEYiKCIWf
         iWBIJx7u6WF11YAEFdnRqGQCLtDuh/0QyW06d6ApdioMdWgYO5KxlzVesCuSWchqRFse
         7s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=qVClWFr9rt58BxoN2C31BVFn0ZHG10Qt/b5BxwzH/rU=;
        b=uJeSVqej+B+sgNrjK4rfFOA4codlwW9FkbUO74Jh4xgE/CzwBv3cPnV9A55MbWyaLh
         MqvlOfBVhg1pQ3A59CCaiA0A2DzqRDjfItD5RgHDZlqMHD8hGVQ01CirtWhKSB5o7LDR
         AlLpn2J1QXtK2XLoLwBnrgGvm+Tj7OLROeguMi7ja6IMTdDHswpz1Z68Z0WJ2RSURJK5
         2ux67sY3k5sj2gKcGXjdH/8a1jsvy0qKE0fjho64yu6UINrmVatPBB84dZ2QPJgRZsgP
         KEdgHKYGSbnXOs+m6cp1K3FpLe4Tv7Bve/sXZw8sxprNVJJwG+dJ2vgDTUazMjfDaFFM
         t5EA==
X-Gm-Message-State: AOAM533AG1LIejMfX/7oKYmYVX4qkELhXKfnxQvsXh0klaallFUXizwv
	p11AYinkbkyr2eSozeGpaipUBMwazjw=
X-Google-Smtp-Source: ABdhPJyzdO3rJZnpUErznA/BJGVvJx25uxmHndljG4o0XrVBjuwHjUspBBvhC8zjE/2m9XhSoGdUYg==
X-Received: by 2002:a17:902:70c3:: with SMTP id l3mr12429777plt.276.1592007983061;
        Fri, 12 Jun 2020 17:26:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from tyche.localnet ([2601:646:9200:4e0::96b0])
        by smtp.gmail.com with ESMTPSA id y23sm6245322pgc.78.2020.06.12.17.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 17:26:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Otavio Salvador <otavio.salvador@gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: Split out zramctl in a specific package
Date: Fri, 12 Jun 2020 16:56:50 -0700
Message-ID: <3337028.jk9WjbSPrm@tyche>
Organization: HIMVIS
In-Reply-To: <20200612204531.1119475-1-otavio@ossystems.com.br>
References: <20200612204531.1119475-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, June 12, 2020 1:45:30 PM PDT Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/recipes-core/util-linux/util-linux.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc index 532cceb935..e3ef558d7e
> 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -270,6 +270,7 @@ ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
>  ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
>  ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
>  ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
> +ALTERNATIVE_LINK_NAME[zramctl] = "${sbindir}/zramctl"
> 

is this sufficient to create it into an independent package ? or do we need to 
add it to PACKAGES too ?

>  ALTERNATIVE_${PN}-doc = "\
>  blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1
> mesg.1 \




