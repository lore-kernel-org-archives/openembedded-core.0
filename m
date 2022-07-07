Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2EBC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:20:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.3213.1657182051276875795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gelUQ4PX;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id y4so8800996edc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PQjo83VidKiR0j6ReApLbnX91LvsGvP4ESdus3pcOUE=;
        b=gelUQ4PXwgBN/5i46dhA18u3eEWaCCCvILB8NSYOuxHGB1Wi1tAX5VG8hQf6Wm6dQX
         j/LzrwrLUYIqF10VRqKSnj36ARoqni44bh/Fn4Z+wUaMdaU1D1gLr1D02uXRw0qlkMpC
         2GkPMnsK8B5oSug+ThN7W3ZOV9g7KT9v0Pvvocz6K++brXe3yZoUBUc+a+67Ejb9i9QR
         bmAybZ2duR9H5KzdicSBHumSlPXHq0fapJNsn1kJZKOshbcN3huGFsLPHjlM35v7/6Nj
         PStC/nnqDLTNitxJgGzWSdbjyXNqTYWHAGAUKg+SObkXOvhlidDDql9NDER3nhIXxqHp
         Y5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PQjo83VidKiR0j6ReApLbnX91LvsGvP4ESdus3pcOUE=;
        b=Ji/37+TGgwEtEayHTpqvy2D0eq3eWkF2fh6D09XBJYLs3rfp4n/gdfRfj+T6YRC9yC
         IUg5Exb9huuTUL+GJQLAYNUhgW6exsyBaujVBEm0ux3EkRj1N1bQJ4vPNio8pOKoEmqr
         Jfjn3rvsBzgXVIPRxYmm4SxQzICqt8qTZrv9lvzk8yz3ymLTO/uhuyJG8I0ib35EdZUV
         mmLS6mtABzSYvtmjTbYKDAUsHOttbC5xREmTPNcHqbDtCj69cKmEQtMs35tfw1T9O9O5
         bwgd/e3WWXmRmLAy+DzlD6xy80OgeeBCgDtfbXgt/4uvcUK/Bg0xA/dVJHbfO/ov5B3I
         Xb8w==
X-Gm-Message-State: AJIora9ZfC7YvXbBWMUSpMvuqgo8dvqd/eeaV4va3ZFhza8uuvzVXi7q
	SC8p1QKTYIAleqLtGzGpMaWH+C+3y5n1aLjL
X-Google-Smtp-Source: 
 AGRyM1vimKWSMgWjLOQo4cuWB1KCvpwb9FzZnaElGq3OCqlLMWwfTFhi3gH8XGoIkQXHJXeTNOXsMw==
X-Received: by 2002:a05:6402:194f:b0:43a:298f:f39c with SMTP id
 f15-20020a056402194f00b0043a298ff39cmr31513537edz.106.1657182049512;
        Thu, 07 Jul 2022 01:20:49 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0072b16a57cdcsm55491ejt.118.2022.07.07.01.20.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:20:49 -0700 (PDT)
Message-ID: <8a4953cd2019ce07a5288db4c0ced8c782eccecd.camel@gmail.com>
Subject: Re: [meta-oe][master][PATCH 0/2] modemmanager update
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 07 Jul 2022 10:20:48 +0200
In-Reply-To: <20220707081704.2494733-1-adrian.freihofer@siemens.com>
References: <20220707081704.2494733-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 08:20:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167761

Just realized that this went to the wrong mailing list, sorry. Please
ignore.

On Thu, 2022-07-07 at 10:17 +0200, Adrian Freihofer wrote:
> Update modemmanager and libqmi to latest stable.
> 
> Adrian Freihofer (2):
>   libqmi: upgrade 1.30.4 -> 1.30.8
>   modemmanager: upgrade 1.18.8 -> 1.18.10
> 
>  .../libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb}               | 2 +-
>  .../{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb}         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb} (95%)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb} (97%)
> 


