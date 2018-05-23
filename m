Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id D7DDA74A12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 01:19:15 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x66-v6so12119071vka.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JJTBL1b3qWMVG8s2099urmUvDCtPxOYSYa12UItyhu0=;
	b=s1HeV8b407sLZcY588Tr1lza95+ffPrXyvIKNqdtplmKaomQhG6bIOpYYdPi2/nknC
	cE/HcQbHmcLDyhEE2lbmMJv7GILojdm5XhIwY2lV7ivDMlrSHZDoY4VZejsIpnI9n/CE
	p/zC2oFTZekVT69hqBXsq98kWisliYg73Cg3vLNQLhvaSyMwhSPFmpP4XOfrdCfrIle0
	n3gv4foga69m6KNLGnnoPS/2K4BaumKpSvMC6ePyx/y8wsjfnwURy3M4GRxlqAXCPvb+
	rOr4pOHYtJKYUduIpyOyuGZiEISjXmJN25t+7lgFyiN+y1g5u2a5tS8Xv0HbIdlSlNzG
	45rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JJTBL1b3qWMVG8s2099urmUvDCtPxOYSYa12UItyhu0=;
	b=pMTjd8fIbZGRy4svGJyuhaYJHqy6Ge4EY9xDzqibPU6UkqBm6W4lVGYfXjHlxVn8W3
	hQDV71f6DlCBfB4mboMTiCJ2GRozNDLclxhOKOegjWvbQK2UJYiOcOS9t/EwnDbRxhjO
	AVogwr57No0FNmh0sUNcC3d/P9AhB302Y0Pkrp1103/IhDpmEInH8nkQTV30zfvqez5l
	FA/wdofIW7edWPK0Uqq6QN8tGSWu+SdQg26udwCIWgq/2vjh9rcksHlgFiD6cpKKuBbd
	ir/Itq4jyQb+fBuSNXw8t5VntitulRxN9EC6WnhgKirTBo007m2YzmYRK1aINBfeTIgn
	Jddw==
X-Gm-Message-State: ALKqPwcoZ0jSsTAdVXTmTf9qO44rK1fQ7BIeasPq6+C2k8N0IQsEhkQZ
	JOmx5JLUmBfQLtFNgx0GSGwnYUJtWnVAfEtWFiw=
X-Google-Smtp-Source: AB8JxZq4rMhjXAe5OlDc5sxkF8oLwmfMedj16nNV+xNl6mpx3IAYHPyPjsJcWgzRU9P2wZwlrGlL7LZOTSIzRR7n5RI=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr518935vkd.154.1527038356353; 
	Tue, 22 May 2018 18:19:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Tue, 22 May 2018 18:19:15
	-0700 (PDT)
In-Reply-To: <b45998ef-41af-b965-c64a-b10a12f5ecfd@windriver.com>
References: <1526827795-10448-1-git-send-email-akuster@mvista.com>
	<CAJ86T=XKQdbiH3ND0Smmpne7FX=PqEtox9GJrJJi9WfiRZcOBQ@mail.gmail.com>
	<759e0c6d-d9cc-4ec2-2e56-871b18ae9313@gmail.com>
	<CAJ86T=UX195m2f_aSiR4uM7G++1rjLKj+_vvtERsKCLH7uMDOg@mail.gmail.com>
	<CAJ86T=WVzwj5j+W3GFTtW9akh3M=SEH5HTLVrBt_mkdFV0XCmA@mail.gmail.com>
	<b45998ef-41af-b965-c64a-b10a12f5ecfd@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 May 2018 18:19:15 -0700
Message-ID: <CAJ86T=VY-OoF+QpL-vAJzhtDiWyZm-vNMptqQ1w-5K3-dHr-sA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] busybox: update to 1.28.3
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
X-List-Received-Date: Wed, 23 May 2018 01:19:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 5:48 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 05/22/2018 07:06 PM, Andre McCurdy wrote:
> ...
>>
>> Building before and after Armin's patch and then diffing .config files
>> in each build directory gives:
>>
>
> I didn't know what all of these configs were so I've
> listed them below and stated a straw-man opinion as
> to whether to keep them or not.

Thanks for digging in to the details!

>> Old 1.27.2 specific config options removed:
>>
>> -CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
>> -CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
>> -CONFIG_FEATURE_ENV_LONG_OPTIONS=y
>> -CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
>> -CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
>
> I'm okay with following upstream busybox wrt long options so
> we can drop this.

There's no real choice but to drop these (ie they disappear when you
run "make oldconfig").

