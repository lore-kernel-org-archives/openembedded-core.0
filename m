Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD32C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 17:50:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.10557.1642182633310609188
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c22cthyD;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id o12so15932314lfu.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eZHH/OK5dV+Ah7ZuvlGrvJTNZ7hWsgOdqQJBB1QFHEk=;
        b=c22cthyD9DsZ4RGADTXmwixda2TzMSoTgLLsPnUoqKfVrNAPjHopyaBOwBDcJyKSJJ
         tqYvgzURzzkY/s924XpZpCrtqOOxllqI8Vj2xpNLG3EbWxx8Q8LEfmm0e1C5u0qnQcyc
         dsRZ3UO3piRVzjcHk3TJUbjqSuwy0RqH3GvzbJNm7VYbLorYQ2uNrX3pcBiU4XRlUAVC
         iHOj2MBf7BlL1jOiOsArtEXBdqz0W/iPvo+3m+Q62UX/2PK9Esy49ItLRSH03nCXMr8A
         SGZPjBetmsqNsL78Ewh4EZANtFAO7u42ROdwn6ovNE7AY3JZcacLGVMeyf3lUeob9qrI
         mqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eZHH/OK5dV+Ah7ZuvlGrvJTNZ7hWsgOdqQJBB1QFHEk=;
        b=hPptRNvOnSu+2H6erSzt6FK6VeWecaEbhEv7F+2GOdV8Uu22TxXhJsVoHH/DirwUsG
         f4HKiN7HFKmFbiDLLuP6hOG4uZcCEnnXIAiQZFEby6++F6ExsjmEUpjFEK7hZw9IJw+z
         iqowg4dFMathjuaPj/hjb22MnFC3pzIHK5syTpL2V84sL2G/xtIdHD2PkqXGQ3oyu+RF
         FjVL/NnRJgIsI4VTAIC5f6fEiaW+3gu66SdAr9rU/oXLkZg93u7IIvRfmxlhSa8EyQlG
         JpX5vKlwsHnEAIohEKhQaCOC/OZdJiVwlj9ri4Eer46W7/dKYP00mhpjHqmyS9LirQMm
         pxEA==
X-Gm-Message-State: AOAM533bFS7gBfG76r7e8H1LEx+AyTIfejh1tvCbXNmy3o0V3K2/QE+G
	DFKkuyZw4nnBxtAQmPUoVJU=
X-Google-Smtp-Source: 
 ABdhPJxMUePMmHVlxT6UMVV2+sB27oWxFKbDc2jAxAGurqMtAJ0WP7xWboyCVYRMi6fXo8S8i0rCtg==
X-Received: by 2002:a19:f001:: with SMTP id p1mr7478566lfc.465.1642182631419;
        Fri, 14 Jan 2022 09:50:31 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 l5sm192996ljc.103.2022.01.14.09.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 09:50:30 -0800 (PST)
Message-ID: <86120c6d-a092-432c-a0fe-26ca5c57792c@gmail.com>
Date: Fri, 14 Jan 2022 18:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core][RFC] classes/native: Propagate dependencies to outhash
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
References: <20220114171222.1788462-1-JPEWhacker@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220114171222.1788462-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 17:50:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160573

On 1/14/22 18:12, Joshua Watt wrote:
> Native task outputs are directly run on the target (host) system after

"target" or "host" ? the latter i suppose

> being built. Even if the output of a native recipe doesn't change, a
> change in one of its dependencies may cause a change in the output it
> generates (e.g. rpm output depends on the output of its dependent zstd
> library).
> 
> This can cause poor interactions with hash equivalence, since this
> recipes output-changing dependency is "hidden" and downstream task only
> see that this recipe has the same outhash and therefore is equivalent.
> This can result in different output in different cases.
> 
> To resolve this, unhide the output-changing dependency by adding it's
> unihash to this tasks outhash calculation. Unfortunately, don't know
> specifically know which dependencies are output-changing, so we have to
> add all of them.
> 

"don't know specifically know which.."

> [YOCTO #14685]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/native.bbclass | 31 +++++++++++++++++++++++++++++++
>  meta/lib/oe/sstatesig.py    | 10 +++++++---
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index 76a599bc15..fc7422c5d7 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -195,3 +195,34 @@ USE_NLS = "no"
>  
>  RECIPERDEPTASK = "do_populate_sysroot"
>  do_populate_sysroot[rdeptask] = "${RECIPERDEPTASK}"
> +
> +#
> +# Native task outputs are directly run on the target (host) system after being

see above

> +# built. Even if the output of this recipe doesn't change, a change in one of
> +# its dependencies may cause a change in the output it generates (e.g. rpm
> +# output depends on the output of its dependent zstd library).
> +#
> +# This can cause poor interactions with hash equivalence, since this recipes
> +# output-changing dependency is "hidden" and downstream task only see that this
> +# recipe has the same outhash and therefore is equivalent. This can result in
> +# different output in different cases.
> +#
> +# To resolve this, unhide the output-changing dependency by adding its unihash
> +# to this tasks outhash calculation. Unfortunately, don't know specifically
> +# know which dependencies are output-changing, so we have to add all of them.
> +#

see above

> +python native_add_do_populate_sysroot_deps () {
> +    current_task = "do_" + d.getVar("BB_CURRENTTASK")
> +    if current_task != "do_populate_sysroot":
> +        return
> +
> +    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
> +    pn = d.getVar("PN")
> +    deps = {
> +        dep[0]:dep[6] for dep in taskdepdata.values() if
> +            dep[1] == current_task and dep[0] != pn
> +    }
> +
> +    d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
> +}
> +SSTATECREATEFUNCS += "native_add_do_populate_sysroot_deps"
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 038404e377..abcd96231e 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -491,7 +491,8 @@ def OEOuthashBasic(path, sigfile, task, d):
>      if task == "package":
>          include_timestamps = True
>          include_root = False
> -    extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
> +    hash_version = d.getVar('HASHEQUIV_HASH_VERSION')
> +    extra_sigdata = d.getVar("HASHEQUIV_EXTRA_SIGDATA")
>  
>      filemaps = {}
>      for m in (d.getVar('SSTATE_HASHEQUIV_FILEMAP') or '').split():
> @@ -506,8 +507,11 @@ def OEOuthashBasic(path, sigfile, task, d):
>          basepath = os.path.normpath(path)
>  
>          update_hash("OEOuthashBasic\n")
> -        if extra_content:
> -            update_hash(extra_content + "\n")
> +        if hash_version:
> +            update_hash(hash_version + "\n")
> +
> +        if extra_sigdata:
> +            update_hash(extra_sigdata + "\n")
>  
>          # It is only currently useful to get equivalent hashes for things that
>          # can be restored from sstate. Since the sstate object is named using
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160571): https://lists.openembedded.org/g/openembedded-core/message/160571
> Mute This Topic: https://lists.openembedded.org/mt/88425608/4454410
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jacob.kroon@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Sounds to me like something we should do.

Jacob

