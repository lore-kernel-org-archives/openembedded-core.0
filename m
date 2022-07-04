Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5381AC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:35:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.72430.1656941704925216148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GG3hLZku;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 l40-20020a05600c1d2800b003a18adff308so5747220wms.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=ALWrpkGJ5/CnFWNZLY1rOUq4kZzq30vVzGkHqiJv6G4=;
        b=GG3hLZku4Zk4/2smSArfG2yMU/nvbDpiMgmUOkmsOzCiB40Kyt31Airr86imRBMLJv
         2FfZVOCwYlPmLPDrC1OOhFLZ3b62H7sGde/LHoWF30lw1Y/pusRDkuGIM3EXn8EPdkP7
         t8kFA0GgyLug2JyUskzedjlscsNSv1ld9seEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=ALWrpkGJ5/CnFWNZLY1rOUq4kZzq30vVzGkHqiJv6G4=;
        b=otGhr0Ox194Y0WBrDzcg+eZGO03fa6Fg+dvxSG6YQJJq6SLGMfDA3T4g69Vw2Ky0IB
         KXnyQoIo0OEwZ8tgT+qnOx7stW5/r0S/Q84XSy5VV3nMXeD4zrAS2V21PVkdoikwnPmY
         ZJJZZPXCJEsVwhwagDVCjzjV9juifWGMTEp8nCX7IXoF3vrWyU5G/R3c1Vh0Wvjg3s4a
         D8wuRwEjk0etb5YFk2I2iS502J9XmnOhhZkcpQmHBGqOC4fuwtmEi9QhcaSYdH6YEs6x
         OmmyNNi4L8lA/EO9WayfPS216FsWufXYAS0w9p78sVdNgYEUXL9MI0NNAl+dbxv32XQX
         Nx2A==
X-Gm-Message-State: AJIora+mZMEUZL1S62Pi1ysUQjobMYPmnlU4BYZrB7jTtD4Bw9MO4KUE
	bAr+0a0RsTVURQ8TK5Apdw4a14nND7SkKg==
X-Google-Smtp-Source: 
 AGRyM1u+4noxi69EjSkevtexXYemETsU1mQzJrgxcZsFt9ECCkN1rDmqqC75T0/VTYE7B6SH8qJA1Q==
X-Received: by 2002:a05:600c:1c0d:b0:3a0:4d2a:1862 with SMTP id
 j13-20020a05600c1c0d00b003a04d2a1862mr33550100wms.198.1656941703054;
        Mon, 04 Jul 2022 06:35:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b003a17ab4e7c8sm18328222wmq.39.2022.07.04.06.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 06:34:45 -0700 (PDT)
Message-ID: 
 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 04 Jul 2022 14:34:43 +0100
In-Reply-To: <16FE039DA287E43E.1980@lists.openembedded.org>
References: <16FE039DA287E43E.1980@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 13:35:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167609

On Sat, 2022-07-02 at 13:41 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Hi All,
>=20
> I tried enabling buildpaths in WARN_QA on the autobuilder. This in
> theory should have built cleanly but it didn't as we don't test all the
> autobuilder configurations for reproducibility. I think this proves the
> value in enabling it however before we can there are a handful of
> issues we need to fix:
>=20
> With oe-core (systemd enabled):
> stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /usr/b=
in/go-helloworld in package go-helloworld contains reference to TMPDIR [bui=
ldpaths]
> stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /usr/li=
b/glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glibc-te=
sts contains reference to TMPDIR
> stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr/src=
/debug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package systemd=
-src contains reference to TMPDIR

I think I have patches sent out which should address the above issues.

> With docs enabled:
> stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/b=
in/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buil=
dpaths]
> stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/=
pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpath=
s]
> stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /us=
r/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc conta=
ins reference to TMPDIR [buildpaths]
> stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vap=
igen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/shar=
e/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains referenc=
e to TMPDIR [buildpaths]

These still remain. In addition we also have:

A musl ltp issue:
stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/ltp/test=
cases/open_posix_testsuite/logfile.conformance-all in package ltp contains =
reference to TMPDIR [buildpaths]

Some multilib issues:
stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin=
/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildp=
aths]
stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapig=
en-wrapper in package vala contains reference to TMPDIR [buildpaths]
stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pk=
gconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]

qemuarm64:
stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/mod=
ules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h.cmd in =
package kernel-devsrc contains reference to TMPDIR [buildpaths]

meta-gplv2 issue:
stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc=
/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildp=
aths]
stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/ta=
r/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDI=
R

Christopher replied about meta-virt which is much appreciated!

Cheers,

Richard

