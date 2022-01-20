Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F700C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 13:38:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.11870.1642685906758552331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 05:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BfVvAZGM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so13826879wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 05:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tThGtA33XgBYYwqfn0J1Ej+ihxfoGqJpLioU7zTt4Rc=;
        b=BfVvAZGMrBQxxvnHhaS80yzyNJFOSIYmDQwHJkz9671zi0vifk/P2gqVBsO3S7Ed3R
         mDd4Fwn/DY2dW3Qo16JTK6HPja23NkRujDjDAwNi552FKCd4Hm+tHvp99YuZD/kGIUXV
         JUu+ugDBjauU3vgTBUeeGrJTNEBzrLupS0FUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tThGtA33XgBYYwqfn0J1Ej+ihxfoGqJpLioU7zTt4Rc=;
        b=zp2C9wn9uPRiJP8qPlR+gfvpTX9PRuthkO28e30cei4vO13mJGFhTwxCB4DRrkbpSd
         GzZjb1N+GupXcjpaa2pL2ceP+ZhltS/DNEDZjMJCIUTmA/gQIKLLIKWztF8uC+AOF9Re
         fxzU/l5m3h09Ayyx0sfp/q6773q8SVrM4jcxdO3l1gLlL7+S76aXKEq+edMNGdIzIcYc
         yEejvSd/MxUl6ejMbs7JjSJTljBQ1BPGdaDst5VTzBJaa62y/cjRRIy3JAo4wDgwi0vP
         n+t9IY5zN2GLNOWDPZK0mU1KZ4HxFsRw5jzF2J2FuJv8EUV9P2EsYxb6FTSN2ChEYBEN
         gC7w==
X-Gm-Message-State: AOAM531UU7z94uyhuomR77VzIgqsdeDOrpVypcQQ8PP2xMYtTvesbli5
	4yThwhVNgs49tSnvwXvFBJ6D4g==
X-Google-Smtp-Source: 
 ABdhPJzkC2pgcEgfqdGmF+Z5ePrSn4XHwBbrob9Cb+qLjBJXcaY9auohDOSvqJHFfuEQOtCsCV277w==
X-Received: by 2002:adf:e510:: with SMTP id j16mr3546422wrm.58.1642685905154;
        Thu, 20 Jan 2022 05:38:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0af:bf7a:53c3:3aa1?
 ([2001:8b0:aba:5f3c:c0af:bf7a:53c3:3aa1])
        by smtp.gmail.com with ESMTPSA id
 s9sm2653006wrr.84.2022.01.20.05.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:38:24 -0800 (PST)
Message-ID: 
 <c32a692ede9b0d10593a960056d7def198dee056.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to
 enable task network globally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Cc: jupiter.hce@gmail.com
Date: Thu, 20 Jan 2022 13:38:24 +0000
In-Reply-To: 
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
References: <cover.1642662353.git.liezhi.yang@windriver.com>
	 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 13:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160759

On Wed, 2022-01-19 at 23:09 -0800, Robert Yang wrote:
> The NIS or icecc can't work when task network is dissable, add BB_TASK_NETWORK
> to enable network globally for such exceptions.
> 
> Note, enable nscd on the build machine might be a solution, but that isn't
> reliable since it depends on whether the network function has been cached or
> not.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/icecc.bbclass |  2 ++
>  meta/conf/bitbake.conf     |  3 +++
>  meta/lib/oe/utils.py       | 15 +++++++++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 794e9930ad9..c39c86458a4 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -41,6 +41,8 @@ ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
>  
>  HOSTTOOLS_NONFATAL += "icecc patchelf"
>  
> +BB_TASK_NETWORK ? = "1"
> +

As Quentin mentions, I'd much rather this was done on the tasks using icecc
using the flag.


>  # This version can be incremented when changes are made to the environment that
>  # invalidate the version on the compile nodes. Changing it will cause a new
>  # environment to be created.
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fba99e8f0cd..bf5bcd55519 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -946,3 +946,6 @@ MULTILIB_VARIANTS ??= ""
>  # what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
>  # support unihashes.
>  BB_UNIHASH ?= "${BB_TASKHASH}"
> +
> +# Enable task network for remote user such as NIS.
> +BB_TASK_NETWORK ??= "${@['1', '0'][oe.utils.is_local_uid()]}"
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 136650e6f74..c21f034aafc 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -595,3 +595,18 @@ def directory_size(root, blocksize=4096):
>          total += sum(roundup(getsize(os.path.join(root, name))) for name in files)
>          total += roundup(getsize(root))
>      return total
> +
> +def is_local_uid(uid=''):
> +    """
> +    Check whether uid is a local one or not.
> +    Can't use pwd module since it gets all UIDs, not local ones only.
> +    """
> +    if not uid:
> +        uid = os.getuid()
> +    local_uids = set()
> +    with open('/etc/passwd', 'r') as f:
> +        for line in f.readlines():
> +            if not ':' in line:
> +                continue
> +            local_uids.add(line.split(':')[2])
> +    return uid in local_uids

I think we should move this code into bitbake as I really dislike having it in
bitbake.conf and that [0][1] syntax is horrible too...

I'm also not convinced about the name "BB_TASK_NETWORK" and think we need
something better. If we're moving the code to bitbake we might not need a name
right now though.

Cheers,

Richard




