Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFC8C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:05:43 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.7808.1666793140428244590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 07:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=r7b/UHs/;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id y12so21380899edc.9
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4S+OpO5ZtSCeNJAb1F8Xq8eSmoQkTvCO7v7DQTNqGSo=;
        b=r7b/UHs/HQSyS9kHJU7ojACDYt+axlFUnSoxvgpNai2wcqOoWu3x2GrFqFmu9jkygb
         JGW0NsV7e+2VDJRwcWac4Tr8SIdm7+DXtdjyMTB3qcteL5MO9uXw1u5tdqMWMVrUmc1a
         aGrEtUuOyLapXHVr7zX4UGBE28dvjOJm1UcBkt9OCPbUKgpqkUQVmqqNYnqg5hbBTm1T
         eTtwl5dePcmRCsAric2+uVX6BSU2GeTG6ZD6gbigML9p2DlN9PmNlUHmEb5nXBm2jz6a
         wWxYCVHOdJQayfZT2AaicgVNGPwl4m/dDaBjUUqDa68k/85nyOelSYaP5kNr73tqUtSp
         ywBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4S+OpO5ZtSCeNJAb1F8Xq8eSmoQkTvCO7v7DQTNqGSo=;
        b=yPPnaztX3rz1ThSlhBm+KETIjGyCiC3dBg5Dbi91xduigyrwPTHdk3SWYGPDP81lnx
         xpGUeoBDwV6Es8MCQviSx8xzrlJ3g4bKAtw/HAdoXVDGwWP/1pIb5YkPeMmL2HHNpjd3
         dggVSOZExK66iC6FCtr2iOnlEMAR0hFVbehySf0Yq+bjeiX5eRd4kR3Hlg9NHdxsO2v4
         pFBOZw2N3fG6eEvnnq/E9iqntXWIbjvZfJ4d+hExVIDNQvPlyX6nO4XG8XK0naAUUFif
         ezZkhzeVuDRTSV9TekvZqDJ+wuCyjlQBmPeU5NJmkEqd5sryT5mx/tW1xUqF5e7Ab1E7
         CbUA==
X-Gm-Message-State: ACrzQf0h04Ysg2pi+qmb8XzYaAEPhq7+TRDzSOm8inszTKvG8fEyV3w4
	v87FdRBA4XWpRpIMVglvtBx4DGRxzY6yC9Ym0BldQw==
X-Google-Smtp-Source: AMsMyM7xZQkplgqcbXKOfaTMgAtUUNhgeIPVDaqOpUAPJqFN6mzBQpVPXHW97/SXq//w3akHcume7zDUA5TNMvG9K90=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr40311339edp.311.1666793138516; Wed, 26
 Oct 2022 07:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <5dd15cbcb294c6907e11461eb8080e0238ec306e.camel@siemens.com>
In-Reply-To: <5dd15cbcb294c6907e11461eb8080e0238ec306e.camel@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Oct 2022 04:05:26 -1000
Message-ID: <CAOSpxdaDbBn-UURqoiBX9=SyT=3cwm=FjWPWXcxyWJecTaSfiw@mail.gmail.com>
Subject: Re: eSDK cherry-picks
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ross.burton@arm.com" <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 14:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172156

Hi Andrej,

It is a bit late to get them in for the 4.0.5 build scheduled for
Monday, but I will take them immediately afterwards.

Thanks!

Steve

On Tue, Oct 25, 2022 at 10:13 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
>
> Hello Steve,
>
> Would it be possible to include these commits
> https://git.yoctoproject.org/poky/commit/?id=4fd15f4e3ad50ba1830b20a5e339d75ebb74a4ce
>  https://git.yoctoproject.org/poky/commit/?id=7e4b96e911f6b308aa1c970db37881d62ddefcac
> into
> kirkstone branch?
>
> I guess, some older branches are affected too. The dunfell branch is
> safe.
>
> Thanks,
> Andrej

