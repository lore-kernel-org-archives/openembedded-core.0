Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA4DC433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 11:19:41 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.5264.1648552780673614798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 04:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LHuBGkFa;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: festevam@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id g20so20294066edw.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uygd4Y21vFPgFtGjF66QK3tzxXRqwd+Noy3a22cMjxg=;
        b=LHuBGkFabiQuSIu8pIp3+M1/WgpKMjruvF/Mbjtl+Pe+DdhIJ2IJk97RtywrZ3rVXh
         wg6SBGT8cwkcFY/mlbIsxDCbAV5M1Ho/3UkuBNGIb4hMe02ZY+mUXr2afJ99mlzbxWjy
         yV6RQ1k4cDPvvh6g1hp/JFCKyKt1HjzPERcKpRA4p9ozaU3p78LEM+J3qJlxyw4XN5oF
         ANftue55UKiVhteJ77Y3812V7laVh6eQKXFcIKEX3+639gz0r3extL/DtL5CsGl+nacf
         qYTf9lcZ3U+YlwdvSs7kMj8T0SJgxIDUTziHi1nYUP+j8ejJStBSllxIls4/30+KVQwm
         RQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uygd4Y21vFPgFtGjF66QK3tzxXRqwd+Noy3a22cMjxg=;
        b=wfEOPv8gOmdsDvymDyIONyWLPV9AdoS0zG0VyfKwzeylu30gRorJkBedjw6nswPr+z
         FlCYWXZABUIfEYCSZeBE56Q0YOUxCU/5hbILvNUagwBWih5SWu9rpDkpBbdjTtrmKeGB
         o3pYqYPO9MHmj4j3djFrZ3RUvVuUNgPpCdJ2+ADAXBbgnNaF9Ao3qOCNezIrWF+5QiVz
         Obb/s1EAxInSCxzmxx2hn9qjNKRVGeOBl6YDNk6W5upSUrAoqjg/AYcNlcwU6Xhzn8Hj
         uNcnxbEmlHOELRl7djwGD6gzxLsvQwnWeN2wV7/Jgq2nUUMyGlfAnJK5gdzlvm7lHPtP
         +ZhA==
X-Gm-Message-State: AOAM532f9zOKYQcNajjN9dkVpry14bxRGqxg490j3Ap71sLEmEYk62bv
	XWPT2YuWD1gTTpDarAgaoyTLH0I+nyTLN7ZWXMw=
X-Google-Smtp-Source: 
 ABdhPJyld05IdK+yUkoCHMPnFFv+zBo1LS4CBuZFHgbSxksJDfWKmSgYSfIIWQC3uJU9ZOs6wFIOjHs9Ui/9GS25Xr8=
X-Received: by 2002:a50:9d0f:0:b0:416:95a3:1611 with SMTP id
 v15-20020a509d0f000000b0041695a31611mr3875658ede.77.1648552779054; Tue, 29
 Mar 2022 04:19:39 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWRay+5Xqz+RO_EX1-Yr2Ef_uXcLUL7dZE45d6wBga4mzA@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWRay+5Xqz+RO_EX1-Yr2Ef_uXcLUL7dZE45d6wBga4mzA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Mar 2022 08:19:26 -0300
Message-ID: 
 <CAOMZO5ANFhewyN4TB7bXacipdOmAabz422nx5AhHrBrY87w1oQ@mail.gmail.com>
Subject: Re: [OE-core] Which vendors maintain SDIO WiFi in mainline stable
 kernel
To: JH <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	linux-wireless <linux-wireless@kernel.org>,
	oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 11:19:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163744

Hi Jupiter,

On Tue, Mar 29, 2022 at 3:16 AM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> I could not understand why so many large WiFi chip vendors retreat to
> stop maintaining WiFi SDIO chips to mainline Linux kernel, and to
> settle it's chip support to out of the tree, use its own SDK and
> proprietary kernel tree to source.codeaurora.org or private repository
> which are not compatible to mainline stable kernel, the kernel
> configures are also different.
>
> I looked at the following link, the mwifiex and mwifiex_sdio support
> the Marvell (NXP) 88W88 chipset, but only kernel 4.19 was able to
> build and to run, kernel 5 cannot support 88W88 chipset, any more.
> Same to Qualcomm, the old Atheros WiFi modules are supported, the
> QCA-9377-3 chipset is in source.codeaurora.org only supported by old
> kernel 4.9.

The QCA9377 is well supported in the mainline kernel by the ath10k driver:
drivers/net/wireless/ath/ath10k/

Just use 5.10 or 5.15 stable tree and there will be no need to use an
out-of-tree driver for QCA9377.

