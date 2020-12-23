Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.7153.1608718197832736135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 02:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tgPtjdcJ;
 spf=pass (domain: konsulko.com, ip: 209.85.167.176, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f176.google.com with SMTP id f132so17700139oib.12
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 02:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAY3Nqgr9oZNyixSFnYTMs37BRTnUv5gms5WVUwKFMM=;
        b=tgPtjdcJotTgA56JHBuotcEU+3mfz9Ulwbz3XKZZtcA6oQbDr9vEbgMI2k0rWNYDeQ
         nFYhypMEQfeRjNk0vDEx/Op0ufsJHdFYlfWxh/KMPMOYYukIgZ7XGEDckEyuL3LUCf4X
         Qp1zLuSwbsnRYAJR1gmWpnpK9fMVTP54nTCTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAY3Nqgr9oZNyixSFnYTMs37BRTnUv5gms5WVUwKFMM=;
        b=e5Iah+6jFgWBFTkFK+4At+LkS+3v6ujHBw11P8Ue5WUJjpXNlm8YCe9CAxdgz6eMu0
         QOsmYb9FqMK8heWk//0I85dtrJguf8FPJ1C2wWg+FNw7jSzXvqMls/fe1Zo3FP81ZAu9
         qHfs8jQbs1YCmy52FVR13CD3dU0KmFvYdZvWkSjL53KY9S9RJPcY9l4br8XufMif5huq
         lJui0Q4rrZQpRlps5pMPY3tjturMD5KZ/DdP5ov07nfWkvMjD8MPgose4doxsbVg4oej
         K+baXIaWHx+dXIRuSy4N0WcvpkA//am9VBAJjmN2N+YEx3xE4QhCrgw1kDnmWE3WVO5E
         BmXg==
X-Gm-Message-State: AOAM532/RGFx6UUbDMp2j8qKLeKCfqpVlEVJ0md3RNnz2c9xFUOPbgla
	J7Jhgziu6dKhDXgy+W7pNk56yn7wBsCvP60ACImttQ==
X-Google-Smtp-Source: ABdhPJxkeJ1BNOoiIexG0OjrjN4ZmIJL+8jiIVjT1Dmvrgx6efHEDM7QXOrHMxXmFHgfcHScxFF/cSkIrExUImXfIbQ=
X-Received: by 2002:a05:6808:a95:: with SMTP id q21mr17301292oij.6.1608718197162;
 Wed, 23 Dec 2020 02:09:57 -0800 (PST)
MIME-Version: 1.0
References: <8a7a93a4-fc72-c5ea-eb6c-cdc192a2442d@gmail.com>
In-Reply-To: <8a7a93a4-fc72-c5ea-eb6c-cdc192a2442d@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 23 Dec 2020 10:09:47 +0000
Message-ID: <CAM9ZRVutRa_KiMd+EYuxT7JVLAV+VTbQALGoPF3F3_x8k3cnRw@mail.gmail.com>
Subject: Re: [OE-core] meta-oe Warrior postgresql build error
To: Outback Dingo <outbackdingo@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Dec 2020 at 09:59, Outback Dingo <outbackdingo@gmail.com> wrote:
>
> bitbake postgresql
> Parsing recipes: 100%
> |#########################################################################################################################|
> Time: 0:00:38
> Parsing of 3787 .bb files complete (0 cached, 3787 parsed). 5212
> targets, 77 skipped, 8 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.42.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-16.04"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "intel-corei7-64"
> DISTRO               = "poky-stx"
> DISTRO_VERSION       = "2.7.3"
> TUNE_FEATURES        = "m64 corei7"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "warrior:c8c383d958807b991e31d22f612ba2a81a3860a4"
> meta-oe
> meta-filesystems
> meta-initramfs
> meta-networking
> meta-perl
> meta-python
> meta-webserver
> meta-gnome           = "warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8"
> meta-virtualization  = "warrior:343b5e236b844e9347090c358797fae80bdd22f5"
> meta-cloud-services
> meta-openstack       = "warrior:f8e76d1f75ca123c0b9ddc457d53280874ae6b09"
> meta-intel           = "warrior:29ee4852a05931dcf856670d9d8a3c3077a40fe8"
> meta-security        = "warrior:4f7be0d252f68d8e8d442a7ed8c6e8a852872d28"
> meta-selinux         = "warrior:ebea59190bd0b26d82afe5b42707a5cf83d830b0"
> meta-iot-cloud       = "warrior:8b6c1562dc3b783e4596672034c281b66eaf7db1"
> meta-python2         = "warrior:6740870aac9627c99f03a20fd49ffc9ae8acc1e3"
> meta-dpdk            = "warrior:c8c30c2c4e2f36b4a55a69a475fe774015423705"
> meta-stx-cloud
> meta-stx-distro
> meta-stx-flock
> meta-stx-integ
> meta-stx-virt        = "master:113db4261d8af823ea2cfae727b9b239d8b1ecc8"
> meta-anaconda        = "warrior:82c305d1b849a4e943b24332688d44e5ca82b510"
>
> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpythonu.control
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython2u.control
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython3u.control
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpythonu.control
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython2u.control
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython3u.control
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
> make[1]: Leaving directory
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/jsonb_plperl'
> make[1]: Leaving directory
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/hstore_plpython'
> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpythonu--1.0.sql
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython2u--1.0.sql
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython3u--1.0.sql
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpythonu--1.0.sql
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython2u--1.0.sql
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython3u--1.0.sql
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
> make[1]: Leaving directory
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/ltree_plpython'
> make[1]: Leaving directory
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/jsonb_plpython'
> make: Leaving directory
> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib'
> sed: can't read
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/var/lib/postgresql/.bash_profile:
> No such file or directory
> WARNING: exit code 2 from a shell command.
> ERROR: Function failed: do_install (log file is located at
> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/temp/log.do_install.25533)
> dingo@ubuntu:~/STX/build$

Looks like a large stack of layers there. Is this failure reproducible
with just poky and meta-openembedded? Have you checked for any
bbappends to the postgresql recipe?

The warrior branch is now EOL so you should upgrade to dunfell or
gatesgarth if you can.

Thanks,

-- 
Paul Barker
Konsulko Group
