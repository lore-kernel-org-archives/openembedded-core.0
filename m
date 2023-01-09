Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616CDC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:10:37 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.67133.1673255434618986324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FsQsV65H;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id bu8so11956146lfb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zB0Cce7IGmbzhBARzOHG2+7FCo/joB1C4nYbb2ElPj8=;
        b=FsQsV65Hle7SgdEFNVy99/iKMKBBcwOR7c7SaFZUVpR+NuG9ho90E+aDL5WID3GxBP
         mxVdXnrG7jdfTCyiXKF+4RvrhUUR7EU0FCVSgnvUD0Ln41/gbwOzjV1nDLDJ74xNOPxh
         Hfa9OS5oA1Xpor2wnBQT89WOmn3pfQBE/CC6mtW8jV6uaZ9jMVw3sRGIdAYqFDDtqXvo
         IoRjXhPVd4CxZtkJWoS91n6MZcpcUatVxu3s/ndlLWjzPxm77tfanrU128Pq1nI7izaj
         W2LHd5sWIuN2H4NYYCboCRueC7QntDzulYt5gFnGL6krsML/TGq2vySLNwgt+gaOXvNC
         458g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zB0Cce7IGmbzhBARzOHG2+7FCo/joB1C4nYbb2ElPj8=;
        b=7BXP5S4eZ/l74sZfAPU10YaU45wigVNV1m8F1GYSF76LmVn2bDUAFnWwFRH7frTFji
         6G/+oVNAjpn0hZqiPlrakOAinUC7aAxyL//O1G37rB50Lx6J/i/6GTAsUwXVUj93uFD6
         zpkbZ4MXyqZ9EPgVF4G70Ib76U5A3oNuI6dvyq5/FMQJBJSVa9XVj+lairRZ6JLCSpY/
         5e4lAM2HVK1RFfy6EODeKhS6F46u152MHCjMrphS8Uko9a2upBpqMH0cJSImKorGvLL7
         f7xvUSfnVi5WlpTh62AIB8yCm9nCfE8bTBBQs2WAVaOHBDE5AWMHo1gvaiBI95rPBhyw
         5Diw==
X-Gm-Message-State: AFqh2koQi+O+ygpd7ueC3CNmGb4KwqK91ejDWhWEtXHF74DVN21Bh6ih
	zBaM0+DqovR6tYksKnt4x6zHOvOdlbVUQs9NYr4=
X-Google-Smtp-Source: AMrXdXtvPs3fKiE2GpiUV5G4gkhE4JvXDr+G7/JqMepLMj2/PLKsFh1MFUNzRoYzpNCGw95Psimq7pO9Wl1KTGGJIXI=
X-Received: by 2002:a05:6512:39ce:b0:4cc:716d:e018 with SMTP id
 k14-20020a05651239ce00b004cc716de018mr484317lfu.367.1673255432547; Mon, 09
 Jan 2023 01:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
 <CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com> <44949595-157b-943d-f248-43b65c1e0d9f@windriver.com>
In-Reply-To: <44949595-157b-943d-f248-43b65c1e0d9f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 10:10:21 +0100
Message-ID: <CANNYZj87-0q6qg19Ph_Tkhu5cF_n=Gw1AMVRb+_ch=1Eac+3RA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libportal: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 09:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175672

On Mon, 9 Jan 2023 at 10:02, Yu, Mingli <mingli.yu@windriver.com> wrote:
> Sorry for noise!
>
> Originally, the patch is used to fix the yocto compliance issue. The
> libportal depends on gtk4 and there is a line "REQUIRED_DISTRO_FEATURES
> = "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory for
> libportal, how to solve the below yocto compliance issue?  Any hints?
>
>
> ERROR: Nothing PROVIDES 'gtk4' (but
> /build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb
> DEPENDS on or otherwise requires it)
> gtk4 was skipped: missing required distro feature 'opengl' (not in
> DISTRO_FEATURES)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'libportal', 'gtk4']
>
>
> [1]
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55

Thanks for clarifying. Meanwhile there was a discussion in a different
thread about this, so the patch is fine.

Alex

