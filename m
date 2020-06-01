Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.31768.1590996070871536076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 00:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tt0ffUQj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k26so10259029wmi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 00:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qzO2+u+2bfaWDek7+egae1Q0q2dEf53A+Iwd5EHYYBg=;
        b=Tt0ffUQjE084B/H6B2j+Oa+tE13j0s3WThRrXWCG5tSsWbW1Ni3dYfX4jZG+LOPqJT
         f74v6f2K5v74YLM1+8E6olxWv8wlCpH0QO1eJSYBT7wRkSHNGjZeJLqo8FGDMofReHME
         bje5z1sLSo3kjf7wOfLZWj3QvOppvFm/Oz7hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qzO2+u+2bfaWDek7+egae1Q0q2dEf53A+Iwd5EHYYBg=;
        b=VHv5oQcIDb6MBImMYIe2M64g3RoaAgmbInIeHRD2z1KggXLxvHS8eiOsHKlGdmSVAk
         jBIyqlY9Cfiqae7k5IYZJShQITmxpSYXSDa7kCeqYNVedM0J7z2pmldanX6qXcDk1PDu
         Utkpz4SpoEG/49MGLX7Wa00YXVczdJ+iBc9EgONupJ/X96nq6H6FCJ+beM18cRfeeROB
         5AWx+1yClSiW1dpOsa7vCiITlsgyrnIwrVlzrs8cGwQO+BGYyvCAeQtEgKmCIgn9Gg8o
         bOJI10K6LeJ0dud6c16oPGKlE3vAbiVgVRCfYsLZKfgrIjNKNpYrvS/vQkTfSgcGlYsK
         SLPQ==
X-Gm-Message-State: AOAM530HV2LESmwAAEyxvKG02EQyTOq+tcYKaLeoIHYV/nR7gEbRZ6Kg
	UfunjKdPDADo/54uscKsc7cdXQ==
X-Google-Smtp-Source: ABdhPJyQQmhtFmfp5egjMfsTvo/Ti+P9JpUI7eSrkNeYR4Urb9r2fuQTHdfXTGGIjUSxCTICn35PWQ==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr12909519wme.62.1590996069364;
        Mon, 01 Jun 2020 00:21:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 23sm9749772wmg.10.2020.06.01.00.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 00:21:08 -0700 (PDT)
Message-ID: <c48af912b817bbb89b8dcae32a94562fd83efc66.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 67/70] apt: update to 1.8.2.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Jun 2020 08:21:07 +0100
In-Reply-To: <20200531155254.10283-67-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
	 <20200531155254.10283-67-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-31 at 17:52 +0200, Alexander Kanavin wrote:
> I took the opportunity to rewrite the recipe from scratch; there was
> just too much baggage in it.

Test builds failed with a reproducibility problem in lz4:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13925

This hasn't been seen until now since there is now a hard dependency on
lz4 from apt in this patch.

We could fix the symbol ordering or perhaps disable the static library
as we don't use it as far as I know, not sure why it would be building
one...

Cheers,

Richard



