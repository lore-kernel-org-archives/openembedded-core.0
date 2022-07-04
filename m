Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F03CC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 21:29:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.77190.1656970141169666196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 14:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K+S/BSqp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id s1so14952914wra.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 14:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=CGAf+j2lMM9pcCzo5v7xiWO64Unyi3OROr5ADP/dBO8=;
        b=K+S/BSqpugElXGy/BhnaDs6kn1vLAoBiNOSTuzW5mypB7suTdf4IGVGpjUHc9ls1sP
         u/ycnC+TGR7GV4A68EY7zT2zjaCT5sqez0HLNe/+NMzQjxcn1C00kK48vNXW2EnBf4gH
         mCwsm8sMTIJMAKCbRBrPU+FF6GEvIjIIL8qEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=CGAf+j2lMM9pcCzo5v7xiWO64Unyi3OROr5ADP/dBO8=;
        b=HbCZjMN/gL48FHXGK0+mvEOhBCH4EQiwoMM/groKXt0BLR9UJ9NIc16AP+KEFJ6irY
         ezQpwvQo63k7eBlw2DJBRH0g5p7iUM8/KSS6nArqsEzTxvDSCYDBMnFNk/096rqK+29C
         zH/CunNX/W4edpNtp5y7lHUEFlP2cqV2aw9cM8zOG68lEDQhtz+YJohpjmUc3RGCYqD1
         f63t/qo5vw1XHtaNM4LR25r6QpKmX2pVCltuDiVFyNLVQlk5OavNNKPZNCq9IDh9yJxC
         +2Lgcdko40n5ReqGv0HwBSR/ocdIyxqJwAPWiqmzjqA7U1UjfYWdbx6JTtzbo6zBMwEK
         dJsA==
X-Gm-Message-State: AJIora8kwfKvNbH261/j7U8a+VdI9t2mc8plnrHSsTFnI0k/Ln9ofJ0J
	6AVxQgmgQMPDmX8GzVPvTWWxi9QdbCt7bw==
X-Google-Smtp-Source: 
 AGRyM1tu6bDyr3VW+vWixpZ4bUm3M9TBC2+b/J9ypJBB00uYSXlANf2Im0m/Rga1ACPjBDFx/Y6Lgg==
X-Received: by 2002:adf:fb43:0:b0:21a:22eb:da43 with SMTP id
 c3-20020adffb43000000b0021a22ebda43mr28393839wrs.347.1656970139173;
        Mon, 04 Jul 2022 14:28:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8?
 ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 q13-20020adff50d000000b0021d64a11727sm6212703wro.49.2022.07.04.14.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 14:28:58 -0700 (PDT)
Message-ID: 
 <b049df925b3ac8f0aeec5eb52768d3f3e1f2d532.camel@linuxfoundation.org>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 04 Jul 2022 22:28:56 +0100
In-Reply-To: <16FEA3B3CA900B93.1980@lists.openembedded.org>
References: <16FE039DA287E43E.1980@lists.openembedded.org>
	 <16FEA3B3CA900B93.1980@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 21:29:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167627

On Mon, 2022-07-04 at 14:34 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sat, 2022-07-02 at 13:41 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Hi All,
> >=20
> > I tried enabling buildpaths in WARN_QA on the autobuilder. This in
> > theory should have built cleanly but it didn't as we don't test all the
> > autobuilder configurations for reproducibility. I think this proves the
> > value in enabling it however before we can there are a handful of
> > issues we need to fix:
> >=20
> > With oe-core (systemd enabled):
> > stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /usr=
/bin/go-helloworld in package go-helloworld contains reference to TMPDIR [b=
uildpaths]
> > stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /usr/=
lib/glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glibc-=
tests contains reference to TMPDIR
> > stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr/s=
rc/debug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package syste=
md-src contains reference to TMPDIR
>=20
> I think I have patches sent out which should address the above issues.
>=20
> > With docs enabled:
> > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr=
/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [bu=
ildpaths]
> > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib6=
4/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpa=
ths]
> > stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /=
usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc con=
tains reference to TMPDIR [buildpaths]
> > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/v=
apigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/sh=
are/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains refere=
nce to TMPDIR [buildpaths]
>=20
> These still remain. In addition we also have:
>=20
> A musl ltp issue:
> stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/ltp/te=
stcases/open_posix_testsuite/logfile.conformance-all in package ltp contain=
s reference to TMPDIR [buildpaths]
>=20
> Some multilib issues:
> stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/b=
in/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buil=
dpaths]
> stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vap=
igen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/=
pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpath=
s]
>=20
> qemuarm64:
> stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/m=
odules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h.cmd i=
n package kernel-devsrc contains reference to TMPDIR [buildpaths]
>=20
> meta-gplv2 issue:
> stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/=
mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buil=
dpaths]
> stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/=
tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMP=
DIR
>=20
> Christopher replied about meta-virt which is much appreciated!

With the .debug checking patch applied, we also see an issue with
lttng-modules on beaglebone, edgerouter, and qemumips:

stdio: WARNING: lttng-modules-2.13.4-r0 do_package_qa: QA Issue: File /lib/=
modules/5.15.36-yocto-standard/kernel/lttng-modules/lib/.debug/lttng-lib-ri=
ng-buffer.ko in package lttng-modules-dbg contains reference to TMPDIR

but not x86 it would seem which is why the normal reproducibility test pass=
es.

Cheers,

Richard

