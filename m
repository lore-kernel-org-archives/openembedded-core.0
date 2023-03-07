Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4A2C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 06:37:42 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.8776.1678171060987897423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 22:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BGmy96Qp;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id i9so15775084lfc.6
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 22:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678171059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/byBDyOa8aoKULO22tM3Z46HUkUkkL2VDv3lX3gHP8=;
        b=BGmy96QpbHMV9iFIq1BOpTeC4+VLqscgFyE2hL0MAXanclUdQEYDn3bvpIGKOrwXBL
         jeTkWvN7U2Sim2INtRFV9gtcdsEw68QE9S0A0vHNr3q/0bg49TQq1V+3TWw6kJKa8mBG
         /AYuTkDtZbWUV23rNylZBrofkCLNU2MrQ64FdfjG8T4SPQdkVnO4rhh3Fp+0eBnCmV42
         eWxwmoE80s8RL3QAYaSEBPNeMYlG7hZsrmlJxgULCzsAPLk9P4wIZLgoiIwUq/o/Z8vT
         7IhBWMSZyv+hHqojzA1T++XI8F6d9hua1c5Xczv1faLGxIDGSuEi1GpCJcRZOvabycUP
         Dpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678171059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/byBDyOa8aoKULO22tM3Z46HUkUkkL2VDv3lX3gHP8=;
        b=PAXy6v1TAoOj1Obv51DNsv4YF0yBvtqtcItBTdIQNqIEsGy+R1CtP/EmJ/PYo0MVQs
         Z7nv8ZO+AF7UUJqtbGd9PL4HZope2sIrAKZODb0+pkkcvar7CbPSHtnh3v4J/gROrfv3
         llpDEhvSG/jx/Q0PmaVgD0HCJDf84XSn5z2xIEr7eUNzNiCjREbCJK8KG+xXSnSVBbkJ
         /WYrPDtk4H2Un8XRH8jM9GkDXIRQ3fbdX+9HIM8GXSzWQhY8S3aQ3Lrd1MObQlFKA/PP
         fjscCiCJW5rxdo+F5Jc5oMHpriUcFazQ/S/C8/TCg9L7J/VDf0NHaR7KyFMyrejMmW4O
         z8Bw==
X-Gm-Message-State: AO0yUKX1hiS1WiCJQoPhQOsm6CP5ANJgUZculGwnKYxOz7qRpi2YrLZ4
	uJVBecQwvvwEbkQh614Oc/g5olQ/yzERIBfVtkQ=
X-Google-Smtp-Source: AK7set/DAOEvv0+n5iJs57kFvlYCDLE/8UtJ94ZzRupYSfhGfBJgVYyDfg5Ac10BhKliHrx1ys8zmtSg2FUQTbbFLXc=
X-Received: by 2002:ac2:46db:0:b0:4e1:d025:789e with SMTP id
 p27-20020ac246db000000b004e1d025789emr4159201lfo.13.1678171058858; Mon, 06
 Mar 2023 22:37:38 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
In-Reply-To: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 07:37:27 +0100
Message-ID: <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 06:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178090

You probably should make a kirkstone mixin layer like we did for dunfell.
https://git.yoctoproject.org/meta-lts-mixins/

Alex

On Tue, 7 Mar 2023 at 07:32, Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Hello everyone,
>
> I would like to ask you how to proceed with multiple CVEs for Google Go
> component in kirkstone branch.
>
> CVEs in current version 1.17.13:
> - CVE-2022-41722
> - CVE-2022-41725
> - CVE-2022-41724
> - CVE-2022-41723
>
> They are fixed in 1.19.6/1.20.1 branches, but a fixing patches are
> available for all of them too. Unfortunately there is more then ~1000
> changed LOC. So not sure if this is the right approach to apply them.
> Not sure if the upgrade is acceptable.
>
> So how to proceed with this?
>
> I know, that they aren't a critical one, but would be nice to have them
> fixed.
>
> Regards,
> Andrej
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178089): https://lists.openembedded.org/g/openembedded-core/message/178089
> Mute This Topic: https://lists.openembedded.org/mt/97444547/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

