Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4719.1611220108332198269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 01:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rs0RJ3A1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id m4so939684wrx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OJb4VjsnXeb4d2iRX1Bk3LCGIRoMC+hCSaQkoGZG3K8=;
        b=Rs0RJ3A1XESj2TreUDx0Xfb9D0yamDsS5NIVfw8FWxwhW0R2H0un2D649X+ID2rIDf
         3Op2qWnrbJWqtS933f62wjd2xXhuNY38/iU6DOjY6ZZRgwCzI2ym11EMUg1qxpdOjYvB
         jRYmt2Y3tfjxXJR3QqlC067Nuk4E0rcN4xYnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OJb4VjsnXeb4d2iRX1Bk3LCGIRoMC+hCSaQkoGZG3K8=;
        b=q3lK/LnajzjtHOaXJYj9ax1YE4mix29LGs2dkiXxBcg58lHc/58zk4f0YO8DCOKw95
         NwiYlS6o5L/KDP3nKKencMuIk0w3MMicy0SHfQjEOFoOk4jcXQ6FDNkd4Rl0L43L51ut
         2DrOh4HS4r81xnVrPLspNXc2E1BMqcJdRA875WyQrb9p6NZucLSTwFx8hPt5VseASwur
         XP1DgxdRvVEOIH3oeYsElvwZV7dyaq3JAXMmfdTRU7dxZKVRTcSUy1FVNzj7+Bz7bxOX
         yesObEh3ki+VOGe4DvD8BC4oNiPgrhDiK6PZuVLCULBplxd0muF2o/FyfC3JD5ZYNCP2
         iMig==
X-Gm-Message-State: AOAM530jxMLz7mjAEk/e0Tp/ViYIu7BM8xfgOmIdtgkMe6wkSpjVyX1y
	69M/4hvG7LjO8BZtCVwfTVD5zg==
X-Google-Smtp-Source: ABdhPJyTg72oZnuv4HX6uoKHtbypoFszkOtzQhr63J8aLU0QCD1uq2nlJMO63mcnJoV3owzsJxbfEA==
X-Received: by 2002:a5d:610e:: with SMTP id v14mr12372570wrt.336.1611220106856;
        Thu, 21 Jan 2021 01:08:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:45f8:776c:2038:dccc? ([2001:8b0:aba:5f3c:45f8:776c:2038:dccc])
        by smtp.gmail.com with ESMTPSA id d22sm3160489wmd.43.2021.01.21.01.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 01:08:26 -0800 (PST)
Message-ID: <21b5362854d1a8b14e8c0b541bb2038ca6295107.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] dtc: improve reproducibility
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	 <oobitots@cisco.com>, Khem Raj <raj.khem@gmail.com>, Otavio Salvador
	 <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2021 09:08:23 +0000
In-Reply-To: <SJ0PR11MB508821FFC16D1AC3736CC355D7A10@SJ0PR11MB5088.namprd11.prod.outlook.com>
References: <20210120182001.20523-1-oobitots@cisco.com>
	 <CAP9ODKok0YUiD2rgJfZYFS0-oP1w-GS8s-KeuV2HUG2skSSKnA@mail.gmail.com>
	,<CAMKF1sqJxR=HfCW10jFdjENi8Rj-BFML4qgrRKdLQa=q2gvx7Q@mail.gmail.com>
	 <SJ0PR11MB508821FFC16D1AC3736CC355D7A10@SJ0PR11MB5088.namprd11.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-01-21 at 07:26 +0000, Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) wrote:
> Should I rework (add patch unconditional) and resubmit patch?
> Or should I try to submit it to the dtc directly?

Both would be ideal please!

Cheers,

Richard

