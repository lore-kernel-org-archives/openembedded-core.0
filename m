Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88678C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 09:45:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.8421.1706003097626692291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 01:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bUNAXNEe;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50eac018059so5592722e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 01:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706003096; x=1706607896; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr8xebmtD+LUQ9zEStDsDkepGkzmcbczI+OxkGoZtNU=;
        b=bUNAXNEewjYbbPWIsk+V9kTNmAYsTrYLk3BHN953q8hjOqHsuiSSPj8NH+IdRhs+n0
         HT0XfoLsFSTj0jlBVhfTxvZxeDBOpwUpCGcy5Cp5/zR5mUiJw1BIsQ1UHgxpWgGO4j3a
         Kt1WIv9/pxdc3bPvPngsD5qtoIIhiFjmAWb5PaGXYUb/V4FqW4ziF1LFIdWk3fnPcN24
         15DSYTZ2mk/RA2Ka8HWsVsddYgVcvxnQC0+5QRZ6qJbumCC2Pf9P6p3A7qDivzZSFJZQ
         mRpKaRK11N+i0FroE576MVohNXCJJdEzKVZRTfrGGH14DAaYH+Pxl48RkI+WJdly0RbC
         +aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003096; x=1706607896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rr8xebmtD+LUQ9zEStDsDkepGkzmcbczI+OxkGoZtNU=;
        b=iEnNfBP6KqEGoNxccwK0IqQpj1FDXrEQa1q7T2DLaD5xO4wHZwRTG/rG2ghrHzOpar
         R7AXTYF4s5d7Wst7c/6PwFj0PHPtBmkfrNZ+Bbn+GRdjRhxafDNiz0FGOyYsILhP7+on
         yDQ4h/TECDB5bs+mGw41AxPiRxoZdM0remU0KwnkfXilchWWXtx+/fFeaXYQmYOlDZJv
         PLFMA6p/Ivre+mG2S3zt+ppkKqS5hRax/qQZe2m6NzZe/Wa5sQKVrF6gZTBcafhO2FVK
         0WjKwl7ev6O7CN3ogDxgIQgjM//gTiUzWBZHB8V+hkn2r93cpyxTfjMspdVaRxIMGFJB
         HaJg==
X-Gm-Message-State: AOJu0YzAbsOpeWgRMgKw4dzMP29FAbsxBMjV1as33QUtskgfSU6jOaWJ
	g5KEfTlTftyLQOr3Z9lYgqnknV8yK6PymFDDfMAZrKDat6JRLfBd5PGXjPe9mSmQZ20MSf/Nq+Q
	NPxf96bevHAb4vCOWQuD6fdKYjVxJ26O1
X-Google-Smtp-Source: AGHT+IFJHaED2EqjK3Ctev205W1RZdIwmcLTm4iDghDp7lXTOhxAM3FKhqtDF+pe2uLPk9tBveevEAGAcNt0waaCE4A=
X-Received: by 2002:a05:6512:558:b0:50e:44a5:57b0 with SMTP id
 h24-20020a056512055800b0050e44a557b0mr2376055lfl.121.1706003095556; Tue, 23
 Jan 2024 01:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20240123090613.656612-1-pavel@zhukoff.net>
In-Reply-To: <20240123090613.656612-1-pavel@zhukoff.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jan 2024 10:44:43 +0100
Message-ID: <CANNYZj_DnCrjmLu-kXTB4zoFk5cB6rJMtzK+sSP+hzhND5afcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mdadm: Disable ptests
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 09:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194224

I think it needs to be removed from PTESTS_SLOW at the same time?

Alex

On Tue, 23 Jan 2024 at 10:06, Pavel Zhukov <pavel@zhukoff.net> wrote:
>
> As agreed upon in the bug triage meeting, disable mdadm ptest for the time being
>
> Related: [Yocto #15181] [Yocto #15159] [Yocto #15308] [Yocto #15309]
>
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index ef6f471e7b..7f949a467c 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -135,6 +135,7 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
>  #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
>  #    libinput \ # Tests need an unloaded system to be reliable
>  #    libpam \ # Needs pam DISTRO_FEATURE
> +#    mdadm \ # tests are flaky in AB.
>  #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
>  #    libseccomp \ #  tests failed: 38; add to slow tests once addressed
>  #    python3-numpy \ # requires even more RAM and (possibly) disk space; multiple failures
> @@ -147,6 +148,7 @@ PTESTS_PROBLEMS = "\
>      libinput \
>      libpam \
>      libseccomp \
> +    mdadm \
>      numactl \
>      python3-license-expression \
>      python3-numpy \
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194218): https://lists.openembedded.org/g/openembedded-core/message/194218
> Mute This Topic: https://lists.openembedded.org/mt/103906271/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

