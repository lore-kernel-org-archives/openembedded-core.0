Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CA3C30653
	for <webhook@archiver.kernel.org>; Sun,  7 Jul 2024 10:00:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.55474.1720346423770120130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jul 2024 03:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fcp083+x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso20301455e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720346422; x=1720951222; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQi4lSRcad+Imu0zX5f9dGCGlCexLeJ7qBzcvuPBuU4=;
        b=Fcp083+xwnjVvLT7w4+cWUV3h+R6fciiMC/U3Y5F62NIpisBP+IAjiJFixsdh2ibVG
         iUPaEp1CT9ugMgR2bwH4r6GEAM9AXbr6/BBFPlb+YI+ewBQ5xk6tZcwIc1m9SlBJDGGR
         VSdYHApNvEqut/urBriqBNSxgHxmb09pnO1nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720346422; x=1720951222;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bQi4lSRcad+Imu0zX5f9dGCGlCexLeJ7qBzcvuPBuU4=;
        b=oVNpZLZdM3vXN8eh8zr1H6WENirHCjTGci1ABHiD9IR4WduAoLBI84ayqc7LTPNQ7p
         A3rvVcVD802l4GdR3iU2W591unMDDzjw3fnn7v+5yYHWY38Ht5aRh7DIh7M8cZFSIGuf
         LMzSlQYi39082XqGMpL9fg11lhZ3ARjBHDZxVd1mXHMIUWIoaJ3GiFueo9Jw73Hudj4B
         9cJ/Ee9VA0LD/+WPAGNpd1V9HcSm3+aPh+PVTZCqJNSziW1geZigOdMx1ZKJ0QiOcV9B
         ZU48tbiWo7Rvk3ds2LlzZ3bVK5fLjX+aCqru17S+tTsTZL3b6RZyNmfl+Wy5tdqvAPcO
         u78A==
X-Forwarded-Encrypted: i=1; AJvYcCVgfKri2V2/82ejwFnlxLA6+gaE44/r2W30q5JbK5RbmuOCzGKBkagS74T1g+83y/rpFVJl9E2KZfsqcvbf52B+qwCKChbDEqBMV0tIH4aDTE9ZDZgaufmL
X-Gm-Message-State: AOJu0YwvDyTBS/J27HWpc6IkFIKfifXS1vB0u3S0vcI86vV5+dttE5Ei
	OUSHhyNKk+Kb49Ud1ijXBQCJ13Hpi7YvHbpV+z43Hd4hONIl9+A4bpmXvm+i4vQ=
X-Google-Smtp-Source: AGHT+IF8uXXwE/fWYDeSc/pE9uLK2QvfEk2zyePBkNumgd/tCbDxGT566X/IOzITUlqhdOwVSHXWzg==
X-Received: by 2002:a05:600c:54f2:b0:426:65bf:5cb3 with SMTP id 5b1f17b1804b1-42665bf5daemr7558545e9.27.1720346421923;
        Sun, 07 Jul 2024 03:00:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c07:df43:6337:8a2f? ([2001:8b0:aba:5f3c:5c07:df43:6337:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426515af733sm87122015e9.14.2024.07.07.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 03:00:21 -0700 (PDT)
Message-ID: <bdc48d97eea594eff799a370fc66fb28f283de52.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.76
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 07 Jul 2024 11:00:20 +0100
In-Reply-To: <20240703235626.1542975-1-gudni.m.g@gmail.com>
References: <20240703235626.1542975-1-gudni.m.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 10:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201619

On Wed, 2024-07-03 at 23:56 +0000, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org wrote:
> Changelog:
> * https://github.com/bluez/bluez/releases/tag/5.76
> * https://github.com/bluez/bluez/releases/tag/5.75
> * https://github.com/bluez/bluez/releases/tag/5.74
> * https://github.com/bluez/bluez/releases/tag/5.73
>=20
> Changes to the build:
> * Patch file
> =C2=A0 0001-Allow-using-obexd-without-systemd-in-the-user-session was
> removed
> partly because some of the changes are now upstream. The rest of the
> changes are dropped, mainly concerning adding obexd D-bus service
> when systemd
> is disabled. Quite a bit has changed in the configuration files, if
> anyone is depending on this then a new patch is needed. There is
> currently no patch waiting upstream.
> * Add a patch file to resolve an issue introduce in version 5.73
> where
> =C2=A0 --disable-cups configuration breaks the build. A
> =C2=A0 patch was submitted upstream a while ago but was denied (silently)
> due
> to failing CI checks according to one of the BlueZ maintainers, see:
> https://github.com/bluez/bluez/issues/773#issuecomment-2200883833
>=20
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
>=20

Thanks for the patch, unfortunately this ran into issues in our CI. One
interesting one is this:

https://valkyrie.yoctoproject.org/#/builders/40/builds/65
https://valkyrie.yoctoproject.org/#/builders/36/builds/64/steps/17/logs/std=
io

which isn't very clear what is going on until you look at the files:

(buildbot-venv) [pokybuild@rocky9-vk-1 ~]$ ls /home/pokybuild/yocto-worker/=
qemuarm-oecore/build/build/tmp-glibc/work/qemuarm-oe-linux-gnueabi/core-ima=
ge-sato/1.0/testimage-sdk/sysroots/cortexa15t2hf-neon-oe-linux-gnueabi/etc/=
bluetooth/ -la
total 32
dr-xr-xr-x. 2 pokybuild pokybuild  4096 Jul  7 11:11 .
drwxr-xr-x. 3 pokybuild pokybuild  4096 Jul  7 11:26 ..
-rw-r--r--. 1 pokybuild pokybuild   928 Jul  7 11:11 input.conf
-rw-r--r--. 1 pokybuild pokybuild 12597 Jul  7 11:11 main.conf
-rw-r--r--. 1 pokybuild pokybuild   120 Jul  7 11:11 network.conf

The missing write bit on the directory is stopping the files from being
deleted.

The second issue is a musl issue:

https://valkyrie.yoctoproject.org/#/builders/6/builds/68
https://valkyrie.yoctoproject.org/#/builders/3/builds/75

Cheers,

Ricahrd






