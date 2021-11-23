Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8FCC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 17:43:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.14783.1637689432174934974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TzavWTMJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id u1so40290042wru.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jufl7Htbu1gT+x8MuCNr0GbVNQclHQAAyHtfZhOiSQk=;
        b=TzavWTMJsjiI3qqq3ZMcNJVz8+7FLgvKCtEqr4aCzUe/iP5hD5C6GHJkWJlFezOdWM
         1AgrYzUzNmghWOz9TkpfZQq0q2NhcRjfDHX9vcVlwTlI9Dqzm32vOhslmuLQSrsyrvtv
         YBqAOp0PK6gok04QKrwTtx8CC0yDtndqW0BhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jufl7Htbu1gT+x8MuCNr0GbVNQclHQAAyHtfZhOiSQk=;
        b=tKX7M5/jy51D1O51Mz9TV7qjDPWaZmUA4NVWu8vRwJFTfdzO8y6vvMlyKzBYZhC+OA
         vNbQYQxBM1L9fvfYeUy4aqmf6yJA7z23q6TXmqSMAZWPHgrD0/WriX2ps4arjW/sGGVq
         Zr97NTIIyVANLH1yAbtkcnV0seVMKtyzZZKq2myx/HbYoWCFHQFTaUdHuyNI8ETS8QtS
         Vn80gLN0WGnqTls2WPoKa1BirVXizKYp2CZpgK64qxJSQRPcJ4yBXz1PIFEH611NLij7
         X7sKw07FLCGkv9h43SOTMqeUJxJvCP9jnJ4wt6DqdJKdRgT6WxYurVE1PNIo/kf6kIal
         huTw==
X-Gm-Message-State: AOAM530utm5r63iZR/j6PAO2AxeNMI/4p/H0b29hRhzBd55blIScXguO
	2lLHLsM6vdJxS836JLKFFNqUAw==
X-Google-Smtp-Source: 
 ABdhPJxg0yUXRZQtQkz3oHTiFH6/FvklyA2bN0QiaN8PbWx5YX0d8rQZ0YwwnPQInlBZyFSmJv23pQ==
X-Received: by 2002:a5d:47c9:: with SMTP id o9mr9187723wrc.348.1637689430434;
        Tue, 23 Nov 2021 09:43:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e990:5f99:797d:8988?
 ([2001:8b0:aba:5f3c:e990:5f99:797d:8988])
        by smtp.gmail.com with ESMTPSA id
 m7sm1630407wml.38.2021.11.23.09.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 09:43:50 -0800 (PST)
Message-ID: 
 <acb4b7e9d576aae4b4ee8374f0e26033a65bff47.camel@linuxfoundation.org>
Subject: Re: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-3.1.12.rc1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qa-build-notification@lists.yoctoproject.org,
	"<yocto@lists.yoctoproject.org>"
	 <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>, "Tummalapalli, Vineela"
	 <vineela.tummalapalli@intel.com>, "Stephen K Jolley (via Google Docs)"
	 <sjolley.yp.pm@gmail.com>
Date: Tue, 23 Nov 2021 17:43:46 +0000
In-Reply-To: 
 <BN9PR11MB5372F9B07F411F0B1708A930BB609@BN9PR11MB5372.namprd11.prod.outlook.com>
References: 
	<581c5d14ffc3eca5b39297c422a08eabba4f6d93.camel@linuxfoundation.org>
	 <BN9PR11MB5372F9B07F411F0B1708A930BB609@BN9PR11MB5372.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 17:43:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158613

On Tue, 2021-11-23 at 11:54 +0000, Teoh, Jay Shen wrote:
> This is the full report for yocto-3.1.12.rc1:  
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> 
> ======= Summary ========
> No high milestone defects. 
> 
> new issue found 
> 
> Bug 14622 - bsps-hw.bsps-hw.Test_Seek_bar_and_volume_control manual test case failure
>    
> ======= Bugs ========
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14622
> 
> Thanks,
> Jay

Thanks Jay.

The TSC discussed 3.1.12 and are happy for rc1 to be released.

Cheers,

Richard


