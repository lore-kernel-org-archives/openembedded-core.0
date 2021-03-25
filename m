Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.8844.1616682434845061763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 07:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KgBBpeom;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id g20so1287682wmk.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CKadSrp+vMRTHd+Ruuoe3uqRj95lKq1UTLHcq4k/Lys=;
        b=KgBBpeomvZdQn7rf6IlWftEXy/fbPMh9xYKHf5Z3bQEnGTMFSOjxpX+AQJGJ56+oJd
         ernq99wFDVC2RKaqCi7+EHcMwPvpICf2h/G9LiSTSSAIYn09BRdhneGfrsCQcXYsO+8I
         H8x6+ukpy1se4/v9tCt1SHmWgAM/0E/fUMB34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CKadSrp+vMRTHd+Ruuoe3uqRj95lKq1UTLHcq4k/Lys=;
        b=WDrxbOKgDz9bnXOMVDdw+LObXGa6S+BWuovhiHQaM6zChXjBO/IXdN3T3PUaVD1IKs
         t5zsKcdtMFW6JIYjVzsx7xOYlFeb0+ZkRSwzWYifh2PN85vxc4D15xUNpqL/Qx9c6DZr
         NoHCaFxgaRlGaElGFuHkv5vMxdnJk55nD8f+/z9ELldi8wf8sONKkZOQT1Thr3VrRvLV
         XQDavvz9jTQzmsNE1eHQwc0w9JAUn5nZBrqhs0nlz4F6v1HlYHd1UpaPuiKHkMB1CcGw
         gp/mWKwhc14lW3ZDr2vSqooz9+RyECxfQznV+FYta3jF18DQrn/oDDQDqnkceRRUiIRb
         esiA==
X-Gm-Message-State: AOAM532Rg5tXR3NtzeoNM+b1fg5KJO6Igcld5qBiiuXQYvQ1fQlaKugb
	j6PJ6zyHK3q3K8SCee2jzM5qqw==
X-Google-Smtp-Source: ABdhPJxrDQGknU/3NBeaKRjqB5kO9R2SDZjVhS7JiboVhxI5l+o+F9BzZzwonvcoRH/BFl4PX9YS4g==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr8107892wmg.182.1616682433344;
        Thu, 25 Mar 2021 07:27:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id z8sm6065226wrh.37.2021.03.25.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:27:13 -0700 (PDT)
Message-ID: <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "Oleksiy Obitotskyi
	-X (oobitots - GLOBALLOGIC INC at Cisco)"
	 <oobitots@cisco.com>, Luca Bocassi <luca.boccassi@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, 
	Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 14:27:12 +0000
In-Reply-To: <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 ,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
	 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
	 <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-25 at 14:22 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 25 mars 2021 10:34
> > To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)
> > <oobitots@cisco.com>; Luca Bocassi <luca.boccassi@gmail.com>;
> > openembedded-core@lists.openembedded.org
> > Cc: bluelightning@bluelightning.org; Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>; Khem Raj <raj.khem@gmail.com>
> > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > recipe to allow bootstrapping
> > 
> > On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots -
> > GLOBALLOGIC INC at Cisco) wrote:
> > > Could you look into this warning.
> > > 
> > > WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-linux-dev
> > rdepends on util-linux-libuuid-dev, but it isn't a build dependency?
> > [build-deps]
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226
> > 
> > That failure was my fault when testing some fixes.
> > 
> > I've sent out a patch which renames util-linux-uuid to util-linux-libuuid
> > and sorts out the license issue Peter reported.
> 
> I don't mind the recipe being renamed and cleaned up, but I would prefer 
> to see my entire patch for the license parts being either integrated before 
> this or squashed into it, whichever you prefer. It does not make sense to 
> use the same LIC_FILES_CHKSUM for util-linux-libuuid as for util-linux, 
> and setting the other LICENSE variables in util-linux.inc no longer makes 
> sense as they are only relevant for util-linux.

I'm torn on that. Code with the other licenses is present, just not used
in the final output and I personally suspect that having one LIC_FILES_CHKSUM 
is going to be easier to maintain in the future rather than two separate ones.

Cheers,

Richard



