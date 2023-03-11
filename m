Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EDFC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 08:03:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.41190.1678521805468483887
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 00:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XAqpDgEi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id h11so7057161wrm.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678521804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hecPDJdLHNGt4Ip3Tyzpg4x42r/GXULXO+iiVLs6pIY=;
        b=XAqpDgEimHZBzu8qmCqpgXdXkbbXTAVcq2fSlchwwflQpK+9UWCix0CTGKCfD9RRt2
         dPvFs3SEoS/PxBqWge4SdOCFgXNQM1f+SMyXNQgawKDiFEvT0F2s/4kOTPISSvYY96r0
         RmWtfPEKIJdZR66KSyCXW5u82ZpGFHXUIQ61c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678521804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hecPDJdLHNGt4Ip3Tyzpg4x42r/GXULXO+iiVLs6pIY=;
        b=rxA6WYTwqN+qF4SjVp0wjk0ReAczfPGcNYjXgZ83hMkjlBnJD+BEc6OEBWpnZHQT0L
         HJtNEJH4f0HhoE23YzDTsRAzu8MOSw5xymhEb7eHXez4QrDXpKTfz/ahFENxm/ibmFJH
         F/aY3a+jSw/AIavhVQolBUItgtt9nVvBkA4l6EQAfMhDVaDjxMduAp62FDdBENIhxb4n
         1Ft3d6OmVrou/g5p1ZGFDUKS16d5MeQi54xZmdhTWRhdEDhgahPdc0JGg24Sb868vmBk
         xvMBdsGd5uxlYNgwQI4rCUeh20a3NizSsnwsaPRVrXP77QseRY4A7JrxOm6VltJ5Wda6
         kXig==
X-Gm-Message-State: AO0yUKW9Liodw+rXmLfpSBIwm1hTL2CoUEtyTKK6Wj9xcn18zxd//0b0
	tzaU5Rh3nsFHnREtax8TdoC/uw==
X-Google-Smtp-Source: AK7set/39QLOmMo6qh29EtFdSMtUdHtq9BXdS8LMXIQMLge2x6IhwId3OFWboa93CH8r0w8G+pS5Tg==
X-Received: by 2002:adf:eb91:0:b0:2ce:a703:1937 with SMTP id t17-20020adfeb91000000b002cea7031937mr262905wrn.50.1678521803848;
        Sat, 11 Mar 2023 00:03:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118? ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c22ca00b003eb3933ef10sm1950611wmg.46.2023.03.11.00.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 00:03:23 -0800 (PST)
Message-ID: <e5d0e2eccdf802d4b257e63600d86f2baf050d73.camel@linuxfoundation.org>
Subject: Re: [OE-core] base-files: any reason hosts contains
 localhost.localdomain
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jermain Horsman <jermain.horsman@nedap.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2023 08:03:22 +0000
In-Reply-To: <SMrL.1678462941565102949.YwpL@lists.openembedded.org>
References: <SMrL.1678462941565102949.YwpL@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 08:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178363

On Fri, 2023-03-10 at 07:42 -0800, Jermain Horsman wrote:
> Currently the hosts file (meta/recipes-core/base-files/base-files/hosts) =
contains the entry:
> 127.0.0.1	localhost.localdomain		localhost
>=20
> This seems to be based on Debian, however it seems they've long since rev=
erted the entry to just "localhost".
>=20
> https://salsa.debian.org/installer-team/netcfg/-/commit/3c15ee521b2b8f47b=
34ccc7f610523cd284f2221
>=20
> I came across this issue as a call to java.net.InetAddress.getHostName() =
returned localhost.localdomain which wasn't the expected value.
>=20
> Because of this I was wondering what/if there is a reason we still have i=
t included as it is?

I think you're right and we should drop it. I'll propose a patch
which we can test.

Cheers,

Richard


