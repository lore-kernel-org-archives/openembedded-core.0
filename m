Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.51646.1612270448752696166
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 04:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nqt7kz8s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id g10so4492977eds.2
        for <Openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 04:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iH++NPqMwnZXLlkrExg1JcdSkkeYlN34FsyBquTMl2E=;
        b=Nqt7kz8sf7OJiAFKwuKUa4kBh8j+73ssSxIRNReggX7RAjY4hUhwmOlz4U0smg2oGr
         ysx1U7hAt9+xgNuB3j5EoUzrU0OUhdNwy5qHVqpw/XZRRmMPFbSuvG5mpuc0BhSrvuU5
         vBsL2Bqb6aPQe1ict8UwtFddWRZLESW2whISw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iH++NPqMwnZXLlkrExg1JcdSkkeYlN34FsyBquTMl2E=;
        b=OjZzVauOBzgk3FU09XXH/n67GleO77EgYcrJhNUoJHX+Ha6edeZ1y5wamjxLxAbuL+
         KHLFzM+HLUEU9T0wq21rJ20oIOgjwT9KfFJO+cIAE8lJTKekD/SJwJUxzpcbjaqL2Ofi
         1gmi2Vy5GNmTtFRPiEVQd4vOxD+d/CsVKeZx+sglOPCiv0WGzyVS9EkAvzpt8ewwzHJ1
         f+oC4lSTJ8DCB/uVx4niVS3OBfJVRKmqIIWq6cFAsKZccS/AeM2u7ZjG1Mjfa7cvREUq
         KNkiuB4W9xj2agGyB6O5OMIvjD1FUHdneiLA82Tpd7sC8LWHa7XW2hOdo8VfDTePVqvx
         V05Q==
X-Gm-Message-State: AOAM532uxK09zh3H5i5c1H31sDu5hFXDSiloyp8nIcFiyXRe5Y/hQLrY
	ueNJiV2hDF4g9p6j8p2y3npn7w==
X-Google-Smtp-Source: ABdhPJyZv52heZgF3vL0KhrXkejX3mylGlJBhUEzGZXTMOwqzPV7pTLrZRYQ7fYiXSNDwUcRs0l4CQ==
X-Received: by 2002:a05:6402:2694:: with SMTP id w20mr23615467edd.200.1612270447330;
        Tue, 02 Feb 2021 04:54:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d48:268:5d93:58e4? ([2001:8b0:aba:5f3c:1d48:268:5d93:58e4])
        by smtp.gmail.com with ESMTPSA id w17sm9478016ejk.124.2021.02.02.04.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 04:54:06 -0800 (PST)
Message-ID: <bf33f16b3853d4d02e37ffc9e5327501dbb117a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] oe-selftest for systemEmulated does not work.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vinay Kumar <vinay.m.engg@gmail.com>, Patches and discussions about
	the oe-core layer <Openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Date: Tue, 02 Feb 2021 12:54:04 +0000
In-Reply-To: <CANUMPcWEyL1rKt35_UYvSmjTsLVVOvPhd=Magc8w3isovOLE8g@mail.gmail.com>
References: 
	<CANUMPcWEyL1rKt35_UYvSmjTsLVVOvPhd=Magc8w3isovOLE8g@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-02-02 at 18:18 +0530, Vinay Kumar wrote:
> Hi,
> 
> Could not run oe-selftest for gcc using qemu image using below command,
> $oe-selftest -r gcc.GccCrossSelfTestSystemEmulated.test_cross_gcc
> 
> getting qemu boot errors as follows,
> ERROR: Qemu pid didn't appear in 120 seconds (02/01/21 19:23:28)
> ERROR: Status information, poll status: None, pidfile exists: False,
> pidfile contents None, proc pid exists False
> 
> The boot uses the tap0 interface. And also observed that the pid file
> is not generating when the qemu boot  command is triggered.
> 
> The launchcmd for qemu boot is,
> runqemu snapshot nographic qemuarm
> /extra/build-master-2/tmp/deploy/images/qemuarm/core-image-minimal-qemuarm.ext4
> tcpserial=51301:51487 bootparams="console=tty1 console=ttyS0,115200n8
> printk.time=1" qemuparams="-pidfile pidfile_8153"
> 
> Also attached GccCrossSelfTestSystemEmulated.log
> (build-dir/tmp/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/testimage/qemurunner_log)
> for reference.
> 
> Additional info :
> The oe-selftest execution is tried using latest poky-master.

Looking at the logs, I think its sitting trying to execute:

sudo /home/vinay/reference-poky/poky-master/scripts/runqemu-ifup 1000 1000 /extra/build-master-st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin

to setup the networking device, perhaps waiting on a password.

You could try running runqemu-gen-tapdevs instead to setup those
devices in advance, or give it permission to run that command without a
password.

Cheers,

Richard

