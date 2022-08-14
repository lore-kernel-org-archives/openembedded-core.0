Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13C5C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 09:12:13 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.3396.1660468323280481881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TNdoscu/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id bs25so5862831wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=Ue4mqtfDsWaXEsHKOstpq/wISsrhLGwCQxPjVNzOUNY=;
        b=TNdoscu/DGlbeEFq4bCocu9UyXRaNnWv11vGJ6L9+/25yfVlYnWn3SF9DWiAepDHY0
         yBzHsUOo2r2RooHsLBsXV5I6GG+/gryFEQZOYC92n+imWwy9crd05Cf66LuytBKIBv+1
         67dglDc4rD5KPt3cYSU2j5O2k24E8Ea5luBfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=Ue4mqtfDsWaXEsHKOstpq/wISsrhLGwCQxPjVNzOUNY=;
        b=hmIquG3JHNoqrG/5dMEIns7Xybz8zHmqgsmYauSprwF5bVOyuENc+rwbQkLmq2YqpC
         s8x5BU25Q0gt8HzQ2jlQE933+6Iy0vIb6oZa1rmc0nF3ZkDxqb5cWFukvmFvQDfnih46
         g5V2RUxArgASpSv78uKi2n7hHlOXM9KXBmKMTmaBzoHldBX5CNhvJZzvEdNMUMMUIP18
         sbUDXJzvn5gTezhB7AVvq6kVOH3ajCVRCyIMYRLrxq2H4lV4BKXtkcpubmNcaYWJdbDO
         AxX0sGLakhyDAMVI/dTQywiZHlVHplC81Pgf0r2Uzq+ENB8mgh5o1UZ3fGLteXIAY2zq
         A6VA==
X-Gm-Message-State: ACgBeo0cSp0SurK6llXBTnQA9eJIYQjEKTAsdlmmzXGJPomg9pkQjcC1
	Gu9eFTj/BpSbjbIK7ovFuUfTDA==
X-Google-Smtp-Source: 
 AA6agR5RlUcDm+RVXK1HjTI0diqWuOtjFJvZQ5CR7I1xp/6aR6ci3YHuytsEYJ0W7u4qC+clVsu0UQ==
X-Received: by 2002:adf:e74c:0:b0:224:f642:71c3 with SMTP id
 c12-20020adfe74c000000b00224f64271c3mr2322485wrn.611.1660468321456;
        Sun, 14 Aug 2022 02:12:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4b0:91f3:f2:f39?
 ([2001:8b0:aba:5f3c:a4b0:91f3:f2:f39])
        by smtp.gmail.com with ESMTPSA id
 h23-20020a05600c145700b003a529b7bc27sm5546040wmi.9.2022.08.14.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 02:12:00 -0700 (PDT)
Message-ID: 
 <a3f546417dd19ae07a73821d269827d8a1aeaf14.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] rng-tools: Remove disabling
 DefaultDependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2022 10:12:00 +0100
In-Reply-To: <20220813170156.4040589-1-raj.khem@gmail.com>
References: <20220813170156.4040589-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 09:12:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169319

On Sat, 2022-08-13 at 10:01 -0700, Khem Raj wrote:
> Delete dependency on dev-hwrng.device and systemd-udev-settle services
> as they can be troublesome because difference devices may have different
> devices to detect resulting in delayed boot. default dependencies would
> add some delay that the race condition for creating the device by kernel
> module and daemon using it is not seen often.
>=20
> do not run if included in a container image
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b=
/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> index 0f50890dcb1..c8b46aebab0 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> @@ -1,10 +1,7 @@
>  [Unit]
>  Description=3DHardware RNG Entropy Gatherer Daemon
> -DefaultDependencies=3Dno
> -After=3Dsystemd-udev-settle.service
> +ConditionVirtualization=3D!container
>  Before=3Dsysinit.target shutdown.target
> -Requires=3Ddev-hwrng.device
> -After=3Ddev-hwrng.device
>  Conflicts=3Dshutdown.target
> =20
>  [Service]

Fails in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/4496/ste=
ps/14/logs/stdio

Cheers,

Richard

