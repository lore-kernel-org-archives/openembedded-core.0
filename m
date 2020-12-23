Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.7631.1608721163689128124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 02:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ApP2g2Xd;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: outbackdingo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id j13so3015505pjz.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LYCKb/Yg7SqnEzGj9WDTUbekFhDMad4uNeG/dZ9iNxU=;
        b=ApP2g2XdTV/475ZBiWuZZmBvnf/vXRWccTJ0U+bzANCS6PGkbzeiXrRh0VBckVvxvk
         aQ1xaFfdl7UizVkiclsGnWVNBWojN/tTre5Udmq0GnruhrhhtwSI3yFYllNc8bitggqo
         mJHZDTSgegCyT/9Nhe0KVYU2PZCf9FilUhsnLDygFLvkfgNlN6JGzF0azMsP+eDnsXYG
         aTy+0db3nWbc3vuIMKulXZKEi3gpZgCpvOcWpfyzREXiTpi3JWsUGvyCqFAW+Wc/7Fch
         yMsuJwhvcSnFaME13XnaaHw26ADg3vG3ZkZRukFYrGBCg4WdW+Xhjieu3j5JRYyZP36a
         /9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LYCKb/Yg7SqnEzGj9WDTUbekFhDMad4uNeG/dZ9iNxU=;
        b=oZnbWdZ8zI9Xvebj3FjJ15tZVNOzuqkcLPeoxSCqWRjw8nvc5+Nca/gY7yXMBMllEb
         h3IFU/Tf/9cMdk1zJ7D8G4jQbohefpBvODibJKcY4Z/oqsDy6+qR75Rl77Vo1dZiY/2U
         cvkxLl+3qO22GAOWckRt/DxVklAkRSlinU+2/5v3G8i7HEVY3O97FciUxjvMF1EJKtl4
         xaxSsxUpsRvFMnKfJhHjPacDqfEOmBr9Ho98HKF17rylNaFlLmEPknEu5JPauyiG7lrh
         8uz4QGJ+0MEHw4PmPW5JjjeG8sL9jfrkLyfuOs4Tkcq/24Vc5vIM/RWAah7urowNtpvZ
         4r1w==
X-Gm-Message-State: AOAM533WcB7RU+WECCj3t3x2tQep7MLeTbkEad2VdCBbCk8xOSf1nCiO
	BYC5q+h4ijKF4ptFOTXP5IWjrWvQuuQ=
X-Google-Smtp-Source: ABdhPJxa2AE1cFMlOgxYszRdCa4ns/1YG/pA21POayGzYU7W2rSnQVr+FpDoWQHZaNS6avLQJhcvuQ==
X-Received: by 2002:a17:902:7007:b029:dc:e89:50f1 with SMTP id y7-20020a1709027007b02900dc0e8950f1mr24805985plk.72.1608721162792;
        Wed, 23 Dec 2020 02:59:22 -0800 (PST)
Return-Path: <outbackdingo@gmail.com>
Received: from [192.168.10.113] ([42.113.225.245])
        by smtp.gmail.com with ESMTPSA id w1sm23429028pfn.151.2020.12.23.02.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 02:59:22 -0800 (PST)
Subject: Re: [OE-core] meta-oe Warrior postgresql build error
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
References: <8a7a93a4-fc72-c5ea-eb6c-cdc192a2442d@gmail.com>
 <CAM9ZRVutRa_KiMd+EYuxT7JVLAV+VTbQALGoPF3F3_x8k3cnRw@mail.gmail.com>
