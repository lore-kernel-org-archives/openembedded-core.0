Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0BFC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 12:02:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.10727.1685707376503663604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 05:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=h6ovsIKi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f601c57d8dso15388445e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685707375; x=1688299375;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO3iEsO9Gsn83OoXWvs5Q9xLNwtLye1uQvLKJsxx0oA=;
        b=h6ovsIKizMGwUfaRe0unfXmj+VG0D1TxxLpUI1tPCu1q5NOf9fsvdXlTW8wRm8XLMc
         SUJWM6iBelHcRFyal/8nmDvy52hpZo4YszuqBMX5XDr/5vSZd+iU4NgoJe9pJmB/Y12X
         P/TvmtFYRwZeXvKRzOL1MjACW/6PSJ0IbVeCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685707375; x=1688299375;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yO3iEsO9Gsn83OoXWvs5Q9xLNwtLye1uQvLKJsxx0oA=;
        b=FYaJq7UQ7xUjNuU4PRE7liuMPT8JcU5eWoG62bIXLAOKVx8aQJ0BtqySYkaZDsCey7
         KkY1U8Tpx2z91T9QpVqi6EGes2w9DgUtDk8vAYWMOYo50+oDraG58sgPdMD+VabYAiVe
         cq46g5mkdT+ICEIRfpLJwGjHu76abd2W3+KZkhqPEojYEforqAhnmgstoXlrCVIzaIUH
         Kkd884OqHbgTnWfML8vl2VxRZXgNARV/2wsoPf0DPXtoJCzFuo17mXPAcjQic+7R1oea
         jG25btUtJCy17hYC/wHozn0gGOxU/v46eoDU/OkWKodJsVYYvSn8fSKWkJL5YON80SDo
         8r5A==
X-Gm-Message-State: AC+VfDyY388iPR9/k889TGfM0/CaNyDII/R2mo1oN9ZKSOvXUKJYGaeH
	CkTBy4debNfiF0d9/cYTWE6rDozlpLTQ2XU64g0=
X-Google-Smtp-Source: ACHHUZ5HQP66kIMLpI2ZvEsdn73VRrwkrZei9s+OP/2WvYRW4que2bF+6Alz/4wXnv2/tfolCuf05w==
X-Received: by 2002:a7b:ca45:0:b0:3f5:e29:bcde with SMTP id m5-20020a7bca45000000b003f50e29bcdemr1789741wml.17.1685707375050;
        Fri, 02 Jun 2023 05:02:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:527f:ecab:4831:c523? ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id g26-20020a7bc4da000000b003f50e88ffc1sm5414744wmk.0.2023.06.02.05.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 05:02:54 -0700 (PDT)
Message-ID: <1c1b9977e8ef107c5469ba8a3a63b21fdb3a1729.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mtd-utils: export headers and libraries for
 MTD and UBI
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefano Babic <sbabic@denx.de>, openembedded-core@lists.openembedded.org
Date: Fri, 02 Jun 2023 13:02:54 +0100
In-Reply-To: <20230602112426.28353-1-sbabic@denx.de>
References: <20230602112426.28353-1-sbabic@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 12:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182310

On Fri, 2023-06-02 at 13:24 +0200, Stefano Babic wrote:
> Mtd-utils has internal libraries (libmtd and libubi) that simplify the
> usage and access, and they can be used by applications to access MTD
> devices without reinventing the code.

Does upstream plan to turn these into a shared library if people are
using them like this?

Cheers,

Richard

