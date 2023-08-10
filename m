Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B53C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 12:54:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16339.1691672094460823958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 05:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QPEnr55N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe79b170e2so6011955e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691672093; x=1692276893;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OIikVs4izxdlRllYdpRmqjor5HkoVbyc/AdY89nE8mw=;
        b=QPEnr55NMY7e2qVUPaRn83u5ZHCslEuu328M64jJjFzv8/2/7cKfhClPJIf9R2RKhw
         jW181MaHucFAUaL8nZ8gLZx5T0moPkWYkq3wfEIV8HCJsiScHi3dxpUb0h2BfV8mgvoR
         0QEu/FOlUc3Qb2Xz04HlrfvHAMbi6eDLf/bCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691672093; x=1692276893;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIikVs4izxdlRllYdpRmqjor5HkoVbyc/AdY89nE8mw=;
        b=QiVSdvHCtNLjfWbFE0Dj6mD+3se7p8TXbwKxHKJCY2gDwlJ1wlblcqaYTOT+q/jGtQ
         sI1rv+PnGmG9YA0RlvStUh40y+3OrV0eChtXF9cf2kFZmdE6Yhl4lUyiBMF+AbmHm43d
         jIfWl51DZft0WpfGEVJgloFGSVN33Yz7hgw2KjQBqvwnsMtje3AaiUKujnLSlixdI09p
         uWk/l+qaGnI3/HUOzeYFM9S1alfoGWEpDqLBS1L5Ouog+bwNpCZzB3r0HC3nqhBGFFF5
         AzfP09txqULp0NyvwRMKdg02wfnb5EXh6tA277DcqaGjbFj+wlrGHU1sLFkE92PkbmfR
         lYNg==
X-Gm-Message-State: AOJu0Yz0VmbTVSPGhlByhoiOQ+cnu6Akb5+a2ZJ6kTdYEwDLhIUvlJvF
	GaeN3WJnTJIMVO8gYnizmYmp6g==
X-Google-Smtp-Source: AGHT+IHfyEi6MoYZCsiw7bHZLqqLdEdRcald2nrSZE7essvjy934+irEFLPxIbciKPpU+z5hgbo8AA==
X-Received: by 2002:a5d:6a84:0:b0:314:4237:8832 with SMTP id s4-20020a5d6a84000000b0031442378832mr1985904wru.48.1691672092748;
        Thu, 10 Aug 2023 05:54:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a? ([2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a])
        by smtp.gmail.com with ESMTPSA id a9-20020a5d5089000000b0031434c08bb7sm2109638wrt.105.2023.08.10.05.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 05:54:52 -0700 (PDT)
Message-ID: <2f08e4323ed31ae69c512b7de35bac6184cd538d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, "alexandre.belloni@bootlin.com"
	 <alexandre.belloni@bootlin.com>
Cc: Luca Bocassi <luca.boccassi@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Date: Thu, 10 Aug 2023 13:54:51 +0100
In-Reply-To: <EB7142F9-143A-4759-8E60-88E341AA5D3C@arm.com>
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
	 <20230805213551.2737605-1-luca.boccassi@gmail.com>
	 <2023081011500664548dca@mail.local>
	 <EB7142F9-143A-4759-8E60-88E341AA5D3C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 12:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185743

On Thu, 2023-08-10 at 12:13 +0000, Ross Burton wrote:
> On 10 Aug 2023, at 12:50, Alexandre Belloni via lists.openembedded.org <a=
lexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >=20
> > Hello,
> >=20
> > This breaks most of the tests on the autobuilders, I guess you will hav=
e
> > to also update the distribution configuration.
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3326=
/steps/12/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5581/=
steps/14/logs/stdio
> >=20
> > ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/oe-sel=
ftest-centos/build/meta/recipes-graphics/wayland/weston_12.0.1.bb DEPENDS o=
n or otherwise requires it)
> > systemd PROVIDES udev but was skipped: missing required distro feature =
'usrmerge' (not in DISTRO_FEATURES)
> > eudev PROVIDES udev but was skipped: conflicting distro feature 'system=
d' (in DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/oe-=
selftest-centos/build/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home=
/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/psplash/=
psplash_git.bb, /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/=
recipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/oe-selftest-=
centos/build/meta/recipes-core/seatd/seatd_0.7.0.bb DEPENDS on or otherwise=
 requires it)
> > systemd was skipped: missing required distro feature 'usrmerge' (not in=
 DISTRO_FEATURES)
> > ERROR: Nothing RPROVIDES 'systemd' (but /home/pokybuild/yocto-worker/oe=
-selftest-centos/build/meta/recipes-core/packagegroups/packagegroup-core-bo=
ot.bb RDEPENDS on or otherwise requires it)
> > systemd was skipped: missing required distro feature 'usrmerge' (not in=
 DISTRO_FEATURES)
>=20
> The poky-altcfg distro uses usrmerge, so the challenge will be adapting t=
he QA so that all of the tests that involve systemd are using poky-altcfg.

The challenge here is reproducibile testing specific since that is
messing with configs to try and get the best coverage.

Since we don't want usrmerge in the reproducibility testing config,
I'll suggest we drop systemd from there. There are some other bits of
config like INHIBIT_PACKAGE_STRIP being set which are also
questionable.

Cheers,

Richard

