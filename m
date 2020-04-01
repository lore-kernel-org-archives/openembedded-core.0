Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.2391.1585732172959537939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 02:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@externs-easymile-com.20150623.gappssmtp.com header.s=20150623 header.b=TtzY3YPT;
 spf=none, err=SPF record not found (domain: externs.easymile.com, ip: 209.85.167.177, mailfrom: arnaud.pecoraro@externs.easymile.com)
Received: by mail-oi1-f177.google.com with SMTP id k5so11910625oiw.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 02:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=externs-easymile-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=YxIAxQMPrH6HwiSg/zQBSkA0KoalU9vftPuVeclPvJM=;
        b=TtzY3YPTbi0Qj9M4xhhRsmOD10Q94+oD/KJGflzIuWXZ6CQmuQ9oZeOrOZeowDy2Zn
         L0rAxCEnxzkuzdNMaJsEKjO9dn6M5xY2lLoR0yIhCi3enBGtqVW4Cuif1MjNHn/VgHti
         F8tBbSd8wVV+R2rqYRTq9LBTB8SRYVxVhEZlz0CnsQrQrc8LfpOhLgenb4kr4zWo9c/5
         Ndfng3MCNm0r4+tLjVkA/+M/XgpCk7zKAwLe18S8X3vIfMKaRefDchW1qLOex5bUQcdv
         b8INmePCER6w24Stq6GXOhAR3MUq8G76xJp7Hm48XLlYGVWWtM5o/yNDP+EqI4TNjG8H
         DFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YxIAxQMPrH6HwiSg/zQBSkA0KoalU9vftPuVeclPvJM=;
        b=WKxhEFSwtWtcRdcKDj/CS2ZjOc7ozSI0LRDK5pppW+zOuf2ayTOqNMUzLx3F3Drd1A
         CJMmEHw6njgS2OHF7D1dYcoZqEjOu/5RtLG6vXnhQL6qk9QreRwrhudwaFEiiQrrgQny
         QOKB688PvdwNuwo0puqNPMS3Q7j69aiULJh58PeuSj5TZvXUIjs8Tr64H28whBpXZBbW
         3FlDL7saR1n6g8rvU/vYdT5LtsYvkEgpGIgkd3hDMr/LqHDkMAkutx/uJXJ0tUjoEpPp
         vrxQJr/5n/53IRSs7rxpfrHAW54UwTeXLCbkZ1NFc5KGjWXavsdRANHALpAcZvZBWfgL
         tS6Q==
X-Gm-Message-State: AGi0PuZks1lf3sRro+9Fk5R6Eke+rfOZLBoJn8fuItBVuj2xjXBLdzAV
	n71N+Ve6jbt3CAq3PJWmfLD4LynmWn0GM60OojxUKhTaXvioXw==
X-Google-Smtp-Source: APiQypLyC9vxShECJp43K5RVoIdy3Ce1jjp3Mk3p7wuNa5g6ssPpGV9MGsVrKb94CjJdxX5Ag+2vxXbRW0XS/7kiLEA=
X-Received: by 2002:aca:56c2:: with SMTP id k185mr1944790oib.141.1585732172061;
 Wed, 01 Apr 2020 02:09:32 -0700 (PDT)
MIME-Version: 1.0
From: arnaud.pecoraro@externs.easymile.com
Date: Wed, 1 Apr 2020 11:09:21 +0200
Message-ID: <CAM15ne=BtZqVdByS9VxHPSyDk+uAMVEWL6cQAaP8KXC_HX_DPA@mail.gmail.com>
Subject: [OE-core] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d32eae05a2370a5c"

--000000000000d32eae05a2370a5c
Content-Type: text/plain; charset="UTF-8"

Hello,

We are having the same issue as described in the link below :

https://lists.openembedded.org/g/openembedded-core/message?id=162040285

WARNING: Paths in the rootfs are owned by the same user or group as the
user running bitbake. See the logfile for the specific paths.
/data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/.uuid
/data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid

Any update on the patch?

Thank you in advance!

Arnaud

--000000000000d32eae05a2370a5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>We are having the sam=
e issue as described in the link below :<br></div><div><br></div><div><a hr=
ef=3D"https://lists.openembedded.org/g/openembedded-core/message?id=3D16204=
0285">https://lists.openembedded.org/g/openembedded-core/message?id=3D16204=
0285</a></div><div><br></div><div style=3D"margin-left:40px">WARNING: Paths=
 in the rootfs are owned by the same user or group as the=20
user running bitbake. See the logfile for the specific paths.<br>/data/poky=
-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/u=
sr/share/fonts/.uuid<br>/data/poky-tmp/master/work/intel_corei7_64-poky-lin=
ux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid<br></div><div><b=
r></div><div>Any update on the patch?<br></div><div><br></div><div>Thank yo=
u in advance!</div><div><br></div><div>Arnaud<br></div></div>

--000000000000d32eae05a2370a5c--
