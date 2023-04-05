Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF3FC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 08:19:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.125071.1680682746249630905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 01:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xc1yRfKP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id i9so35322493wrp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680682744;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir04iJeXD0yypP4xgpKxxWcabazoUWWggcinJLC5nfI=;
        b=Xc1yRfKPe8f+AJAfU3OftmkhP707oPqsSXijAADVRW8IEfheoP6YmLO+8Qz5j7fTcS
         D66As8WmeTDnHalPFChIt12kJMeAgLqE1JvF2h6rB5fjKpNcpBSn0qOvJHCCLFC7OqvT
         mY1ka2Zj32UoLg71LmDBkhzfeuuV8fl5IFNT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682744;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ir04iJeXD0yypP4xgpKxxWcabazoUWWggcinJLC5nfI=;
        b=ph4W/a4NO786TobJ53rVDV/Mu3TF1CVI/6anZT07W2Am7rUlqaijaQ30TnMwqOajed
         9Mab69g3b53aZD5G2MnWt2M8REGyw/fJ/sdbAJWFZ5iwTpOihhxUnClbrUaCxXuojEx5
         iDkJ6DAnvSd+NLUlqrFvRc/wAf4nA1lIQc05ktn7ibup8e+4LKpa5Cmr1F+MTbHNJE6U
         1wN6O1EmRUqgey2zf86x0i9nL1o3D+U/rVFHkQ2chdUZVZyDTBZPwvqg5RwLJeLDsT5C
         vsJJEt1rIF2ahMDFEMsjzhlW5Fc/u/EvfuRNY8DrNbZzG1CF10JyYmGooRPw2XksK7eg
         nKvg==
X-Gm-Message-State: AAQBX9dul2ENrBEXaCsYjPzlUUw08wbJF+ZbkE27owUrgFwygztvvoxs
	UmzskP6Jz/EAxjVLsBpo5SixYQ==
X-Google-Smtp-Source: AKy350ZBSU4FIQ7JuYqndEd6BRaT7JG1Jgw9CjY5UCIPwNtdzv8UQUj3zWcJO25x3b28J/JbdCizOw==
X-Received: by 2002:a5d:440d:0:b0:2d8:cacd:797e with SMTP id z13-20020a5d440d000000b002d8cacd797emr3414118wrq.10.1680682744480;
        Wed, 05 Apr 2023 01:19:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5bf:59d3:395c:4325? ([2001:8b0:aba:5f3c:f5bf:59d3:395c:4325])
        by smtp.gmail.com with ESMTPSA id v8-20020a5d4a48000000b002c557f82e27sm14278218wrs.99.2023.04.05.01.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:19:04 -0700 (PDT)
Message-ID: <b474e607dd85ab8087a146dc01c1aadc0ddd04ce.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 01/10] gobject-introspection: reduce
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr =?UTF-8?Q?Kubiz=C5=88=C3=A1k?= - 2N <Kubiznak@2n.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Apr 2023 09:19:03 +0100
In-Reply-To: <DB4PR02MB1003028940467C6316D6AD229E2909@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
	 <974f5837cdf9f57176e1af6d02c49a5b2cb03db1.camel@linuxfoundation.org>
	 <DB4PR02MB10030EAC0D633CDD131D6642EE2939@DB4PR02MB10030.eurprd02.prod.outlook.com>
	 <DB4PR02MB1003028940467C6316D6AD229E2909@DB4PR02MB10030.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 08:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179726

Hi Petr,

On Wed, 2023-04-05 at 07:05 +0000, Petr Kubiz=C5=88=C3=A1k - 2N wrote:
> Thanks for merging the vte patch. I'd like to confirm that the build
> succeeded on my side yesterday so that should be all prerequisites
> needed for the "gobject-introspection: reduce dependencies" which has
> not been merged yet. I've seen that patch was already in master-next
> but was removed from there. So I just want to make sure it is still
> somewhere in the queue, not being forgotten.

We're about to make the mickledore release and that final patch is
probably a little bit too risky this late in the release process
(feature freeze was several weeks ago).

Adding in the DEPENDS is fine and low risk but as we proved with vte,
the other patch does cause fallout and it will impact other layers
besides core.

As such I do plan to take it but in the next development cycle. Please
remind me if I don't as it is hard to track everything being deferred.

Cheers,

Richard



