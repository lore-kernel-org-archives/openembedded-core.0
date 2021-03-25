Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.5681.1616664853899622230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 02:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zrg1+Qle;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id x16so1560924wrn.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZvAk6WQTRy+jzC6EEFtNixI1RCxrZzuW6QXe0rCFuX0=;
        b=Zrg1+Qle90eaOrVxmY3BElqKtUjWRc+mh1u7fhkvpneoDp41kOCt00Baaxg+DIpTsm
         jtLHOxe/14SG+/aDg/RpojQ4sLLRusGpILLAieOSScmJxSn3U1vfmWNrhj7JduDBA0jL
         7JLW4mthBt5/OeQmykUaUYWNhFg3Ol4D+yC6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZvAk6WQTRy+jzC6EEFtNixI1RCxrZzuW6QXe0rCFuX0=;
        b=sOeXWlBUI5+Okn1UnjzLc8wbKujtYTSABigQYVqTX6Qhi2cWoypGljueMfBYrZSeoB
         Mds4L2yezGJRCpBS6pP704qIVkrf6LSG/PA58OU68kx8z2cHkWY/pWnWSQe0X6rXO2bI
         FEbOYiZhHyBwW4//VDQ1dQBAmw8USYJDphbbeQBCcGtStSDtRAfsG17zz1Hva3HogU0R
         qjh8Ia82WOJ14s9Nsd7zDQSOY6u7scM/rWt3P5jfuO/qMzLNg1eHJKNknnMrnIUuY/AQ
         Yq+Lj/AbtueJR6U7R0Lf0awHrfjLLZBi9QW5CfyAqkie20be1M07elCWjaDx5FxIsGUG
         VVKg==
X-Gm-Message-State: AOAM533A2GGjw8lmCLqJI+Cm3sB8HoXbsYYOVgR3Jj7vDvzw0xUaFpZp
	ic+QO2rztNhnkjWG2/087MIAAA==
X-Google-Smtp-Source: ABdhPJzMa3ilt7G9+5uS9CT6adAFpVPbrJxmeMR55czjxuC6wE/+pBndh9YGqir+cGa/CALjNLmNpQ==
X-Received: by 2002:a5d:6cd2:: with SMTP id c18mr7907663wrc.330.1616664852438;
        Thu, 25 Mar 2021 02:34:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id j123sm5848959wmb.1.2021.03.25.02.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 02:34:12 -0700 (PDT)
Message-ID: <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	 <oobitots@cisco.com>, Luca Bocassi <luca.boccassi@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, 
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
 <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 09:34:08 +0000
In-Reply-To: <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) wrote:
> Could you look into this warning.
> 
> WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-linux-dev rdepends on util-linux-libuuid-dev, but it isn't a build dependency? [build-deps]
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226

That failure was my fault when testing some fixes.

I've sent out a patch which renames util-linux-uuid to util-linux-libuuid
and sorts out the license issue Peter reported.

I'm optimistic this fixes the various issues people have been having
and simplifies the recipe a bit as an added bonus.

The patch has already tested cleanly on the autobuilder (the above warning
was from an earlier aborted build before I opted to rename the recipe).

Khem: Thanks for the related meta-oe tweak, I think the rename whilst 
slightly painful now is the best way forward overall.

Cheers,

Richard

