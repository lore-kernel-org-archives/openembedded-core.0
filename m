Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.36008.1585226797393947411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 05:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HjNzdpbt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id m11so1701739wrx.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rSkWi6hGXFSlAOxnin8y7zVz/KPwCIRML8Me9p2U2SQ=;
        b=HjNzdpbtC6qqJGoMzMHGT6wQE6QuwntOs9AT7BumYDCj2VhytqYZaVuVZ7Z5dYQK+W
         mywgdWeJO8HTpzfRafaWGoSlQPK4t1MeG2/dBFK7Ym015B4bc/6hyCm0ulb7s/IIJuvH
         MRavbneR0Xen8AHA8GtW7b9cRWXodeSej0Bxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rSkWi6hGXFSlAOxnin8y7zVz/KPwCIRML8Me9p2U2SQ=;
        b=uafyiRJF1sJkcWklV1y35VNpfLTjF2TrjQLzPJlZI3orBXyuj9ifoRdL414ZFW8jo+
         gd4EmCGV+E9eovkrsPBEz5dvBC1dwb6Orc28fc07FfdmRSP4sDaSafpIkeIRupeOyEVp
         7/Rx8vZBAS5crirE6QzyIut3QRpa7o0Dr04qtn45RWsBYY+Ta+ZFOVYsXwKIPRxxb2uS
         jgpirpmuJh+2631JprL3cNk7CsPf2/Mc4i7EBEbrmG6smT28wsJSMjFieaw37ZkHC6XS
         1eGXqddTGWRUrIPnwG0IrdNvhzv5XnbYVrJkhWWswL6lVOIocJ0obDLvC2ath/cLzpIZ
         AE/g==
X-Gm-Message-State: ANhLgQ2UsHRtvP2fKiH6MjcQDePfzzji+d5btS0IQs7LSm8Otg6S19Re
	Wuzfy0kg7z713Vki+UeRVAb24g==
X-Google-Smtp-Source: ADFU+vsVcd/nMTrCKu86Z2ESSR++0tcMCNwwCN7fiUuFynwzP4hzBcE7SIBd2C2kC/HBok0Xzt9E/w==
X-Received: by 2002:adf:e48a:: with SMTP id i10mr9673008wrm.71.1585226795911;
        Thu, 26 Mar 2020 05:46:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y189sm3514956wmb.26.2020.03.26.05.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 05:46:35 -0700 (PDT)
Message-ID: <dc67771ed58fb564c84c8991e7cf16cf3b5dcff4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] libpng: Fix CVE-2019-6129
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, Sakib Sajal
 <sakib.sajal@windriver.com>,  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Mar 2020 12:46:34 +0000
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F3034AD388@PGSMSX101.gar.corp.intel.com>
References: <20200323215034.144217-1-sakib.sajal@windriver.com>
	 <C0207330DF60C5409302EC78C3FE68F3034AD388@PGSMSX101.gar.corp.intel.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-26 at 02:36 +0000, Anuj Mittal wrote:
> This patch has not yet been merged upstream and upstream has disputed
> the security impact of this CVE. So I am not sure if we should take
> this.
> 
> https://github.com/glennrp/libpng/issues/269
> 
> Has any distro taken this?

I did also read into the CVE and yes, it is quite questionable. I'm
leaning towards not taking it if upstream aren't interested.

Cheers,

Richard

