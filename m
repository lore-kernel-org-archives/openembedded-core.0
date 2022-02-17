Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBD9C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 09:49:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.5666.1645091385490886060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 01:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=afF/dcvz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id h6so7936883wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 01:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uj8cqaTvjh9oM499Bv0e5UTtZMZO+1LbYXSwglBv8NU=;
        b=afF/dcvz+6v+G2u0KImFwl6F/YYYEKsg896uPHG/mgteMLmdIz71ndXFBSEq2dzngS
         3HrD8SK/QK52di5Qau98NRHzEFU+rxRaeEdYs+0+0W1I29edW/whQY3RzuXDaMbeWfFR
         BnmRrDEWegSP4K8eY3sI1+C4LTEPFV9dAL2zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uj8cqaTvjh9oM499Bv0e5UTtZMZO+1LbYXSwglBv8NU=;
        b=6nsSe22XJrgbz6505REWL6/0F+wyJxkBug5GpuC9N5FlXY9CAcGTHzz3oHqt0FTd5G
         v8mcsDpTzganNTbxJaQhjAqcc4F7gt8BU+j9kZc169Z/kZe1OIF5RXnJUcZqpfFET0Yp
         t1CUsXcwbFauK1CZoJeH8K2Wb37yz/n5IKdWyAQoQ4ng6Lg3jk9EjVzuAxHLTAAFN3lf
         cZ7yIlCc51SUR4BBouE/YbyDscuhFJXigrkeGfnnQOoyypiZZehyQBrZKwVn0DstgWhh
         JXmkOfXYoFg/F6C5iLN4Rv4xN+MoqdtGaaseYxNAbqT29jhGIFlXn2gXG2+JG+ZOdzqg
         DrAw==
X-Gm-Message-State: AOAM532/6H/Zdj4luNd8SEkQYg6m8eaelZh04u/ZzY3IJzSjZwhjn2uh
	0lMbh8gg5MNXmvlmpS2Hw9hBkg==
X-Google-Smtp-Source: 
 ABdhPJzf3c2oZnri2DJJ0WSqmFmfroAAvAJZN+at5F+ufC00C7TK1LrT0IlGhq43zOM9Ys9puSxL/Q==
X-Received: by 2002:adf:e902:0:b0:1e3:3336:ea7d with SMTP id
 f2-20020adfe902000000b001e33336ea7dmr1704171wrm.542.1645091383896;
        Thu, 17 Feb 2022 01:49:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2892:510b:1ca1:ad61?
 ([2001:8b0:aba:5f3c:2892:510b:1ca1:ad61])
        by smtp.gmail.com with ESMTPSA id
 g10sm13901118wri.91.2022.02.17.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 01:49:43 -0800 (PST)
Message-ID: 
 <1682af951d93cc8e8945c365a586c13d77c3cd49.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive
 Language variable renames
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Feb 2022 09:49:39 +0000
In-Reply-To: <20220217003248.581903-1-saul.wold@windriver.com>
References: <20220217003248.581903-1-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 09:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161794

