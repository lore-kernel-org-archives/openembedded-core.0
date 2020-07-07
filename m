Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.24722.1594151864219415554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 12:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TAB0yInE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 22so427626wmg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 12:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6ZkEQGeY3f3GvlhlsbP7RKeye6ZYycOqX2VVhepZgMQ=;
        b=TAB0yInEAMIANzgtN1clwca/v/m+I81cSKLJiKca2kMRnKW12adUP88BwqoXGVOQiX
         BySIS4zj+UGNCCCcjlOkG6M9xGBrU8iqvHGgy0xi+kkPcXjvUc6EUMpKpnvemexAf1rz
         /9ZtPi/THRd+xKUIOZQu8QBMtAy2BkBO3tvXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6ZkEQGeY3f3GvlhlsbP7RKeye6ZYycOqX2VVhepZgMQ=;
        b=LuzaOasMsGCf0+H+zL5QBB2js6w9bprVdcQqHlm2JKPTRQd9DtZPF2cMLSkPxnlG3r
         E4rCCQMuxYGUyXDAteZWcdRIhHBT3D43nJ/HLuVMa6aJNPkw8SAl6jPWCBzwuiJruTiv
         8hcSDq8CldlXKg8zudzq+rnvBcze9hJpYxkEjEkH3ALDLXiKuL2hF2Ah8TSjGXobkIzd
         ZlOYURMbhHNeQg7TZBdKyelPN7Dn+8VruCVY0LGbURAxE/hC3/wg9DJGAky8AAgRu1XD
         8yO3FEkqM0lSYN11jtYyWEPxyazsz2ZvbpfO06WA1KieBcy5OzqqeSDih9q4HgGSOlpi
         M4RA==
X-Gm-Message-State: AOAM531t0CershhRzkFSWSR8UsnvKdepV6o69CG9DRS9lcu5IOQXgSTw
	8G2SHHm9V8U0DMfQtFA9yTyzlQ==
X-Google-Smtp-Source: ABdhPJwhbdsKZt4IDeOtoppbZv7bnsMmWIDpyZoM8jh9C6GPuHngnamXGQ6wMRkqbzwoLdSEfvEIug==
X-Received: by 2002:a1c:80c8:: with SMTP id b191mr5493207wmd.37.1594151862629;
        Tue, 07 Jul 2020 12:57:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e23sm2205917wme.35.2020.07.07.12.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 12:57:34 -0700 (PDT)
Message-ID: <96b58c86ca72aacc7e95936eb09a95504b1eb2bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] distutils: put tests to a separate package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Jul 2020 20:57:29 +0100
In-Reply-To: <AM7PR05MB68813E4C4054D8A201FD2DACA8660@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: 
	<PR3PR05MB6890710E8729FAD4ED19D5F4A8660@PR3PR05MB6890.eurprd05.prod.outlook.com>
	 <c16a183feaffb57121e74462dcd56816220daeac.camel@linuxfoundation.org>
	 <AM7PR05MB68813E4C4054D8A201FD2DACA8660@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-07 at 21:34 +0200, Konrad Weihmann wrote:
> That's a very good question.
> I myself haven't seen python unit tests used via ptests in the wild,
> but 
> if that is used, yes fully agree, it should be rather PN-ptests than 
> PN-tests.
> BTW it would also require to create a run-ptest file, which would 
> complicate things even more.

Even if we don't create the run-ptest yet, I think putting them there
is the more correct location...

Cheers,

Richard



