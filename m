Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.6466.1623238659624608661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 04:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bRr+5wu3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id c5so25061442wrq.9
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 04:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=f6KnboDVnUVHEpn3eaAEpEUGsG0yYxmdQtcQoHwbQCQ=;
        b=bRr+5wu3lY1TDIRQfyGUXz/vsDPA31e89NglMcg4bqqOotAAshbjX7ye2ropMSQNRZ
         yZFbZGLfsGawBnmp4WEkNZee1kBWkkX62ETCgtUZ/8zh9nyeFeLbBOShHLPPX3Lw2X/2
         IDZgyskgUq6Fg6HAmB9KgWhJdZV9JhPtIkWao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=f6KnboDVnUVHEpn3eaAEpEUGsG0yYxmdQtcQoHwbQCQ=;
        b=qGZTGudlXH469N5b4ey1NhhCC5HAZLCNJuNNKsLrY5pgP023K3RmAM97P6UFqjpm5u
         ib+bev2KXfPGhzi/spBSwaWsdX0Lk7mM6J+nVd06PSdauW02peDLOQSYVkFKkSVYDcKf
         TuOcPZixP9FtH7dtK8M6oq/W/qVTIyB5yowydyIVSL8qsbyB4PrSz5C0RBn0DpwQzC3E
         xv8KHevpOCo7FotJtnXBBY5gugfWXbP/WuBYiq39fSS38xDDdDflxZhLWgzsXWgf4a6/
         pXajDrNmFSzwdKObXQEw9ugspAnTw5ceOhaNPUPWNXimBHtdF42PL9NQTI4eu80eUwf+
         tFiQ==
X-Gm-Message-State: AOAM533Y8EvCmDSU6R/BTAARWDSKiXB80Z2VB4ni96WKYBM2cwfjMJnE
	2eWqZXPdFpmqb2c1U0wngHt1Vg==
X-Google-Smtp-Source: ABdhPJwFsPu4SCgPF/cigrFL/mM/akv8WB2OIGCmYUZZ4j4DlWgqAZRNmQiOvOqHr5S/c0XkF2eXsA==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr27901525wrq.240.1623238657740;
        Wed, 09 Jun 2021 04:37:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d6f8:4296:455a:d852? ([2001:8b0:aba:5f3c:d6f8:4296:455a:d852])
        by smtp.gmail.com with ESMTPSA id t14sm22510838wra.60.2021.06.09.04.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 04:37:37 -0700 (PDT)
Message-ID: <ffe15158da239184a7eef20767652cda2b9f272a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>,  OE-core
 <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Jun 2021 12:37:36 +0100
In-Reply-To: <CANNYZj9wKQv+YMgCN98R1fEiCaruFTiK_MHXt+aNPVLOYBBS2w@mail.gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-4-alex.kanavin@gmail.com>
	 <1685B658849E960A.4717@lists.openembedded.org>
	 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
	 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
	 <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
	 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
	 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
	 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
	 <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
	 <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
	 <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com>
	 <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com>
	 <CAMKF1sobgTDj0Cf5TZ=DcO00tTGQb=q2yPiMuub57-PfAv058w@mail.gmail.com>
	 <CADfgfob3EjTPSuxOXQ1EbR6j108OqcKi_oNibGE9xQ-=_AHxGQ@mail.gmail.com>
	 <CAMKF1spK+WC_J-pb-iYsnvHzVj4-sr8YKaz63yjCU98F+VurTw@mail.gmail.com>
	 <CANNYZj-1D7M6ggXiaGZX7PnkmENqK_8wgHpR06W9AWp==kwbUQ@mail.gmail.com>
	 <CADfgfoaUpky3zgsU=q90nQdbuPWa63VxQSKQCc=r1YahwKw5oQ@mail.gmail.com>
	 <CANNYZj9wKQv+YMgCN98R1fEiCaruFTiK_MHXt+aNPVLOYBBS2w@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-08 at 20:15 +0200, Alexander Kanavin wrote:
> I can confirm that the previous kernel behaves correctly:
> utimensat_time64(AT_FDCWD, "../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
> [{tv_sec=1623176017, tv_nsec=6290007298941124608}, {tv_sec=1622966579, tv_nsec=17838646317425885184}], 0) = -1
> ENOSYS (Function not implemented)
> utimensat(AT_FDCWD, "../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake", [{tv_sec=1623176017,
> tv_nsec=0} /* 2021-06-08T18:13:37+0000 */, {tv_sec=1622966579, tv_nsec=0} /* 2021-06-06T08:02:59+0000 */], 0)
> = 0
> 
> Does look like a botched backport of time64 syscalls to me.
> 
> Alex
> 
> On Tue, 8 Jun 2021 at 17:40, Michael Halstead <mhalstead@linuxfoundation.org> wrote:
> > I've rebooted centos8-ty-1 using the previous 4.18.0-240.15.1.el8_3.x86_64 kernel and kept it in the pool.
> > I've paused centos8-ty-2 so it won't interfere with builds and left it at the current 4.18.0-
> > 305.3.1.el8.x86_64 kernel for testing. 

Thanks Michael and Alex. We can therefore pretty safely say that something was 
broken between the 240 and 305 of the centos8 kernel for the 32 bit syscall
utimensat syscalls.

I did poke around https://github.com/kernelim/linux/tree/centos8 which does
have a kernel diff but it is huge and you have to clone the repo to get it.

git show a3342908613ba72a84f652ca7a56c3e2113bda12 | grep sys_utimensat -C 40

shows they did add the syscalls in that kernel.

So this does look to be a RedHat issue. Not sure if we want to report it
to them? Can we run the autobuilders on the older kernel for now until
they hopefully fix it?

Cheers,

Richard




