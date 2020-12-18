Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.1083.1608309224853270620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 08:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hWVllA/7;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x18so1672841pln.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WiRz4NGkav5g3m8H+1PxmrcDBkV9/FlJ2toE4cgpR/M=;
        b=hWVllA/7Ve/JxRSgqyKq3ULb3JChKG610pHL/e2Z2GJwEFU6O3xunvVMbJ12K1HIt7
         3tbz9/klDmgRhu7AOKNkC5qv8j+ZT73wX6zDOyCB/H6ZBZyPhrOOiy9gKaABXS3IeVTS
         nGm/tBciFkGaHD0cMDdGz1fLC/74PvBRBkL7+z0WjggUD0iWjMJX3cVgRmP66gg3VPu9
         O5ZGwE0DdJExeMTjb6Karcck1GTXC8Wdoje85XkhMn9AalhR5QMesQAdvGQAENcroVAc
         I46j/brE3RLxgTOlqSKJS1ejSZKQsMn9w/D+pVnfQ/Qr3LDE7XmqKqRSvFxeQe3XVUEf
         J1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WiRz4NGkav5g3m8H+1PxmrcDBkV9/FlJ2toE4cgpR/M=;
        b=nEwg8RfKdSPwEdsTzfqmAPHeWCnVQF8GlHauIxn3Q/WxmRPugZngoQ8Qdic8Dk24p9
         EajzH/nW07aDD5BZHA5ChTwAcCQtC1PHuhz7tQcBUdBDzgk7Fs8gvJRWZzOoFY2Cv7H3
         qAcv8suTi56nb6DuhaqchUVr7Arm352D50ODhljyUR+V4LuVuAAexDlnzIb5MrRqfcWO
         DIleXBcEIImFiLAgB3SSqOk2mgT5U7aHFgmwCKJfurdb5Z5Ej6ci+O7mRb+TVgIrgXwz
         v3FknXelk1iBQOqKr8CLBLzXTBONGqmBLmUpE6qIpiWmxP006w3mmzTF3OqCZ7iti9sx
         BF1g==
X-Gm-Message-State: AOAM532BVvM7sRdVLFondXqO9F7ZEdHLM9Q8tf+jMNIkSy/sEvdWXPoE
	U0pqeEiqOqQYk0Asf/6Bn1xbpIOos02zYw==
X-Google-Smtp-Source: ABdhPJx2Bz/1Y/tlOxK6Du8MFUA3jchX8VsT/HCSOpuXYyVbMjeGVmqaijUuJjXLcUB9ToaL2DBQjA==
X-Received: by 2002:a17:90a:a45:: with SMTP id o63mr5144981pjo.146.1608309223916;
        Fri, 18 Dec 2020 08:33:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::9ac9? ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id 193sm9481125pfz.36.2020.12.18.08.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Dec 2020 08:33:43 -0800 (PST)
Subject: Re: [OE-core] [PATCH 3/4] busybox: Run mdev as daemon
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20201217225440.2633474-1-raj.khem@gmail.com>
 <20201217225440.2633474-3-raj.khem@gmail.com>
 <CAJ86T=VVepAL0d4d9AZnDr0auBYZyKOmz-gn3kExpaHkuOgFWg@mail.gmail.com>
 <CAMKF1sqmcrgG-DhiPCE6k30wEUR_SJNRmbxZ+zdYkCK9xg6c7g@mail.gmail.com>
 <CAJ86T=XE6Woyb7-yXKyQpGi+CqqZOc2PK9vkyBVZypiLa69_dw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <84681f38-9023-1c0c-7e68-582307f2e63c@gmail.com>
