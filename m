Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.963.1615420899317708969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 16:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FTOWRqZh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso11733760wmi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 16:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ow01oNnKO8/WxLbyMdQxJPH8wyo5xQu6sH5oTxuBE+w=;
        b=FTOWRqZh4CptuFTGBtjCLjyl9/r9uijUu3rIJUfL/u7jGiioStu/jE8XoRnqwZHkxt
         IqtMWGhUWzRsFAKXveTyN4yqETidiKiWf1d8Q8R1V91bZyskSdnsCqEHDDPnHxI699u3
         iibKWirP6ovt0kT7RtcM/1MQEwUS9+UeVm2s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ow01oNnKO8/WxLbyMdQxJPH8wyo5xQu6sH5oTxuBE+w=;
        b=Ga06OrzPXDfo4kIuiQW8awksujJ+xPYVXN0v6XiTGR2xtKBb+Zt1Js1+TvGMd58m5A
         2DthLDV3fxUG3WeAVx4c1Cv7+libJBv0QJh6idCjU+4WtkR/rRsBpHN9nwBIW8Rk6bUK
         9/mJncF9g2cYfd+HY+g6Hs04bePSLBg2GXj3tD/4Jdj4GHItuWAmvCdSSHX6W6iSOkvv
         6GMe7anhvPMKpohZxzKeUuSYdbdUOsb017bN6RvewkdqyrPf2gU82zG7m/R3V/+AXs4R
         gTpSvlPSExV/CU3T/aBmxwiLUQDxDt3Tpc7ICNXGR+B8Opwnbl/yhRl51L7UTZKZY/JT
         DgoQ==
X-Gm-Message-State: AOAM5332jC3kOyGvIh5GI6TcWbJ/mdv9EMpbi3QAI8pWEhxc9IRQLDrY
	q6WoNXRctjjAJmnfGpNyq3/1Rw==
X-Google-Smtp-Source: ABdhPJzD1D/TLs6p5o/OPGLkiJyYPOFWtjMQCQ5M/qG/iSGY3wZ1Qr2A6eyT0E8klxGt3yRTps/puA==
X-Received: by 2002:a05:600c:190c:: with SMTP id j12mr5626659wmq.133.1615420897750;
        Wed, 10 Mar 2021 16:01:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5? ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
        by smtp.gmail.com with ESMTPSA id s20sm923225wmj.36.2021.03.10.16.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 16:01:37 -0800 (PST)
Message-ID: <a5654f84a58994708704c7e48c60975466caee0c.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/27] Pull request (cover letter only)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 11 Mar 2021 00:01:36 +0000
In-Reply-To: <20210310113442.bowxtz5ckz7kfkij@jama>
References: <cover.1615334832.git.steve@sakoman.com>
	 <20210310113442.bowxtz5ckz7kfkij@jama>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-10 at 12:34 +0100, Martin Jansa wrote:
> On Tue, Mar 09, 2021 at 02:09:38PM -1000, Steve Sakoman wrote:
> > The following changes since commit dd893279f352e290c23577a0f91df1b8c6232f10:
> > 
> >   selftest/reproducible: Don't call sync between each file compare (2021-03-04 04:19:50 -1000)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> > 
> > Martin Jansa (1):
> >   sstatesig.py: show an error instead of warning when sstate manifest
> >     isn't found
> 
> FYI: now when this was backported to gatesgarth and dunfell I've found
> one case where it triggers this error:
> 
> http://jenkins.nas-admin.org/job/LuneOS/view/testing/job/luneos-testing_mako/735/console
> ERROR: android-kernel-bootimg-1.0-r0 do_package: Manifest
> /home/jenkins/workspace/luneos-testing/webos-ports/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-initramfs-android-image.packagedata
> not found in mako cortexa8t2hf-neon-halium cortexa8t2hf-neon
> cortexa8t2hf-vfp cortexa8hf-neon cortexa8hf-vfp armv7at2hf-neon
> armv7ahf-neon armv7at2hf-vfp armv7ahf-vfp armv6thf-vfp armv6hf-vfp
> armv5tehf-vfp armv5ehf-vfp armv5thf-vfp armv5hf-vfp allarch
> x86_64_x86_64-nativesdk (variant '')?
> 
> The error looks strange as it probably shouldn't be looking for
> nativesdk- manifest and it doesn't happen with master.

I don't know why that would happen but nativesdk is a red-herring, the code 
just iterates a list of possibilities and nativesdk is the last on the list so
the error would normally show nativesdk if it didn't find anything. That is why
it lists the possibilities.


Cheers,

Richard

