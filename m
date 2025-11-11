Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5AECCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 10:39:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14677.1762857595318606046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 02:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCqw6WFA;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88043139c35so40877806d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 02:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762857594; x=1763462394; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ixhoivFwKIdAYTHyZK0Zy2L1Gg02weKXWhpOw0JEO6c=;
        b=YCqw6WFASPf9qcGA+wx3FZH7cSA29yduUMLBVltCRz+YzPrwBNxV7OWGXBFTAE1DbG
         t4GFUyuUYzvCMEw8LZXIIzzk5778MM5r4YB+lYDKcL2JrKyc+RneMfzdwOXsblueOS6O
         JtSUBEslOAIk7MCvZ00rkLzjPtf404D7rY0Jeak5+fOPKY50d6TryXqkPSG1ffPIktYE
         hNAoZ7b/Ua+KAVDshzfq7Hqrw6ntvs5/e/9wWYnbQ6sp/e/Oagg2bLlM7yaggfyfCREt
         N0o+dfn8ldcgcDAfHJqyiYd0FIyZZDBWfiIuPl+3pfDDdTeRYiMq5aMyi2t6I44h4CVP
         +9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857594; x=1763462394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixhoivFwKIdAYTHyZK0Zy2L1Gg02weKXWhpOw0JEO6c=;
        b=oYN6qVwgn38pfhC35gPHf3uMTKLmudun6Uq+ac7Sk2YHTIAjjCGqOgTBYhUPEiAloJ
         DaXNT/KlbF+aZXRCThqEue/3uHg0OwZKsr46AiQPYYWaEHji/ldBgAqvXmwXybyO0qOl
         Jyfp1mBBKtJYXdNr5ZK6250yACtazoH9oJzEl5pa8zPeWgw+BFfqCXIFFhCC84bivpiL
         47Ijse2r6vbrrrb1jySatwPCMgtrf1SDyXVedaVvVbRGqxi8fOQIC/Ri+CHZ7IUNpKSw
         jT8jiKVzGkVpGFIVeKMutkFn0E8Y3lhgNCDZUB9pRLRik0P8acvDiFUwcfhPKXYhyNFz
         QHiA==
X-Gm-Message-State: AOJu0YwivUKi6KTWT57EWQCLdme/9Go6AWrSGASJ0abDrMZn2fssjpqN
	S270OI41PZUVM36RtmLQlAveNVkSOC8RoQXEKksQb1zDtygLytYLNHhJEf5PcO6KgxSDUunSxyP
	UHSWHYlnNmLrNb4V0i4ag9NQ6YtgRsXI=
X-Gm-Gg: ASbGncuyCkz4nYlQNX5bIMO66MidYGfAScQIRmvL/Oh7R6/Lh8Ei6XILSUqab62PcUw
	SgOu+BKTgGk43RA4pjjp+InZFizU9M5VgjMoo6j8H693GsUPtVxvcclUmCqE9h58NbMUY05nigv
	6Q56F8i8CpThimtT/zbm2085J/e9k1i8mcVvXjqJX790Hv4C1sozOPjd/rU86PS4S9yslX+vNgF
	YsGwJvR01lP8DpSqR6ZsBl8BWFJTk9cn31JaFzmsD9/MEn7jhum49jZk8gIEKLWbwTz2hcFDQ==
X-Google-Smtp-Source: AGHT+IGQKuLw2DERDcHKOSwEnElAmvIeCMbZytWau0rbD90Xo1ineSdbmJGWapAwdZzbRF3LFYe3BrfH0aJyR+qnlFw=
X-Received: by 2002:ad4:5bce:0:b0:87c:765:dc6 with SMTP id 6a1803df08f44-882385a5956mr146361786d6.8.1762857594277;
 Tue, 11 Nov 2025 02:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20251111052244.3228403-1-vudupa@qti.qualcomm.com>
In-Reply-To: <20251111052244.3228403-1-vudupa@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Nov 2025 11:39:42 +0100
X-Gm-Features: AWmQ_bnMCdKHZqeR-v2nyB3f6tl2v-vqBRF48VjzuwqyJImbhqoxLjI9svhM9g0
Message-ID: <CANNYZj_9kLM2ZAYAqY5RJupTfsZty8LbD0ys6mShWeAOMKkEoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] findutils: /var is populated by base-files, so
 no need to repack empty dir
To: vudupa@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 10:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226156

Is there some harm or an error that happens when it is packaged? This
needs an explanation of what the issue is and why is it not observed
in Yocto CI. How can it be seen?

Alex

On Tue, 11 Nov 2025 at 07:06, Vishwas Udupa via lists.openembedded.org
<vudupa=qti.qualcomm.com@lists.openembedded.org> wrote:
>
> findutils installs an empty /var/lib which is already created
> by base-files. It doesn't need to be packaged by findutils.
>
> Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
> ---
>  meta/recipes-extended/findutils/findutils_4.10.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> index 29ad6c7350..8d5c721522 100644
> --- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> @@ -15,6 +15,10 @@ EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
>  # need od from coreutils for -t option
>  RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
>
> +do_install:append() {
> +       rm -rf ${D}${localstatedir}
> +}
> +
>  do_install_ptest:class-target() {
>         mkdir -p ${D}${PTEST_PATH}/tests/
>         cp ${S}/init.cfg ${D}${PTEST_PATH}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226147): https://lists.openembedded.org/g/openembedded-core/message/226147
> Mute This Topic: https://lists.openembedded.org/mt/116234660/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

