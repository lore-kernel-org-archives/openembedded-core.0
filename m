Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.110659.1597931071185022937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 06:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VUNBi98P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id z18so2051297wrm.12
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nAEHbVHj2ZeG4ND8qoYdxZHZEtKgHe4FqoA19XeZ2a4=;
        b=VUNBi98PD0qQbG6NIrXMeUviKSsIyhKzMcna9Okx/trElTijsWLPQoyExBuZ9St7ls
         ELELZzlCM1pxS0zNfUWQnq035Yx4C0McuYYM9JKr7iZIF9w1/glzlAHGzRDOwecQjZ/O
         noE8piH7FYOZuh3aTH67EwgaiteJtCBYiNTp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nAEHbVHj2ZeG4ND8qoYdxZHZEtKgHe4FqoA19XeZ2a4=;
        b=bM8U7Tszb/fgoLHobQY7t3U2jrf47z6cOtWgbiZC73uYEkJMeiVng5I9r/Pq0Cd3Dl
         +deWC2+DPhN8p4EvywfyM9KR0HLaTCrdiQSTf+ozWyI1p0AEv0r7R3I4rLwwzQkZPyVe
         wfSSqDh1izSLIN+Bgni+sXhoR/vJVMv5zsvzQSV+YomyzvdNQcrm6LHk1EgX72wWcQCW
         1+Po/7VKFF1HHyf8ljhjCskHOtqZte3s/+7UitehjAIM4sljCBaKMLZH0EeQI8tDdbcv
         mOweg6bQKDccRch6YbG2I2GqF4uP1FhwFm3PY2QVwCo86bENcWi9qbK3SU7sXfL7iqLw
         lojw==
X-Gm-Message-State: AOAM531kmuRMoeDfQtFBBSWNvEsi9ozJeG1QQyTU4c13sJ1div3D8XN3
	k6pYUU+r57HwxHf77lLfhbgmLw==
X-Google-Smtp-Source: ABdhPJxRnGaUqKXHAxl1A9xL+lgLk85JlvIs6JsIIBtaPmco/sdYxat0MB6iU8YbCG0aKKmjbzAp3w==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr3234100wrn.126.1597931069455;
        Thu, 20 Aug 2020 06:44:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id z8sm4279351wmf.10.2020.08.20.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 06:44:28 -0700 (PDT)
Message-ID: <51e6c1c12faf89297dc9e4caf45e5a3945463d61.camel@linuxfoundation.org>
Subject: Re: QA notification for completed autobuilder build (yocto-3.0.4.rc1)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>, 
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>, 
 "yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
 <apoorv.sangal@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,  "akuster808@gmail.com"
 <akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>
Date: Thu, 20 Aug 2020 14:44:27 +0100
In-Reply-To: <BYAPR11MB3624CCC0E73C6F4B2DE23F59E35D0@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200815050617.E1710247EA@centos7-ty-4.yocto.io>
	 <BYAPR11MB3624CCC0E73C6F4B2DE23F59E35D0@BYAPR11MB3624.namprd11.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-19 at 09:09 +0000, Jain, Sangeeta wrote:
> This is the full report for yocto-3.0.4.rc1:  
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> 
> ======= Summary ========
> No high milestone defects.  
> No new defects are found in this cycle.

Thanks Sangeeta and team!

Cheers,

Richard

