Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6BDC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 20:22:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.16948.1637698933500660301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 12:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fUnkSUcs;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id l9so594954ljq.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 12:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=t1Z7Ww0xsabrOldOwebMaXC7qY834Ji9aLiFOEpxupM=;
        b=fUnkSUcsfOPrTHhNaQxGBZ7m00G6Rzdd7kQB0UDgqV8nVCBVMGZG1a1DuEm6RCb1sC
         GxuEeGnrQnil7sx2CSIk4D9U7HSfta8kmGo+Oi/QB6QbRkxChAjPnry3efyeOkl9pTpx
         Mfr4bUJM6FhNG9+ksMJHa/HpAc+aFJp5FyYhc9BYra33VLRsAyjQvX+evWlamTAM5/Ix
         CfYKFDwkN6ilKjAh9T3GSWUD8UM8nMur+FdX92aHHr2Whyj2XvUlYKN6O4Prsx64AqX0
         994LmLwQf966yw/GIWg0AXRicGSjpcPrGj+2NOntyuGkCSydNvp3x2tXwCI10o4Upfo5
         stNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t1Z7Ww0xsabrOldOwebMaXC7qY834Ji9aLiFOEpxupM=;
        b=T/oQ8ZrgPx1HgsM+QrLDLjlaZSTDVCSZiFSr4BwRYJNtYDyGR3xZ0L1gieJGNtQQfc
         5br5jMcB0ZHX5A2p/f/INYxB6y2E6DbI7hR6o5LFe/uaOXa6f/FJGSpmC/sEnugA5KNg
         7mpvIV2CzzgLIHA6tR4dZTSIUIVlsY9Ub/nf/c31VXupQHCGLkgLmZOWlwILIfXj8rSp
         ZhPsfBq6iazb5eWJmOxOyztmgDZqPRQro1XwBOO2GoFZwTbrDORdkrJnCyIukAqUR1LE
         FAAvAQbnKgaE2sLKwV2AjVPi4lks8mw6rixbIEzyjt53U8Rt3Dn39Mxp8JH8/HgFmVMG
         FoyA==
X-Gm-Message-State: AOAM533tXD2OnzR7urb6v8WsAPJBlCTK2cNxCRT+1D/PPizPK8sGkUCM
	eVG0ug2MdgjN9b99uX72JXo=
X-Google-Smtp-Source: 
 ABdhPJxOgKR3CJMRrxPpa+epIIDkPU1i0Y+xgvBZW8rrGtJ1rDCVIZXYF7YgPiocGkIMSibohujfTg==
X-Received: by 2002:a2e:9c02:: with SMTP id s2mr8491070lji.121.1637698931474;
        Tue, 23 Nov 2021 12:22:11 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 v17sm1388523lfd.287.2021.11.23.12.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 12:22:11 -0800 (PST)
Message-ID: <9415e9e5-10b7-8c9a-6eb0-7f563c6472fc@gmail.com>
Date: Tue, 23 Nov 2021 21:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] native/cross: Add ar wrapper for determinism
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211123141210.28396-1-richard.purdie@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20211123141210.28396-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 20:22:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158618



On 11/23/21 15:12, Richard Purdie wrote:
> From: Jacob Kroon <jacob.kroon@gmail.com>
> 
> Add a wrapper around ar calls for native/cross recipes. This wrapper adds
> the -D option so that deterministic archives are built for native/cross
> output. This improves the changes of hash equivalence matches and hence
> build artefact reuse.
> 
> We don't need this in the target case since we compile binutils-cross
> with an option making this the default. We need a wrapper since we need
> to remove the "u" option and replace it with "D" but also allow things like
> "--version" to continue to work too.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/cross.bbclass  |  2 ++
>  scripts/cross-intercept/ar  |  1 +
>  scripts/native-intercept/ar | 29 +++++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 120000 scripts/cross-intercept/ar
>  create mode 100755 scripts/native-intercept/ar
> 
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 3e6a2f60b9e..9d951076a78 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -93,3 +93,5 @@ python do_addto_recipe_sysroot () {
>  }
>  addtask addto_recipe_sysroot after do_populate_sysroot
>  do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
> +
> +PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
> diff --git a/scripts/cross-intercept/ar b/scripts/cross-intercept/ar
> new file mode 120000
> index 00000000000..bc68ffd7a21
> --- /dev/null
> +++ b/scripts/cross-intercept/ar
> @@ -0,0 +1 @@
> +../native-intercept/ar
> \ No newline at end of file
> diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
> new file mode 100755
> index 00000000000..642b6eae864
> --- /dev/null
> +++ b/scripts/native-intercept/ar
> @@ -0,0 +1,29 @@
> +#!/usr/bin/env python3
> +#
> +# Wrapper around 'ar' that defaults to deterministic archives
> +
> +import os
> +import shutil
> +import sys
> +
> +# calculate path to the real 'ar'
> +path = os.environ['PATH']
> +path = path.replace(os.path.dirname(sys.argv[0]), '')
> +real_ar = shutil.which('ar', path=path)
> +
> +if len(sys.argv) == 1:
> +    os.execl(real_ar, 'ar')
> +
> +# modify args to mimic 'ar' configured with --default-deterministic-archives
> +argv = sys.argv
> +if argv[1].startswith('--'):
> +    # No modifier given
> +    None
> +else:
> +    # remove the optional '-'
> +    if argv[1][0] == '-':
> +        argv[1] = argv[1][1:]
> +    argv[1] = argv[1].replace('u', '')
> +    argv[1] = 'D' + argv[1]
> +
> +os.execv(real_ar, argv)
> 

What should we do if the user is explicitly passing U, "Do not operate
in deterministic mode." ? Don't replace any 'u' and don't pass D ?

Jacob

