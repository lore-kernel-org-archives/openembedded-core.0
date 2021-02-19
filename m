Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.7213.1613734613805995792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 03:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WQF4mGua;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id o24so7287490wmh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=i2Bku7lILT65WgabhwebOgGTt6Onz/m6e14gH/9am0Y=;
        b=WQF4mGuaJ5icNxYO2QbSdyrROX9t5BzL6iDb0F1WtDPnB3ZB1SZpfeqhl6Cyq9r/Ws
         docil1jRHkPJsrgm+Ev5QlTSuO4eDchbfQHcHROINgEHruEMrTj9IWsZhSRaN2gHVesg
         vEJDE0mWccXW+1J/DKqZYX4N2Z7OtmT2JkAWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i2Bku7lILT65WgabhwebOgGTt6Onz/m6e14gH/9am0Y=;
        b=nIO2+v7FiX18VtPaBwXIe7KSNYEBp3oFD9FDvAQ3+kvpN2krlTmpbb+oB6Jc1Qoks7
         p6PJVGUxmXora4YoVznKUFj9Eb6XspEgRaWU0Wtze0z8qsVp/wA/z/I6WTv2SxfuDsFg
         06Pf0e7mLolmwKVeP7q7ZW3Wp3QO6AbIqOELUuJFaIDeHLyavuuhF/26zCe0M+EczAhS
         DrKZeSjfO65WNwl/YJr1b12HM4Mw6pax6VHrFd518hi16ML/r+7EqQ4LizEkfvJqvnFN
         sArjeLx4ssSkVYftXj5PUu+QsX5S38fi3dp38KHtRA7R/xpRH3IAmjzjL3JN2er4pLb5
         L38A==
X-Gm-Message-State: AOAM530Sq9AG35tI7iPmKesjiMBA+4s8KZoEN7TeacIy5JsGjilyIjJ8
	27YyFZ/m/Zi0hrwMW5o07kboxbAv9UgF0g==
X-Google-Smtp-Source: ABdhPJxc2t1weONPQ3crqle49W+lcIYa86d03Ar5K6NwJsFMYlWXg6ndICbkybLoKDMYO0NQuQ1/3A==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr862842wmi.1.1613734612322;
        Fri, 19 Feb 2021 03:36:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id r1sm13036917wrl.95.2021.02.19.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 03:36:52 -0800 (PST)
Message-ID: <5b5b7cb71b40268712a8bf9d18e33bf6901cebd4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/1] wic: warn on usage of Y2038 affected file systems
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>, 
	"henning.schild@siemens.com"
	 <henning.schild@siemens.com>
Date: Fri, 19 Feb 2021 11:36:51 +0000
In-Reply-To: <63367642579f08f14d87cfcb8212483aaabf1ba1.camel@siemens.com>
References: <20210218130559.43404-1-florian.bezdeka@siemens.com>
	 <6e28620fe97ac6c3363ef47c12d7333b2c4b1511.camel@linuxfoundation.org>
	 <63367642579f08f14d87cfcb8212483aaabf1ba1.camel@siemens.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-19 at 11:19 +0000, florian.bezdeka@siemens.com wrote:
> Hi Richard,
> 
> On Fri, 2021-02-19 at 10:55 +0000, Richard Purdie wrote:
> > On Thu, 2021-02-18 at 13:06 +0000, florian.bezdeka@siemens.com wrote:
> > > From: Florian Bezdeka <florian.bezdeka@siemens.com>
> > > 
> > > The following patch is the summary of a nice journey through the file 
> > > system jungle regarding Y2038 problem. It all began with a warning which 
> > > is reported by kernels >= 5.4:
> > > 
> > > ext4 filesystem being mounted at (mountpoint) supports timestamps until
> > > 2038 (0x7fffffff)
> > > 
> > > When reading this warning I was surprised. Shouldn't a modern file
> > > system like ext4 be Y2038-safe? As it turned out it depends on the
> > > inode size if an ext4 file system is safe or not. So why was the
> > > inode size not sufficient in my case?
> > > 
> > > The inode size is chosen during file system generation and depends on
> > > the size of the file system that is going to be created. For details
> > > let's have a look at `man mke2fs`:
> > > 
> > > -T usage-type[,...]
> > >     Specify how the filesystem is going to be used, so that mke2fs can
> > >     choose optimal filesystem parameters for that use. The usage types
> > >     that are supported are defined in the configuration file
> > >     /etc/mke2fs.conf. The user may specify one or more usage types
> > >     using a comma separated list.
> > > 
> > >     If this option is is not specified, mke2fs will pick a single
> > >     default usage type based on the size of the filesystem to be
> > >     created. If the filesystem size is less than 3 megabytes, mke2fs
> > >     will use the filesystem type floppy. If the filesystem size is
> > >     greater than or equal to 3 but less than 512 megabytes, mke2fs(8)
> > >     will use the filesystem type small.
> > > 
> > > The relevant parts from /etc/mke2fs.conf:
> > > [fs_types]
> > > ...
> > >         small = {
> > >                 blocksize = 1024
> > >                 inode_size = 128
> > >                 inode_ratio = 4096
> > >         }
> > > ...
> > > 
> > > So whenever you create an ext4 file system with less than 512MB in
> > > size you will end up with 128 byte inodes and your file system is
> > > not Y2038-safe.
> > > 
> > > Some words to the other filesystems supported by wic:
> > >  - ext2 and ext3 will overflow in 2038, 
> > >    The user will be warned as well
> > >  - squashfs will overflow in 2106
> > >  - btrfs uses u64 for time representations, so Y2038 safe
> > 
> > 
> > Thanks, this is probably something we need to do. I did apply it in the 
> > test builds and they do show a few warnings:
> > 
> (sorry for breaking the link, but hopefully our infrastructure is being
> fixed soon)
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F58%2Fbuilds%2F3052&amp;data=04%7C01%7Cflorian.bezdeka%40siemens.com%7C35ed532b2cf14a3fb99e08d8d4c4eae5%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637493289505466921%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1fZIR%2BFOFjTL%2BXaIjZJAVgg6x2YcV6UN6te1Akuvj%2FI%3D&amp;reserved=0
> > 
> > Before we could merge it, we really need to fix this. Are there parameters
> > we should add to our default ext4 to make it Y2038 safe and avoid the 
> > warnings?
> 
> Sorry for the warnings in the CI system. I didn't notice the .wks file
> that is used for that test, but that is actually doing what I wanted to
> achieve: Warn users that there system is affected by Y2038 problem.

Its fine, it was a good test that it works in some ways! :)

> There are a couple of possibilities now:
>   - Adding `--mkfs-extraopts "-t ext4"` to the affected partition
>     This tells mke2fs to use the parameters used for "normal" ext4 file
>     systems instead of the "optimizations" for "small" ones. (There
>     was some additional information in the cover letter)
> 
>   - Adding `--mkfs-extraopts "-I 256"` to tell mke2fs to use the bigger
>     inodes.
> 
> I decided to not apply one of this options per default. Depending on
> the target system and use case there might be (performance) side
> effects.
> 
> Should I come up with a v2 and adding one of the mentioned options to
> the .wks file? In this case both of them are possible. Or should I just
> sent out an additional patch?

In this case a v2 with the additional change might be good, then if people
run into the same warning and find the commit adding it, they'd find
an idea of how to potentially fix it too?

Cheers,

Richard



