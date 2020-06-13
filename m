Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.513.1592008487459292093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 17:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i/b5ZppP;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id j4so1159251plk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 17:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:organization:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRlXII9ndivdD7ps+YtWKvT3UKE8TpScnaAlViyS2ZY=;
        b=i/b5ZppPyLun4KXVqQndtQBBzFdaBILkX6RZVQO0ynYxk4NMotr1/edNCbHOE68+gH
         fDdVO39vTmCWZu9ZiLN4tVF9SY7hstnu1Wmw/zYeQWnsMhNF7XMJPcXG3AfynVXu9d9u
         P0O3s1HMkfDNjyw6Fv+vi+2Es3GCVwlEqfpUrjMJfA8J84NPJEGupYu3VNfh7b2OgFx7
         AmTpS1gMlxgtgErZ2XImnZCQ7neAwm9trfSFg27ZexP2QTfsjhHFwuxSdpWvl4Jz+pcs
         Dmr/ukNIVSKOpkigLlDhr2KxAasIZ4VTyia/XgIOe/QmeZhafH6EmIfXfXKrxwObIABa
         rRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=uRlXII9ndivdD7ps+YtWKvT3UKE8TpScnaAlViyS2ZY=;
        b=IhKHTpaz+IVhvHSB6pt85pLkgLwHNTw52sM+mIltdII/gEmi5HEZbExUqoQPv0Qiqb
         CNyT0zlGz4p26eO+V9IOdHV11ZD3AoS9UR+j+azLz+puwzbyQRxeeUGujNgyMb2c70KK
         lObqgCNkdyZ/MnwwM/shhRHPsmvLBUUE/VMJmcXpkZ1JgQ3DNpn5/3oNfRyL+4ROj+zr
         a1G29/xjSD3ORaTjFchTYUb7Pn6+B2qZtHSyLGQxmVfSyjFk3iT6qlM0+PVYmp4LXDD7
         mQKDM1Og4BVQO85Z9HFlVOPk72+9Zqp6kfduZXsq7LQPuWigBCU/jAQ/c/1Wp2eLRLOf
         au/Q==
X-Gm-Message-State: AOAM532Dk22C/6iSFnzT/7hchHCKuz6t7yJY5j5lgf2LOMWQ4RT2w2bx
	BVfH9nsLFFHoo57DLPKOHqzpchxw6PA=
X-Google-Smtp-Source: ABdhPJy7lyHqQWf6VzikC1Z5LR4zehDyTt01aHXrU9k5detyB1ktN3AU1aDqbRGWlcxGkkv+V2du/g==
X-Received: by 2002:a17:90a:f414:: with SMTP id ch20mr1294969pjb.97.1592008486474;
        Fri, 12 Jun 2020 17:34:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from tyche.localnet ([2601:646:9200:4e0::96b0])
        by smtp.gmail.com with ESMTPSA id 77sm7335615pfx.172.2020.06.12.17.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 17:34:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Subject: Re: [OE-core] Error while building image for 5.4.y on RPI4
Date: Fri, 12 Jun 2020 17:34:45 -0700
Message-ID: <3022466.YH7JXIEmOa@tyche>
Organization: HIMVIS
In-Reply-To: <Y4nb.1591945376060563369.5YNj@lists.openembedded.org>
References: <Y4nb.1591945376060563369.5YNj@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, June 12, 2020 12:02:56 AM PDT Pankaj  Vinadrao Joshi wrote:
> Hi,
> i am trying to build an image for RPI4 for 5.4.y kernel but i am getting
> following error , i
> 
> Initialising tasks: 100%
> |##########################################################################
> ############################################################################
> #############| Time: 0:00:04 Sstate summary: Wanted 1094 Found 0 Missed 1094
> Current 1154 (0% match, 51% complete) NOTE: Executing Tasks
> WARNING: libfm-extra-1.3.1-r0 do_fetch: Failed to fetch URL
> https://downloads.sourceforge.net/pcmanfm/libfm-1.3.1.tar.xz, attempting
> MIRRORS if available *WARNING:
> linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Failed to
> fetch URL git://github.com/raspberrypi/linux.git;branch=rpi-5.4.y,
> attempting MIRRORS if available* *ERROR:
> linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Fetcher
> failure: Unable to find revision 97badb4baeb8999263a9bc2fa85c3060ffff344b
> in branch rpi-5.4.y even from upstream* *ERROR:
> linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Fetcher
> failure for URL: 'git://github.com/raspberrypi/linux.git;branch=rpi-5.4.y'.
> Unable to fetch URL from any source.* *ERROR: Logfile of failure stored in:
> /home/pankaj/Oe-Raspberrypi4/tmp-glibc/work/raspberrypi4-oe-linux-gnueabi/l
> inux-raspberrypi/1_5.4.40+gitAUTOINC+97badb4bae-r0/temp/log.do_fetch.10175*
> ERROR: Task
> (/home/pankaj/meta-raspberry/meta-raspberrypi/recipes-kernel/linux/linux-ra
> spberrypi_5.4.bb:do_fetch) failed with exit code '1' NOTE: Tasks Summary:
> Attempted 2294 tasks of which 1551 didn't need to be rerun and 1 failed.
> 
> This my linux-raspberrypi_5.4.bb file
> 
> LINUX_VERSION ?= "5.4.40"
> LINUX_RPI_BRANCH ?= "rpi-5.4.y"
> 
> SRCREV = "97badb4baeb8999263a9bc2fa85c3060ffff344b"
> 
> require linux-raspberrypi_5.4.inc
> 
> SRC_URI +=
> "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch \
> file://0001-Revert-selftests-bpf-Skip-perf-hw-events-test-if-the.patch \
> file://0002-Revert-selftests-bpf-Fix-perf_buffer-test-on-systems.patch \
> file://0001-selftest-bpf-Use-CHECK-macro-instead-of-RET_IF.patch \
> file://powersave.cfg \
> "
> 
> pankaj@exaleap-Inspiron-3584:~/Oe-Raspberrypi4$ bitbake -e | grep
> ^PREFERRED_VERSION_linux-raspberrypi
> PREFERRED_VERSION_linux-raspberrypi="5.4.%"
> 
> am i missing anything,why i am getting this error can someone help??

upstream has not yet make 5.4 as defualt kernel for rpi until they do so they 
keep rebasing it unfortunately which means meta-raspberrypi has to keep 
updating SRCREVs, 

you can cherrypick https://github.com/agherzan/meta-raspberrypi/pull/654
until its merged



