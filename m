Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.1967.1587133416717944796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 07:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Flyzqt2H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id t14so3217845wrw.12
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cbXYDdoWE2KwgyPHKpAvprogq1GHu+OVF3RNNNUr/b8=;
        b=Flyzqt2HflpPDCw7qX2+Kk11Q3XNjlW2xYqnTuncrk+y1pDhZhnjVCxE6ha9QUICZ6
         Aqi62SdjNXezVqPMSxnDcFTgYgwiJ2Xi1dMEVl0s23yU4Z93dpgZoiVDtJoKyT0GX0Og
         Ykj0YxM39adQwz5JKxabhEkIJu4QRphaPEkrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cbXYDdoWE2KwgyPHKpAvprogq1GHu+OVF3RNNNUr/b8=;
        b=gJWuIHY5OmbxWpUL3kvepFkTsWdITQ/+5Wndc9jVAh4EDKP8AXQvW/g6wQhW7ElM71
         tTplmJpiz0M9HiYsLW9KZdO7IBdjD4eWC60F2uwYj/YYz3A614hv/Ko+BEDDwrXTkQTG
         sGUIoxHR/yEaf0qFXeEgMBccgyZiVOSFV1vamE950EKiepi1C1sixfaWS0XDCk+maJYe
         lb4PotlauO5mKB6Mb2SmTHSqVkGFXV5JkMwW/IVB21oUqDVAp43at1kRqj5QHGaUNXpE
         6DnCS4alRf59AFiz+S6KX1QovDi93HGTxz4HeKS3PXsSsRZyQ6ijqLHJSWZgBzOuo4CK
         r34w==
X-Gm-Message-State: AGi0PuZGaJw1AOeJfwLxy6midGUi4aHqMtsi3eGlGhYcrb28PBoOBQtX
	HuO3qlCpVm87pbaGb6vxa1I12g==
X-Google-Smtp-Source: APiQypJb1cyPLeHX4nPgxqcGMsHP5bdKqFOrU+zySayUegSgunlNbAiE6Eo8YfxgDW8zjb9FYqc/hg==
X-Received: by 2002:adf:c442:: with SMTP id a2mr4157281wrg.110.1587133415330;
        Fri, 17 Apr 2020 07:23:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g186sm7961411wme.7.2020.04.17.07.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 07:23:34 -0700 (PDT)
Message-ID: <32628e313368db285b51d04b8278dfcdace4c7c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/weston: Enhance weston tests
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Apr 2020 15:23:33 +0100
In-Reply-To: <BL0PR11MB3251695A651506BDAEC39943C8D90@BL0PR11MB3251.namprd11.prod.outlook.com>
References: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
	 <e8c932bc18840d681befb3606076563ea5fbde84.camel@linuxfoundation.org>
	 <BL0PR11MB3251695A651506BDAEC39943C8D90@BL0PR11MB3251.namprd11.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

On Fri, 2020-04-17 at 01:53 +0000, Yeoh, Ee Peng wrote:
> Hi Richard,
> 
> After more testing, I realized that it will take different amount of
> time for each host machine to initialize new wayland compositor. I
> had added the logic to retry the checking of new wayland compositor
> to comprehend this host machine differences. I had submitted the v02
> patch. 
> 
> Thank you very much!

I did try the v2 patch but it still failed unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1788

Cheers,

Richard

