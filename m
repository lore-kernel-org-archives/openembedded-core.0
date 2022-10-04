Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C517C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 11:28:27 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.9249.1664882904968048207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 04:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HJSTZdLL;
 spf=pass (domain: linaro.org, ip: 209.85.167.53,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id z4so20684913lft.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 04:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=6953Otk38ux97oReB/WMzpP5ZIf1qZ/tvl3M1Ygn8Bc=;
        b=HJSTZdLLp/47nxqQK1Dpowfh8FfrxNPqXmmI0WUNLCjdUzyMd8GduhX6pCc0nUykGQ
         9oiev6+y0+3kUYcDFzJaE9T41YfQ9ghc4nuKw4tc4j5ZtpxB/vb5wE4MiEwQ/1f2USlN
         rLlm80pRsbLDQZF29Vbu7SazhfGzlcPXI7HwpdasTFUbG9VwG0vr6k3JETYlHHfC0inZ
         sFKMilgVMQpBMcbwijRsl7Qyqx4Z4GJmrKZ5rFPmiz92+qNr9vFJH1oWKYXc6TKFtpKe
         /I98Svr1roU5gHT3tE9M4ibM2epLdUwkA7qhU+Sib/3SQ1OyLNDt9nBdRONnFGIHY8Bh
         u2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6953Otk38ux97oReB/WMzpP5ZIf1qZ/tvl3M1Ygn8Bc=;
        b=jc8btjL+hPvCyqNSnrrO62uOZSBRgREucv0XIXCtI1PvWaLHYNdxvAtuA8MfFCAeXa
         WyTM/FyXA2fVrvMcdqTK/5PRacoWnzYa9st+2dcdO2EOyRspWAfwirESkRpwz/t02XiJ
         2Ertxc1LyjEPAf2GIW8r1VOgugb7NdOFp0my8EP2gsjYRULmQUnjJYV/869g6uasFG7i
         Ozeiwy+86zWHyiPs1pZhXTEKDlzlZglPQBIySK1iME5GkCdUeFfCjIQYOAI2VOroZlrb
         xUoz0ifKVSfzMSouzlTZCaN7C/OEGFKrYMl5iOD+EHFaeGXdvzU8nEILwI1Q0GVk5yh6
         B9TA==
X-Gm-Message-State: ACrzQf14j2fkDGa/ETpUzlwKUkTkwOgzfKMQbr3CQwWW2dUT9VVhMNZG
	MOLEIvO2e/2ubk7oRHocYee86A==
X-Google-Smtp-Source: 
 AMsMyM46VSC55ALDCZaLCkovs9LjBZRCBj7Jn3ipXvG9EfUYGWIoZvG7U/WgzVRiEm3BPtvqsncqow==
X-Received: by 2002:ac2:495c:0:b0:4a2:2d6e:4a39 with SMTP id
 o28-20020ac2495c000000b004a22d6e4a39mr4788052lfi.233.1664882903119;
        Tue, 04 Oct 2022 04:28:23 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id
 z13-20020a056512308d00b004991437990esm1880364lfd.11.2022.10.04.04.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 04:28:22 -0700 (PDT)
Date: Tue, 4 Oct 2022 14:28:12 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 4/4] linux-yocto: use openssl-native.bbclass
Message-ID: <YzwYzKYCeoBYpIQF@nuoska>
References: <20221004101107.2745139-1-mikko.rapeli@linaro.org>
 <e0fc2054236524ba2cca50068503089aaaf72c08.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <e0fc2054236524ba2cca50068503089aaaf72c08.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 11:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171387

Hi,

On Tue, Oct 04, 2022 at 11:44:51AM +0100, Richard Purdie wrote:
> On Tue, 2022-10-04 at 13:11 +0300, Mikko Rapeli wrote:
> > It sets environment variables etc correctly for openssl-native use.
> > For most kernel side use cases are covered by plain openssl native
> > wrapper but some out of tree e.g. python scripts may be not.
> 
> When you say "out of tree", you mean scripts in the kernel we don't use
> by default, or scripts that aren't in the kernel at all but some users
> add?

Both. Same for u-boot which has internal signing scripts that require
python3-cryptography-native which doesn't work out of the box.

> I'd have thought the dependency on the class would be added where it
> was being used?

Yes, this could be done too, but I'd like to set a clear example in poky
by using this bbclass.

The root causes are not obvious when ../usr/bin/openssl works but
../usr/lib/libcrypto.so doesn't.

Cheers,

-Mikko