From: "Outback Dingo" <outbackdingo@gmail.com>
Message-ID: <3b188ffb-bdb9-65e9-b703-6034e4f1b9e2@gmail.com>
Date: Wed, 23 Dec 2020 17:59:19 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVutRa_KiMd+EYuxT7JVLAV+VTbQALGoPF3F3_x8k3cnRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12/23/20 5:09 PM, Paul Barker wrote:
> On Wed, 23 Dec 2020 at 09:59, Outback Dingo <outbackdingo@gmail.com> wrote:
>> bitbake postgresql
>> Parsing recipes: 100%
>> |#########################################################################################################################|
>> Time: 0:00:38
>> Parsing of 3787 .bb files complete (0 cached, 3787 parsed). 5212
>> targets, 77 skipped, 8 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           = "1.42.0"
>> BUILD_SYS            = "x86_64-linux"
>> NATIVELSBSTRING      = "ubuntu-16.04"
>> TARGET_SYS           = "x86_64-poky-linux"
>> MACHINE              = "intel-corei7-64"
>> DISTRO               = "poky-stx"
>> DISTRO_VERSION       = "2.7.3"
>> TUNE_FEATURES        = "m64 corei7"
>> TARGET_FPU           = ""
>> meta
>> meta-poky
>> meta-yocto-bsp       = "warrior:c8c383d958807b991e31d22f612ba2a81a3860a4"
>> meta-oe
>> meta-filesystems
>> meta-initramfs
>> meta-networking
>> meta-perl
>> meta-python
>> meta-webserver
>> meta-gnome           = "warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8"
>> meta-virtualization  = "warrior:343b5e236b844e9347090c358797fae80bdd22f5"
>> meta-cloud-services
>> meta-openstack       = "warrior:f8e76d1f75ca123c0b9ddc457d53280874ae6b09"
>> meta-intel           = "warrior:29ee4852a05931dcf856670d9d8a3c3077a40fe8"
>> meta-security        = "warrior:4f7be0d252f68d8e8d442a7ed8c6e8a852872d28"
>> meta-selinux         = "warrior:ebea59190bd0b26d82afe5b42707a5cf83d830b0"
>> meta-iot-cloud       = "warrior:8b6c1562dc3b783e4596672034c281b66eaf7db1"
>> meta-python2         = "warrior:6740870aac9627c99f03a20fd49ffc9ae8acc1e3"
>> meta-dpdk            = "warrior:c8c30c2c4e2f36b4a55a69a475fe774015423705"
>> meta-stx-cloud
>> meta-stx-distro
>> meta-stx-flock
>> meta-stx-integ
>> meta-stx-virt        = "master:113db4261d8af823ea2cfae727b9b239d8b1ecc8"
>> meta-anaconda        = "warrior:82c305d1b849a4e943b24332688d44e5ca82b510"
>>
>> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpythonu.control
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython2u.control
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython3u.control
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
>> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpythonu.control
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython2u.control
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython3u.control
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
>> make[1]: Leaving directory
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/jsonb_plperl'
>> make[1]: Leaving directory
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/hstore_plpython'
>> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpythonu--1.0.sql
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython2u--1.0.sql
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython3u--1.0.sql
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
>> /home/dingo/STX/build/tmp/hosttools/install -c -m 644
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpythonu--1.0.sql
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython2u--1.0.sql
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython3u--1.0.sql
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
>> make[1]: Leaving directory
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/ltree_plpython'
>> make[1]: Leaving directory
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/jsonb_plpython'
>> make: Leaving directory
>> '/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib'
>> sed: can't read
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/var/lib/postgresql/.bash_profile:
>> No such file or directory
>> WARNING: exit code 2 from a shell command.
>> ERROR: Function failed: do_install (log file is located at
>> /home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/temp/log.do_install.25533)
>> dingo@ubuntu:~/STX/build$
> Looks like a large stack of layers there. Is this failure reproducible
> with just poky and meta-openembedded? Have you checked for any
> bbappends to the postgresql recipe?

Welp valid point, there are alot of layers in this, tried building it 
from poky / meta-oe alone

Build Configuration:
BB_VERSION           = "1.42.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "intel-corei7-64"
DISTRO               = "poky"
DISTRO_VERSION       = "2.7.4"
TUNE_FEATURES        = "m64 corei7"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "warrior:c8c383d958807b991e31d22f612ba2a81a3860a4"
meta-oe
meta-filesystems
meta-initramfs
meta-networking
meta-perl
meta-python
meta-webserver
meta-gnome           = "warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8"
meta-intel           = "warrior:29ee4852a05931dcf856670d9d8a3c3077a40fe8"

Initialising tasks: 100% 
|######################################################################################################################| 
Time: 0:00:01
Sstate summary: Wanted 406 Found 0 Missed 406 Current 0 (0% match, 0% 
complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1643 tasks of which 0 didn't need to be 
rerun and all succeeded.

where it did build fine, checking layers for any bbappends... where it 
finds the offensive inc file... time to resolve and see if i can sort it 
out.

find . -name "*postgres*" -print | xargs grep bash
grep: ./meta-stx/meta-stx-integ/recipes-dbs/postgresql: Is a directory
grep: ./meta-stx/meta-stx-integ/recipes-dbs/postgresql/postgresql: Is a 
directory
grep: 
./meta-stx/meta-stx-cloud/recipes-support/puppet/files/puppetlabs-postgresql: 
Is a directory
grep: ./meta-cloud-services/meta-openstack/recipes-dbs/postgresql: Is a 
directory
./meta-cloud-services/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc: 
files="${D}${localstatedir}/lib/${BPN}/.bash_profile"
grep: 
./meta-cloud-services/meta-openstack/recipes-dbs/postgresql/postgresql: 
Is a directory
grep: ./meta-openembedded/meta-oe/recipes-dbs/postgresql: Is a directory

>
> The warrior branch is now EOL so you should upgrade to dunfell or
> gatesgarth if you can.

Yes id love for this to be on gatesgarth or dunfell, unfortunatly its 
meta-stx out of wind river that targeted warrior ... i tried it under 
both gatesgarth and dunfell and it failed with even greater misery.

thanks for the insight


>
> Thanks,
>
