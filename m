Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.9940.1593782043056620278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gt+QN9nP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j4so30187725wrp.10
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wbFnTLy0FN4wvLRvcpowFoKKJtD5QiVSTNJGMAFsYic=;
        b=gt+QN9nPC4Byl42hT1evDqwjCzRiOS0+tbJAeKKjeF7DURgGzBXZfDQL1E3/mJdwGx
         FKFMGpUEcBTZ3q+mN1b0S5Qedys3oytOyW37F94q5mmTkqLJ/N0ofGIKD5r8p6/QQtT+
         gxkV5s4VHGUH22CzC3VKDH0mNzP7KdDmRlBMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wbFnTLy0FN4wvLRvcpowFoKKJtD5QiVSTNJGMAFsYic=;
        b=TML4mEgZ7Qe3mPP3GZ7WZpaRxk7AKFJj9jJta+GModjSEXJZDepDtvkpKOPITWOwAU
         Rj8hLAZ02RXn61hEKq3kgdaGJXPZ8rFTh72OM8Um43rDNkCL6kEgZMNw0T1nvA3h9cWn
         Z7TqjNWgXdlz4ZZ7IkgY54IgABE2+sIX2Ljps7V917N5arbnqdCYIwI6QU2OJXsX7QhY
         yesJuEt6Xx/bSzTFX19xY0jFnWLpS+sKv3ZfEJCZxNC/IHrOARYsc6/rlqG2VwhgteMc
         q7ll3vcqzhmXc42mWcsBbY6GpT5sRGLJXIsZv62ThZOr3OqLRoazxfp+AwMxf7E3tdU5
         /5ew==
X-Gm-Message-State: AOAM5325uCOpRsq2DnkZyfAnBz1XYkd6wW7Y0ZsE9H0iB0CbSSKPVlbp
	qnjElVE7yuXqxjYGho5P0C48qA==
X-Google-Smtp-Source: ABdhPJxkZic/+gOCogYSX3XiAqXZ1xVdtwPHVTo9lPGWeGvBcITIKj1J+2BX2VhTiS0MBQsVUVXQDg==
X-Received: by 2002:adf:f452:: with SMTP id f18mr36458734wrp.78.1593782041358;
        Fri, 03 Jul 2020 06:14:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w12sm14724381wrm.79.2020.07.03.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 06:14:00 -0700 (PDT)
Message-ID: <807b2c9d9bff71490e99029793e754e0e1e38ba3.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 03 Jul 2020 14:13:59 +0100
In-Reply-To: <c8d6a6fa55052aecc157642169039f4c7cdccef1.camel@linuxfoundation.org>
References: <20200622105717.108062-1-alex.kiernan@gmail.com>
	 <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
	 <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
	 <161AF559DCEBF3F0.4124@lists.openembedded.org>
	 <68c8ab0777b1b8e43d4d9cd7a0032a84efd39ea8.camel@linuxfoundation.org>
	 <CAO5Uq5ShcQMYSYT5YFOa7i3sbAGP_dVWKrcPTiK3zPKFZZfvGw@mail.gmail.com>
	 <c8d6a6fa55052aecc157642169039f4c7cdccef1.camel@linuxfoundation.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-06-23 at 11:01 +0100, Richard Purdie wrote:
> Looking at the pattern, I did have a thought which I've not
> researched
> yet.
>=20
> Is it possible these are dynamically generated group/users in the
> rootfs which happen to collide with the host user/group?
>=20
> You'd think the adduser/addgroup calls would happen in a
> deterministic
> order as the rootfs is build but perhaps it doesn't work out like
> that.
>=20
> Are each of the above groups of files, specifically created users at
> rootfs time?

At this point this patchset is driving me a bit crazy. I've had it in
master-next, we keep seeing warnings and its hard to know whether the
warnings are real ones or ones from this patch.

I'm worried that things are not deterministic and this meant I really
needed to investigate.

I added some fixes and more debug to the patch, then ran it on the
autobuilder again. An example failure is:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2113

WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned =
by the same user or group as the user running bitbake: /var/spool/cron tota=
l 8 drwxrwx--- 2 0 995 4096 Oct 31 2019 . drwxr-xr-x 4 0 0 4096 Jul 3 12:27=
 ..
WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned =
by the same user or group as the user running bitbake: /usr/bin/crontab -rw=
xr-sr-x 1 0 995 51544 Oct 31 2019 /home/pokybuild/yocto-worker/musl-qemux86=
-64/build/build/tmp/work/qemux86_64-poky-linux-musl/core-image-sato-sdk/1.0=
-r0/rootfs//usr/bin/crontab
WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: /etc/passwd: root:x:0:0:root=
:/home/root:/bin/sh daemon:x:1:1:daemon:/usr/sbin:/bin/sh bin:x:2:2:bin:/bi=
n:/bin/sh sys:x:3:3:sys:/dev:/bin/sh sync:x:4:65534:sync:/bin:/bin/sync gam=
es:x:5:60:games:/usr/games:/bin/sh man:x:6:12:man:/var/cache/man:/bin/sh lp=
:x:7:7:lp:/var/spool/lpd:/bin/sh mail:x:8:8:mail:/var/mail:/bin/sh news:x:9=
:9:news:/var/spool/news:/bin/sh uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh p=
roxy:x:13:13:proxy:/bin:/bin/sh www-data:x:33:33:www-data:/var/www:/bin/sh =
backup:x:34:34:backup:/var/backups:/bin/sh list:x:38:38:Mailing List Manage=
r:/var/list:/bin/sh irc:x:39:39:ircd:/var/run/ircd:/bin/sh gnats:x:41:41:Gn=
ats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh nobody:x:65534:6553=
4:nobody:/nonexistent:/bin/sh messagebus:x:999:999::/var/lib/dbus:/bin/fals=
e rpc:x:998:998::/:/bin/false rpcuser:x:997:997::/var/lib/nfs:/bin/false av=
ahi:x:996:996::/run/avahi-daemon:/bin/false sshd:x:995:994::/var/run/sshd:/=
bin/false pulse:x:994:993::/var/run/pulse:/bin/false
WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: /etc/group: root:x:0: daemon=
:x:1: bin:x:2: sys:x:3: adm:x:4: tty:x:5: disk:x:6: lp:x:7: mail:x:8: news:=
x:9: uucp:x:10: man:x:12: proxy:x:13: kmem:x:15: input:x:19: dialout:x:20: =
fax:x:21: voice:x:22: cdrom:x:24: floppy:x:25: tape:x:26: sudo:x:27: audio:=
x:29:pulse dip:x:30: www-data:x:33: backup:x:34: operator:x:37: list:x:38: =
irc:x:39: src:x:40: gnats:x:41: shadow:x:42: utmp:x:43: video:x:44: sasl:x:=
45: plugdev:x:46: kvm:x:47: staff:x:50: games:x:60: shutdown:x:70: users:x:=
100: nogroup:x:65534: messagebus:x:999: rpc:x:998: rpcuser:x:997: avahi:x:9=
96: crontab:x:995: tracing:x:1000: sshd:x:994: pulse:x:993:pulse

On that centos7 worker, the build UID is 6000, the GID is 995.

As we can see from the dump of /etc/group, crontab is GID 995 and
crontab files owned by that group are fine. So the warning is a false
one and my theory about the cause is confirmed.

We'd only see the issue where the dynamicly assigned UIDs/GIDs conflict
with the host running the build which explains the intermittent nature.

I don't know how to fix this. I'm going to batch together the fixes we
have and send those, then drop this patch from master-next until we can
figure out something better to use in testing.

Cheers,

Richard



