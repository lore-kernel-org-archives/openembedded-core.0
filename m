Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAB9C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 14:13:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.11226.1645193614204245860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mam5ARcE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u1so14805505wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qDLF3GYy6xgHvTckG4X7ziH5vxmqmIWGmYT5a/EpIHM=;
        b=Mam5ARcE7yaJvbc4o0RE1stkExcU+hP2e+nxfY0JufQvqrZMKA8b7XOjmtMBqv3+WL
         staOYNDZV4ZDSxXK04Je+Z9QGHgGs+DgycWmR+FEh0wXMx32jhpx20ldrjubE8umjdR4
         6+66V2ypKtawE9JP0L9ojXZ+A6YNzwKi0J6Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qDLF3GYy6xgHvTckG4X7ziH5vxmqmIWGmYT5a/EpIHM=;
        b=lXMVkSZLavmxsH/UCkm3/osZuSASehchVB06y0Hc5Hsgua0kEiPO2wQnQldCnW+1my
         knRo/cHJEbr03GmLTzp7btMi4S2Rwm3IZmVRSL8C//xz7sZaIBJVijsfvEuC2LUKmzYY
         2wUkSCaYSJDPTOXnEBZYJOWEUFkikguLIHH5Y5VN/2zyt/khtX4oB+WQxOPrsOyWnXl8
         oRgCpIjQhXFAfktUUxsvbAJ5tfBqhBklrl1gKtvbsgbrXp4XAtHIiwcRkKQ+OfQ+hEBs
         kLkqmqxPeSPV/Q05LY9XzyNSYNqtxbQ7rOv+0oeH3m4zJSKth1/Cb3/1OmDV1qSdi9fc
         eqWQ==
X-Gm-Message-State: AOAM533rv9WPrLdZJKE21CEwdj37fqNIsY/IVe/idZfoq547rnBkxioO
	aqRQcj4ywPgTfnWj1JG6ITNMzQ==
X-Google-Smtp-Source: 
 ABdhPJysh25MLfkadIU5BQe4V7Tr0YdJ/4DXHom2STfT/FSovlH1daJOgjs1GqoH1wzF3s100NmxvA==
X-Received: by 2002:a5d:610c:0:b0:1d8:e910:47d1 with SMTP id
 v12-20020a5d610c000000b001d8e91047d1mr6528849wrt.339.1645193612475;
        Fri, 18 Feb 2022 06:13:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bc9:59b:7021:269f?
 ([2001:8b0:aba:5f3c:7bc9:59b:7021:269f])
        by smtp.gmail.com with ESMTPSA id
 j6sm29556220wrt.70.2022.02.18.06.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:13:31 -0800 (PST)
Message-ID: 
 <df167d230c66ea8a975e7bc4b8d731cf58798e81.camel@linuxfoundation.org>
Subject: Re: [oe] INCOMPATIBLE_LICENSES and WHITELIST_<license> usage
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-architecture@lists.openembedded.org, OE-core
	 <openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	 <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Feb 2022 14:13:30 +0000
In-Reply-To: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
References: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 14:13:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161939

On Thu, 2022-02-17 at 15:01 -0800, Saul Wold wrote:
> I am working on a proposal to re-write how INCOMPATIBLE_LICENSES is used 
> and processed to possibly include a COMPATIBLE_LICENSES variable as 
> well, see PeterK's email [0]
> 
> I am trying to determine the usage of WHITELIST_<license> which would be 
> used to override a license that might be listed in INCOMPATIBLE_LICENSES 
> variable.
> 
> Randy and I have done a quick and dirty survey of a 100 or so layers 
> (thanks Randy) and could not find any real usage other than what's 
> currently in OE-Core for WHITELIST_GPL-3.0.
> 
> If you are using WHITELIST_<license>, please let me reply with your usage.
> 
> 
> [0] https://lists.openembedded.org/g/openembedded-devel/message/95166

We need to be mindful that we need to resolve this to unblock the other language
changes and feature creep here is potentially problematic. I do think it is
worth trying to improve things rather than blindly allowing the horrible syntax
in this variable to continue though.

The test case we have for this currently is:

WHITELIST_GPL-3.0:pn-core-image-minimal = "bash"

so I'd wondered about an alternative of:

INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0"

which matches the current functionality, removes the issue that the name of the
variable is unknown without iterating every possible license name and makes it
clear where it is applying to.

I don't really like INCOMPATIBLE_LICENSE_ALLOWED_RECIPES since:

a) it is long
b) it refers to recipes when it works against packages

(INCOMPATIBLE_LICENSE_PACKAGE_EXCEPTIONS is more correct but still long)

I do like it mentioning INCOMPATIBLE_LICENSE in full since it works in
conjunction with that variable and that is definitely not clear from the current
WHITELIST_XXX until you look at the code.

I'm still of the opinion the AVAILABLE_LICENSES variable is something we should
be aiming to remove ultimately too, it has horrible issues with layers changing
hashes for all recipes.

Cheers,

Richard



