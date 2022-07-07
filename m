Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E28C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 10:17:33 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.3878.1657189052790300757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XoaZmHHa;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 19so781055ljz.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZC9bgD/LAtPi1W3KNUtsFvCZgqD9V1KHU7LDOBOKaIM=;
        b=XoaZmHHaQhnVPljstNBa+qrbFAjOpwTX0+3KFkGFji9SqB8UXuEeKnSth4DUg1mEdd
         OK0oMB4hSviBQ9jSG+wONRAb7J9PZe3iWBAwl6ag3B75y8Hx36FXd0LR2b2QrUEI/wvh
         uHIoQi+F9zk4/E3Xk0X9KvHNC4FiPLrrfbCAGNj2xkrthu3uus1dsu8WOMGndU0ymemZ
         EP960SfZ7efUGB/pXnLKTeNlJx9ajItGjAPogYZ6MPosSq50Dg27hQxiP4TiE2MBA9dX
         RyGfRUiGEgeJoGCdBLr0zc2BHsGzINi/ZCpxF0aetG835yLxcTgGT3n/nTHmZIA2/Yvy
         ZazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZC9bgD/LAtPi1W3KNUtsFvCZgqD9V1KHU7LDOBOKaIM=;
        b=O5SOpmOnQ9+5W72l80HTPVHjCAaeV6tbHMxzUpSjm1jSBhfs83BcTjinN0E4CoI88C
         F1nwLuG6HWExYsYf0KycytN4Sjw+bVggdOU9pzcVbr23Zr+duw54bVBPCuOIVp0fPFwr
         55kuMvfD+XtRwjUDEUAShweIHcN6iax3GitDhgPUIC+IrLw/rRQ3t9KQDtRqXtyF0Io/
         6E7mmhXfRJTMGZgn13J2cSc3iAwh1j3PlCS4g6+8oqEpCiwJpqMLF4iEHAGpfs2psj8J
         2J5w88Ao1sqE9fFnD3LCqQdflP53JrcptYicIRmMWnIP4QAEGQ4WQXsqp6P0dY5qZGQM
         fIHw==
X-Gm-Message-State: AJIora+B6U4Ut22uIK7mbGVZWgGnNoxwPMoTQN+1ZovjVp5DMgSdBsuZ
	CTYG+ZZQYrGrbxdYYfbCcK3vDgbJU/pd7C8Ac/8=
X-Google-Smtp-Source: 
 AGRyM1sogAnWiDzJmakr8IcLShaFmlUkQ+LMhRl8rg0Xyd9cM+lEpxIYHbgf3WdZasFwvmPY2hXqcmHV5EoZzAZfN6c=
X-Received: by 2002:a2e:9c8b:0:b0:25d:4d9a:130b with SMTP id
 x11-20020a2e9c8b000000b0025d4d9a130bmr1909971lji.68.1657189050973; Thu, 07
 Jul 2022 03:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220706195311.974830-1-JPEWhacker@gmail.com>
 <CAA2FC7D-8003-431C-B856-B8DE9DCDC202@arm.com>
In-Reply-To: <CAA2FC7D-8003-431C-B856-B8DE9DCDC202@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Jul 2022 12:17:19 +0200
Message-ID: 
 <CANNYZj-tF-QYoJ2U-V-PgJJXfAWbRDmELLBziUrq40SzXi5LwQ@mail.gmail.com>
Subject: Re: [OE-core][RFC] Layer Setup JSON schema and example
To: Ross Burton <ross.burton@arm.com>
Cc: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 10:17:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167765

On Thu, 7 Jul 2022 at 12:03, Ross Burton <ross.burton@arm.com> wrote:
> JSON is terrible for humans to read or edit, is this intended to be purel=
y for the machine, or are humans meant to read it too?  If humans are meant=
 to work on the file I=E2=80=99d really prefer something readable like YAML=
.

Wait, how is YAML more readable, if JSON is valid YAML?

Alex

