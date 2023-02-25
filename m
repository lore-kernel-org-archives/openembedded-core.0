Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0E5C6FA8E
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 13:17:38 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.43310.1677331053699905878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 05:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ptZw0E5S;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id c18so2227406qte.5
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 05:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p2smvwi3og37uM9WEgBeTQZk7qY4jD+mkH02eIlZkg=;
        b=ptZw0E5S4BQcuPZiv4M5dS2z7Ql2a6gj06nxMfMPhrGFBHDmjFQW+WRpodMV3nRf1W
         LbBYVPy4lz0ShgYvpn1OILeejJix7Ejx5PVOtfl3i/OmfYlLE/2k2dt9K5i8N9DODuUX
         XWLvxfq61KSEMZvb0l9yrDZmIkN5U4+u8vNAzQYgNsytkE4/+KINzlZtWc8nBnmMj4WA
         P4rIzMGHYcagFMpaNxJWKcBev+9dtQPc0VxWBbmoLWO8h5ot1a4VSZzuoUdmLuRXBx+B
         DNKgB+N/k+xBcpQq1QZnvXhejKoB6XVEYFXPJ11S9rIwu0+T+daGm499pTdKTbpfpJWD
         cS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p2smvwi3og37uM9WEgBeTQZk7qY4jD+mkH02eIlZkg=;
        b=W+b4sKfJ1+Hg6l8s1Cn+e0kKSFLlbPWdRXQDaphXugkCS6skkm31yvZU40b1SMDNDC
         cqKDORJdhnnrkRuN+Pt0MI0PCidsKRrb0tPFI53uCCvUU6uJgGRNyIeBG2KNEvgSQWpN
         ONLwTRyRpF698hxSziZ3B01uhiqAqgrjLVdJ/m5rIpMlGgFOtjwfLSrifAQMPyKCsVh5
         qtJ48sIHc7xL2ikPiocErdysSn+Jf2C0S7w74Pf1vrd/eBrRxRqFJs8yPcTKjwu8/zJm
         zFySvI5VFwlGbz73oH7p+F06Nc6qmBVWAy2s8JV0U3BlovdoN2jXnE8G2XqShj9lZBkz
         gcFg==
X-Gm-Message-State: AO0yUKUhD8KeeNcxx5gm8CB2CFEffAhrEsrw6C7O+bNNZuDzEFBTpR7/
	U2BDUlBb1HX39Fvg7lSxh1Y=
X-Google-Smtp-Source: AK7set+wDtiWwV6QN9JIz+sAW5i45F/5whpBhJt68rbrQ/2P+zVSA82VYK7nUJBZi5h9GwI4t7bNcA==
X-Received: by 2002:a05:622a:1389:b0:3b9:a4fe:e86c with SMTP id o9-20020a05622a138900b003b9a4fee86cmr31744125qtk.16.1677331052693;
        Sat, 25 Feb 2023 05:17:32 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ay6-20020a05620a178600b00742663a2019sm1197980qkb.76.2023.02.25.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 05:17:31 -0800 (PST)
Date: Sat, 25 Feb 2023 08:17:30 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 03/11] build-appliance-image: add support for
 qemu
Message-ID: <20230225131730.GA7583@localhost>
References: <20230221204445.23931-1-twoerner@gmail.com>
 <20230221204445.23931-4-twoerner@gmail.com>
 <eb51a596433feb6d1e7c80584adce82f4503339b.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb51a596433feb6d1e7c80584adce82f4503339b.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 13:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177718

On Fri 2023-02-24 @ 04:05:22 PM, Richard Purdie wrote:
> On Tue, 2023-02-21 at 15:44 -0500, Trevor Woerner wrote:
> > Add ext4 explicitly to the list of IMAGE_FSTYPES so the build appliance can be
> > run with runqemu.
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > index 064e7a1ed82f..e28096758b9b 100644
> > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > @@ -1,5 +1,5 @@
> >  SUMMARY = "An image containing the build system itself"
> > -DESCRIPTION = "An image containing the build system that you can boot and run using either VirtualBox, VMware Player or VMware Workstation."
> > +DESCRIPTION = "An image containing the build system that you can boot and run using any of qemu, VirtualBox, VMware Player or VMware Workstation."
> >  HOMEPAGE = "http://www.yoctoproject.org/documentation/build-appliance"
> >  
> >  LICENSE = "MIT"
> > @@ -20,7 +20,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
> >  APPEND += "rootfstype=ext4 quiet"
> >  
> >  DEPENDS = "zip-native python3-pip-native"
> > -IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
> > +IMAGE_FSTYPES = "ext4 wic.vmdk wic.vhd wic.vhdx"
> >  
> >  inherit core-image setuptools3
> >  
> 
> I've held off this one since whilst it isn't wrong as such, the ext
> images aren't exactly optimal. I think our hope was that we could use
> the vmdk or vhdx images with qemu instead and then directly test the
> ones we publicly share. Do you know if that could work? It may then
> mean people don't need to handle multiple files too?

Okay, I'll take a look.

I did try the vmdk image and was surprised it didn't work. Then I noticed this
piece of code in the recipe:

	IMAGE_CMD:ext4:append () {
		# We don't need to reserve much space for root, 0.5% is more than enough
		tune2fs -m 0.5 ${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.ext4
	}

	https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/images/build-appliance-image_15.0.0.bb#n39

and assumed ext4 was either an implicit or explicit artifact in the past.

