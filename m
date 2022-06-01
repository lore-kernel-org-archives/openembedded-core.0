Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE429C43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:10:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.545.1654099836988284136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f5538XbU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id y24so1242719wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=In+HoUraSHQt5cwo8h/u6HAMBQHA3oTIbExTZE6jYqc=;
        b=f5538XbUz7CQuVg+t9Fa8xkWrBkH8PO1pG+tkvYc9o2wt/9xwhbGas21ZAH2CCkGiB
         0Nbi5udPaBnFgUEJEqtTsGhqaYveGXmOpHhJhE9wTISxmy9LDChXZymxCVOSTzwHpnAI
         VFnIA0V92nvSxerDc5blV1MmskhI+G6jV40zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=In+HoUraSHQt5cwo8h/u6HAMBQHA3oTIbExTZE6jYqc=;
        b=KPYqmrSaDvFJ/m7p6Yy9q+wwh3u4FcApRQTKy0hZGn9iAB6aeX//0DlgBWxGhXyGhQ
         clZP9bSzujDp9LXeFxe4Ima55jWNJNrwpwfmi6YNeXQoocAnc/yC9dDIFsdgQhW7vUWJ
         fjN3oSkGq4vTiixcXQjTq10QAwEGLm+hYi17+yT4+cgTcuIKgRBSs0IMr/Q68vhpcqiw
         3J+PHfwxWC55nh0wkeSlNUMn9jBTL6tFZopXMMd64DIiIRJ0nkFiB3FshQ08Dme4ZIx9
         A8JVRsGXxDPp2x5qTrxXDkJowSv0t+gxVx4q/B1F+xdToqAOrAG5tCeBiBLNPfl7pd7I
         qhkA==
X-Gm-Message-State: AOAM531Dg8tI+QV9QQ5GQozc+Jdlwld1DEuoUqa7vgVJ/TAAgx8HNYO5
	VKYKdf6dh1NEVmeJtlylX7DksA==
X-Google-Smtp-Source: 
 ABdhPJws4R67MwUJ0BgLbvAtcW4h73FMVRI1TzkNMJ8BluMJQnHiOga94Jr41rHRUASRwTKziddBlg==
X-Received: by 2002:a1c:5416:0:b0:397:3d93:d456 with SMTP id
 i22-20020a1c5416000000b003973d93d456mr156001wmb.12.1654099835142;
        Wed, 01 Jun 2022 09:10:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eab:cafb:b8d4:fe67?
 ([2001:8b0:aba:5f3c:eab:cafb:b8d4:fe67])
        by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b00397402ae674sm6575763wmg.11.2022.06.01.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 09:10:34 -0700 (PDT)
Message-ID: 
 <3aea71febbe02c97dabec307ace0c4389d45d913.camel@linuxfoundation.org>
Subject: Re: [kirkstone][PATCH 1/2] gcc: Upgrade to 11.3 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 01 Jun 2022 17:10:33 +0100
In-Reply-To: 
 <CAOSpxdYXrnJRdc_NghthSexaq_R10h0=JBTfqPTP3TR7PbwGLA@mail.gmail.com>
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
	 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
	 <CA+chaQfSE-oiUxdSJxqCT-GjUP_KGA4dOvcD49xPqwez=ohhFg@mail.gmail.com>
	 <CAOSpxdYXrnJRdc_NghthSexaq_R10h0=JBTfqPTP3TR7PbwGLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:10:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166391

On Wed, 2022-06-01 at 05:29 -1000, Steve Sakoman wrote:
> On Wed, Jun 1, 2022 at 12:10 AM Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >=20
> > As discussed on IRC yesterday I've tried to reproduce this failure loca=
lly and it works fine with poky master cee443ae75f (last commit in master b=
efore the upgrade to 12.1)
> > 2022-06-01 09:46:37,051 - oe-selftest - INFO - RESULTS - reproducible.R=
eproducibleTests.test_reproducible_builds: PASSED (6429.19s)
> > and now it passed with kirkstone as well:
> >=20
> > poky $ git cherry-pick 44a36caa7c2
> > Auto-merging meta/conf/distro/include/maintainers.inc
> > [jansa/kirkstone-gcc-11.3 5c6e280eed5] gcc: Upgrade to 11.3 release
> > ...
> > poky $ oe-selftest -r reproducible 2>&1 | tee log.oe-selftest.reproduci=
ble.kirkstone
> > 2022-06-01 09:51:31,653 - oe-selftest - INFO - Changing cwd to /OE/buil=
d/poky/build
> > 2022-06-01 09:51:31,653 - oe-selftest - INFO - Adding layer libraries:
> > 2022-06-01 09:51:31,653 - oe-selftest - INFO -  /OE/build/poky/meta-pok=
y/lib
> > 2022-06-01 09:51:31,653 - oe-selftest - INFO -  /OE/build/poky/meta/lib
> > 2022-06-01 09:51:31,654 - oe-selftest - INFO -  /OE/build/poky/meta-yoc=
to-bsp/lib
> > 2022-06-01 09:51:31,654 - oe-selftest - INFO -  /OE/build/poky/meta-sel=
ftest/lib
> > 2022-06-01 09:51:31,655 - oe-selftest - INFO - Running bitbake -e to te=
st the configuration is valid/parsable
> > hint: Using 'master' as the name for the initial branch. This default b=
ranch name
> > hint: is subject to change. To configure the initial branch name to use=
 in all
