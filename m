Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.7172.1608717534104072903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 01:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ljLYzUgf;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: outbackdingo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id v1so2761811pjr.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 01:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=UARq0nmk27ujt3dJ8IMM9MHPOaSRzlBcnETx4k9JbeE=;
        b=ljLYzUgf1RKaricDu7z+dnTubvJ08vN7Q1+SZPWKUlMhuVrLGP+ksMO7vSTtDTh1Gw
         raYHVJG3n/UoorqfZQcnmYLH++MW3+yPWqq7GQx1qhYr8igufYEAp3cV2VY9IwfsS6dy
         XZYQTko9GMCApy/+0xMI+OkTHPxx/EM5MoThij59QInPCwd9TV/6Nx7HOSfB8Q2mf7ja
         mmWoIqd5z8bhssfllaFN7sUIfHmAWPL4UuA+7ZsW9h3tq2cFwX86tgRAHx83QLFrMY4X
         Nl+C/FYLm1rE4NkbYD4IJ+ivBf5FI73dk1ygQ22/wlnbE3DMlkrSYHO5SoG7HjDkEux8
         d8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=UARq0nmk27ujt3dJ8IMM9MHPOaSRzlBcnETx4k9JbeE=;
        b=pjqYaphKn8fMfDPcKLq6Jx6lwcNhvoNq7SSV5yf8dA8axwqGth2TAB/PMZPiOQAUBi
         tx7+XCAwG5L6ew4QtTWdc+FL8+d09VodegXE6X2fqzorwxsdYgyUm82aE6BwWJDk/QpI
         puUGGE98jtJAfShfdJdsudUMH+vjifwns4OupVyuncwUiznyEe9xNfu+u3NQkidcJ7Et
         alE/+W+TW2hfDgnwUCQPe0yGTD9a0J06wGYMEUzIkjepG0U/6ke/W69iiNbOIka7V9LC
         vgTFfF4n9/r9w0v3ScXnDXgo6WR8wdfpugvJwHemC9lN2RohonqK3c1GjdeQh9IznSRr
         vMcA==
X-Gm-Message-State: AOAM531uByTF+3B8l1d7LQ0j0yUh8lQChHp0qxRzpx9Y6N10wpTmi8K1
	jkADN6yGd/aeVwGHSanIJ81tYLHg9Xw=
X-Google-Smtp-Source: ABdhPJyCvZL+iSb1T5bZhDw2XnnstAVTkM4t8sWjMw5kjXOb/kUBy80S/fkF/rP/vSz3Yw/yFNI+HA==
X-Received: by 2002:a17:902:654f:b029:da:347d:7af3 with SMTP id d15-20020a170902654fb02900da347d7af3mr2819638pln.18.1608717533045;
        Wed, 23 Dec 2020 01:58:53 -0800 (PST)
Return-Path: <outbackdingo@gmail.com>
Received: from [192.168.10.113] ([42.113.225.245])
        by smtp.gmail.com with ESMTPSA id 7sm22721801pfu.2.2020.12.23.01.58.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 01:58:52 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: "Outback Dingo" <outbackdingo@gmail.com>
Subject: meta-oe Warrior postgresql build error
Message-ID: <8a7a93a4-fc72-c5ea-eb6c-cdc192a2442d@gmail.com>
Date: Wed, 23 Dec 2020 16:58:49 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

bitbake postgresql
Parsing recipes: 100% 
|#########################################################################################################################| 
Time: 0:00:38
Parsing of 3787 .bb files complete (0 cached, 3787 parsed). 5212 
targets, 77 skipped, 8 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.42.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "intel-corei7-64"
DISTRO               = "poky-stx"
DISTRO_VERSION       = "2.7.3"
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
meta-virtualization  = "warrior:343b5e236b844e9347090c358797fae80bdd22f5"
meta-cloud-services
meta-openstack       = "warrior:f8e76d1f75ca123c0b9ddc457d53280874ae6b09"
meta-intel           = "warrior:29ee4852a05931dcf856670d9d8a3c3077a40fe8"
meta-security        = "warrior:4f7be0d252f68d8e8d442a7ed8c6e8a852872d28"
meta-selinux         = "warrior:ebea59190bd0b26d82afe5b42707a5cf83d830b0"
meta-iot-cloud       = "warrior:8b6c1562dc3b783e4596672034c281b66eaf7db1"
meta-python2         = "warrior:6740870aac9627c99f03a20fd49ffc9ae8acc1e3"
meta-dpdk            = "warrior:c8c30c2c4e2f36b4a55a69a475fe774015423705"
meta-stx-cloud
meta-stx-distro
meta-stx-flock
meta-stx-integ
meta-stx-virt        = "master:113db4261d8af823ea2cfae727b9b239d8b1ecc8"
meta-anaconda        = "warrior:82c305d1b849a4e943b24332688d44e5ca82b510"

/home/dingo/STX/build/tmp/hosttools/install -c -m 644 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpythonu.control 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython2u.control 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython3u.control 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
/home/dingo/STX/build/tmp/hosttools/install -c -m 644 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpythonu.control 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython2u.control 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython3u.control 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
make[1]: Leaving directory 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/jsonb_plperl'
make[1]: Leaving directory 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/hstore_plpython'
/home/dingo/STX/build/tmp/hosttools/install -c -m 644 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpythonu--1.0.sql 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython2u--1.0.sql 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/ltree_plpython/ltree_plpython3u--1.0.sql 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
/home/dingo/STX/build/tmp/hosttools/install -c -m 644 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpythonu--1.0.sql 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython2u--1.0.sql 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/../postgresql-11.5/contrib/jsonb_plpython/jsonb_plpython3u--1.0.sql 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/usr/share/postgresql/extension/'
make[1]: Leaving directory 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/ltree_plpython'
make[1]: Leaving directory 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib/jsonb_plpython'
make: Leaving directory 
'/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/build/contrib'
sed: can't read 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/image/var/lib/postgresql/.bash_profile: 
No such file or directory
WARNING: exit code 2 from a shell command.
ERROR: Function failed: do_install (log file is located at 
/home/dingo/STX/build/tmp/work/corei7-64-poky-linux/postgresql/11.5-r0/temp/log.do_install.25533)
dingo@ubuntu:~/STX/build$


