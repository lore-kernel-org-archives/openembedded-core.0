Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A32C47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 08:36:03 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.10615.1670229356949826059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 00:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BN/osx6J;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id s8so17393522lfc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hED421vNn4anZFNA3O47519GDwm2rHy+isohQgLhIYA=;
        b=BN/osx6JXpPY9n9Iu5uvUv+HL23g5xEdJL3HR+HZEEncgC2CbfGWNvCwvCxK/99UfJ
         S3zVbnWe3x2bnKjm4L9BFt78XVLk20fNe+wEexnZBXVe9Mfx2inajDdSlafOZtmfpCEj
         +N3Pbo8ZuYF2p542M0K8OS5akywf8UulmqkLDlp4xVkAEnfE33MPlw3e/UEzpgPo39vS
         0CVia2ceVgov+XQyOPuCP/4Q44KHqzESopjsMwFlKAvC/OOSiGuDKjvPl4T7VXduIefH
         LEVbGc9XjV2f/ZtjduElW0EqmdUEsfw9Uh7CQq0hlZVSZapOIGIGxf6Zv2OslwgCNtvg
         1WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hED421vNn4anZFNA3O47519GDwm2rHy+isohQgLhIYA=;
        b=ebXGNqBamSiNRitM5GHRoyN8OY0BSvtICQO/60ATH3tV4R/ouJKBuwmB+s6LpjZ6DW
         L+t3zkNykeumt/kgbbMVau79qvFEHJli5PFM5bDMG2ykKD4Xinyas9d8vLhsqnn/eI9s
         K9IZ3z/2mlW2Rj35c9EWQ/Dkn+39oE4vkz1KUPMxiV2BcL991zISg6zBU3EAl/ORckc/
         SLzbUc4PUL/KkSvoFpSgmTm21lfRlAHRxut8SUVPP9i4ByaUCDfHXsvu7WNTJXOLVEQJ
         2ayy6fxCc/7ezBDVmRFIMq8/6DmPco1tM7g59QtwnSwdhYFKeFlqCi8HKhOEsLTenqm8
         N8kA==
X-Gm-Message-State: ANoB5pmTELv4/IWPpD4n78qXv0yEslfALxtXy/agoKzW/TYDXxGwj++J
	V01vRtj/w1eDavRYCA27MM5MJ21a6xjvsI3ykWg=
X-Google-Smtp-Source: AA0mqf78+tgmdJAI+MPefk79occj8c2KFOxri5SuGh5JxZhiaorj30KahutzKmTf8nv/x5oZ4VUbR44qlFCD2WW1ZyM=
X-Received: by 2002:a05:6512:3445:b0:4a9:39f4:5793 with SMTP id
 j5-20020a056512344500b004a939f45793mr24443765lfr.131.1670229354548; Mon, 05
 Dec 2022 00:35:54 -0800 (PST)
MIME-Version: 1.0
References: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com> <1670207094-6846-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1670207094-6846-4-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Dec 2022 09:35:42 +0100
Message-ID: <CANNYZj8fHw9+r9UzKtqX5ethrM0oxBg6YbALkN=uOMQsMqX6Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnu-config: upgrade to latest revision
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 08:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174278

On Mon, 5 Dec 2022 at 03:25, wangmy <wangmy@fujitsu.com> wrote:
> -SRCREV = "20403c5701973a4cbd7e0b4bbeb627fcd424a0f1"
> +SRCREV = "f992bcc08219edb283d2ab31dd3871a4a0e8220e"
>  PV = "20220927+git${SRCPV}"

The date in PV should also be updated to the current date.

Alex

