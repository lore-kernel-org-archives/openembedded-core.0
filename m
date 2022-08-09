Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E741C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:08:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12327.1660054125486803473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZEIFWayy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id p10so14442882wru.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=nvO5LwTfw0I5nd3LLtqaBXp44zOiLzaP2r0qD1/NRS8=;
        b=ZEIFWayyx9ok8TWXxzrtcHsz70gUwTfcpJClfi5RxMKp8aaThGxrPy4Kb3XOR2hf/f
         c/cLh9jJaKd/Hfkcq/MewNO258dRwoGVWoy8fnVFvr9gYKkeHhz4T18xSGPgPRMyIf1p
         TIAlFxXZEzyBQc/HfAlpFszsTHG8GIVN1feIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=nvO5LwTfw0I5nd3LLtqaBXp44zOiLzaP2r0qD1/NRS8=;
        b=YqsKY8c/NmO4w50/Dz8aq9HLAs32kIqkqxm0YproiNedNT1o2Cp3s6NQEYpiQfHWL5
         Ir2D7xYglsc8HX7F1uwZkUGVgS6PoMCPSoEMNOpPdOW5hZ6q/bovRmuPUJfCphiilDTQ
         8z3ZuTmGgf4tgsOC2tAqNQ6bLXVQj0EoiimZZfewgMPE/GLkSan7d6bGnMBI746Meycu
         UYiTVXuTRhgJJXevgmW0US0G4yWeDaPvrA86twF4U4QIVuVTCJNGK+YT9DjeWgn1mX/b
         Jf1WksoTMZ3IPECD+td8lNzxNPW/MCono7zcMcnXupg2LDXtByHkUU7P0gOao7CT9M3d
         5f6g==
X-Gm-Message-State: ACgBeo3ZSfVBPod+lgdAwf2+YuCoDbwD1eJhEkqC77yFmZ+AFi64Bimp
	10Qu5mKfQo7JfBIj2OSBq8SJGQ==
X-Google-Smtp-Source: 
 AA6agR5i36G0rzQIdzEZQvedH2jK+i5SBdN2vEbKZWlr04y3aSFjz8QDmv0cr1ZvqUhxljC+iFcapQ==
X-Received: by 2002:a05:6000:226:b0:21f:d78:39e5 with SMTP id
 l6-20020a056000022600b0021f0d7839e5mr14839633wrz.638.1660054123482;
        Tue, 09 Aug 2022 07:08:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222?
 ([2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222])
        by smtp.gmail.com with ESMTPSA id
 b17-20020a05600010d100b002206b4df832sm13503499wrx.110.2022.08.09.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 07:08:43 -0700 (PDT)
Message-ID: 
 <38993922ecd0f4c3d774ff9fd5d4053ad80ea6af.camel@linuxfoundation.org>
Subject: Re: [PATCH] kern-devsrc: Drop auto.conf creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2022 15:08:42 +0100
In-Reply-To: 
 <CADkTA4OnaX_jAn7GLbOVRSONWqTcMdc9Zk4Fg4ULdeUDEDjnXw@mail.gmail.com>
References: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
	 <CADkTA4MBRL7JuLA8D32K1_CcyDMcRO=hfJyghPHyUZtwKw-nqA@mail.gmail.com>
	 <bfc1c1a5b9ac8093b409129b825c41696650f66a.camel@linuxfoundation.org>
	 <CADkTA4OnaX_jAn7GLbOVRSONWqTcMdc9Zk4Fg4ULdeUDEDjnXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 14:08:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169152

On Tue, 2022-08-09 at 09:29 -0400, Bruce Ashfield wrote:
> On Tue, Aug 9, 2022 at 9:26 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2022-08-09 at 09:16 -0400, Bruce Ashfield wrote:
> > > On Tue, Aug 9, 2022 at 7:14 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > After this commit in the mainline kernel, the quoting is different =
in auto.conf
> > > > compared to .config:
> > > >=20
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D129ab0d2d9f38b9d43df35235fc66c6740d6928b
> > > >=20
> > > > We therefore can't just copy one over the other or it leads to synt=
ax/quoting
> > > > errors. We end up running make prepare anyway in all our tests so d=
rop
> > > > this copy for fix 5.19 kernels.
> > >=20
> > > It is safe to stop doing this manipulation now.
> > >=20
> > > But I am curious, I was running on-target tests for 5.19+ and didn't
> > > have any issues, what is breaking that I managed to miss ?
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5629/=
steps/13/logs/stdio
> >=20
> > Basically any kernelmodule.KernelModuleTest.test_kernel_module which
> > was run was failing (which would run on any image with kernel-devsrc in
> > and a toolchain). It failed everywhere, all sdk qemu machines equally.
>=20
> odd. I never did see that same error, and I built and installed kernel
> module for all the architectures.

Did you use the oeqa code or something else? It seems odd you didn't
see it as it was quite consistent on my local system and the
autobuilders :/

Cheers,

Richard


