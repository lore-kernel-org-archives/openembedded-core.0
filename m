Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE78C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 08:07:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.13120.1677226061187707263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 00:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CuGrYCL5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so1188482wmi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 00:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+IMMGHWAvlGKNLUL7XpJokUzA9U3XasBD2WBspMkrTU=;
        b=CuGrYCL5gC9/cdkpXBwtT/Vl+p5lCVQIfOneAfudOsPPSBN4G+cZhF1M+WfosDQBhT
         +slQBlbX3qLJXyVyC4nCNmEA+nTJmkcrm4cig/f0GgEGma2zf7hH5IGjDi+1FyFU0lYp
         uCCdzyaSVQqdKaDNj9RhY0DnmbcRzEMIktpfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IMMGHWAvlGKNLUL7XpJokUzA9U3XasBD2WBspMkrTU=;
        b=khWC9FeB3fv6kB7V1/DfVDDOaovO1G2Vd3G6QUFmQ42U9o59EIhbS3/dW591DrOF6H
         3I6Boy2V7wfEDHrtzbEPDYIWgdxo7H/zGeInxqyeXwEWZX7CfbUrvbDCR1engshsNeRA
         wBF5jR5CJNB/T4Gn3FGhoL0QiGxp7hrOz8jlWtnZgFedysObPbOL0HrDUlIDjtu21lkg
         S/qrUs7RhjoeelgUWtVmIyhTucOnV3EXUceCpY/Yx3AqTOV/qRIlfHrFqHL+YggEDHgj
         ioQdIyKqA+x2aguAiao7dM/vWaDrLy2VRQsBmKqwL+ZH6iWQHEHD/8S1kIL3rWcetCCw
         cvoQ==
X-Gm-Message-State: AO0yUKWBl65bMIbpJpgZsNqeWIdB9i6S2mEsFiwMMaWzkI8gr5XvclDC
	gPGsNXDXESfc/e7vONDqUk+Y8Q==
X-Google-Smtp-Source: AK7set+Yi15xt0VAWgVWv3o97RH5ZmWqB4LXLNAuANAwemW7hUgn2ZOGs0Mt+HozrCAgsGLCx7EIjg==
X-Received: by 2002:a05:600c:2e88:b0:3e2:201a:5bcb with SMTP id p8-20020a05600c2e8800b003e2201a5bcbmr11318848wmn.28.1677226059459;
        Fri, 24 Feb 2023 00:07:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id i15-20020adffc0f000000b002c5691f13eesm13108702wrr.50.2023.02.24.00.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:07:39 -0800 (PST)
Message-ID: <24267b35ff6660e54f784e8624ef220acc72ee3f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v12] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, pgowda.cve@gmail.com, 
	openembedded-core@lists.openembedded.org, "Gowda, Naveen"
	 <naveen.gowda@windriver.com>
Cc: rwmacleod@gmail.com, vinay.m.engg@gmail.com, "Shinde, Yash"
	 <yash.shinde@windriver.com>
Date: Fri, 24 Feb 2023 08:07:38 +0000
In-Reply-To: <174695D374C4BEEF.29542@lists.openembedded.org>
References: <20230223063624.2226016-1-pgowda.cve@gmail.com>
	 <18d49c01-cafe-aef9-4bbc-9ab97ec067e3@windriver.com>
	 <1746900CB74FE25B.29542@lists.openembedded.org>
	 <174695D374C4BEEF.29542@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177661

On Thu, 2023-02-23 at 22:50 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-02-23 at 21:04 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2023-02-23 at 13:55 -0500, Randy MacLeod wrote:
> > > Thanks Naveen,
> > >=20
> > > With a large patch like this it would be good if you could provide a
> > > =C2=A0cover letter that summarized what is different in v12, compared=
 to
> > > v11.
> > >=20
> > > I've looked at the diff and my summary is below. There are some
> > > changes
> > > =C2=A0which I see but would benefit from an explanation.
> > >=20
> > > Finally, please change your SOB line to @windriver.com.=20
> > >=20
> >=20
> > Changelogs definitely help, thanks Randy!
> >=20
> > Thanks for putting this patch together Naveen, we are getting there. I
> > ran this through the autobuilder and the good news is we only saw one
> > failure related to the patch, in oe-selftest on an ARM host:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1004
> > (from
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4962
> > )
> >=20
> > We could disable the rust tests on arm host systems to get this to
> > merge however ideally it would be fixed to run there properly as well.
> > I'm not even sure this should actually be running there at all now I
> > look at things. The other toolchain/machine specific tests are tagged
> > as "machine", e.g. meta_ide.py has:
> >=20
> > @OETestTag("machine")
> > class MetaIDE(OESelftestTestCase):
> >=20
> > or they're marked as @OETestTag("toolchain-user") or
> > @OETestTag("toolchain-system") in the case of the glibc/gcc tests. The
> > difference is how the tests are run so "toolchain-system" would be most
> > appropriate for rust. This means that the tests are run per MACHINE
> > target instead of once overall.
> >=20
> > The second issue I noticed is that the test results are not appearing
> > in the test report. For the build above, this is here:
> >=20
> > https://autobuilder.yocto.io/pub/non-release/20230223-9/testresults/tes=
tresult-report.txt
> >=20
> >=20
> > and I can't see the rust tests at all. This will need to be fixed
> > before the patches can merge. It may be changing to be
> > machine/toolchain might fix that, I don't remember the details.
>=20
> I found some time to check into this a little further. We definitely
> need to mark the test as a toolchain-system test so it is run in the
> right places.
>=20
> Aside from that, there is also no individual test result reporting in
> place for it, either the test suite passes or it does not.
>=20
> With the gcc tests, you'll see there is the self.ptest_result() call
> which logs the individual test pass/fail/skip value. We'll need to do
> something similar with rust so we don't just have one overall
> pass/fail.

I reran this with the OTTestTag set. With that set, the tests run in
the correct places and we then see failures for x86, mips and ppc:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6663
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/6682
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/6672

AssertionError: Command '['scp', '-o', 'UserKnownHostsFile=3D/dev/null', '-=
o', 'StrictHostKeyChecking=3Dno', '-o', 'LogLevel=3DERROR', '/home/pokybuil=
d/yocto-worker/qemux86/build/build-st-2169186/tmp/work/core2-32-poky-linux/=
rust/1.67.1-r0/rustc-1.67.1-src/build/x86_64-unknown-linux-gnu/stage1-tools=
-bin/remote-test-server', 'root@192.168.7.8:~/']' returned non-zero exit st=
atus 1:
b'scp: dest open(""): No such file or directory\r\nscp: failed to upload fi=
le /home/pokybuild/yocto-worker/qemux86/build/build-st-2169186/tmp/work/cor=
e2-32-poky-linux/rust/1.67.1-r0/rustc-1.67.1-src/build/x86_64-unknown-linux=
-gnu/stage1-tools-bin/remote-test-server to'

which might be because it is trying to copy a file from /x86_64-
unknown-linux-gnu/ when it is a 32 bit target?

Cheers,

Richard

