Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA25C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:49 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.84507.1657028264764156269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AE2VIqrZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id k14so13636146qtm.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5EkQYE0ADZ1r+la3seCPQPsvfEHVzllzPo+7CGAm7h8=;
        b=AE2VIqrZD0LB1QGzTkY/mo9wR5DyexMD+Uq8vudmIq+11mahSn0Ss40SCfIEqPKPDS
         Yym4JSv1gP7IFn+fNqrB+6w/TXafIU24SmbwDpR3LZ3DmQreCnzOt9inSvKk5QmJhORn
         9mi7DKSKaucZomcwMaohGlbXOFTcfFwmW8z8p8h22YPVrK4uuwJNhOUpArhIbYqdBqFO
         x+jnr+fqZL6J/A0jJxQEvpik2HlzMq3j05xpNe1R3BUop82NoGA91ns93ence/uDZu3L
         rW6vqnNYc+B/gpW59u1awdNa6Bpii72bTEjvrYTro7VYf2IaVSxQNPO/kEq2Qq0p8bMI
         FmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5EkQYE0ADZ1r+la3seCPQPsvfEHVzllzPo+7CGAm7h8=;
        b=EJQKiX41inhseXhoqveuCoZJPssP38rz6JB//ka515isX3AZRjX9FIaQnRh3IuHA4l
         b0zJShhrd+3iEOL/7uzpsHmHmbuT9HUNcKyqDbKe6RUcsGyobrnGjlTWfcIiOLOToZ07
         H7IhY4HExQEmHtGfCJCOdjQmBGJEo0HTf9V38Dt8Juhe4wi3j3uyJbwBP+71FtAwOm1B
         5notmFTnmiTBQ9QTUZJjV8xpDDmBqfq+D3CHw7X6VBx0Nwtcv1TPwGwJlKQCj1dWqmoZ
         JYcLIkloWS9TBcjuswPlMZXOV1ryTdLZ+mgK0v/YuVvjiULfLN8SjMYTayfXle3i+rEG
         tCAQ==
X-Gm-Message-State: AJIora98mm4qLvlHlG9KNpo5SSF8SGy6sOUNuCN5E+Jjk7CTP/QQaAdK
	blDIqC+VQbGuLDJlcXapACJq09p7ntSN8w==
X-Google-Smtp-Source: 
 AGRyM1vzyZ9myMRdjOZPNPFDG0tOYgIgCTUezo6xBkcntcUVuVY34ysiEM5yMx2kBGYtsuNZzq/Kag==
X-Received: by 2002:ad4:594b:0:b0:470:852e:2efd with SMTP id
 eo11-20020ad4594b000000b00470852e2efdmr31488210qvb.115.1657028263779;
        Tue, 05 Jul 2022 06:37:43 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:959d:d09a:db6c:637c?
 ([2607:fea8:95df:9730:959d:d09a:db6c:637c])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a05620a410400b006a6278a2b31sm17063442qko.75.2022.07.05.06.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:37:43 -0700 (PDT)
Message-ID: <ee8e898d-893d-c1fb-2e99-f14d3199fe42@gmail.com>
Date: Tue, 5 Jul 2022 09:37:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [OE-core] [kirkstone] Binutils : Binutils-2.38 Stable release
 updated with latest commits
Content-Language: en-US
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
 shivams@gmail.com
References: <20220705035905.163902-1-sundeep.kokkonda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220705035905.163902-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 13:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167653

this is ok.

On 7/4/22 11:59 PM, Sundeep KOKKONDA wrote:
> Below commits on Binutils-2.38 development branch are updated.
>
> binutils:
> eed56ee299b Automatic date update in version.in
> 8e001ed8f2c Automatic date update in version.in
> 6b2a26c63ba Automatic date update in version.in
> f0b5a0b5687 Automatic date update in version.in
> 5cc2bdc75bf Automatic date update in version.in
> a06ed65fce8 Automatic date update in version.in
> 164daf3d644 Automatic date update in version.in
> 8b1dda80a5d Automatic date update in version.in
> a4577d4f18f Automatic date update in version.in
> 614000f9d7b Automatic date update in version.in
> ebd859d2cc4 Automatic date update in version.in
> d2823f8c27c Automatic date update in version.in
> 949c11728ca Automatic date update in version.in
> fe36d34f258 Automatic date update in version.in
> 0dae8bed68e Automatic date update in version.in
> 884e81eeb2c Automatic date update in version.in
> d61f79dc474 Automatic date update in version.in
> c86fbb1d885 Automatic date update in version.in
> 724f6468fb1 Automatic date update in version.in
> aef4bdb2ed5 Automatic date update in version.in
> db802012a3e Automatic date update in version.in
> b28a1fd5055 Automatic date update in version.in
> e1ea1dafff6 x86: Properly handle IFUNC function pointer reference
> e35ea91a86c Automatic date update in version.in
> 1d81266d92e Automatic date update in version.in
> b0530a6f3dc Automatic date update in version.in
> 81d275cb83f Automatic date update in version.in
> 794474ead0b Automatic date update in version.in
> 220b941f1e0 Automatic date update in version.in
> 912f2e4449d Automatic date update in version.in
> 93054037f1e Automatic date update in version.in
> bc8ba34fc24 Automatic date update in version.in
> af58abfd800 Automatic date update in version.in
> d200cde62c8 Automatic date update in version.in
> 31fd6cd3d76 Automatic date update in version.in
> 475549dc3ac Automatic date update in version.in
> ffc7aa903b9 AArch64: Enable FP16 by default for Armv9-A.
> f20245c35f2 Automatic date update in version.in
> 39c6088537b Automatic date update in version.in
> 6a8f2255438 Automatic date update in version.in
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>   meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
> index dc0a2a4054..c2502e0901 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>   
> -SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
> +SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
>   BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
>   SRC_URI = "\
>        ${BINUTILS_GIT_URI} \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167634): https://lists.openembedded.org/g/openembedded-core/message/167634
> Mute This Topic: https://lists.openembedded.org/mt/92179043/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