> > hint: of your new repositories, which will suppress this warning, call:
> > hint:
> > hint:   git config --global init.defaultBranch <name>
> > hint:
> > hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
> > hint: 'development'. The just-created branch can be renamed via this co=
mmand:
> > hint:
> > hint:   git branch -m <name>
> > 2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding: "include selftes=
t.inc" in /OE/build/poky/build-st/conf/local.conf
> > 2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding: "include bblayer=
s.inc" in bblayers.conf
> > 2022-06-01 09:51:37,092 - oe-selftest - INFO - test_diffoscope (reprodu=
cible.DiffoscopeTests)
> > 2022-06-01 10:08:42,982 - oe-selftest - INFO -  ... ok
> > 2022-06-01 10:08:42,983 - oe-selftest - INFO - test_reproducible_builds=
 (reproducible.ReproducibleTests)
> > 2022-06-01 10:09:56,114 - oe-selftest - INFO - Building reproducibleA (=
sstate allowed)...
> > ^Ap2022-06-01 11:11:09,785 - oe-selftest - INFO - Building reproducible=
B (sstate NOT allowed)...
> > 2022-06-01 11:55:00,507 - oe-selftest - INFO - Checking deb packages fo=
r differences...
> > 2022-06-01 11:55:00,946 - oe-selftest - INFO - Reproducibility summary =
for deb: same=3D139 different=3D0 different_excluded=3D0 missing=3D0 total=
=3D139
> > unused_exclusions=3D[]
> > 2022-06-01 11:55:00,946 - oe-selftest - INFO - Checking ipk packages fo=
r differences...
> > 2022-06-01 11:55:01,330 - oe-selftest - INFO - Reproducibility summary =
for ipk: same=3D139 different=3D0 different_excluded=3D0 missing=3D0 total=
=3D139
> > unused_exclusions=3D[]
> > 2022-06-01 11:55:01,331 - oe-selftest - INFO - Checking rpm packages fo=
r differences...
> > 2022-06-01 11:55:01,760 - oe-selftest - INFO - Reproducibility summary =
for rpm: same=3D139 different=3D0 different_excluded=3D0 missing=3D0 total=
=3D139
> > unused_exclusions=3D[]
> > 2022-06-01 11:55:01,760 - oe-selftest - INFO -  ... ok
> > 2022-06-01 11:56:29,573 - oe-selftest - INFO - ------------------------=
----------------------------------------------
> > 2022-06-01 11:56:29,573 - oe-selftest - INFO - Ran 2 tests in 7495.224s
> > 2022-06-01 11:56:29,573 - oe-selftest - INFO - OK
> > 2022-06-01 11:56:31,723 - oe-selftest - INFO - RESULTS:
> > 2022-06-01 11:56:31,724 - oe-selftest - INFO - RESULTS - reproducible.D=
iffoscopeTests.test_diffoscope: PASSED (1025.89s)
> > 2022-06-01 11:56:31,724 - oe-selftest - INFO - RESULTS - reproducible.R=
eproducibleTests.test_reproducible_builds: PASSED (6378.78s)
> > 2022-06-01 11:56:31,881 - oe-selftest - INFO - SUMMARY:
> > 2022-06-01 11:56:31,881 - oe-selftest - INFO - oe-selftest () - Ran 2 t=
ests in 7495.225s
> > 2022-06-01 11:56:31,881 - oe-selftest - INFO - oe-selftest - OK - All r=
equired tests passed (successes=3D2, skipped=3D0, failures=3D0, errors=3D0)
> >=20
> > Is it possible that the reproducibility failure was caused by something=
 else included in your run on autobuilder?
>=20
> It is quite possible that it is host distro specific, I've seen that
> quite often in the past.  Let me know which distro you used for your
> test and I'll try the same on the autobuilder.

Keep in mind that the test uses sstate to compare against so even that
isn't a guarantee of identifying the issue.

Did you try the strings comparison I suggested? Do you have the file
section tables comparison (diff) I could look at?

Cheers,

Richard



