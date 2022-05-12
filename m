Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BA9C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 10:34:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.2513.1652351640322211576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 03:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aAhE8aMM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id x18so6686197wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=3spzMdnpSrVFn7RfRHk1txXMLZ7awyWH96lm1yRReag=;
        b=aAhE8aMMBvx+w+E0DHs2CH64SZTFiUcZjUUwl1LFm3VlkAJp4F3K+rkYJZCvrWxzcB
         PjTZf09ATZICdHHkKCOCddMKrvXoxHYhaGkcAwnKen0cJETNoyiWOkk9L2Ll4C8x0x1/
         ZZraj3sJLQoK3zExLN0rzgc0lrD8x8Mhqg2F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=3spzMdnpSrVFn7RfRHk1txXMLZ7awyWH96lm1yRReag=;
        b=4YF1jGufExDQbiHSjEVEoI1mH+pg4Ng9yBePNvsZy14XeCw3AzhDQc9z7kj3NuNCzw
         nY/BF+23DlgbMd7XORqLlUK9mO+VdnhisBaHWvyOddNM8o73Oq6cNx6kzA34RSErZ83g
         T8WX/03gswxQlFi27VhMi+qumzRsapjl1zqRlnvPKFlEiP+mxwdcNoLx1OcDhwjtw0I/
         4Xbwj5E0Wb0D3lxgDRKNjHKIBTR7QPVnwXkrzFMKO/m9PAEWt+b3f8LeNaQuRCYO16gp
         0Xxdlh/vl4mMplLKTU9uQV4LrSffsgAudsQJEw8eI9fp+cJlwV8N4f3//tX2p9897DYK
         D4YA==
X-Gm-Message-State: AOAM530mERW7afqfnsL+zDpO3BKE2l8G9u4xH5QkaUw4DJsntM7AAAYS
	CXdsCy9dIHq+AzullVy5/f6N0g==
X-Google-Smtp-Source: 
 ABdhPJywT0TG5lrAWy2M3qS+qKdKJfjIhYWeR0VdEiXJcwybmNNVINJiu2Xer7d5pT3schuANbZ8yQ==
X-Received: by 2002:a05:6000:188d:b0:20c:71e5:86d7 with SMTP id
 a13-20020a056000188d00b0020c71e586d7mr26602076wri.185.1652351638660;
        Thu, 12 May 2022 03:33:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a764:742e:164b:b1fb?
 ([2001:8b0:aba:5f3c:a764:742e:164b:b1fb])
        by smtp.gmail.com with ESMTPSA id
 4-20020a05600c02c400b003942a244edasm2204012wmn.31.2022.05.12.03.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:33:57 -0700 (PDT)
Message-ID: 
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
From: richard.purdie@linuxfoundation.org
To: Alex Kiernan <alex.kiernan@gmail.com>, Changqing Li
	 <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 12 May 2022 11:33:47 +0100
In-Reply-To: 
 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
References: <20220512054303.429208-1-changqing.li@windriver.com>
	 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 10:34:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165539

On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:
> On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windriver.com>=
 wrote:
> >=20
> > From: Changqing Li <changqing.li@windriver.com>
> >=20
> > dev in modules.devname should be populated in /dev on boot.
> > remove create static mode from udevd will make these devices
> > cannot be populated. When use sysVinit, devices like /dev/net/tun
> > will not be created.
> >=20
> > more info:
> > udevd in systemd also remove create static mode in udevd, but using
> > service kmod-static-nodes.service and
> > systemd-tmpfiles-setup-dev.service in systemd to create these node, so
> > systemd works well.
> >=20
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++++
> >  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
> >  2 files changed, 116 insertions(+)
> >  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-stat=
ic-nodes-from-modules.patch
> >=20
> > diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-node=
s-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-stati=
c-nodes-from-modules.patch
> > new file mode 100644
> > index 0000000000..19611f4e89
> > --- /dev/null
> > +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-=
modules.patch
> > @@ -0,0 +1,115 @@
> > +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Tue, 10 May 2022 14:04:35 +0800
> > +Subject: [PATCH] eudev: create static nodes from modules
> > +
> > +Revert commit <src/udev/udevd.c: remove create static nodes from modul=
es>
> > +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7abd5ec9cc47a8=
b895df6db77fb1537c6f1a39
> > +
> > +Upstream-Status: Inappropriate [oe-specific]
> > +
> > +Upstream intentionally remove create static nodes from modules, it is
> > +expected handled by tmpfiles services, refer [1].
> > +[1] https://github.com/eudev-project/eudev/issues/229
> > +
> > +For yocto, when start with sysVinit, to enable systemd distro feature,
> > +and install systemd-tmpfiles is not proper, so revert this commit.
> > +
>=20
> Reading the upstream issue, I'm not sure this really is an
> "Inappropriate" upstream. eudev has dropped this commit, because you
> can use systemd-tmpfiles ("as it works without systemd and can be
> compiled individually" - presumably using our unsupported musl
> patches...) or opentmpfiles (which is dead and points you back to
> systemd-tmpfiles).
>=20
> Feels like this is an engage with upstream rather than carry a patch
> forever which just causes us to be perpetually divergent.

I agree, this does sound like something we need to address to keep the
project maintainable...

Cheers,

Richard

