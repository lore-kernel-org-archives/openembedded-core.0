Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579A2C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 16:09:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.1121.1632499765831141207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 09:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SlkwBcdi;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s11so10259466pgr.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=lIi6KwnxaQujt15CVQhz76HVYkrrxPF1zK1XyDISrtM=;
        b=SlkwBcdibF0q9dO3pZiuP10TxnpsPq7+5qH2OzTa6M9vpl3Iw+OGnKJ4/4+PASoVNN
         Jz+ud1i8TE0A2ZpFJQtEyLRNnfg21630kZMcdPy5fNNYPOv+haXD2MaGGGy4y6vYBvSG
         DCBvAn90K1IqHF9xWjPOZrYnNZmW+fnx9vRS3272Mg8WlbnTNlGjN6m2upAnXRxN57ai
         X+4joZZ63ruWniMlGD9BxPiS8w2DCkDFVElCHe9cPPsT4dY0y5v9xXQsZ6PMY3uxOSlT
         x/AK2ZkyXZwj0j2kO5GoyRHyzg3cb0bEd2RokNW51vlBv/bVlT+VcXD3vie5joL1141l
         Q1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=lIi6KwnxaQujt15CVQhz76HVYkrrxPF1zK1XyDISrtM=;
        b=bCST6LKWMurzaOetkMXpe0cn0aw/p9PHtgoGSoPY3acSm74GcIOUYTHdMLlczMtpir
         00y1P39BrPeAMaY50ECuCEuJbXfHDlxffPlUSfJiyI9NcT3mSmVs1dCTk213hq5Yw6Yz
         gGgutPfTkzXmAdMtu7zend65lDaUGgXUWPYHj+E/3l05zT9QagAT1tXZUxI+Ff1NEJyR
         mnLKUs2B0WYMGPNDImwrHDjBCwpvwAUWhN3BWq3on9tXCZ2iwc5WVczlmoArtXuBnoUN
         Y0EmlQgUCPskmxjGc61G5iGSD4hfoCsayTH4f/fUnWuHQeBE6RxJMgF5vhmaHy4YuZez
         UsIw==
X-Gm-Message-State: AOAM532ZBDSeCXPH5FcS0yJzJoEnaMuDN/4EDehK/N1ZyNmQ9O8sn3yZ
	ajV/vMNjiuBRF5+7Lh4Pnuw=
X-Google-Smtp-Source: 
 ABdhPJx73VBYt5qOJ1YkVG8NZ2NQyBIcVkZ3VAvmfLsaPK5PTZPVPkW9UsEqm7I+fBpsIpaqefnjzA==
X-Received: by 2002:aa7:991b:0:b0:447:bf92:b94d with SMTP id
 z27-20020aa7991b000000b00447bf92b94dmr10600840pff.76.1632499765040;
        Fri, 24 Sep 2021 09:09:25 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:1dda:37cf:b1d6:5d51?
 ([2601:646:9200:a0f0:1dda:37cf:b1d6:5d51])
        by smtp.gmail.com with ESMTPSA id
 x8sm2419674pjf.43.2021.09.24.09.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 09:09:24 -0700 (PDT)
Message-ID: <7a4ef3ac-72bd-2f96-d651-c4abe17b5af5@gmail.com>
Date: Fri, 24 Sep 2021 09:09:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [PATCH V2] archiver: Configurable tarball compression
Content-Language: en-US
To: Ian Ray <ian.ray@ge.com>, openembedded-core@lists.openembedded.org
References: <20210920102512.9358-1-ian.ray@ge.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210920102512.9358-1-ian.ray@ge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 16:09:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156331



On 9/20/21 3:25 AM, Ian Ray wrote:
> In order to be more efficient, we use xz as compression method
> to create GPL sources archives.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
> [V1 was https://patchwork.openembedded.org/patch/155985/]
> [Rebased]

xz has its own mind when it comes to parallel threads, how do we control 
that here? Does it use the global setting to control the number of xz 
threads ?

> Signed-off-by: Ian Ray <ian.ray@ge.com>
> ---
>   meta/classes/archiver.bbclass | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index dd31dc0..411d459 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -51,6 +51,7 @@ ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
>   ARCHIVER_MODE[dumpdata] ?= "0"
>   ARCHIVER_MODE[recipe] ?= "0"
>   ARCHIVER_MODE[mirror] ?= "split"
> +ARCHIVER_MODE[compression] ?= "gz"
>   
>   DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
>   ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
> @@ -409,15 +410,16 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
>       # that we archive the actual directory and not just the link.
>       srcdir = os.path.realpath(srcdir)
>   
> +    compression_method = d.getVarFlag('ARCHIVER_MODE', 'compression')
>       bb.utils.mkdirhier(ar_outdir)
>       if suffix:
> -        filename = '%s-%s.tar.gz' % (d.getVar('PF'), suffix)
> +        filename = '%s-%s.tar.%s' % (d.getVar('PF'), suffix, compression_method)
>       else:
> -        filename = '%s.tar.gz' % d.getVar('PF')
> +        filename = '%s.tar.%s' % (d.getVar('PF'), compression_method)
>       tarname = os.path.join(ar_outdir, filename)
>   
>       bb.note('Creating %s' % tarname)
> -    tar = tarfile.open(tarname, 'w:gz')
> +    tar = tarfile.open(tarname, 'w:%s' % compression_method)
>       tar.add(srcdir, arcname=os.path.basename(srcdir), filter=exclude_useless_paths)
>       tar.close()
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156329): https://lists.openembedded.org/g/openembedded-core/message/156329
> Mute This Topic: https://lists.openembedded.org/mt/85841980/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

