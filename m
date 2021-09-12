Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.16844.1631458520055543968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 07:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b8bwOxz+;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id m26so6475803pff.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HMumFdTBPRfBXpNoSm45QEWg0KrNXGvGGZj7pE/Yv+0=;
        b=b8bwOxz+haOzOLryCtkncZ+imYTKRlt8rZB4cnD4CmGCXNO8kuA1ufbz1tyrM0MZfa
         OiZzXc5noIY0U0NLYbhw7N0+c+AeoWriYRGTwxzCQwg5HOEzcIfJv0cKY8TFwBGaDh4o
         50m4GfWPj8IHA+FSB6eLjfP1pi2yq2/0aCmskF/K4VK5ioBr8ZyGM/eEKMuw9RvT519r
         rEVk5UFdgUrzl92AW4r0H6h6bwsa5npzZWA96OH9U3qhe0FNJBCD5p9Sx9KXeUr8K1a9
         gcsIJ75Aa5LFZCQznZvPxded6MOBufu1TsrO/kNnDklzzMOWDSmj2aRBxJnzsK+IGGZp
         Twxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HMumFdTBPRfBXpNoSm45QEWg0KrNXGvGGZj7pE/Yv+0=;
        b=Ig8Fx/jZjWHkfJGaFcHRkB2A2cn9ZVt6jp1B50yeCC4OqESZSl5hOxiCCaSzsFzMFC
         /2TOxVhsS5Jx8dUq0jiFWSqKjZ9dbI2flwtVHxuhd3NQf+4K4XupOw8g7Sc99zkb+DI6
         4sgjCX+Qk3Mbpv1yZy1hchtVMFZd1TnyOu6ajsSfBRajAXswoJPPZ+/GBBuPNAjmC3vN
         jdN8V0y7i+9C4GIzdGnOpKWTeTq4PnJ4m78kWfi+P/5tumfTXKTu1T+DWB0N0Tb8RSNy
         On2fIQKPiUuG7HfvU29py9jfn/wFKZWwfk3bWmHfoftwqC6O+D9FyRUi1Cgxo2QP4zjn
         igDA==
X-Gm-Message-State: AOAM532/SEevmYnMsYEy1ds7KHcispHN1dK4Ualb9FWO2D3z30FBZRQ2
	hfOh8/ZTXvOC/8i20EVwAlc=
X-Google-Smtp-Source: ABdhPJzDwI3D2Ywub/WaDCCb3JOhZ8VShO4UyMD8yVuUcdNpy2LONaA0X3UtYdGmOCgL0g5t9cYfbw==
X-Received: by 2002:aa7:93dc:0:b0:3f8:a765:a948 with SMTP id y28-20020aa793dc000000b003f8a765a948mr6901259pff.27.1631458519378;
        Sun, 12 Sep 2021 07:55:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:b27c:7a4e:d59f:d7eb? ([2601:202:4180:a5c0:b27c:7a4e:d59f:d7eb])
        by smtp.gmail.com with ESMTPSA id v13sm4338537pfm.16.2021.09.12.07.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 07:55:18 -0700 (PDT)
Subject: Re: [OE-core] Public project sstate/hash equivalence mirror now live
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <0b6111c1d71f1665cacafafaea972e609a77a0cd.camel@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <95bf1261-eb40-cafa-3153-0c472142fb98@gmail.com>
Date: Sun, 12 Sep 2021 07:55:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0b6111c1d71f1665cacafafaea972e609a77a0cd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/12/21 4:46 AM, Richard Purdie wrote:
> We made the autobuilder sstate public a while ago but it wasn't useful after we
> switched to hash equivalence by default. I'm pleased to be able to report that
> we now have a read-only public server for the hash equivalence. We did have to
> fix a small API omission and a couple of sstate related bugs but I'm pleased to
> be able to report it is now operational and usable. An example config would be:
>
> SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
> BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
>
> I've included an example image build below where it took 11 minutes for a 
> core-image-minimal image build. Obviously this is only of benefit if you're
> building configurations that match the project autobuilder although hash
> equivalence could be useful alone in reducing some build times.

What branches that support hash equivalence will be available other than
Master?


>
> I have updated the local.conf sample file in poky to match the new release.
> We're not widely highlighting that information as yet as it remains to be seen
> how well it scales and what the hosting impacts for it will look like but it is
> there to experiment with to a wider audience such as this list.

The should improve the out-of-the-box experience.

thanks,

> The builds will sit for a long time whilst it queries hash equivalency and I
> appreciate the UI feedback could be better there but one step at a time!
>
> Cheers,
>
> Richard
>
> $ time bitbake core-image-minimal
> Loading cache: 100% |                                                                                                                                                       | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100% |######################################################################################################################################################| Time: 0:00:03
> Parsing of 871 .bb files complete (0 cached, 871 parsed). 1519 targets, 49 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.51.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-20.04"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "3.3+snapshot-89e48765083f15bf79839a778d08a68f8aece51d"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta                 
> meta-poky            
> meta-yocto-bsp       
> meta-selftest        = "master:89e48765083f15bf79839a778d08a68f8aece51d"
>
> Initialising tasks: 100% |###################################################################################################################################################| Time: 0:03:40
> Checking sstate mirror object availability: 100% |###########################################################################################################################| Time: 0:00:28
> Sstate summary: Wanted 1525 Local 0 Network 1515 Missed 10 Current 0 (99% match, 0% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 3913 tasks of which 3603 didn't need to be rerun and all succeeded.
>
> real	11m2.578s
> user	0m42.927s
> sys	0m9.963s
>
>
>
>
> 
>