Date: Fri, 18 Dec 2020 08:33:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XE6Woyb7-yXKyQpGi+CqqZOc2PK9vkyBVZypiLa69_dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/17/20 10:07 PM, Andre McCurdy wrote:
> On Thu, Dec 17, 2020 at 7:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Dec 17, 2020 at 3:59 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> When busybox is used for device management, kernel needs to support
>>>> older/obsolete mechanism via CONFIG_UEVENT_HELPER and
>>>> CONFIG_UEVENT_HELPER_PATH to enable /proc/sys/kernel/hotplug but this
>>>> would require kernel defconfig change and will always be needed when
>>>> mdev is used, intead run it in daemon mode
>>>>
>>>> Update mdev init script to run mdev in daemon mode
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>   meta/recipes-core/busybox/busybox/mdev.cfg |  2 +
>>>>   meta/recipes-core/busybox/files/mdev       | 56 +++++++++++++++-------
>>>>   2 files changed, 41 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
>>>> index 6aefe90e43..143e6097cb 100644
>>>> --- a/meta/recipes-core/busybox/busybox/mdev.cfg
>>>> +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
>>>> @@ -9,3 +9,5 @@ CONFIG_SETSID=y
>>>>   CONFIG_CTTYHACK=y
>>>>
>>>>   CONFIG_FEATURE_SHADOWPASSWDS=y
>>>> +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
>>>> +CONFIG_FEATURE_MDEV_DAEMON=y
>>>> diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
>>>> index 8c9c06e96c..2fbdfb073e 100755
>>>> --- a/meta/recipes-core/busybox/files/mdev
>>>> +++ b/meta/recipes-core/busybox/files/mdev
>>>> @@ -1,21 +1,43 @@
>>>>   #!/bin/sh
>>>> -mount -t proc proc /proc
>>>> -mount -t sysfs sysfs /sys
>>>> -mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
>>>> -mkdir /dev/pts /dev/shm
>>>> -chmod 777 /dev/shm
>>>> -mount -t devpts devpts /dev/pts
>>>> -touch /dev/mdev.seq
>>>> -#sysctl -w kernel.hotplug=/sbin/mdev
>>>> -echo "/sbin/mdev" > /proc/sys/kernel/hotplug
>>>> -mdev -s
>>>> -
>>>>   #
>>>> -# We might have mounted something over /dev, see if /dev/initctl is there.
>>>> +# Run the mdev daemon
>>>>   #
>>>> -if test ! -p /dev/initctl
>>>> -then
>>>> -        rm -f /dev/initctl
>>>> -        mknod -m 600 /dev/initctl p
>>>> -fi
>>>> +
>>>> +DAEMON="mdev"
>>>> +PIDFILE="/var/run/$DAEMON.pid"
>>>> +
>>>> +
>>>> +start() {
>>>> +  echo -n "Starting $DAEMON... "
>>>> +  start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df
>>>
>>> Where do these start-stop-daemon options come from? Using -b for an
>>> application which is designed to run as a daemon (and deliberately
>>> telling that app to run in the foreground) looks odd, etc.
>>>
>>> Are there bugs or limitations in mdev which you are trying to workaround?
>>
>> its using start-stop-daemon applet from busybox which does have these options
>> implemented, its so that start-stop-daemon takes the control of the daemon
> 
> The question is not whether start-stop-daemon supports using PID files
> but whether the busybox mdev application supports creating them.
> 
> It looks like although most of the busybox daemons do, mdev does not:
> 

right it does not, letting start-stop-daemon works well though and is 
used in lot of places

> .../busybox-1.32.0 $ grep -r write_pidfile *
> debianutils/start_stop_daemon.c:        write_pidfile(pidfile);
> include/libbb.h:void write_pidfile(const char *path) FAST_FUNC;
> include/libbb.h:void write_pidfile_std_path_and_ext(const char *path) FAST_FUNC;
> include/libbb.h:#define write_pidfile_std_path_and_ext(path)  ((void)0)
> include/libbb.h:#define write_pidfile(path)  ((void)0)
> libbb/pidfile.c:void FAST_FUNC write_pidfile(const char *path)
> libbb/pidfile.c:void FAST_FUNC write_pidfile_std_path_and_ext(const char *name)
> libbb/pidfile.c:    write_pidfile(buf);
> miscutils/watchdog.c:    write_pidfile_std_path_and_ext("watchdog");
> miscutils/crond.c:    write_pidfile_std_path_and_ext("crond");
> networking/ifplugd.c:    write_pidfile(pidfile_name);
> networking/ntpd.c:        write_pidfile_std_path_and_ext("ntpd");
> networking/inetd.c:    write_pidfile_std_path_and_ext("inetd");
> networking/udhcp/dhcpc.c:    write_pidfile(client_data.pidfile);
> networking/udhcp/dhcpc.c:    write_pidfile(client_data.pidfile);
> networking/udhcp/dhcpd.c:    write_pidfile(server_data.pidfile);
> networking/udhcp/d6_dhcpc.c:    write_pidfile(client_data.pidfile);
> networking/udhcp/d6_dhcpc.c:    write_pidfile(client_data.pidfile);
> sysklogd/syslogd.c:    write_pidfile_std_path_and_ext("syslogd");
> sysklogd/klogd.c:    write_pidfile_std_path_and_ext("klogd");
> util-linux/acpid.c:    write_pidfile(opt_pidfile);
> 
