Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.305.1616607431567211471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EoahoAjK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id x16so25289252wrn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VGQ1os/QiVxxBTkzIO6GaPG3QJwQpfV6tArRLJHUx/8=;
        b=EoahoAjK7LT+zjHNMNCRRbrKNLi7so91bIcn1zlY2AlDBbTt/LOMxfgezR2GlP2J5R
         NyHEszsLaSnQTClcBCXMc8YNiK9W01Ww11QeOYwWqxTXWd5dfDvJq13HUgUHxaufd3/Q
         mvFk26MQuQMWdahJla05iLOHXpldfmQBhGV60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VGQ1os/QiVxxBTkzIO6GaPG3QJwQpfV6tArRLJHUx/8=;
        b=nV5NMhqwLH5qyjIoLbt85CHwVhP8VXsLMMPTz8CHSKzYA7+drQmh8shQJa6j1LsDme
         hPYdZHHzNUxQJSdX3DSXLNflv1cxY4S8/esbsFddVexAe1fa8nVeBkuG/gxAtPjY3ND/
         OvLonQOHQpYRaXmgH64D3PaNOKJWQQyDLWo9X7XLq4lfdIMbKkJKrVxf86wRfpOlRPLK
         vWG5RqDaQx44hHhCLCeLKBIxAykwfBNDnZ1GTTTeX6tnQpqJYwirAogUa3tbkKg88Hpd
         cEMUWje+LaG+DiVPBpwtKEzE5qFsdu/ChikfhAPF4Aqab5fdqBmUa7weBfS/Nk6pWXKZ
         HUjQ==
X-Gm-Message-State: AOAM5332XzifVKWfk5duVlRanH49kcjkPB0Kl4RRJwvAMPOJuZXXd2J/
	Q3dQLmCIFWzkDnVPFOC2JO/xbg==
X-Google-Smtp-Source: ABdhPJx3RbGTKgu2xgCo8RIh41W5e6N7j7xTK8+csEJBSIuGZ2VaGoiD4YEFcro1TqeU1NdhVHpfDQ==
X-Received: by 2002:adf:8b58:: with SMTP id v24mr4613770wra.160.1616607429746;
        Wed, 24 Mar 2021 10:37:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93? ([2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93])
        by smtp.gmail.com with ESMTPSA id x14sm4079393wrw.13.2021.03.24.10.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:37:09 -0700 (PDT)
Message-ID: <cd4ac541b34a1d30dd02797cf5a0ac4d9802c8d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <Luca.Boccassi@microsoft.com>,
 "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
 "martin.jansa@gmail.com" <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>
Date: Wed, 24 Mar 2021 17:37:08 +0000
In-Reply-To: <999621be325d671cabd9a7b9ef270176a87889b8.camel@microsoft.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
	 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
	 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
	 <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
	 <20210315135555.hlkwmj4yj5ugw2he@jama>
	 <166C88B2CBAB1BAF.20509@lists.openembedded.org>
	 <eb829949abe227556ae2d4ef8c0e11f6141508d9.camel@linuxfoundation.org>
	 <c9335d1e-e133-1c1c-65f1-13fac6b6b43d@broadcom.com>
	 <999621be325d671cabd9a7b9ef270176a87889b8.camel@microsoft.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 17:03 +0000, Luca Boccassi wrote:
> On Wed, 2021-03-24 at 09:52 -0700, Scott Branden wrote:
> > I have not debugged yet, but I suspect this change is causing the following failure if I merge the latest poky into our builds:
> > 
> > ERROR: mc:host:util-linux-uuid-2.36.2-r0 do_package: QA Issue: util-linux-uuid: Files/directories were installed but not shipped in any package:
> >   /usr/lib/debug
> >   /usr/lib/debug/usr
> >   /usr/lib/debug/usr/lib
> >   /usr/lib/debug/usr/lib/libuuid.so.1.3.0.debug
> > Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> > util-linux-uuid: 4 installed and not shipped files. [installed-vs-shipped]
> > ERROR: mc:host:util-linux-uuid-2.36.2-r0 do_package: Fatal QA errors found, failing task.
> > ERROR: Logfile of failure stored in: /hdd/yocto/genx/poky/build/tmp/work/core2-64-poky-linux/util-linux-uuid/2.36.2-r0/temp/log.do_package.31753
> > ERROR: Task (mc:host:/hdd/yocto/genx/poky/build/../meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_package) failed with exit code '1'
> 
> It most certainly is - is /usr/lib/debug configurable or supported?
> Currently we have:
> 
> FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"

Does it need to be set at all or will the default not cover this?

Cheers,

Richard