>> New 1.28.3 specific options added:
>>
>> +CONFIG_BB_ARCH=y
>
>
> Adds 'arch' which is the same output as 'uname -m' but
> I always use arch and didn't know off-hand that uname -m was the same.
>
> Keep it.
>
>> +CONFIG_FEATURE_CATN=y
>
>   This adds an option to cat:
>    -n numbers all output lines while -b numbers nonempty output lines.
>   The commit that added this feature says:
>      a2bdc5c55 cat: allow compiling out -n and -b
>   so since previously the feature was always available,
>
> I'm okay with keeping it.
>
>> +CONFIG_FEATURE_SH_READ_FRAC=y
>
>
>   Enables a fractional second read timeout for the shell builtin.
>   bool "read -t N.NNN support (+110 bytes)"
>   Enable support for fractional second timeout in read builtin.
>
> Potentially useful, keep it.
>
>> +CONFIG_FEATURE_SWAPONOFF_LABEL=y
>
>
>   This allows for specifying a device by label or uuid, rather than by
>   name. This feature utilizes the same functionality as blkid/findfs.
>
> Useful. Keep it.
>
>> +CONFIG_FEATURE_VOLUMEID_MINIX=y
>
>
> I don't know of a case where this would be generally useful.
>
> Omit.
>
>> +CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=y
>
>     xargs: support -a FILE
>
>     The GNU-specific option -a lets xargs read the arguments from a file
>     rather than from stdin.
>
>     This is particularly convenient when debugging in gdb interactively,
>     and it might be of more general use.
>
> Huh... what?
> Digging through the findutils repo, I see that there's a better explaination
> in the findutils/NEWS file from 2004(!):
>
> *** xargs can now read a list of arguments from a named file, allowing
>     the invoked program to use the same stdin as xargs started with
>     (for example ``xargs --arg-file=todo emacs'').
>
> Keep it (I suppose).
>
>> +CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL=y
>
>
> From: https://bugs.busybox.net/show_bug.cgi?id=9511
> Example:
> find samplegz | xargs -n1 -P4 sh parse.sh
>
> Costs 241 bytes.
>
> Keep it.
>
> The next group are described below but
> I've put my conclusions after each config.
>
>> +CONFIG_HEXEDIT=y
>
> Drop it.
>
>> +CONFIG_NUKE=y
>
> Drop it.
>
>> +CONFIG_RESUME=y
>
> Drop it -- maybe?
>
>> +CONFIG_RUN_INIT=y
>
> Drop it.
>
>> +CONFIG_SETFATTR=y
>
> Drop it.
>
>>
>> So new applets hexedit, nuke, etc, are going to sneak in to our builds
>> unless we refresh our defconfig to disable them.
>>
>
>
> Here is the rough estimate of the new applet sizes:
>
> $ git show 38da4c4420ea6d7b3cf120c0902458e7d8256560 | \
>    grep "^+//config:.*bool"
> +//config:      bool "nuke (2.4 kb)"
> +//config:      bool "resume (3.3 kb)"
> +//config:      bool "run-init (7.5 kb)"
> +//config:      bool "hexedit (20 kb)"
> +//config:      bool "setfattr (3.6 kb)"
>
>
> and the commit that added most of the applets that includes
> a brief explanation of the applet's function:
>
> commit ab77e81a8527fa11a4f9392d97c2da037d6f4f98
> Author: Denys Vlasenko <vda.linux@googlemail.com>
> Date:   Fri Aug 18 19:15:29 2017 +0200
>
>     klibc-utils: new applets: resume, nuke, minips
>
>     minips is a pure alias to ps,
>     just in case someone needs 100% klibc-utils compat.
>
>     nuke is a primitive version of "rm -rf" without
>     options and error checks. ~30 bytes.
>
>     resume is a tool for initramfs which resumes from
>     a given block device.
>
>     function                                         old     new   delta
>     resume_main                                        -     582    +582
>     packed_usage                                   31640   31712     +72
>     nuke_main                                          -      28     +28
>     xstrtoull                                          -      24     +24
>     applet_names                                    2646    2665     +19
>     applet_main                                     1532    1544     +12
>     applet_suid                                       96      97      +1
>     applet_install_loc                               192     193      +1
>     applet_flags                                      96      97      +1
>
> ------------------------------------------------------------------------
>     (add/remove: 5/0 grow/shrink: 6/0 up/down: 740/0)   Total: 740 bytes
>
>     Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>
>
>
> While these are useful utilities,
> I don't see a need for any of the new applets in the oe-core defconfig.

All the proposals seem reasonable to me.

> Armin,
> If no one objects to my suggestions, please change the defconfig
> in the next update or ping me and I'll do it.

As an aside, it looks like the poky-tiny defconfig for busybox hasn't
been refreshed since busybox 1.19.3 so anyone building poky-tiny now
is going to get 6 years worth of new applets and features which they
might not be expecting.

>
> --
> # Randy MacLeod
> # Wind River Linux

