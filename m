Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045CCE7545E
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:58:32 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.120918.1766584710273233417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 05:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xp3W+NTI;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a3d2f3299so70038856d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 05:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766584709; x=1767189509; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VLF3QUpY0eWQacISnFA+thy1blPMUyUTjjZ6HxkMMBQ=;
        b=Xp3W+NTIM53A16x67lf1uJNkFEuv/49VeMTPohuVPmMv2gDYIG7SrYKLCAjGc85kF1
         ofzxldcccNZD1VcO2qBygiXc6Mcff6n2DDW7lqgVRH274d76deyBMwt1rcgjHc76R3cm
         CJ9osqjx3x0G7BU8Wz0r8tWBMlXuwZ1Tbr/2oG5dLYfoJBZNndlwZVotXs2dH9X78OmL
         ouoMDtJPvw1gOGIpv28PPzuVsp9fe9+sqLCmiJRHzbDlkWXG0LMi1JCcRhshjYCPdh6Y
         LUTdOw1rWIvtvsCh64EpAG3j02q51NGj79Er5Lvsa/g9nhInVwv7X59bIauJWmkl4MTt
         Vr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584709; x=1767189509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLF3QUpY0eWQacISnFA+thy1blPMUyUTjjZ6HxkMMBQ=;
        b=FzJhK9gh5y81oxL85f/3SCSa83HphfA3C7P6DLlkGnUD+vkXOqr2uOKAPK2t97a289
         96DWrfcZ5QL9sKmkL7pdt1nyM1T+owuPEGVpE93vbtWzQLw+AzNwFmxNjfMiHybBleIM
         UlJR1usZ1MiEtCSoB7tprnHEEAM/iUZUI383Xr5KPBubHDXyL+m2ag11l1e9D7DFVBbN
         XqQC6BFuG1do8J7NPV4PnPztsoVR1lETqzPJBraYZ4pCPsC6pVarpxo9I+BvZtqK/899
         e7/UNoRbo7Mg4j5YqPD6OVNL1bLpcU7ky48Me2ogOwNENyuxPvX9YOG3QRZkIRB7EI7y
         J/MQ==
X-Gm-Message-State: AOJu0Yyupm57AmTMa8oIVpZSdnLDDYvrViJ6f9RKg8Cs1pBLLhqTUKee
	K+N7pQDc1PMA+E6KTbc2PSvPV/omfwv7nGMG+qcJabsbPyuyCnXbZotaAZX4RhxXfTJuwur/hE9
	+PH5kdqS7amJymswO8+lFyQFds3Yg6ErAFw==
X-Gm-Gg: AY/fxX6UVmaUDiadTH6DPKX2kQ2DgsNq6xxi0cxa85dXELVV9VrMgO48rDKtd/M1kvp
	gd5EuCWqKgMoe4+IukzdQKirV9A1kzgHcxs57avZ1/AYd5H4c5Z2Y+3BDcEYM0ZmCXq2Kb+YfvN
	1WkGSeOzPEb6FY5LFpTmdXIqexPbn1CtlefvXikYdHHnt0glbyxV9vkwlZavafy6EpbVokBzvxK
	OHzBMIStTeEJxiR9668/n6VrNLquIFqjrAu3DJsqvvM8/D0IBEYmSoC09KUCSlmyg/WrQ==
X-Google-Smtp-Source: AGHT+IF67q00bDjBQsA+C3WFEF136W6ezFoX4pXaFWzUTTqf+FAjXRrF/YHxrEcK/FO/fwUedO6RTXFyVDyEQ+LlfeA=
X-Received: by 2002:ad4:5c63:0:b0:88a:2e39:957e with SMTP id
 6a1803df08f44-88d86963c67mr290188066d6.57.1766584709063; Wed, 24 Dec 2025
 05:58:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765878985.git.liezhi.yang@windriver.com>
 <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
 <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
 <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com> <CANNYZj8c1DRLJfxZMVVT3fx2Db8fnUc8A73_pE3AasKRMQ6U1A@mail.gmail.com>
 <473904dd-5f19-4331-91a3-4ccdab694c1c@windriver.com> <CANNYZj9sUP6xxkOLauwXuGAZH17HM3zkmAzQHSp5vx7b5Gy2VA@mail.gmail.com>
 <8da2cc05-7587-4264-843d-aa2e57cbc161@windriver.com>
In-Reply-To: <8da2cc05-7587-4264-843d-aa2e57cbc161@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Dec 2025 14:58:18 +0100
X-Gm-Features: AQt7F2o7G2baBEcBhEcNLWBl_oG-UmaIa0-npPrWW0SJNjEP6Tl6a0k_B6S9lDY
Message-ID: <CANNYZj_LgEZvfNiKua=bmTaC0pyvCTKr=fDmWiDRV5Vqp20omw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 13:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228535

On Wed, 24 Dec 2025 at 13:39, Robert Yang <liezhi.yang@windriver.com> wrote:
> You're right! All test cases are passed in 6.17:
>
> # TOTAL: 1450
> # PASS:  1121
> # SKIP:  329
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 0
> # ERROR: 0
>
> So we should hold on this upgrading.
>
> I didn't use core-image-ptest-strace in previous testing, but test it manually
> with core-image-sato, so I got the failures on 6.17.

The upgrade has already merged, as it was needed for the kernel
updates. The two failing bpf tests were patched out so that reset can
pass.

Alex

