Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.16995.1612092888336702664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 03:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MRsuQyu4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f46.google.com with SMTP id g12so19751202ejf.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 03:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mkXjQOqRFoGMj+tEUntm4CKnbITHjh2FRGAuGo/t2Qw=;
        b=MRsuQyu4rVoPorcqtB61J7r+jS/qp2C/M4+gKNfXkW4ooHNs5bc4zC9fldXX1Qllvm
         As26NhfABXSC+7VbVZ/skkMEF9ruMuPlPOMvfdONL7+oDHi65DOARvw8a+xpHyj6sh4/
         sMzR+yacVMnIuaY05k6QwDDfgsHq0k59VSWdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mkXjQOqRFoGMj+tEUntm4CKnbITHjh2FRGAuGo/t2Qw=;
        b=mkyux9d8aGJCxp8PvWBiMr3VDX6o2R9Wb5qfumHl9k/nMIUelKfFQ1AD9ii0zE6Ib/
         IRKxZYioPvij5bTqGuZ0AXqOEXdGNGHBjO1xRDzNP8oIAHRx8nazmvDsRUk84bECXrvT
         jnHgpQ4TSGXvZbygdVh140CNS0yejYjLQfdMlLP8eCMQLkffTQF1PGnn3A0EujBh+iOA
         QdCu1pkId6mbSZjUMAxBpGUlINA/VkYBxRff1zo3b/lkKZt7xTusFcYl7dPUVRP05a9r
         HAXDlOtGrzWOfiJybhePryrfS6CLaEKwHel21ikMkFTlZREJa54pvfYQ9qjhu2CD1mJC
         KttQ==
X-Gm-Message-State: AOAM5313v4FSakTE0T4XQuJts9tMgA00Z+1Q/XOVf/uQB0oPtaS7JH1h
	1AyK+WlWcuKktWBWA4u22K/4rg==
X-Google-Smtp-Source: ABdhPJyI4XU3i8SURagNXfx17K8s048793o4toC7o4DY4QGV30P/kFod0DyQfceODLF/E8hnl5yGSA==
X-Received: by 2002:a17:906:a2d2:: with SMTP id by18mr5217056ejb.262.1612092886954;
        Sun, 31 Jan 2021 03:34:46 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29f7:5a4e:c660:258e? ([2001:8b0:aba:5f3c:29f7:5a4e:c660:258e])
        by smtp.gmail.com with ESMTPSA id p21sm7034564edx.90.2021.01.31.03.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:34:46 -0800 (PST)
Message-ID: <a74c0f3dfbbcd6655b577f281858e264c0458a2c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] QA notification for completed autobuilder build (yocto-3.3_M2.rc1)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, Sangeeta Jain
	 <sangeeta.jain@intel.com>
Cc: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, 
 openembedded-core <openembedded-core@lists.openembedded.org>,
 "qa-build-notification@lists.yoctoproject.org"
 <qa-build-notification@lists.yoctoproject.org>
Date: Sun, 31 Jan 2021 11:34:45 +0000
In-Reply-To: <CANPvuR=_aZWF7Yt=7sk3NSYCWAJbwz8zHtzbQvbUDeoS7YFB9w@mail.gmail.com>
References: <20210121050529.465241A30A4@debian8-ty-1.yocto.io>
	 <BYAPR11MB362480C0773B27E427539424E3BB9@BYAPR11MB3624.namprd11.prod.outlook.com>
	 <CANPvuR=_aZWF7Yt=7sk3NSYCWAJbwz8zHtzbQvbUDeoS7YFB9w@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-27 at 09:45 +0000, Jose Quaresma wrote:
> Hi All,
> gstreamer1.0: fix failing ptest
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7b90027aac9fa41b3dc98765151d761df8dabb97
> 
> Is this commit present yocto-3.3_M2.rc1 ?

Just to confirm, it wasn't so this should be fixed for M3, thanks!

Cheers,

Richard

