Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1179C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 03:03:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.6779.1635303779516962816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 20:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q2PGEePk;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id l203so1384750pfd.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 20:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=t7MMKo0aL7uVROzMDGVQQ8yU7Oci246VHLFpNNlcDoM=;
        b=q2PGEePkiBTksJGu/aDbbKOIrZbzU94E9E68kdrPVgbDeHFfIRhkpcRE8tGpAFvSAH
         qYbgsDpqm1Z/DHFHiG1n0wGqtLQqIZnof65dQCln7frqwcjVgf4KFc1vYbMg2X1IECiR
         rqjMnBdWAHOdtkZbUfnDF+Syo9CZGePviZtY7Fi3FtWNN28EnMxq+yG1nZFOSNVgpdbx
         vTwSWAn5fVRwMTUjzY6HunEFo/0k7m+kL8wxV/7Q+LAptD5TxDpPbpnatH9uj1LRXPSk
         mFqRtSZPk1h+fozMET7x5U6aZ9GwdA4zHTJj7lrFR9DgU2Cbla3UZG8PCVRFp4GJAWXF
         6MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=t7MMKo0aL7uVROzMDGVQQ8yU7Oci246VHLFpNNlcDoM=;
        b=Wfw1OP+C3mRLZvh5HC9srRjmfdR6ThEPL5J7umDs1aZ39F2FnViElb1s4g6SityaR9
         UdImpMCrHHlfehZF8BRVPvKS5ZMqi8VVSFEDpXDLus8jJpgkvbQKola2Jt4mkOwiFvPp
         I++VmpjHbJf6K2oIJmD2b+YDNiHNVrJIPocdaw+mMZHsx28t6CJ+d2q2jy8hzqn2xn57
         lOCp+TeILn1vnjRCoUd0RLQawdgUkviGdzRyXDkncBA5PGdrwvlP4X8fy3mivEyjcSDG
         PuTh5Ulj28nOVqDGbOhiflIHPPXtRjgFeN+IzTxgO6ObneVsMAYjE4N4aXnu5wqw71wd
         6kTg==
X-Gm-Message-State: AOAM531yn43Pfv7KqI4aWf3tn3ce8ZW68XDKvhbnn1jgJ+QTmG7WDrHN
	05ZwGT6pbG+3t03jkUuXyYw=
X-Google-Smtp-Source: 
 ABdhPJwmsgTDotE84NheeWykM0XacBIgtEtecrpvU0S44V3CXoM2jSPiVSUut6CUhmKz8/Nv1diksg==
X-Received: by 2002:a63:b706:: with SMTP id t6mr21981107pgf.11.1635303778671;
        Tue, 26 Oct 2021 20:02:58 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::f3c? ([2601:646:9200:a0f0::f3c])
        by smtp.gmail.com with ESMTPSA id
 b8sm23332705pfi.103.2021.10.26.20.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 20:02:58 -0700 (PDT)
Message-ID: <c85f01e3-effb-1b57-2f40-3bf579417b42@gmail.com>
Date: Tue, 26 Oct 2021 20:02:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [OE-core] [PATCH] go.bbclass: Allow adding parameters to go
 ldflags
Content-Language: en-US
To: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>,
 openembedded-core@lists.openembedded.org
References: <20211026185642.13747-1-Ahmed.Hossam@opensynergy.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211026185642.13747-1-Ahmed.Hossam@opensynergy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 03:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157473

looks fine

On 10/26/21 11:56, Ahmed Hossam wrote:
> Currently, there is no clean way to pass extra parameters to the go tool link,
> which is passed by the go build ldflags flag, the append needs to happen inside
> the quotes of the ldflags parameter
> 
> See [YOCTO #14554].
> 
> Add a variable to allow adding extra parameters to -ldflags in the GO_LDFLAGS
> variable, one of the main usecases is setting the application version.
> 
> For example, adding to the recipe something like
> GO_EXTRA_LDFLAGS="-X main.Version=v1.0.0"
> or
> GO_EXTRA_LDFLAGS="-X main.Version=${PV}"
> 
> Signed-off-by: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
> ---
>   meta/classes/go.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 0dd0c5f1d2..aa54b4a08c 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -41,7 +41,8 @@ GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS
>   GO_LINKMODE ?= ""
>   GO_LINKMODE:class-nativesdk = "--linkmode=external"
>   GO_LINKMODE:class-native = "--linkmode=external"
> -GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
> +GO_EXTRA_LDFLAGS ?= ""
> +GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
>   export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
>   export GOPATH_OMIT_IN_ACTIONID ?= "1"
>   export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
> --
> 2.33.1
> 
> 
> Please mind our privacy notice<https://www.opensynergy.com/datenschutzerklaerung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-general-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.opensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaeftspartner-gem-art-13-dsgvo/>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157449): https://lists.openembedded.org/g/openembedded-core/message/157449
> Mute This Topic: https://lists.openembedded.org/mt/86610860/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