On Wed, 2022-02-16 at 16:32 -0800, Saul Wold wrote:
> From: Saul Wold <Saul.Wold@windriver.com>
> 
> This script searches for a list of variable that have been renamed
> and converts them to their more descriptive names. It also searches
> for a list of variables that have been removed or deprecated and
> prints a message.
> 
> It will print a message to inform the user that there are terms that
> need to be updated in their files. Many of these changes are context
> sensitive and may not be modified as they might be existing calls to
> other libraries. This message is informational only.
> 
> I have tested this on poky and meta-openembedded so far.
> 
> (From OE-Core rev: 50fe7ba8dba05a9681c9095506f798796cfc2750)
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
> v2: renamed script, removed bitbake internal vars, added WHITELIST_ option
> 
>  scripts/contrib/convert-variables.py | 110 +++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100755 scripts/contrib/convert-variables.py
> 
> diff --git a/scripts/contrib/convert-variables.py b/scripts/contrib/convert-variables.py
> new file mode 100755
> index 0000000000..a632fd4d5c
> --- /dev/null
> +++ b/scripts/contrib/convert-variables.py
> @@ -0,0 +1,110 @@
> +#!/usr/bin/env python3
> +#
> +# Conversion script to rename variables with more descriptive terms
> +#
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +import re
> +import os
> +import sys
> +import tempfile
> +import shutil
> +import mimetypes
> +
> +if len(sys.argv) < 2:
> +    print("Please specify a directory to run the conversion script against.")
> +    sys.exit(1)
> +
> +renames = {
> +"BB_ENV_WHITELIST":"BB_ENV_PASSTHROUGH",
> +"BB_ENV_EXTRAWHITE":"BB_ENV_PASSTHROUGH_ADDITIONS",
> +"BB_HASHCONFIG_WHITELIST":"BB_HASHCONFIG_IGNORE_VARS",
> +"BB_SETSCENE_ENFORCE_WHITELIST":"BB_SETSCENE_ENFORCE_IGNORE_TASKS",
> +"BB_HASHBASE_WHITELIST":"BB_BASEHASH_IGNORE_VARS",
> +"BB_HASHTASK_WHITELIST":"BB_TASKHASH_IGNORE_TASKS",
> +"CVE_CHECK_PN_WHITELIST":"CVE_CHECK_SKIP_RECIPE",
> +"CVE_CHECK_WHITELIST":"CVE_CHECK_IGNORE",
> +"MULTI_PROVIDER_WHITELIST":"BB_MULTI_PROVIDER_ALLOWED",
> +"PNBLACKLIST":"SKIP_RECIPE",
> +"SDK_LOCAL_CONF_BLACKLIST":"ESDK_LOCAL_CONF_ALLOW",
> +"SDK_LOCAL_CONF_WHITELIST":"ESDK_LOCAL_CONF_REMOVE",
> +"SDK_INHERIT_BLACKLIST":"ESDK_CLASS_INHERIT_DISABLE",
> +"SSTATE_DUPWHITELIST":"SSTATE_ALLOW_OVERLAP_FILES",
> +"SYSROOT_DIRS_BLACKLIST":"SYSROOT_DIRS_IGNORE",
> +"UNKNOWN_CONFIGURE_WHITELIST":"UNKNOWN_CONFIGURE_OPT_IGNORE",
> +"WHITELIST_":"INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_",
> +}
> +
> +removed_list = [
> +"BB_STAMP_WHITELIST",
> +"BB_STAMP_POLICY",
> +"ICECC_USER_CLASS_BL",
> +"ICECC_USER_PACKAGE_BL",
> +"ICECC_USER_PACKAGE_WL",
> +"INHERIT_BLACKLIST",
> +"TUNEABI_WHITELIST",
> +]
> +

Thanks Saul. The key to making this a success is in the detail and I know you're
doing your best with it but there are some things we need to get right.

a) the script name or description at the top of it still doesn't sit right with
me. "convert-variables" doesn't really tell me what it is for in a years time.
I've tweaked the patch to "convert-variable-renames.py" locally which mentions
the fact it is renaming things and I tweaked the description too.

b) ESDK_LOCAL_CONF_ALLOW and ESDK_LOCAL_CONF_REMOVE are backwards above. The
wiki also used LOCALCONF in one case and LOCAL_CONF in the other. I prefer
LOCALCONF and that was what the original discussion said so I've fixed
everything to match that. I've updated things in master-next.

c) The WHITELIST_ change isn't what was discussed. That variable needs removing
somehow, at least the license addition bit to it as it is horrible. A straight
conversion is not appropriate. We can patch this into the conversion script when
it is ready, IMO it isn't there yet.

d) The subtleties of the ICECC_USER* translations have gotten lost in the
system. The idea was to merge several variables together.

The final piece of all this is communication. We need regular and clear
communication with the community about what is happening, when things are
merging, what work remains, the current work items and so on.

I guess my next best thing to work on is going to be to communicate where things
sit as I see them and what remains.

Cheers,

Richard




