Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.1535.1598380570180230869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 11:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SiPQQHD8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id f7so13883538wrw.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qyNm66JOTRn8op1z+1ymHIgH6wjjSMOtuVRBrwcT8iM=;
        b=SiPQQHD89Ltqc6yjlwbv94s7+7TonaynVC8oDdNSkLedEI+223DNRLOfz1+E/2M/Yt
         ljQI8TCpaLz0MG3bnQAE7za+Horunk4aJRT4vi+IfEYIr5QJ4zxrjxytu3RPMhk9Qsa+
         uPUd8N8xepSjfcsTgSphtpVmKzzvMkNZvb7vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qyNm66JOTRn8op1z+1ymHIgH6wjjSMOtuVRBrwcT8iM=;
        b=Vh2pdgUH7rfh8YigKhTEeqAX3jUZTis7RZ3u1cn6E0DKVkVpluWFP4KQJ9Ik6IdAFZ
         XdBsIswMpuxN6NaibJmBHlQZSobEJyfbnpvfzl14wu4FvwnLY7HuO+GHHl/vGXNYvar2
         N6OBgHvR+7zmihRdYdMA4PjaLJvkiC7DRtY0heQE2RpsRF7EcOtO2JuM7CK5d2GHI08+
         TwWnqmQjFDr7Kjq8fv58CEABz7mpCTaaCWSA0786ECxM4xzTA5W/zFoDilhXDELB7OZ2
         jWCAddJhYMilZTiZUge42whEfH34oi3mIFbFa8WWF7AToNXxiGlIjY5GmX8kXUu3oaeF
         /bTw==
X-Gm-Message-State: AOAM531oj1BLUMGYcrV/pN6OiBWOfPeOreZ8p56qiz3Yc99ug9AXIjdF
	z8PjKHjk/ExMks5JhGVaUpPpMA==
X-Google-Smtp-Source: ABdhPJzxbMzS4RCALMaMHpr2MQ/+U0G4uAcDsgvBwkzE8JAJL9I8zPL8cRTvDE7Kte98beLTS+7VpA==
X-Received: by 2002:a05:6000:11ca:: with SMTP id i10mr11145009wrx.252.1598380568527;
        Tue, 25 Aug 2020 11:36:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id x14sm7400241wmc.5.2020.08.25.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 11:36:07 -0700 (PDT)
Message-ID: <5ba9cc01116c68eb18204c8c7c120904be8d2097.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 2/5] hash equivalency and pr service
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Joshua Watt
	 <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2020 19:36:05 +0100
In-Reply-To: <ecc18b89-6291-4292-9421-16a9340380c7@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
	 <20200824232930.150388-3-mark.hatle@kernel.crashing.org>
	 <CAJdd5GY+g7M_O05V4id+o-_fN=aAXz4M0zcxNUvQphACHHS-bg@mail.gmail.com>
	 <ecc18b89-6291-4292-9421-16a9340380c7@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-25 at 09:16 -0500, Mark Hatle wrote:
> On 8/25/20 7:50 AM, Joshua Watt wrote:
> > On Mon, Aug 24, 2020 at 6:29 PM Mark Hatle
> > <mark.hatle@kernel.crashing.org> wrote:
> > > +PKGDATA_VARS_NOHASH = "EXTENDPRAUTO"
> > 
> > There are so many hashes to keep track of, can we make it more
> > specific than just "HASH"? How about "PKGDATA_VARS_NOOUTHASH" ?
> 
> After talking with RP, I'm getting rid of the oe_nohash file
> completely.  It's
> not needed any longer (after the second part of the patch.)
> 
> We still need a way to do this clearing of the variable and such --
> and I'm not
> particular about the name.. but NOTOUTHASH doesn't seem to be any
> better to me
> then NOHASH in this case.

Except we do call this "outhash" in various places...

Cheers,

Richard

