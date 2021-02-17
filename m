Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6067.1613560621072555687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 03:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WmthPZF9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id w4so1763028wmi.4
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 03:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pdvWjhy2O/zfIDUQQYb/IbFfnODpcszS6BUCPCuXbB8=;
        b=WmthPZF9UpxU/di7tj1tK55Do+PhdE8QYAvCmua4gT3kvhAhp9ZVBkiBR9nL8EYmtm
         N5MusphdOsvhIMhgvqU/7FPSo952/AKHO5Py+IqRt8MCk+5TE/UYCG4idtQTf2keYOfg
         pIDYK7SMQIfVArIAMYp3e9Z1WCVcu2FHBsZh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pdvWjhy2O/zfIDUQQYb/IbFfnODpcszS6BUCPCuXbB8=;
        b=dCtrBLBq762viVaT9boIIBquWvUbJ4Pa264WJ2yCN1Ok7mmkIxak1gjKp78WBH6grY
         bXoiKrsk4DIft8wQGK1rLvm1fUIrNvmER/zCZwtTa0CWVALJhppiyCV6wQNVyp63hTGH
         cHy37TTY5IO5G5wM+c8n6LaYmgn+mcaAS1M730t05LY1U/o8AowAcAMjo96O7u72bwog
         RcE4oIVAHej2rX6O8IKtFXfpENdH6v7WgFopDoYYTAHyL+s+SZP/LZeC+XaCd6qY7vhP
         9DMsOV2wdal6BsQthnuX4V6essyNq4psAWrA73K9Ab0DBYDfD+zlACsi8ZuSeF76j5Tw
         XJbg==
X-Gm-Message-State: AOAM530r2blzw31vDD1mn96Dx4DxW7RztCDNimSNRW5QOWvyfJL0cmWq
	otbkOBi3arcFrOmU0oMiDEAMXA==
X-Google-Smtp-Source: ABdhPJzhBvDr1ajHXMGQuRqRZqI9hA1TQfGBtE4M+kL3hahTTnvZreTkjIr9zfc+5ZIovPpj64L88g==
X-Received: by 2002:a1c:4e13:: with SMTP id g19mr6807885wmh.55.1613560619548;
        Wed, 17 Feb 2021 03:16:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:19d:cb66:14ba:c267? ([2001:8b0:aba:5f3c:19d:cb66:14ba:c267])
        by smtp.gmail.com with ESMTPSA id d5sm3349241wrp.39.2021.02.17.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:16:59 -0800 (PST)
Message-ID: <1312e9f5502bee8d7667c598ae4fc5b7de61830f.camel@linuxfoundation.org>
Subject: Re: [poky][PATCH v6] Update license file to match current SPDX names
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2021 11:16:58 +0000
In-Reply-To: <20201015204539.24549-1-idadelm@gmail.com>
References: <20201015204539.24549-1-idadelm@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-10-15 at 21:45 +0100, Meh Mbeh Ida Delphine wrote:
> Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.
> Added missing mappings.
> Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only.
> Added "or later" versions of license mappings
> Added "or later" versions of common license files eg GPL-2.0-or-later
> 
> Fixes: [YOCTO #13320]
> 
> Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>

I really want to get this issue resolved so I've queued this patch.
There is a comment below.

> Changes in V6:
>  * Added "or later" versions of common license files eg GPL-2.0-or-later in meta/files/common-licenses.
> 
> Changes in V5:
>  * Added "or later" versions of license mappings in meta/conf/licenses.conf
> 
> Changes in V4:
>  * Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only
> 
> Changes in V3:
>  * Added missing mappings to meta/conf/licenses.conf
> 
> Changes in V2:
>  * Corrected the email subject line.
[...]
>   #MPL variations
>  SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
>  SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
> +SPDXLICENSEMAP[MPL-1.0] = "MPL-1.0"
>  SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
> +SPDXLICENSEMAP[MPL-1.1] = "MPL-1.1"
>  SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
> +SPDXLICENSEMAP[MPL-2.0] = "MPL-2.0"
> +
>   #MIT variations
>  SPDXLICENSEMAP[MIT-X] = "MIT"
> @@ -48,33 +66,43 @@ SPDXLICENSEMAP[openssl] = "OpenSSL"
>  #PSF variations
>  SPDXLICENSEMAP[PSF] = "PSF-2.0"
>  SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
> +SPDXLICENSEMAP[PSF-2.0] = "PSF-2.0"
>  
>  #Python variations
> 
>  SPDXLICENSEMAP[Python-2] = "Python-2.0"
> +SPDXLICENSEMAP[Python-2.0] = "Python-2.0"
>  
>  #Apache variations
>  SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
>  SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
> +SPDXLICENSEMAP[Apache-2.0] = "Apache-2.0"
>  
>  #Artistic variations
>  SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
>  SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
> +SPDXLICENSEMAP[Artistic-1.0] = "Artistic-1.0"
>   #Academic variations
> 
>  SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
> +SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
>  SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
> +SPDXLICENSEMAP[AFL-1.2] = "AFL-1.2"
>  SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
> +SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
>  SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
>  
>  #CDDL variations
>  SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
>  SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
> +SPDXLICENSEMAP[CDDL-1.0] = "CDDL-1.0"
>   #Other variations
>  SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
> +SPDXLICENSEMAP[EPL-1.0] = "EPL-1.0"
>  
> 

>  #Silicon Graphics variations
>  SPDXLICENSEMAP[SGIv1] = "SGI-1"
> +SPDXLICENSEMAP[SGI-1] = "SGI-1"
> 

I removed the above pieces where the piece in [] is the same as the
value at the end. We don't need mappings where the two pieces are
identical. Everything else in the patch looked ok.

I also realised that we have recipes which reference some of the names
which have been renamed in LIC_FILES_CHKSUM entries. The following
files look to be affected:

meta/recipes-connectivity/connman/connman-conf.bb
meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
meta/recipes-core/systemd/systemd-serialgetty.bb
meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb	

I've queued a patch to fix these.

Cheers,

Richard


