Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.21087.1627632665287065844
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 01:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fPUowmPd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id r2so10204760wrl.1
        for <Openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 01:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=vJxRUpEL7lWKysfCF0l79aKUU1njI+6prYXXYn6dRpo=;
        b=fPUowmPdAaUfdZ/HNbCQieqom57BxoJNMLVxDcWRAlsjny5iJM+uvXpxkHdSnKoaJO
         snNn8ld4EayKbbkTMi+OrdlGTFrhKNO3BI5VAwmlXy/e6TLsBm/mtnkWhU6yTkv/aFE/
         Oz3Vr99lVOeOLGUIYED0VFzirRDrb3m2uJu+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vJxRUpEL7lWKysfCF0l79aKUU1njI+6prYXXYn6dRpo=;
        b=XGuOxobdsFC1cGGV9f5S7B8iO8PehC8xpJWGnEQIx48qTs16YUCBU6SKgAJJEKSP+Z
         ElxZKB3OdWPCCKh9p3F5SnyNqUdKeqeMZw37vT1hz/dZQD70gwdwpsgysaJeRFTsqPWO
         ae2LHVrlRiuxdAcXJZp9H5O79HLa7V7jVp6LTFe6MU8CfdUoflUYfbs4Q36J3nmkO8G5
         TMAo5LsoNH4YihjS4QlqZL4Vn/4Z7nOI87SiwlvPGQvKwktDk5AKcc7UTBRBPSLmXKv8
         MlcleiE/Jm/hGvU/1QqbTJosZmZCnoFf8ESSvduxaWjaK94UY5hb9s3NnKSxhTEWLCwk
         bx7Q==
X-Gm-Message-State: AOAM530zyK3ehoIPcpmz710Iga3e5jPEc6leQ1/OTxZOR3b+cm5Btaps
	/oOoR8DNQHaPDBJGfVTjQdKexg==
X-Google-Smtp-Source: ABdhPJxhWB89D4c4yoFmU4XH/6yAzAOHRtLA3eYanva7U+n9VwgQf3xSx4HPUzWxmBqhpQq6gqzhog==
X-Received: by 2002:a05:6000:1a86:: with SMTP id f6mr1591762wry.127.1627632663664;
        Fri, 30 Jul 2021 01:11:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id c10sm838582wmb.40.2021.07.30.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 01:11:03 -0700 (PDT)
Message-ID: <49a1ee543e7d47f6a633aae870f5fada34fb6c78.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/8] overlayfs.bbclass: generate overlayfs mount units
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Fri, 30 Jul 2021 09:11:02 +0100
In-Reply-To: <04ee9e7a-6139-db38-0a08-80962f3e3e24@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
	 <20210715193933.66120-2-uvv.mail@gmail.com>
	 <3374ac50d1997cf849fc5a8d83109dc05cc1926f.camel@linuxfoundation.org>
	 <04ee9e7a-6139-db38-0a08-80962f3e3e24@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-07-30 at 07:14 +0200, Vyacheslav Yurkov wrote:
> Sorry for the late response. Do you mean to move only helper functions 
> to meta/lib/oe, right?

Correct, yes. The things being defined as "def <function>".

> By variable dependencies you mean that bitbake would not pick up meta 
> data changes automatically?

I mean that if a function is something like:

def function(d):
   d.getVar("VAR")

it will no longer magically depend on the variable VAR.

> I will try to move common parts to meta/lib/oe then and send a v4

Thanks!

Cheers,

Richard

