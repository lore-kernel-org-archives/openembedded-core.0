Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAF0EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 11:25:19 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.14962.1687605911334619882
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 04:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=KyoMUN3K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-988aefaa44eso197372066b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687605909; x=1690197909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pgRuvyCmgRdaSfNRNNbRTsSeqBtAc4aOB/NQfHw2/pI=;
        b=KyoMUN3KoDB3WK6SzmQ9powwjUbuZsYyTMRUWltFhJditKrV95uN4kWonFhAUzsi6m
         6vlXIrHUzM1HNyojoUNVuWazDRkni9/tD3Rz6C+20ctPv2xMJi8iw5Ywb3I1Sj2bVw7x
         tLWuOoRmmpR3njF9UGhvqngmtUwy5Tu5bQCEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687605909; x=1690197909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgRuvyCmgRdaSfNRNNbRTsSeqBtAc4aOB/NQfHw2/pI=;
        b=JomuLT2tf5fc2MSSTebSjXjfW5yOGMn5DvAmY8NF6jhWH3EmX6ifWgHZRAWfgBIvUp
         xK4kD9PfHL5PUYLHFrYky9fbXb+w6iVMtc5PUIN4bBWxxLt8rcEIraqBWG7cWXx0LJsa
         V+ReSvdJiNtFcE+0i9W5kDOfItoB7ak2pkmUf4g+2kH/rD84FmOG2NkJUEYZaE7uFESl
         YLVRAm1yN5xJiWh4RTzbp07krLp39Z1lQFs/Zuqxtg/ZtRlNKIRTr+FPYZlI8DJcMsZF
         YT1Y3kqaon0sStWIBzMKNUtfcu8y1aYjfEgyhENZShyQs7M+0kpW5hsPaqXTvvEKS0kL
         SyXg==
X-Gm-Message-State: AC+VfDybj3Mi283qxbStnxLO6u1CI01zrIyKh1e8kjH9hWw/WGEUzdwf
	bzGvPW+vpR0E/R+LjmkF4XdWOw==
X-Google-Smtp-Source: ACHHUZ5JiSy8aPYLb7FzaQ6tKM5GLLaigO3Mvub5BmGPxuCslyFj+rK+tWtl91iegp+vxgfU51CoZQ==
X-Received: by 2002:a17:907:6d9c:b0:988:a642:1840 with SMTP id sb28-20020a1709076d9c00b00988a6421840mr15086869ejc.39.1687605909675;
        Sat, 24 Jun 2023 04:25:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b3:5ed5:120f:4dbc? ([2001:8b0:aba:5f3c:1b3:5ed5:120f:4dbc])
        by smtp.gmail.com with ESMTPSA id l25-20020a1c7919000000b003f9b29ba838sm1913434wme.35.2023.06.24.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 04:25:09 -0700 (PDT)
Message-ID: <6429518d405c9c303ae3554e1967cf8e30c2a397.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/9] fixes for runqemu-gen-tapdevs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Sat, 24 Jun 2023 12:25:08 +0100
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 11:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183360

On Thu, 2023-06-22 at 19:01 +0200, Adrian Freihofer wrote:
> At least on my machine recent the changes related to the tap interface
> setup for Qemu broke even more than already discussed e.g. here:
> https://lists.openembedded.org/g/openembedded-core/message/183176
> These patches should fix and improve the related scripts:
> - First interface is now tap1 with IP address 192.168.7.3. Go back to
>   tap0 with IP 192.168.7.1.
> - Rather than looping over all tap interfaces which are available on a
>   machine, handle only interfaces with a name like tap*. (I need my VPN.)
> - New feature: Make the tap interface names configurable at least for
>   the basic runqemu use case.
> - Cleanup unused parameters and variables. Scripts are supposed to be
>   backward compatible. They print warnings for deprecated parameters.

I had the right intentions with the direction of these improvements but
not my best patches, thanks for fixing up a few things and taking the
cleanups further! I'd wondered what had happened to tap0.

Cheers,

Richard

