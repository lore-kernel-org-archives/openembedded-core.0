Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.378.1616175191049827019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cFhHePea;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id x16so9900416wrn.4
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gBrWXq79VqoZ7CPhAHfOclc+dEGRd2WWlAQlmmg7C30=;
        b=cFhHePeabIUi++Qva3uWD/ecdUfVpef/RJGdC7L1Ep/Wbub4uemOEeAQGKmD0h7Is6
         QHyRcSYomG95FFTZZGa7hMgJenCF3FrX1nU4ZaoVzlGltNdrR+I2J6qY3eD6Pcn4Px+J
         xQ6c8/XggCe4ROzeYNEQ+rEsIyVmwf0WZxAho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gBrWXq79VqoZ7CPhAHfOclc+dEGRd2WWlAQlmmg7C30=;
        b=tCwLIsS8QeU+LRfTlyXMj7oXwzJ45u3FgPQSQuS2SFYBUYJ5JNTCznAqj/l2ODJP9t
         dZH0h62T20B1HeGJAHRnpRuCjgoq6dJRDREOWNxGaV3SMPGV1vbdYn8cuz7UPvDIedkE
         9Di0dNudkE2ZjF2+65Bug2wei7Zn39CllUj/YQCohuQ5PBcHQwqngBQcPY3Nuwx8obwf
         92KqmHgHTzURh00uioVnM+CUfuHFsIV5MrsGcAXtoGG9eFEZSdCDJkFqdyJMDbAEUyDJ
         FMMbzRlhD1Ojr9DmbF8KvEamx/Np3cvx0j6njAlUQxBhTa0YUT16QxG5MtW8Dug0fYUF
         gTnA==
X-Gm-Message-State: AOAM533Yn/6zdSDZrWvUGCwwjP8IdSO1CQbMMdDH1Ir2Z6j+SPuAd1d9
	LJ1/NM1Ob8l2E4Qbda7rXT9k0Q==
X-Google-Smtp-Source: ABdhPJzmAl8Ro8O3llx3XJ1+0Ii9I2TJzSs03qbUMtoQB1orBw2O98HvLaX7UKgHVJz/FZn3te3uHw==
X-Received: by 2002:adf:8151:: with SMTP id 75mr5661978wrm.152.1616175189475;
        Fri, 19 Mar 2021 10:33:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:8e52:d330:3893? ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id g202sm7194821wme.20.2021.03.19.10.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:33:09 -0700 (PDT)
Message-ID: <4dae32cd7ff6573010af48a2d54eac0d6201cc94.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] grub: upgrade 2.04 -> 2.06~rc1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Naveen Saini
 <naveen.kumar.saini@intel.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Mar 2021 17:33:05 +0000
In-Reply-To: <CAMKF1sr1X99rgF2G1vdyrb-i3bfDPcj3NSxoXV-A8Mw7nxRbNw@mail.gmail.com>
References: <20210319071433.23131-1-naveen.kumar.saini@intel.com>
	 <CAMKF1sr1X99rgF2G1vdyrb-i3bfDPcj3NSxoXV-A8Mw7nxRbNw@mail.gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-03-19 at 10:04 -0700, Khem Raj wrote:
> I think renaming recipe to drop PV from its name is not a good as this
> makes it harder for bbappends to be version specific or atleast cause
> an  event  to upgrade
> 

Having "~" in a filename probably isn't too sensible either though?

Cheers,

Richard


