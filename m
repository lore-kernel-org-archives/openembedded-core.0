Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0558B7F7DF
	for <openembedded-core@openembedded.org>;
	Fri, 10 Jan 2020 23:15:04 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k197so1674468pga.10
	for <openembedded-core@openembedded.org>;
	Fri, 10 Jan 2020 15:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:references:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=70fQNoZ3e1Lfo/cgGTnOvOVNrZsZTW4GjBHcC82j8O4=;
	b=UvQc60/juEqoI9vhva4eiUW3UE0WjE9mEjrRFGqp1O97r/wP0gMW2LPV2zFM+C27xU
	w/EHNCrL1hMh9HOMxk3iYUQjkzUMMAqWLKiM/JAdfzIBXcmWE+5/yUZlf8flt+cHW943
	46pzuRRIcWQNsKiC1MGiA/1raQgCYOb2Lj/Zhv4iCn/L/NFq2yZ8yzw9KFdyGCSF1IB1
	Aa+7fo7QAIXiaDUrlJrPHHXE/uR4JSEO4TEq8EaNJCWcMbSTEw5BzXzFA96wMDMfI4Tt
	VgvKcJEuj6fIqrnXbkoVYOtR1sRp1D+vth93mqZQ+guKO/8sgrUj6dcFhLe1OQgrDP8A
	JKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=70fQNoZ3e1Lfo/cgGTnOvOVNrZsZTW4GjBHcC82j8O4=;
	b=EGohewp0qIJJfNSHTEYMYj70jSfKLP8Yl2DRttpe8+yLDDCCToDHCmr+ritjttP4He
	kEvJzNeKYrs7JdHDBfJFCHxSYX9HflDxCxF5RBp7uDFsIzDSvLo9lB08vbkpVLEkzwOM
	vqSYV8f3sKWit0+W8uulXl8vtr/44eOdBLqf3A6pjsCCeZJ5NhYvhiP371tKgpA1LFJk
	zvSBiW2YFgrF3IzXpz7/WJ/YXLS4a13e28UngYpJAMgdHg+f1q05cxM4fq0nm+UAApIR
	jE88jsyqvqsIOW0j9uFTEJ+fygsJpq5Ui38iIDXVgZ1952Y2SgVmUlJMw/jAWnSsCcDA
	cZbQ==
X-Gm-Message-State: APjAAAVsU6lf2mrA0QhU3ik+6r2aDdW0lRb8QhxiCh443FCcny0kFGvM
	KfSoV3M3gSXKNDEjqxEStZLrh4kf
X-Google-Smtp-Source: APXvYqxohNgQ7pOsMjhOQosNAvHZWw8jqo8KCwQV3DorPSzVrkf/KBjJ7mIqIxRoEQ5PR49v8kfhVw==
X-Received: by 2002:a63:e954:: with SMTP id q20mr7615353pgj.204.1578698105730; 
	Fri, 10 Jan 2020 15:15:05 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3819:b940:29a4:50a6?
	([2601:202:4180:a5c0:3819:b940:29a4:50a6])
	by smtp.gmail.com with ESMTPSA id o2sm3923863pjo.26.2020.01.10.15.15.05
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 10 Jan 2020 15:15:05 -0800 (PST)
From: akuster808 <akuster808@gmail.com>
To: openembedded-core@openembedded.org
References: <cover.1578544698.git.akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e934fe7e-c7a9-54c1-aa57-216f582e0f78@gmail.com>
Date: Fri, 10 Jan 2020 15:15:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
Subject: Re: [zeus 00/28][v2] Pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2020 23:15:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I'll ping next week if not merged by then

- armin

On 1/8/20 8:49 PM, Armin Kuster wrote:
> V2 pull request with valgrind change removed.
>
> The following changes since commit 754d0ae5a960056468cdf50e5965a4c22515f8f9:
>
>   lttng-modules: fix NULL pointer deference error when testing rpc_task_running (2019-12-31 10:36:32 +0000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next
>
> Adrian Bunk (2):
>   systemd: Upgrade 243 -> 243.2
>   python3: Upgrade 3.7.5 -> 3.7.6
>
> Bruce Ashfield (11):
>   linux-yocto/5.2: update to v5.2.21
>   linux-yocto/5.2: update to v5.2.22
>   linux-yocto/5.2: update to v5.2.23
>   linux-yocto/4.19: update to v4.19.84
>   linux-yocto/5.2: update to v5.2.24
>   linux-yocto/4.19: update to v4.19.87
>   linux-yocto/5.2: update to v5.2.25
>   linux-yocto/5.2: update to v5.2.26
>   linux-yocto/5.2: update to v5.2.27
>   linux-yocto/4.19/5.2/-dev: fix gcc10 build
>   linux-yocto/5.2: update to v5.2.28
>
> Joshua Watt (1):
>   python3: RDEPEND on libgcc
>
> Martin Jansa (1):
>   sstate.bbclass: Fix for consistent whitespace
>
> Richard Purdie (6):
>   sstate: Add ability to hide summary output for sstate
>   sstate: Stop overwriting SSTATE_PKG
>   sstate: Ensure SSTATE_PKG is reloaded when handling siginfo
>   sstate: Ensure target sstate directory exists if unihash changes
>   sstate: Ensure mkdir happens before mktemp
>   python3: Update to apply libgcc fix to libpython, glibc only
>
> Robert Yang (1):
>   pseudo: Make realpath() remove trailing slashes
>
> Ross Burton (3):
>   podfix: class to remove Pod::Man versions from manpages
>   reproducible_build_simple: inherit podfix
>   podfix: only alter normal files
>
> Tim Orling (1):
>   liberror-perl: update 0.17027 -> 0.17028
>
> Vasyl Gomonovych (1):
>   kernel: Make symbol link to vmlinux.64 in boot directory
>
> Yanfei Xu (1):
>   libsdl2: fix failure appeared in bitbake libsdl2-native
>
>  meta/classes/kernel.bbclass                   |  3 +
>  meta/classes/podfix.bbclass                   | 35 ++++++++++++
>  .../classes/reproducible_build_simple.bbclass |  1 +
>  meta/classes/sstate.bbclass                   | 51 +++++++++--------
>  ...temd-boot_243.bb => systemd-boot_243.2.bb} |  0
>  ...temd-conf_243.bb => systemd-conf_243.2.bb} |  0
>  meta/recipes-core/systemd/systemd.inc         |  4 +-
>  .../{systemd_243.bb => systemd_243.2.bb}      |  0
>  ...rl_0.17027.bb => liberror-perl_0.17028.bb} |  6 +-
>  ...1-realpath.c-Remove-trailing-slashes.patch | 57 +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  .../{python3_3.7.5.bb => python3_3.7.6.bb}    |  6 +-
>  .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
>  .../linux/linux-yocto-rt_4.19.bb              |  6 +-
>  .../linux/linux-yocto-rt_5.2.bb               |  6 +-
>  .../linux/linux-yocto-tiny_4.19.bb            |  8 +--
>  .../linux/linux-yocto-tiny_5.2.bb             |  8 +--
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++----
>  19 files changed, 167 insertions(+), 68 deletions(-)
>  create mode 100644 meta/classes/podfix.bbclass
>  rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)
>  rename meta/recipes-devtools/perl/{liberror-perl_0.17027.bb => liberror-perl_0.17028.bb} (85%)
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
>  rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (98%)
>


