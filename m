Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20702C64ED6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 22:50:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4027.1677192646224790359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 14:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SHM6sgf0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso597429wmp.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 14:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WskdJHYqQK18dHGQ0HKZHVLY5PLeM4NTe/1/6EKiVx4=;
        b=SHM6sgf0w27QO+P163HhR4ndvg9Nc3NM3BSdsodSckQyvK7wTygmGKS3g+nrbotpyd
         dxwVggnotEDrDRsucqhgicrA618tY7Oi3SGWI7ZqwusBCGP9uCO19ZPxNtKzvIgKNMCF
         kJU3A/pUw1j4vNkNbrTWR9qjMPeP20lwlw5iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WskdJHYqQK18dHGQ0HKZHVLY5PLeM4NTe/1/6EKiVx4=;
        b=YFitJHCeUL22GOIT/lm6XubUOnrTNY26q2g71YUhEce9//jVGKBB4/hFYgL3SF1UW2
         cWv6WNYD//GVi6pAk//Wp7+cKgzbe+0LFOxkXQ/lyprMIbUHsAD/nPGN4OOrYof/V0WB
         XVLxeQPaa01tR306ZvuOrpKi4U3cSLJk3L21wbO3pZipxqma7rymVy2+94pOSZm8qqUK
         PQDwPIv+VBjhdlaKn+cpxRJINMVmNLMvZXEu6lRkL+HGf/XzbqZe7vagswyXoNz4LUFi
         PfKHTpNtImnF67XWB/ud7nurcqdxni1kRj0K/ubCkBYgAtZhVrBeKaie55iw5Xhcyx+U
         zFcQ==
X-Gm-Message-State: AO0yUKVW5DNIJDj6Muwx0iWIoHuh3iLr3DJTleARu50ewAO+Bbk1giDi
	pfnX1iX0JLrcsZu3SqmctvUY4Q==
X-Google-Smtp-Source: AK7set9BBz20fKgenHEz2hlekU0MdC0vYdGwO2EgMD1//JvJrVlKagQM9yU2GM5wfpWiGIhIQFOPFQ==
X-Received: by 2002:a05:600c:3318:b0:3ea:dc1b:90c with SMTP id q24-20020a05600c331800b003eadc1b090cmr1487027wmp.20.1677192644492;
        Thu, 23 Feb 2023 14:50:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id be6-20020a05600c1e8600b003e89e3284fasm697712wmb.36.2023.02.23.14.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 14:50:44 -0800 (PST)
Message-ID: <501090b4519e209d6b26712c5106395e28de03ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v12] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, pgowda.cve@gmail.com, 
	openembedded-core@lists.openembedded.org, "Gowda, Naveen"
	 <naveen.gowda@windriver.com>
Cc: rwmacleod@gmail.com, vinay.m.engg@gmail.com, "Shinde, Yash"
	 <yash.shinde@windriver.com>
Date: Thu, 23 Feb 2023 22:50:43 +0000
In-Reply-To: <1746900CB74FE25B.29542@lists.openembedded.org>
References: <20230223063624.2226016-1-pgowda.cve@gmail.com>
	 <18d49c01-cafe-aef9-4bbc-9ab97ec067e3@windriver.com>
	 <1746900CB74FE25B.29542@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 22:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177637

On Thu, 2023-02-23 at 21:04 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-02-23 at 13:55 -0500, Randy MacLeod wrote:
> > Thanks Naveen,
> >=20
> > With a large patch like this it would be good if you could provide a
> > =C2=A0cover letter that summarized what is different in v12, compared t=
o
> > v11.
> >=20
> > I've looked at the diff and my summary is below. There are some
> > changes
> > =C2=A0which I see but would benefit from an explanation.
> >=20
> > Finally, please change your SOB line to @windriver.com.=20
> >=20
>=20
> Changelogs definitely help, thanks Randy!
>=20
> Thanks for putting this patch together Naveen, we are getting there. I
> ran this through the autobuilder and the good news is we only saw one
> failure related to the patch, in oe-selftest on an ARM host:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1004
> (from
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4962
> )
>=20
> We could disable the rust tests on arm host systems to get this to
> merge however ideally it would be fixed to run there properly as well.
> I'm not even sure this should actually be running there at all now I
> look at things. The other toolchain/machine specific tests are tagged
> as "machine", e.g. meta_ide.py has:
>=20
> @OETestTag("machine")
> class MetaIDE(OESelftestTestCase):
>=20
> or they're marked as @OETestTag("toolchain-user") or
> @OETestTag("toolchain-system") in the case of the glibc/gcc tests. The
> difference is how the tests are run so "toolchain-system" would be most
> appropriate for rust. This means that the tests are run per MACHINE
> target instead of once overall.
>=20
> The second issue I noticed is that the test results are not appearing
> in the test report. For the build above, this is here:
>=20
> https://autobuilder.yocto.io/pub/non-release/20230223-9/testresults/testr=
esult-report.txt
>=20
>=20
> and I can't see the rust tests at all. This will need to be fixed
> before the patches can merge. It may be changing to be
> machine/toolchain might fix that, I don't remember the details.

I found some time to check into this a little further. We definitely
need to mark the test as a toolchain-system test so it is run in the
right places.

Aside from that, there is also no individual test result reporting in
place for it, either the test suite passes or it does not.

With the gcc tests, you'll see there is the self.ptest_result() call
which logs the individual test pass/fail/skip value. We'll need to do
something similar with rust so we don't just have one overall
pass/fail.

Cheers,

Richard




