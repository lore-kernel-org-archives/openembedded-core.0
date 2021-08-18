Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.60563.1629320670911947420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 14:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nqu8sgm2;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d5so2742508qtd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=djjPEbaizCml10AdzBMh7yjENboMqo3CqIJixE+0fS0=;
        b=nqu8sgm2u56liszLbnmRZduNXyuLUVnbpAOwuPNVHunPHyI4lFUhofficKd7LNtQA8
         qK5DIJT9jA5RikPs0j/RWbdhjiVCXbvkO4QHYFpXpUo8+yLKcpXVafAPatPD5iohxLLK
         /ush7V0AKdeI5JFemIR3xwq8KxaAPZvtYZYbN8XjM6a64eCoC9EsKqzZWEdq/W8guZZ2
         Hmoain4XyIC91+tMqCV2VL4utXXLN+PxTmX9l/dA4BPQJePfSt54/jeBt13K0gCF+a2H
         QG3hPWnBZrCvUiJtvKAYOaAXctMLkcMMOzDsYnlXZ72w2+CusZ9a0ER7NvimTgxpXkaU
         u+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=djjPEbaizCml10AdzBMh7yjENboMqo3CqIJixE+0fS0=;
        b=Wb1FD+lcOHGVzEnyHzO61Xdbijd/Ec0xJ4ZV82QuxZrorwGIk5lyp2k3hcRI5f+zgf
         KNsrQ+YouTdZNA0Go819Qu0+KrsqvVfjrCu06s/LoLlKz4rgA++IshfokZBQsRLUr1f3
         HpF6oOlc2GA+xydPyyyUNGvkDpdlcapkt4zPueEEV/gfgr8Gh266YdqWnA/eFmw9snmZ
         qJsBEYC0x2QhWd8jNjF3VDYxKXwUrbZD/e5Rt4uHcfa7IhIwAXGLyFXTr2gxtGgReHBv
         jqJMDprsUqkvRtu++VC+lO8RbBXaykAF85jeNgpsREV0HXBW9XZUEkysb1ygoUFaMvs9
         7UGg==
X-Gm-Message-State: AOAM533aC58kkfXIQ6MI7a4++e+ZJO3yX6gXysNc8OUCm1xdK2Wxr7et
	SoSi0KOQpXZIBkyr6MWCVFY=
X-Google-Smtp-Source: ABdhPJxhNIr9ON44NDwR3XZST0E/I0UcLS3+uOeDnj0nzO6PZ4Yf1YGQVEtocDfVkAmAmaOAOfI2ow==
X-Received: by 2002:ac8:7c5:: with SMTP id m5mr3127410qth.180.1629320669593;
        Wed, 18 Aug 2021 14:04:29 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 9sm438506qtz.83.2021.08.18.14.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:04:29 -0700 (PDT)
Date: Wed, 18 Aug 2021 17:04:27 -0400
From: "Trevor Woerner" <twoerner@gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC WIP][PATCH v2] add two zram IMAGE_FEATUREs
Message-ID: <20210818210427.GA7454@localhost>
References: <20210818203605.30426-1-twoerner@gmail.com>
 <de12600b-4b7d-b6b1-83f3-88825631b73b@kernel.org>
MIME-Version: 1.0
In-Reply-To: <de12600b-4b7d-b6b1-83f3-88825631b73b@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed 2021-08-18 @ 11:37:36 PM, Sinan Kaya wrote:
> On 8/18/2021 11:36 PM, Trevor Woerner wrote:
> > this is a WIP patch submitted for RFC
> > this patch only works, currently, with sysvinit
> > but I wanted to get feedback on the general approach before tackling systemd
> 
> How about using/extending the zram package in meta-openembedded?
> Would that be an option?

When I found the zram package in meta-openembedded I had thought that my work
was done. I figured I'd add it to my image and move on. Unfortunately the zram
package in meta-openembedded is woefully inadequate :-(

In fact, if my patch gets accepted into oe-core, my next patch would be to
remove this package from meta-openembedded ;-)

So far I have only considered the case where the user wants to use zram with
sysvinit. I haven't looked at the systemd case yet, but if it has as many
holes as the sysvinit case…

If you look at the package in meta-openembedded you'll see that it:
- tries to do its work using start/stop initscripts
- doesn't even try to handle the case where the user wants to use zram instead
  of tmpfs, and that's not a coincidence

A running system will happily incorporate added SWAP anytime that SWAP is
added. Simply prepare the partition for SWAP as appropriate then "swapon" and
everything is happy. Substituting zram for tmpfs, however is a lot more
finicky. You can't simply wait until after tmpfs has been used for your
various tmp partitions then mount new partitions on top of the existing
/var/volatile and /run. This will cause your logger to get upset, and it will
cause pretty much every currently-running program to not be very happy.
Programs that are started and put their pids in /run and various things in
/tmp don't usually react favourably when those filesystems have something else
mounted on top of them during their execution.

Therefore in order to properly switch from tmpfs to zram for tmp filesystems:
- /etc/fstab has to be modified to not try to mount tmpfs things to
  /var/volatile and /run
- the place where "mount -a" is called has to be modified to setup, format,
  and mount zram-based disks. specifying zram disks is not something you can
  simply tweak /etc/fstab to do. according to the kernel documentation there
  is no
  	zram  /var/volatile zram,ext2 defaults 0 2
  line that can be added to /etc/fstab to get zram-based filesystems to mount
  automatically via "mount -a"

Because this change is much more invasive than simply running a script at a
given runlevel I came to the conclusion that an IMAGE_FEATURE would be a
better fit for this sort of feature.

I also took the opportunity to parameterize various parts of the configuration
to make it easy for the user to either accept the sane defaults, or easily
tweak them to their liking. I added checks to these parameters so that they're
valid/sane. I added the feature in a way that any required packages are added
to the image automatically without the user having to do anything. I also tied
into the kernel's "kmeta config" system so that simply enabling this
IMAGE_FEATURE will also tweak the kernel config to add the necessary options
(again, without user intervention).

Also, if you look at the existing sysvinit script in meta-openembedded
you'll notice that it jumps through some hoops trying to figure out how many
cores/cpus are on the system, then it uses that number as a basis for how many
SWAPs to create. You can tell this is a very old script because, according
to the kernel documentation, this is something that was required a long time
ago, but has long since is no longer required. Simply create one SWAP or one
zram-backed /tmp mount and the number of "streams" is automatically handled
internally in the kernel:

	root@rock-pi-e:~# zramctl
	NAME       ALGORITHM DISKSIZE  DATA COMPR TOTAL STREAMS MOUNTPOINT
	/dev/zram2 lz4         975.6M    4K   73B   12K       4 [SWAP]
	/dev/zram1 lz4            10M  400K 16.1K  240K       4 /run
	/dev/zram0 lz4            30M   68K  1.6K   68K       4 /var/volatile

So, in conclusion, the stuff on meta-openembmedded's zram package is:
- old
- has very few knobs for the user to tweak
- doesn't handle the zram-tmpfs case
- doesn't update your kernel config automatically

(at least for the sysvinit portion)
