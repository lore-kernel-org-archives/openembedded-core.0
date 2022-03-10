Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03BCC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 10:11:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7887.1646907086436470676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TEForVmb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k24so7123061wrd.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MR0Moz24Ztoz9HhnU5UkSopLf6AMgn1V+e19u8oLVw4=;
        b=TEForVmb4F1WsYWjfyOuDwSnXUIhkGRvgSHN+GxA9Wrct8bop7OzMwu7gFVwi1tnnp
         VIzKBzlYNY8RBzQhJKEw/Y9FJWuyAcfskCy6X043/DscmEJ5aP9D0SfNq/FrRscQzPz2
         oaz3fKA0qQGquDxEknWe1IGexXgplM5CsecC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MR0Moz24Ztoz9HhnU5UkSopLf6AMgn1V+e19u8oLVw4=;
        b=NFnQFO3cOl640+/CQRLXq9R6rhAFVTAhlwp4PP4TsnO27JWXg4ipVu0F9tL4C0udOT
         22qWdRSPNukcXE7rR63O7lwAW/abtB2qiCuAD01Qzq55OplSSXu3MkVA6S1nMJj60bG/
         EgWdHM+XrFlG+rUo6TfsiTedlOSYJxpgx21SRUiD+rJ/1L9Z637gj3fMp9pD/HtgVKQq
         ychfJtPHKQ3gjkOK1/svUJW0vgFP0RlNtFKXoz7Y/DLPElt9IJ2FWpF6af/M64Z1M5tc
         LUDrnUA6dYRuBq1mxZj3twS94odlRuGrg/yKk6Xmuncec7u8G1qhKK1Q6fqgCynYzdkC
         xEBA==
X-Gm-Message-State: AOAM533K0jY9K8Cn9NVnKxkaZMo/rw7rgFvuZ9xtiRkQeqcqE8d78IJB
	96OwwdCwQyPNcZZNLZ/KNxmTXw==
X-Google-Smtp-Source: 
 ABdhPJz0XYWHSR7cPSr/pztws37Z99u52zgh5OIVxw8/RTH6YQXbGLhbkxxb6174oAGzEQ7PU4KZfA==
X-Received: by 2002:a5d:5746:0:b0:1ea:9643:92ac with SMTP id
 q6-20020a5d5746000000b001ea964392acmr2919827wrw.597.1646907084923;
        Thu, 10 Mar 2022 02:11:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4dd4:e08f:40b6:a45e?
 ([2001:8b0:aba:5f3c:4dd4:e08f:40b6:a45e])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm3717750wrx.47.2022.03.10.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 02:11:24 -0800 (PST)
Message-ID: 
 <37dadffea7d833f128aacd1454f7bbfaae4c8563.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] overlayfs: add systemd unit path prefix to
 FILES:${PN} array
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Claudius Heine <ch@denx.de>, openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Thu, 10 Mar 2022 10:11:02 +0000
In-Reply-To: <20220309142946.3028564-1-ch@denx.de>
References: <20220309142946.3028564-1-ch@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 10:11:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163007

On Wed, 2022-03-09 at 15:29 +0100, Claudius Heine wrote:
> The 'FILES:${PN}' array is missing the systemd unit dir prefix causing
> them to not be packaged and the build fails with the
> `installed-vs-shipped` error.
> 
> This adds the `systemd_system_unitdir` variable in front of every unit
> file added with this class.
> 
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>  meta/classes/overlayfs.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> index 4a860f7308..f525ea6625 100644
> --- a/meta/classes/overlayfs.bbclass
> +++ b/meta/classes/overlayfs.bbclass
> @@ -103,7 +103,8 @@ python () {
>      unitList = unitFileList(d)
>      for unit in unitList:
>          d.appendVar('SYSTEMD_SERVICE:' + d.getVar('PN'), ' ' + unit)
> -        d.appendVar('FILES:' + d.getVar('PN'), ' ' + strForBash(unit))
> +        d.appendVar('FILES:' + d.getVar('PN'), ' ' +
> +		d.getVar('systemd_system_unitdir') + '/' + strForBash(unit))
>  
>      d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
>  }

I have to wonder how this is being tested since this patch injects tabs into a
python function and that triggers warnings about tabs in python code.

That caused selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3227
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3240
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3271

I've tweaked the patch to fix the whitespace here and in the other patch but I
notice more patches on the list also with what I suspect are whitespace issues.

Cheers,

Richard



